USE [RentPath]
GO
/****** Object:  StoredProcedure [staging].[pr_ParsedPivot]    Script Date: 9/22/2017 8:18:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [staging].[pr_ParsedPivot] @YMDID [INT] AS 
/************************************************************************************************************************
* Name:         staging.[pr_ParsedPivot]
* Desc:         Move ParsedData Around for Daily and Archived Purpose
* Author:		Richard Chen
* Create date:  2016/02/04
* -----------------------------------------------------------------------------------------------------------------------
Workflows:



for marting purposes
* Run Proc: 
     exec staging.pr_ParsedPivot
     View Log
     select * from common.dbo.logging_storedProcs order by id desc
     LogData is in common.dbo.logging_storedProcs

##################################################################################
 READ ME
##################################################################################
* Instruction:  How to add a new tag
  1. In staging.ParsedPivot add new tag to select column section
  2. In staging.ParsedPivot add new tag to pivot section
  3. In  [dbo].[ParsedPivot], add new tag to select section
  4. Create statistics for the new tag in statistic section for dbo.parsedPivot

  1a. In staging.ParsedPivotRecover add new tag to select column section
  2a. In staging.ParsedPivotRecover add new tag to pivot section
  3a. In  [dbo].[ParsedPivotRecover], add new tag to select section
  4a. Create statistics for the new tag in statistic section for dbo.parsedPivotRecover

     exec [staging].[pr_ParsedPivot]  @ymdid=NULL
     exec [staging].[pr_ParsedPivot]  @ymdid=20170907
     exec [staging].[pr_ParsedPivot]  @ymdid=20160406
	 exec [staging].[pr_ParsedPivot]  @ymdid=20170308

select * from common.dbo.logging_storedProcs 
where procName='[staging].[pr_ParsedPivot]'
order by id desc

 -----------------------------------------------------------------------------------------------------------------------
* Hist:
*     01  02/19/2016   Richard Chen      Initial Version
*     02  02/23/2016   Richard Chen      Ticket 22196, add listing_source
*     03  02/26/2016   Richard Chen      Ticket 22227  add DerivedCampaignID
*     04  03/01/2016   Richard Chen      Ticket 22288  add DerivedEFID, 
*     05  03/02/2016   Richard Chen      Ticket 22277  Remove Listing_source
*     06  03/07/2016   Richard Chen      Ticket 22337  Add profile, subprofile
*     07  03/09/2016   Richard Chen      Ticket 22365  Rename Unit_id to UnitLayout_ID
*     08  03/11/2016   Richard Chen      Add functionality to recover data without stop on nightly job' toe
*     09  03/28/2016   Richard Chen      Ticket 22565 add uzid length 20
*     10  04/13/2016   Richard Chen      Ticket 22663 FirstEventVisit flag and FirstEventTVisit flag
*     11  05/04/2016   Richard Chen      Ticket 22936
                                            tag           max len
                                            app_name	    16
                                            app_version	    19
                                            carrier	        17
                                            device	        51
                                            link_id	        29
                                            screen_title	28
*     12  06/15/2016   Richard Chen      Ticket 23270  add x, y to parsedPivot
*     13  08/25/2016   Julie DiPietro	 Ticket 24002  Added Operating System Version
*	  14  08/30/2016   Sarah Mims        Ticket # 24065 Added tpl_source
*	  15  01/11/2017   Sarah Mims		 Case # 01376381 - add REPLACE logic to ListingID to remove special characters of "." or "-"
*     16  01/26/2017   Julie DiPietro    Case # 01385194 - changed substring(t_visit,1,33 ) to substring(t_visit,1,59 ) 
*     17  02/15/2017   Julie DiPietro    Case # 01402301 - changed SUBSTRING(pp.ssTestName,1,200) to SUBSTRING(pp.ssTestName,1,255) 
*                                                          and SUBSTRING(pp.ssVariationGroupName,1,50) to SUBSTRING(pp.ssVariationGroupName,1,255)
*     18  03/10/2017   Richard Chen      Case #01422598    Recover ParsedPivot for 20170308.  Retrived data from historicalParsedData
*     19  07/20/2017   Julie DiPietro	 Case #01517485    Increased uzid from 30 to 36 characters
************************************************************************************************************************/ 


BEGIN
/*#############################################################################################
Declare variable 
##############################################################################################*/
        DECLARE @TrackDate DATETIME ,
            @LocalYMDID INT ,
            @ParsedDataYMDID INT ,
            @LengthInSeconds INT ,
            @DatabaseName VARCHAR(128) ,
            @ProcedureName VARCHAR(128),
            @TableSet varchar(128)

/*#############################################################################################
Set up @LocalYMDID 
##############################################################################################*/

        SET @parsedDataYmdid= (select top 1 ymdid from dbo.parsedData)
        set @tableSet ='ParsedData'

        IF @ymdid IS NULL 
          begin
            if @ParsedDataYMDID  <>  CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
            SET @LocalYMDID = @ParsedDataYMDID
            else 
            SET @LocalYMDID=  CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
          end
        
        ELSE 
           begin
            SET @LocalYMDID = @YMDID
            SET @tableSet ='ParsedDataRecover'
           end
            

--            ,@YMDID int
--           set @Ymdid=NULL

        SET @TrackDate = GETDATE();
        SET @LengthInSeconds = 0;
        SET @DatabaseName = DB_NAME()  ;      
        SET @ProcedureName = '[staging].[pr_ParsedPivot]';

        SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
                EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                    @ProcName = @ProcedureName,
                    @StepName = '1 Start Proc Staging.pr_ParsedPivot',
                    @VariableStates = @LocalYMDID,
                    @LengthInSeconds = @LengthInSeconds,
                    @Comments = 'Start Procedure';
                SET @TrackDate = GETDATE();
Begin Try
/*#############################################################################################
This Section build ParsedPivot table in Staging shema, It will containt Every column we know
    It is not restricted by the selection in  ShareEdit google Doc
If @LocalYmdid is yesterday, build Staging.ParsedPivot
If @LocalYMDID is not yesterday,build Staging.ParsedPivotRecover 
     Recover missing date data.

TableBuild string is too long to use execute dynamic sql.  Limitation of Nvarchar(4000)
##############################################################################################*/
        BEGIN TRY
            IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
            or @tableSet ='ParsedData'
            
                DROP TABLE STAGING.ParsedPivot;
            ELSE
               DROP TABLE STAGING.ParsedPivotRecover;
        END TRY
        BEGIN CATCH
        END CATCH

        SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
                EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                    @ProcName = @ProcedureName,
                    @StepName = '2 Drop Table Staging.ParsedPivot',
                    @VariableStates = @LocalYMDID,
                    @LengthInSeconds = @LengthInSeconds,
                    @Comments = 'Table Staging.ParsedPivot Dropped';
                SET @TrackDate = GETDATE();
        --Yesterday,  Use by Nightly Job
		print @localYMDID
		print @tableSet

        IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
         or @tableSet ='ParsedData'
                    create table staging.ParsedPivot
                    with (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]))
                    as
                    select Parseid, ProfileKey, YMDID, Eventdate
                            ,[a_l_fplans]
                            ,[action]
                            ,[ad_listing_type]
                            ,[ad_sense_channel]
                            ,[afterFireCallback]
                            ,[appver]
                            ,[app_name]
                            ,[app_version]
                            ,[bed_bath_leads]
                            ,[bed_bath_leads_required]
                            ,[beds]
                            ,[browser]
                            ,[browser_size]
                            ,[browser_version]
                            ,[carrier]
                            ,[Campaign]
                            ,[campaign_id]
                            ,[CheckAvailability]
                            ,[city]
                            ,[clickleadsubmit]
                            ,[ClickListMap]
                            ,[ClickMapListingPin]
                            ,[ClicksCallTelephoneNumber]
                            ,[clicktype]
                            ,[clickvalue]
                            ,[combldrid]
                            ,[CustIPAddress]
                            ,[dcsid]
                            ,[dcsqry]
                            ,[dcsref]
                            ,[dcssip]
                            ,[dcsuri]
                            ,[detail_page_type]
                            ,[device]
                            ,[dim_id]
                            ,[dim_name]
                            ,[dim_text]
                            ,[DISPLAYMODE]
                            ,[dpg]
                            ,[ef_id]
                            ,[email_registration]
                            ,[entry_campaign_id]
                            ,[event_name]
                            ,[facebook_registration]
                            ,[featured_array]
                            ,[first_pageview]
                            ,[floorplan]
                            ,[ft]
                            ,[g_c_pv]
                            ,[geo]
                            ,[googleplus_registration]
                            ,[hash]
                            ,[hw]
                            ,[index]
                            ,[last_name_required]
                            ,[leadcount]
                            ,[LeadSubmitted]
                            ,[LeadType]
                            ,[lfpos]
                            ,[link_id]
                            ,[listing_array]
                            ,[listingId]
                            ,[listing_id]
                            ,[listing_name]
                            --,[listing_source]
                            ,[listing_type]
                            ,[listingdata]
                            ,[listingid_lead_submission]
                            ,[listings_per_page]
                            ,[logged_in]
                            ,[lpp]
                            ,[METRO]
                            ,[miles]
                            ,[modal]
                            ,[MSACODE]
                            ,[msg]
                            ,[neighborhood]
                            ,[operating_system]
							,[operating_system_version]
                            ,[original]
                            ,[os]
                            ,[page]
                            ,[page_category]
                            ,[page_number]
                            ,[page_sub]
                            ,[PAGENUM]
                            ,[path]
                            ,[person_id]
                            ,[phone_required]
                            ,[phonecount]
                            ,[position]
                            ,[profile]
                            ,[propertyname]
                            ,[querystring]
                            ,[r_l_cp_click]
                            ,[r_l_map]
                            ,[r_l_pv]
                            ,[r_l_rdny_click]
                            ,[r_l_sr]
                            ,[r_l_srloc]
                            ,[r_l_srloctype]
                            ,[r_l_srlv]
                            ,[r_l_srmsa]
                            ,[r_l_srpgnum]
                            ,[r_l_srpgsize]
                            ,[r_l_srrn]
                            ,[r_l_srspot]
                            ,[r_l_srspot_click]
                            ,[rand]
                            ,[RefDomain]
                            ,[referrer]
                            ,[referring_domain]
                            ,[refine_srch]
                            ,[refinement_array]
                            ,[registration]
                            ,[RH_L_PV]
                            ,[RH_L_SR]
                            ,[screen_resolution]
                            ,[screen_title]
                            ,[screen_type]
                            ,[search]
                            ,[selection]
                            ,[selsearch]
                            ,[seq]
                            ,[ServerIPAddress]
                            ,[session_id]
                            ,[shadow_person_id]
                            ,[site]
                            ,[site_value]
                            ,[site_version]
                            ,[spg]
                            ,[spotlight]
                            ,[spotlight_array]
                            ,[spotlight_count]
                            ,[SpotlightPaginationLeft]
                            ,[SpotlightPaginationRight]
                            ,[SRCH]
                            --,[srchresults]
                            ,[ssSiteID]
                            ,[ssSiteName]
                            ,[ssTestID]
                            ,[ssTestName]
                            ,[ssVariationGroupID]
                            ,[ssVariationGroupName]
                            ,[ssVisitCounted]
                            ,[state]
                            ,[SubmitLeadFromCheckAvailDetail]
                            ,[subprofile]
                            ,[t_visit]
                            ,[tag_item]
                            ,[text]
                            ,[title]
                            ,[TOTALSEARCHRESULTS]
                            ,[tpl_source]
                            ,[twitter_registration]
                            ,[unitlayout_id]
                            ,[url]
                            ,[user_email]
                            ,[user_id]
                            ,[UserAgent]
                            ,[userid]
                            ,[uzid]
                            ,[value]
                            ,[ver]
                            ,[version]
                            ,[visit]
                            ,[visitor]
                            ,[WT.bh]
                            ,[WT.bs]
                            ,[WT.cg_n]
                            ,[WT.co_f]
                            ,[WT.dl]
                            ,[WT.fi]
                            ,[WT.fv]
                            ,[WT.hp]
                            ,[WT.jo]
                            ,[WT.js]
                            ,[WT.jv]
                            ,[WT.si_n]
                            ,[WT.si_p]
                            ,[WT.si_x]
                            ,[WT.sr]
                            ,[WT.ti]
                            ,[WT.tu]
                            ,[WT.tz]
                            ,[WT.ul]
                            ,[WT.vt_f_tlh]
                            ,[WT.vt_f_tlv]
                            ,[WT.vt_sid]
                            ,[x]
                            ,[y]
                            ,[zip]
                            ,[zip_code]

                    from
                    (select  * from dbo.parseddata) s
                    pivot
                    (min(measure) FOR measuretype in (
                            [a_l_fplans]
                            ,[action]
                            ,[ad_listing_type]
                            ,[ad_sense_channel]
                            ,[afterFireCallback]
                            ,[appver]
                            ,[app_name]
                            ,[app_version]
                            ,[bed_bath_leads]
                            ,[bed_bath_leads_required]
                            ,[beds]
                            ,[browser]
                            ,[browser_size]
                            ,[browser_version]
                            ,[carrier]
                            ,[Campaign]
                            ,[campaign_id]
                            ,[CheckAvailability]
                            ,[city]
                            ,[clickleadsubmit]
                            ,[ClickListMap]
                            ,[ClickMapListingPin]
                            ,[ClicksCallTelephoneNumber]
                            ,[clicktype]
                            ,[clickvalue]
                            ,[combldrid]
                            ,[CustIPAddress]
                            ,[dcsid]
                            ,[dcsqry]
                            ,[dcsref]
                            ,[dcssip]
                            ,[dcsuri]
                            ,[detail_page_type]
                            ,[device]
                            ,[dim_id]
                            ,[dim_name]
                            ,[dim_text]
                            ,[DISPLAYMODE]
                            ,[dpg]
                            ,[ef_id]
                            ,[email_registration]
                            ,[entry_campaign_id]
                            ,[event_name]
                            ,[facebook_registration]
                            ,[featured_array]
                            ,[first_pageview]
                            ,[floorplan]
                            ,[ft]
                            ,[g_c_pv]
                            ,[geo]
                            ,[googleplus_registration]
                            ,[hash]
                            ,[hw]
                            ,[index]
                            ,[last_name_required]
                            ,[leadcount]
                            ,[LeadSubmitted]
                            ,[LeadType]
                            ,[lfpos]
                            ,[link_id]
                            ,[listing_array]
                            ,[listingId]
                            ,[listing_id]
                            ,[listing_name]
                            --,[listing_source]
                            ,[listing_type]
                            ,[listingdata]
                            ,[listingid_lead_submission]
                            ,[listings_per_page]
                            ,[logged_in]
                            ,[lpp]
                            ,[METRO]
                            ,[miles]
                            ,[modal]
                            ,[MSACODE]
                            ,[msg]
                            ,[neighborhood]
                            ,[operating_system]
							,[operating_system_version]
                            ,[original]
                            ,[os]
                            ,[page]
                            ,[page_category]
                            ,[page_number]
                            ,[page_sub]
                            ,[PAGENUM]
                            ,[path]
                            ,[person_id]
                            ,[phone_required]
                            ,[phonecount]
                            ,[position]
                            ,[profile]
                            ,[propertyname]
                            ,[querystring]
                            ,[r_l_cp_click]
                            ,[r_l_map]
                            ,[r_l_pv]
                            ,[r_l_rdny_click]
                            ,[r_l_sr]
                            ,[r_l_srloc]
                            ,[r_l_srloctype]
                            ,[r_l_srlv]
                            ,[r_l_srmsa]
                            ,[r_l_srpgnum]
                            ,[r_l_srpgsize]
                            ,[r_l_srrn]
                            ,[r_l_srspot]
                            ,[r_l_srspot_click]
                            ,[rand]
                            ,[RefDomain]
                            ,[referrer]
                            ,[referring_domain]
                            ,[refine_srch]
                            ,[refinement_array]
                            ,[registration]
                            ,[RH_L_PV]
                            ,[RH_L_SR]
                            ,[screen_resolution]
                            ,[screen_title]
                            ,[screen_type]
                            ,[search]
                            ,[selection]
                            ,[selsearch]
                            ,[seq]
                            ,[ServerIPAddress]
                            ,[session_id]
                            ,[shadow_person_id]
                            ,[site]
                            ,[site_value]
                            ,[site_version]
                            ,[spg]
                            ,[spotlight]
                            ,[spotlight_array]
                            ,[spotlight_count]
                            ,[SpotlightPaginationLeft]
                            ,[SpotlightPaginationRight]
                            ,[SRCH]
                            --,[srchresults]
                            ,[ssSiteID]
                            ,[ssSiteName]
                            ,[ssTestID]
                            ,[ssTestName]
                            ,[ssVariationGroupID]
                            ,[ssVariationGroupName]
                            ,[ssVisitCounted]
                            ,[state]
                            ,[SubmitLeadFromCheckAvailDetail]
                            ,[subprofile]
                            ,[t_visit]
                            ,[tag_item]
                            ,[text]
                            ,[title]
                            ,[TOTALSEARCHRESULTS]
                            ,[tpl_source]
                            ,[twitter_registration]
                            ,[unitlayout_id]
                            ,[url]
                            ,[user_email]
                            ,[user_id]
                            ,[UserAgent]
                            ,[userid]
                            ,[uzid]
                            ,[value]
                            ,[ver]
                            ,[version]
                            ,[visit]
                            ,[visitor]
                            ,[WT.bh]
                            ,[WT.bs]
                            ,[WT.cg_n]
                            ,[WT.co_f]
                            ,[WT.dl]
                            ,[WT.fi]
                            ,[WT.fv]
                            ,[WT.hp]
                            ,[WT.jo]
                            ,[WT.js]
                            ,[WT.jv]
                            ,[WT.si_n]
                            ,[WT.si_p]
                            ,[WT.si_x]
                            ,[WT.sr]
                            ,[WT.ti]
                            ,[WT.tu]
                            ,[WT.tz]
                            ,[WT.ul]
                            ,[WT.vt_f_tlh]
                            ,[WT.vt_f_tlv]
                            ,[WT.vt_sid]
                            ,[x]
                            ,[y]
                            ,[zip]
                            ,[zip_code]
                    )
                    ) P
                    
        --Anyother days Use recover table
        ELSE 
                    create table staging.ParsedPivotRecover
                    with (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]))
                    as
                    select Parseid, ProfileKey, YMDID, Eventdate
                            ,[a_l_fplans]
                            ,[action]
                            ,[ad_listing_type]
                            ,[ad_sense_channel]
                            ,[afterFireCallback]
                            ,[appver]
                            ,[app_name]
                            ,[app_version]
                            ,[bed_bath_leads]
                            ,[bed_bath_leads_required]
                            ,[beds]
                            ,[browser]
                            ,[browser_size]
                            ,[browser_version]
                            ,[carrier]
                            ,[Campaign]
                            ,[campaign_id]
                            ,[CheckAvailability]
                            ,[city]
                            ,[clickleadsubmit]
                            ,[ClickListMap]
                            ,[ClickMapListingPin]
                            ,[ClicksCallTelephoneNumber]
                            ,[clicktype]
                            ,[clickvalue]
                            ,[combldrid]
                            ,[CustIPAddress]
                            ,[dcsid]
                            ,[dcsqry]
                            ,[dcsref]
                            ,[dcssip]
                            ,[dcsuri]
                            ,[detail_page_type]
                            ,[device]
                            ,[dim_id]
                            ,[dim_name]
                            ,[dim_text]
                            ,[DISPLAYMODE]
                            ,[dpg]
                            ,[ef_id]
                            ,[email_registration]
                            ,[entry_campaign_id]
                            ,[event_name]
                            ,[facebook_registration]
                            ,[featured_array]
                            ,[first_pageview]
                            ,[floorplan]
                            ,[ft]
                            ,[g_c_pv]
                            ,[geo]
                            ,[googleplus_registration]
                            ,[hash]
                            ,[hw]
                            ,[index]
                            ,[last_name_required]
                            ,[leadcount]
                            ,[LeadSubmitted]
                            ,[LeadType]
                            ,[lfpos]
                            ,[link_id]
                            ,[listing_array]
                            ,[listingId]
                            ,[listing_id]
                            ,[listing_name]
                            --,[listing_source]
                            ,[listing_type]
                            ,[listingdata]
                            ,[listingid_lead_submission]
                            ,[listings_per_page]
                            ,[logged_in]
                            ,[lpp]
                            ,[METRO]
                            ,[miles]
                            ,[modal]
                            ,[MSACODE]
                            ,[msg]
                            ,[neighborhood]
                            ,[operating_system]
							,[operating_system_version]
                            ,[original]
                            ,[os]
                            ,[page]
                            ,[page_category]
                            ,[page_number]
                            ,[page_sub]
                            ,[PAGENUM]
                            ,[path]
                            ,[person_id]
                            ,[phone_required]
                            ,[phonecount]
                            ,[position]
                            ,[profile]
                            ,[propertyname]
                            ,[querystring]
                            ,[r_l_cp_click]
                            ,[r_l_map]
                            ,[r_l_pv]
                            ,[r_l_rdny_click]
                            ,[r_l_sr]
                            ,[r_l_srloc]
                            ,[r_l_srloctype]
                            ,[r_l_srlv]
                            ,[r_l_srmsa]
                            ,[r_l_srpgnum]
                            ,[r_l_srpgsize]
                            ,[r_l_srrn]
                            ,[r_l_srspot]
                            ,[r_l_srspot_click]
                            ,[rand]
                            ,[RefDomain]
                            ,[referrer]
                            ,[referring_domain]
                            ,[refine_srch]
                            ,[refinement_array]
                            ,[registration]
                            ,[RH_L_PV]
                            ,[RH_L_SR]
                            ,[screen_resolution]
                            ,[screen_title]
                            ,[screen_type]
                            ,[search]
                            ,[selection]
                            ,[selsearch]
                            ,[seq]
                            ,[ServerIPAddress]
                            ,[session_id]
                            ,[shadow_person_id]
                            ,[site]
                            ,[site_value]
                            ,[site_version]
                            ,[spg]
                            ,[spotlight]
                            ,[spotlight_array]
                            ,[spotlight_count]
                            ,[SpotlightPaginationLeft]
                            ,[SpotlightPaginationRight]
                            ,[SRCH]
                            --,[srchresults]
                            ,[ssSiteID]
                            ,[ssSiteName]
                            ,[ssTestID]
                            ,[ssTestName]
                            ,[ssVariationGroupID]
                            ,[ssVariationGroupName]
                            ,[ssVisitCounted]
                            ,[state]
                            ,[SubmitLeadFromCheckAvailDetail]
                            ,[subprofile]
                            ,[t_visit]
                            ,[tag_item]
                            ,[text]
                            ,[title]
                            ,[TOTALSEARCHRESULTS]
                            ,[tpl_source]
                            ,[twitter_registration]
                            ,[unitlayout_id]
                            ,[url]
                            ,[user_email]
                            ,[user_id]
                            ,[UserAgent]
                            ,[userid]
                            ,[uzid]
                            ,[value]
                            ,[ver]
                            ,[version]
                            ,[visit]
                            ,[visitor]
                            ,[WT.bh]
                            ,[WT.bs]
                            ,[WT.cg_n]
                            ,[WT.co_f]
                            ,[WT.dl]
                            ,[WT.fi]
                            ,[WT.fv]
                            ,[WT.hp]
                            ,[WT.jo]
                            ,[WT.js]
                            ,[WT.jv]
                            ,[WT.si_n]
                            ,[WT.si_p]
                            ,[WT.si_x]
                            ,[WT.sr]
                            ,[WT.ti]
                            ,[WT.tu]
                            ,[WT.tz]
                            ,[WT.ul]
                            ,[WT.vt_f_tlh]
                            ,[WT.vt_f_tlv]
                            ,[WT.vt_sid]
                            ,[x]
                            ,[y]
                            ,[zip]
                            ,[zip_code]

                    from
                    --(select  * from dbo.Historicalparseddata where ymdid=@LocalYMDID) s
					(select  * from dbo.parseddataArchived where ymdid=@LocalYMDID) s
                    pivot
                    (min(measure) FOR measuretype in (
                            [a_l_fplans]
                            ,[action]
                            ,[ad_listing_type]
                            ,[ad_sense_channel]
                            ,[afterFireCallback]
                            ,[appver]
                            ,[app_name]
                            ,[app_version]
                            ,[bed_bath_leads]
                            ,[bed_bath_leads_required]
                            ,[beds]
                            ,[browser]
                            ,[browser_size]
                            ,[browser_version]
                            ,[carrier]
                            ,[Campaign]
                            ,[campaign_id]
                            ,[CheckAvailability]
                            ,[city]
                            ,[clickleadsubmit]
                            ,[ClickListMap]
                            ,[ClickMapListingPin]
                            ,[ClicksCallTelephoneNumber]
                            ,[clicktype]
                            ,[clickvalue]
                            ,[combldrid]
                            ,[CustIPAddress]
                            ,[dcsid]
                            ,[dcsqry]
                            ,[dcsref]
                            ,[dcssip]
                            ,[dcsuri]
                            ,[detail_page_type]
                            ,[device]
                            ,[dim_id]
                            ,[dim_name]
                            ,[dim_text]
                            ,[DISPLAYMODE]
                            ,[dpg]
                            ,[ef_id]
                            ,[email_registration]
                            ,[entry_campaign_id]
                            ,[event_name]
                            ,[facebook_registration]
                            ,[featured_array]
                            ,[first_pageview]
                            ,[floorplan]
                            ,[ft]
                            ,[g_c_pv]
                            ,[geo]
                            ,[googleplus_registration]
                            ,[hash]
                            ,[hw]
                            ,[index]
                            ,[last_name_required]
                            ,[leadcount]
                            ,[LeadSubmitted]
                            ,[LeadType]
                            ,[lfpos]
                            ,[link_id]
                            ,[listing_array]
                            ,[listingId]
                            ,[listing_id]
                            ,[listing_name]
                            --,[listing_source]
                            ,[listing_type]
                            ,[listingdata]
                            ,[listingid_lead_submission]
                            ,[listings_per_page]
                            ,[logged_in]
                            ,[lpp]
                            ,[METRO]
                            ,[miles]
                            ,[modal]
                            ,[MSACODE]
                            ,[msg]
                            ,[neighborhood]
                            ,[operating_system]
							,[operating_system_version]
                            ,[original]
                            ,[os]
                            ,[page]
                            ,[page_category]
                            ,[page_number]
                            ,[page_sub]
                            ,[PAGENUM]
                            ,[path]
                            ,[person_id]
                            ,[phone_required]
                            ,[phonecount]
                            ,[position]
                            ,[profile]
                            ,[propertyname]
                            ,[querystring]
                            ,[r_l_cp_click]
                            ,[r_l_map]
                            ,[r_l_pv]
                            ,[r_l_rdny_click]
                            ,[r_l_sr]
                            ,[r_l_srloc]
                            ,[r_l_srloctype]
                            ,[r_l_srlv]
                            ,[r_l_srmsa]
                            ,[r_l_srpgnum]
                            ,[r_l_srpgsize]
                            ,[r_l_srrn]
                            ,[r_l_srspot]
                            ,[r_l_srspot_click]
                            ,[rand]
                            ,[RefDomain]
                            ,[referrer]
                            ,[referring_domain]
                            ,[refine_srch]
                            ,[refinement_array]
                            ,[registration]
                            ,[RH_L_PV]
                            ,[RH_L_SR]
                            ,[screen_resolution]
                            ,[screen_title]
                            ,[screen_type]
                            ,[search]
                            ,[selection]
                            ,[selsearch]
                            ,[seq]
                            ,[ServerIPAddress]
                            ,[session_id]
                            ,[shadow_person_id]
                            ,[site]
                            ,[site_value]
                            ,[site_version]
                            ,[spg]
                            ,[spotlight]
                            ,[spotlight_array]
                            ,[spotlight_count]
                            ,[SpotlightPaginationLeft]
                            ,[SpotlightPaginationRight]
                            ,[SRCH]
                            --,[srchresults]
                            ,[ssSiteID]
                            ,[ssSiteName]
                            ,[ssTestID]
                            ,[ssTestName]
                            ,[ssVariationGroupID]
                            ,[ssVariationGroupName]
                            ,[ssVisitCounted]
                            ,[state]
                            ,[SubmitLeadFromCheckAvailDetail]
                            ,[subprofile]
                            ,[t_visit]
                            ,[tag_item]
                            ,[text]
                            ,[title]
                            ,[TOTALSEARCHRESULTS]
                            ,[tpl_source]
                            ,[twitter_registration]
                            ,[unitlayout_id]
                            ,[url]
                            ,[user_email]
                            ,[user_id]
                            ,[UserAgent]
                            ,[userid]
                            ,[uzid]
                            ,[value]
                            ,[ver]
                            ,[version]
                            ,[visit]
                            ,[visitor]
                            ,[WT.bh]
                            ,[WT.bs]
                            ,[WT.cg_n]
                            ,[WT.co_f]
                            ,[WT.dl]
                            ,[WT.fi]
                            ,[WT.fv]
                            ,[WT.hp]
                            ,[WT.jo]
                            ,[WT.js]
                            ,[WT.jv]
                            ,[WT.si_n]
                            ,[WT.si_p]
                            ,[WT.si_x]
                            ,[WT.sr]
                            ,[WT.ti]
                            ,[WT.tu]
                            ,[WT.tz]
                            ,[WT.ul]
                            ,[WT.vt_f_tlh]
                            ,[WT.vt_f_tlv]
                            ,[WT.vt_sid]
                            ,[x]
                            ,[y]
                            ,[zip]
                            ,[zip_code]
                    )
                    ) P                    
        SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
                EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                    @ProcName = @ProcedureName,
                    @StepName = '3 Staging.ParsedPivot reCreated',
                    @VariableStates = @LocalYMDID,
                    @LengthInSeconds = @LengthInSeconds,
                    @Comments = 'Staging.ParsedPivot reCreated';
                SET @TrackDate = GETDATE();



/*#############################################################################################
End build ParsedPivot in Staging Schema
##############################################################################################*/
--declare
--@localymdid int
--set @localymdid=20160413

IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
or @tableSet ='ParsedData'
          BEGIN
          IF object_id ('staging.tVisitFirstLast') is not null
             DROP TABLE staging.tVisitFirstLast

          CREATE TABLE staging.tVisitFirstLast  
            with (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]))
          AS
          SELECT *
            FROM 
            (
                Select parseid, [action]
                ,t_visit
                ,FirstEventTVisit =(case when (row_number() over (partition by substring(t_visit,1,59 )
                                                                           order by eventdate,
                                                                                    CASE action
                                                                                    WHEN 'pageview'          THEN 1
                                                                                    WHEN 'click'             THEN 2
                                                                                    WHEN 'lead_submission'   THEN 3
                                                                                    WHEN 'swipe'             THEN 4
                                                                                    WHEN 'view'              THEN 5
                                                                                    WHEN 'moving_submission' THEN 6
                                                                                    WHEN 'select'            THEN 7
                                                                                    ELSE 8
                                                                                     END,parseid)) =1 then 1
                                              else null 
                                               end)
                 ,LastEventTVisit =(case when (row_number() over (partition by substring(t_visit,1,59 )
                                                                           order by eventdate desc,parseid desc)) =1 then 1
                                              else null 
                                               end)
                 from staging.parsedPivot
                 where (t_visit is not null and t_visit <>'.' )
                      and profileKey <> -1
             ) v
          WHERE (FirstEventTVisit is not null or LastEventTVisit is not null)


          IF object_id ('staging.VisitFirstLast') is not null
             drop table staging.VisitFirstLast

          CREATE TABLE staging.VisitFirstLast
          with (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]))
          AS
          SELECT *
            FROM 
            (
              SELECT parseid, [action]
                    ,visit
                    ,FirstEventVisit =(CASE WHEN (row_number() over (PARTITION by substring(visit,1,33 )
                                                                               ORDER by eventdate, 
                                                                                    CASE action
                                                                                    WHEN 'pageview'          THEN 1
                                                                                    WHEN 'click'             THEN 2
                                                                                    WHEN 'lead_submission'   THEN 3
                                                                                    WHEN 'swipe'             THEN 4
                                                                                    WHEN 'view'              THEN 5
                                                                                    WHEN 'moving_submission' THEN 6
                                                                                    WHEN 'select'            THEN 7
                                                                                    ELSE 8
                                                                                     END, parseid)) =1 then 1
                                                  else null
                                                   end)
                    ,LastEventVisit =(CASE WHEN (row_number() over (PARTITION by substring(visit,1,33 )
                                                                              ORDER by eventdate desc,parseid desc)) =1 then 1
                                                  else null
                                                   end)
                FROM staging.parsedPivot
               WHERE (visit is not null and visit <>'.' )
                      and profileKey <> -1
             ) o
          WHERE (FirstEventVisit is not null or LastEventVisit is not null)


          END
ELSE
            BEGIN

            if object_id ('staging.TVisitFirstLastRecover') is not null
             drop table staging.TVisitFirstLastRecover

            create table staging.TVisitFirstLastRecover  
             with (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]))
            as
            select *
            from 
            (
            Select parseid, [action]
            ,t_visit
            ,FirstEventTVisit =(case when (row_number() over (partition by substring(t_visit,1,59 )
                                                                       order by eventdate,
                                                                                    CASE action
                                                                                    WHEN 'pageview'          THEN 1
                                                                                    WHEN 'click'             THEN 2
                                                                                    WHEN 'lead_submission'   THEN 3
                                                                                    WHEN 'swipe'             THEN 4
                                                                                    WHEN 'view'              THEN 5
                                                                                    WHEN 'moving_submission' THEN 6
                                                                                    WHEN 'select'            THEN 7
                                                                                    ELSE 8
                                                                                     END,ParseID	)) =1 then 1
                                     else null 
                                      end)
            ,LastEventTVisit =(case when (row_number() over (partition by substring(t_visit,1,59 )
                                                                           order by eventdate desc,parseid desc)) =1 then 1
                                              else null 
                                               end)
             from staging.parsedPivotRecover
             where (t_visit is not null and t_visit <>'.' )
                      and profileKey <> -1
             ) v
            where (FirstEventTVisit is not null or LastEventTVisit is not null)


            if object_id ('staging.VisitFirstLastRecover') is not null
             drop table staging.VisitFirstLastRecover

            create table staging.VisitFirstLastRecover
            with (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([ParseID]))
            as
            select *
            from 
            (
            Select parseid, [action]
            ,visit
            ,FirstEventVisit =(case when (row_number() over (partition by substring(visit,1,33 )
                                                                       order by eventdate,
                                                                                    CASE action
                                                                                    WHEN 'pageview'          THEN 1
                                                                                    WHEN 'click'             THEN 2
                                                                                    WHEN 'lead_submission'   THEN 3
                                                                                    WHEN 'swipe'             THEN 4
                                                                                    WHEN 'view'              THEN 5
                                                                                    WHEN 'moving_submission' THEN 6
                                                                                    WHEN 'select'            THEN 7
                                                                                    ELSE 8
                                                                                     END,parseid)) =1 then 1
                                    else null
                                     end)
            ,LastEventVisit =(CASE WHEN (row_number() over (PARTITION by substring(visit,1,33 )
                                                                      ORDER by eventdate desc,parseid desc)) =1 then 1
                                   else null
                                    end)
             from staging.parsedPivotRecover
             where (visit is not null and visit <>'.' )
                      and profileKey <> -1
             ) o
             where (FirstEventVisit is not null or LastEventVisit is not null)


             END
/*#############################################################################################
Begin to build ParsedPivot in DBO Schema
Share Edit Google Doc Link 
https://drive.google.com/open?id=1mbm9jelS_JErijDctHsYJcevb5xpi2AUv2SipIVWXmw
If Yesterday Build DBO.ParsedPivot
If Not Yesterday Build DBO.ParsedPivotRecover
##############################################################################################*/

        BEGIN TRY
            IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
            or @tableSet ='ParsedData'
            DROP TABLE dbo.ParsedPivot;
            ELSE
            DROP TABLE dbo.ParsedPivotRecover;
        END TRY
        BEGIN CATCH
        END CATCH


        SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
                EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                    @ProcName = @ProcedureName,
                    @StepName = '4 Table DBO.ParsedPivot Dropped',
                    @VariableStates = @LocalYMDID,
                    @LengthInSeconds = @LengthInSeconds,
                    @Comments = '4 Drop table DBO.ParsedPivot';
                SET @TrackDate = GETDATE();

        IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT) 
        OR @tableSet ='ParsedData'
                    CREATE TABLE [dbo].[ParsedPivot] 
                    WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([Parseid]))
                    as 
                    select 
                        pp.Parseid, 
                        pp.ProfileKey,
                        --Profileid, 
                        --SubProfileID, 
                        YMDID, 
                        pp.Eventdate, 
                        --a_l_fplans=SUBSTRING(a_l_fplans,1,30) , 
                        [action]=
                        --CASE WHEN  profileid in (1,51,53) 
                        Case when pp.profilekey=-1 and pp.[site] in ('www.apartmentguide.com','m.apartmentguide.com','www.rent.com','www.rent.com_kilo')
                               and (pp.email_registration =1 or pp.googleplus_registration=1 or pp.facebook_registration=1 or pp.twitter_registration=1) THEN
                           'click'
                        ELSE
                           isNULL(SUBSTRING(pp.[action],1,100),SUBSTRING(pp.[WT.dl],1,100)) 
                        END, 
                        [app_name]=SUBSTRING(pp.[app_name],1,50),
                        app_version=SUBSTRING(pp.[app_version],1,50),
                        --ad_listing_type=SUBSTRING(ad_listing_type,1,50) , 
                        --ad_sense_channel=SUBSTRING(ad_sense_channel,1,30) , 
                        --afterFireCallback=SUBSTRING(afterFireCallback,1,200) , 
                        --appver=SUBSTRING(appver,1,30) , 
                        --bed_bath_leads=SUBSTRING(bed_bath_leads,1,30) , 
                        --bed_bath_leads_required=SUBSTRING(bed_bath_leads_required,1,30) , 
                        --beds=SUBSTRING(beds,1,2) , 
                        browser=SUBSTRING(pp.browser,1,30) , 
                        --browser_size=SUBSTRING(browser_size,1,50) , 
                        browser_version=SUBSTRING(pp.browser_version,1,30) , 
                        --Campaign=SUBSTRING(Campaign,1,10) , 
                        campaign_id=coalesce(SUBSTRING(pp.campaign_id,1,10),SUBSTRING(pp.Campaign,1,10)) , 
                        carrier=substring(pp.carrier,1,50),
                        --CheckAvailability=SUBSTRING(CheckAvailability,1,30) , 
                        city=SUBSTRING(pp.city,1,200) , 
                        --clickleadsubmit=SUBSTRING(clickleadsubmit,1,30) , 
                        --ClickListMap=SUBSTRING(ClickListMap,1,30) , 
                        --ClickMapListingPin=SUBSTRING(ClickMapListingPin,1,30) , 
                        --ClicksCallTelephoneNumber=SUBSTRING(ClicksCallTelephoneNumber,1,30) , 
                        --clicktype=SUBSTRING(clicktype,1,200) ,   --Translate to position
                        --clickvalue=SUBSTRING(clickvalue,1,150) , 
                        --combldrid=SUBSTRING(combldrid,1,30) , 
                        CustIPAddress=SUBSTRING(pp.CustIPAddress,1,20) , 
                        --dcsid=SUBSTRING(dcsid,1,50) , 
                        --dcsqry=SUBSTRING(dcsqry,1,100) , 
                        --dcsref=SUBSTRING(dcsref,1,400) , 
                        --dcssip=SUBSTRING(dcssip,1,50) , 
                        --dcsuri=SUBSTRING(dcsuri,1,100) ,
                        device=substring(pp.device,1,100), 
                        DerivedCampaignID=SUBSTRING(COALESCE(CASE WHEN pp.referrer LIKE '%WT.mc_id=[0-9]%' THEN 
                                                                  SUBSTRING(pp.referrer,(CHARINDEX('WT.mc_id=',pp.referrer)) + 9,CASE WHEN (PATINDEX('%[a-z,$,-,?#,%,&]%',SUBSTRING(pp.referrer,CHARINDEX('WT.mc_id=',pp.referrer) + 9,999)) - 1) = -1 
                                                                                                                                    THEN 99
												                                                                                    ELSE PATINDEX('%[a-z,$,-,?,#,%,&]%',SUBSTRING(pp.referrer,CHARINDEX('WT.mc_id=',pp.referrer) + 9,999)) - 1 
													                                                                                 END
                                                                           )
						                                         ELSE NULL
					                                             END
                                                            ,CASE WHEN pp.url LIKE '%WT.mc_id=[0-9]%' THEN SUBSTRING(pp.url,(CHARINDEX('WT.mc_id=',pp.url)) + 9
                                                                                                                         ,CASE WHEN (PATINDEX('%[a-z,$,-,?,#,%,&]%',SUBSTRING(pp.url,CHARINDEX('WT.mc_id=',url) + 9,999)) - 1) = -1 
                                                                                                                               THEN 99
																												              ELSE PATINDEX('%[a-z,$,-,?,#,%,&]%',SUBSTRING(pp.url,CHARINDEX('WT.mc_id=',url) + 9,999)) - 1 
																												               END)
							                                      ELSE NULL
						                                           END)
                                                   ,1,10
                                                   ),
                        DerivedEFID=CASE WHEN REPLACE(pp.referrer,'_','|underscore|') LIKE '%ef|underscore|id%' THEN SUBSTRING(pp.referrer,CHARINDEX('ef_id',pp.referrer)+6,33) 
                                         WHEN REPLACE(pp.path,'_','|underscore|') LIKE '%ef|underscore|id%' THEN SUBSTRING(pp.path,CHARINDEX('ef_id',pp.path)+6,33) 
                                         ELSE NULL
                                          END,
                        --detail_page_type=SUBSTRING(detail_page_type,1,30) , 
                        --device=SUBSTRING(device,1,30) , 
                        --dim_id=SUBSTRING(dim_id,1,30) , 
                        --dim_name=SUBSTRING(dim_name,1,30) , 
                        --dim_text=SUBSTRING(dim_text,1,30) , 
                        --DISPLAYMODE=SUBSTRING(DISPLAYMODE,1,30) , 
                        --dpg=SUBSTRING(dpg,1,30) , 
                        ef_id=SUBSTRING(pp.ef_id,1,33) , 
                        --email_registration=SUBSTRING(email_registration,1,1) , 
                        --entry_campaign_id=SUBSTRING(entry_campaign_id,1,50) , 
                        --event_name=SUBSTRING(event_name,1,30) , 
                        --facebook_registration=SUBSTRING(facebook_registration,1,1) , 
                        featured_array=replace(SUBSTRING(pp.featured_array,1,200),';',',') , 
                        tvfe.FirstEventTVisit,
                        vfe.FirstEventVisit,
                        --first_pageview=SUBSTRING(first_pageview,1,30) , 
                        --floorplan=SUBSTRING(floorplan,1,500) , 
                        --ft=SUBSTRING(ft,1,30) , 
                        --g_c_pv=SUBSTRING(g_c_pv,1,30) , 
                        --geo=SUBSTRING(geo,1,30) , 
                        --googleplus_registration=SUBSTRING(googleplus_registration,1,30) , 
                        --[hash]=SUBSTRING([hash],1,100) , 
                        --hw=SUBSTRING(hw,1,50) , 
                        --[index]=SUBSTRING([index],1,30) , 
                        tvle.LastEventTVisit,
                        vle.LastEventVisit,
                        --last_name_required=SUBSTRING(last_name_required,1,30) , 
                        --leadcount= CASE WHEN profileid=1 and [wt.dl]='submission' THEN 
                        --                '1'
                        --           WHEN profileid in (51,52) and position='LeadSubmitted' THEN 
                        --                '1'
                        --           ELSE
                        --            SUBSTRING(leadcount,1,30)
                        --           END , 
                        --LeadSubmitted=SUBSTRING(LeadSubmitted,1,30) , 
                        --LeadType=SUBSTRING(LeadType,1,30) , 
                        --lfpos=SUBSTRING(lfpos,1,30) , 
                        link_id=left(pp.link_id,50),
                        listing_array=replace(isNULL(SUBSTRING(pp.listing_array,1,500),SUBSTRING(pp.spg,1,500) ),';',','), 
                        --listing_id=SUBSTRING(listing_id,1,30) , 
                        --listing_name=SUBSTRING(listing_name,1,200) , 
                        --listing_source=SUBSTRING(listing_source,1,30),
                        --listing_type=SUBSTRING(listing_type,1,30) , 
                        --listingdata=SUBSTRING(listingdata,1,400) , 
                        listingId=SUBSTRING(REPLACE(REPLACE(pp.listingId,'-',''),'.',''),1,30) , 
                        --listingid_lead_submission=SUBSTRING(listingid_lead_submission,1,30) , 
                        listings_per_page=isNULL(SUBSTRING(pp.listings_per_page,1,30),SUBSTRING(pp.lpp,1,30)) , 
                        --logged_in=SUBSTRING(logged_in,1,30) , 
                        --lpp=SUBSTRING(lpp,1,30) , 
                        --METRO=SUBSTRING(METRO,1,50) , 
                        --miles=SUBSTRING(miles,1,30) , 
                        --MSACODE=SUBSTRING(MSACODE,1,30) , 
                        --msg=SUBSTRING(msg,1,50) , 
                        neighborhood=SUBSTRING(pp.neighborhood,1,200) , 
                        operating_system=isNULL(SUBSTRING(pp.operating_system,1,30),SUBSTRING(pp.os,1,30) ),
						operating_system_version=SUBSTRING(pp.operating_system_version,1,30),
                        --original=SUBSTRING(original,1,400) , 
                        --os=SUBSTRING(os,1,30) , 
                        [page]=
                         CASE WHEN  pp.profilekey=-1 and pp.[site] in ('www.apartmentguide.com','m.apartmentguide.com','www.rent.com','www.rent.com_kilo')  --profileid <=83   --in (1,51,53) 
                              then
                             CASE WHEN pp.email_registration =1 THEN
                                     --CASE WHEN profileid=51 THEN
                                       case when pp.[site]='m.apartmentguide.com' then
                                            'sign_up'
                                          else
                                            SUBSTRING(pp.[WT.cg_n],1,200)
                                          END
                                  WHEN pp.googleplus_registration=1 THEN
                                       --CASE WHEN profileid=51 THEN
                                       case when pp.[site]='m.apartmentguide.com' then
                                            'login'
                                       ELSE
                                            SUBSTRING(pp.[WT.cg_n],1,200) 
                                       END
                                  WHEN  pp.facebook_registration=1 THEN
                                       CASE when pp.[site]='m.apartmentguide.com' --WHEN profileid=51 
                                       and CHARINDEX('user_type=new',pp.[page])> 0 THEN
                                            'sign_up'
                                       WHEN pp.[site]='m.apartmentguide.com' --profileid=51 
                                       and CHARINDEX('user_type=new',pp.[page])= 0 THEN
                                            'login'
                                          ELSE
                                            SUBSTRING(isnull(pp.[WT.cg_n],''),1,200)
                                          END
                                  WHEN  pp.twitter_registration=1 THEN
                                          case when pp.[site]='m.apartmentguide.com' then --CASE WHEN profileid=51 THEN
                                            'login'
                                          ELSE
                                            SUBSTRING(isnull(pp.[WT.cg_n],''),1,200)
                                          END

                              ELSE
                                 SUBSTRING(pp.[WT.cg_n],1,200)
                              END
                        ELSE
                            SUBSTRING(pp.[page],1,200) 
                        END, 
                        page_category=SUBSTRING(page_category,1,30) , 
                        page_number=isNULL(SUBSTRING(pp.page_number,1,10),SUBSTRING(pp.PAGENUM,1,10)) , 
                        page_sub=
                        CASE WHEN  pp.profilekey=-1 and pp.[site] in ('www.apartmentguide.com','m.apartmentguide.com','www.rent.com','www.rent.com_kilo') --profileid in (1,51,53)  
                             THEN
                             CASE WHEN pp.email_registration =1 THEN
                                     CASE WHEN pp.[site]='m.apartmentguide.com'--profileid =1 
                                           THEN
                                            'login_button'
                                          WHEN pp.[site]='m.apartmentguide.com' --profileid=51 
                                           THEN
                                            'login_button'
                                          WHEN  pp.[site] in ('www.rent.com','www.rent.com_kilo')--profileid=53 
                                          THEN
                                            'sign_up_button'
                                          ELSE
                                            NULL
                                          END
                                  WHEN pp.googleplus_registration=1 THEN
                                       'googleplus'                   
                                  WHEN  pp.facebook_registration=1 THEN
                                       'facebook'
                                  WHEN  pp.twitter_registration=1 THEN
                                       'twitter'
                              ELSE
                                 NULL
                              END
                        ELSE
                        SUBSTRING(isnull(pp.page_sub,''),1,200)
                        END , 
                        --PAGENUM=SUBSTRING(PAGENUM,1,10) , 
                        [path]=SUBSTRING(pp.[path],1,500),
                        --person_id=SUBSTRING(person_id,1,50) , 
                        --phone_required=SUBSTRING(phone_required,1,30) , 
                        --phonecount=SUBSTRING(phonecount,1,30) , 
                        position= 
                        CASE WHEN pp.ProfileKey = -1 THEN--profileid in (1,51,53)  then
                             CASE WHEN pp.email_registration =1 or pp.googleplus_registration=1 or pp.facebook_registration=1 or pp.twitter_registration=1 THEN
                                       CASE WHEN pp.[site] in ('www.apartmentguide.com','www.rent.com','www.rent.com_kilo') --profileid in (1,53) 
                                          and CHARINDEX('user_type=new',pp.[page])> 0 THEN
                                       'register_dev'
                                       WHEN pp.[site] in ('www.apartmentguide.com','www.rent.com','www.rent.com_kilo')--profileid in (1,53) 
                                         and CHARINDEX('user_type=new',pp.[page])= 0 THEN
                                       'login_div'
                                       WHEN pp.[site] in ('m.apartmentguide.com')--profileid = 51 
                                       THEN
                                       'login'
                                       END
                              ELSE
                                 NULL
                              END
                        ELSE
                            isNULL(SUBSTRING(isnull(pp.position,''),1,200),SUBSTRING(isnull(pp.clicktype,''),1,100)) 
                        END, 
                        [profile]=SUBSTRING(isnull(pp.[profile],''),1,50) , 
                        --propertyname=SUBSTRING(propertyname,1,200) , 
                        querystring=SUBSTRING(pp.querystring,1,500),
                        --r_l_cp_click=SUBSTRING(r_l_cp_click,1,30) , 
                        --r_l_map=SUBSTRING(r_l_map,1,30) , 
                        --r_l_pv=SUBSTRING(r_l_pv,1,30) , 
                        --r_l_rdny_click=SUBSTRING(r_l_rdny_click,1,30) , 
                        --r_l_sr=SUBSTRING(r_l_sr,1,1800) , 
                        --r_l_srloc=SUBSTRING(r_l_srloc,1,200) , 
                        --r_l_srloctype=SUBSTRING(r_l_srloctype,1,30) , 
                        --r_l_srlv=SUBSTRING(r_l_srlv,1,30) , 
                        --r_l_srmsa=SUBSTRING(r_l_srmsa,1,50) , 
                        --r_l_srpgnum=SUBSTRING(r_l_srpgnum,1,50) , 
                        --r_l_srpgsize=SUBSTRING(r_l_srpgsize,1,30) , 
                        --r_l_srrn=SUBSTRING(r_l_srrn,1,30) , 
                        --r_l_srspot=SUBSTRING(r_l_srspot,1,200) , 
                        --r_l_srspot_click=SUBSTRING(r_l_srspot_click,1,30) , 
                        --[rand]=SUBSTRING([rand],1,200) , 
                        --RefDomain=SUBSTRING(RefDomain,1,200) , 
                        referrer=SUBSTRING(pp.referrer,1,2000) , 
                        referring_domain=isNULL(SUBSTRING(pp.referring_domain,1,200),SUBSTRING(pp.RefDomain,1,200)) , 
                        --refine_srch=SUBSTRING(refine_srch,1,1000) , 
                        refinement_array=replace(SUBSTRING(pp.refinement_array,1,500),';',',') , 
                        --registration=SUBSTRING(registration,1,50) , 
                        --RH_L_PV=SUBSTRING(RH_L_PV,1,30) , 
                        --RH_L_SR=SUBSTRING(RH_L_SR,1,500) , 
                        --screen_resolution=SUBSTRING(screen_resolution,1,30) , 
                        screen_title=left(pp.screen_title,50),
                        screen_type=SUBSTRING(pp.screen_type,1,50) , 
                        --search=SUBSTRING(search,1,200) , 
                        selection=SUBSTRING(pp.selection,1,50) , 
                        --selsearch=SUBSTRING(selsearch,1,100) , 
                        seq=SUBSTRING(pp.seq,1,30) , 
                        --ServerIPAddress=SUBSTRING(ServerIPAddress,1,30) , 
                        --session_id=SUBSTRING(session_id,1,30) , 
                        --shadow_person_id=SUBSTRING(shadow_person_id,1,30) , 
                        --[site]=SUBSTRING([site],1,50) , 
                        --site_value=SUBSTRING(site_value,1,200) , 
                        --site_version=SUBSTRING(site_version,1,50) , 
                        --spg=SUBSTRING(spg,1,500) , 
                        --spotlight=SUBSTRING(spotlight,1,30) , 
                        spotlight_array=replace(SUBSTRING(pp.spotlight_array,1,200),';',',') , 
                        --spotlight_count=SUBSTRING(spotlight_count,1,30) , 
                        --SpotlightPaginationLeft=SUBSTRING(SpotlightPaginationLeft,1,30) , 
                        --SpotlightPaginationRight=SUBSTRING(SpotlightPaginationRight,1,30) , 
                        --SRCH=SUBSTRING(SRCH,1,200) , 
                        --srchresults=SUBSTRING(srchresults,1,30) , 
                        --ssSiteID=SUBSTRING(ssSiteID,1,30) , 
                        ssSiteName=SUBSTRING(pp.ssSiteName,1,30) , 
                        --ssTestID=SUBSTRING(ssTestID,1,10),
                        ssTestName=SUBSTRING(pp.ssTestName,1,255) , 
                        --ssVariationGroupID=SUBSTRING(ssVariationGroupID,1,10),
                        ssVariationGroupName=SUBSTRING(pp.ssVariationGroupName,1,255) , 
                        --ssVisitCounted=SUBSTRING(ssVisitCounted,1,10),
                        [state]=SUBSTRING(pp.[state],1,50) , 
                        --SubmitLeadFromCheckAvailDetail=SUBSTRING(SubmitLeadFromCheckAvailDetail,1,30) , 
                        subprofile=SUBSTRING(pp.subprofile,1,50) , 
                        t_visit=SUBSTRING(pp.t_visit,1,200) , 
                        --tag_item=SUBSTRING(tag_item,1,30) , 
                        --[text]=SUBSTRING([text],1,100) , 
                        --title=SUBSTRING(title,1,500) , 
                        --TOTALSEARCHRESULTS=SUBSTRING(TOTALSEARCHRESULTS,1,30) , 
                        tpl_source=SUBSTRING(tpl_source,1,30), 
                        --twitter_registration=SUBSTRING(twitter_registration,1,30) , 
                        unitlayout_id=SUBSTRING(pp.unitlayout_id,1,30) , 
                        url=SUBSTRING(pp.url,1,500) , 
                        --user_email=SUBSTRING(user_email,1,200) , 
                        --[user_id]=SUBSTRING([user_id],1,200) , 
                        --UserAgent=SUBSTRING(UserAgent,1,350) , 
                        --userid=SUBSTRING(userid,1,200) , 
                        uzid=SUBSTRING(pp.uzid,1,36) , 
                        --value=SUBSTRING(value,1,400) , 
                        --ver=SUBSTRING(ver,1,30) , 
                        --[version]=SUBSTRING([version],1,30) , 
                        visit=isNULL(SUBSTRING(pp.visit,1,50),SUBSTRING(pp.[WT.vt_sid],1,50)) , 
                        visitor=isNULL(SUBSTRING(pp.visitor,1,100),SUBSTRING(pp.[WT.co_f],1,100)) , 
                        --[WT.bh]=SUBSTRING([WT.bh],1,30) , 
                        --[WT.bs]=SUBSTRING([WT.bs],1,15),
                        --[WT.cg_n]=SUBSTRING([WT.cg_n],1,200) , 
                        --[WT.co_f]=SUBSTRING([WT.co_f],1,100) , 
                        --[WT.dl]=SUBSTRING([WT.dl],1,200) , 
                        --[WT.fi]=SUBSTRING([WT.fi],1,30) , 
                        --[WT.fv]=SUBSTRING([WT.fv],1,30) , 
                        --[WT.hp]=SUBSTRING([WT.hp],1,30) , 
                        --[WT.jo]=SUBSTRING([WT.jo],1,30) , 
                        --[WT.js]=SUBSTRING([WT.js],1,30) , 
                        --[WT.jv]=SUBSTRING([WT.jv],1,30) , 
                        --[WT.si_n]=SUBSTRING([WT.si_n],1,50) , 
                        --[WT.si_p]=SUBSTRING([WT.si_p],1,200) , 
                        --[WT.si_x]=SUBSTRING([WT.si_x],1,30) , 
                        --[WT.sr]=SUBSTRING([WT.sr],1,50) , 
                        --[WT.ti]=SUBSTRING([WT.ti],1,500) , 
                        --[WT.tu]=SUBSTRING([WT.tu],1,30) , 
                        --[WT.tz]=SUBSTRING([WT.tz],1,30) , 
                        --[WT.ul]=SUBSTRING([WT.ul],1,30) , 
                        --[WT.vt_f_tlh]=SUBSTRING([WT.vt_f_tlh],1,30) , 
                        --[WT.vt_f_tlv]=SUBSTRING([WT.vt_f_tlv],1,15),
                        --[WT.vt_sid]=SUBSTRING([WT.vt_sid],1,200) , 
                        --zip=SUBSTRING(zip,1,30) , 
                        x=left(pp.[x],20),
                        y=left(pp.[y],20),
                        zip_code=isNULL(SUBSTRING(pp.zip_code,1,30), SUBSTRING(pp.zip,1,30))
                    from staging.parsedPivot pp
                    left join staging.TVisitFirstLast tvfe on pp.parseid=tvfe.parseid and tvfe.FirstEventTvisit=1
                    left join staging.VisitFirstLast vfe   on pp.parseid=vfe.parseid  and vfe.FirstEventVisit=1
                    left join staging.TVisitFirstLast tvle on pp.parseid=tvle.parseid and tvle.LastEventTvisit=1
                    left join staging.VisitFirstLast vle   on pp.parseid=vle.parseid  and vle.LastEventVisit=1
                    where (len(pp.ListingID)<=30 or pp.listingid is NULL)  --get rid of listingid =  ï¿½Fredericksburg/The-Mark-at-Salem-Station/16114/'/><meta class=
                      and pp.[profile] is not null
                      and pp.[subprofile] is not null
                      and profilekey <> -1
                      and pp.t_visit<>'.';
                   
        ELSE
                    CREATE TABLE [dbo].[ParsedPivotRecover] 
                    WITH (CLUSTERED COLUMNSTORE INDEX, DISTRIBUTION = HASH([Parseid]))
                    as 
                    select 
                        pp.Parseid, 
                        pp.ProfileKey,
                        pp.YMDID, 
                        pp.Eventdate, 
                        [action]=
                        CASE WHEN  pp.profilekey=-1 and pp.[site] in ('www.apartmentguide.com','m.apartmentguide.com','www.rent.com','www.rent.com_kilo') --profileid in (1,51,53) 
                               and (pp.email_registration =1 or pp.googleplus_registration=1 or pp.facebook_registration=1 or pp.twitter_registration=1) THEN
                           'click'
                        ELSE
                           isNULL(SUBSTRING(pp.[action],1,100),SUBSTRING(pp.[WT.dl],1,100)) 
                        END, 
                        [app_name]=SUBSTRING(pp.[app_name],1,50),
                        app_version=SUBSTRING(pp.[app_version],1,50),
                        browser=SUBSTRING(pp.browser,1,30) , 
                        --browser_size=SUBSTRING(browser_size,1,50) , 
                        browser_version=SUBSTRING(pp.browser_version,1,30) , 
                        campaign_id=coalesce(SUBSTRING(pp.campaign_id,1,10),SUBSTRING(pp.Campaign,1,10)) , 
                        carrier=substring(pp.carrier,1,50),
                        city=SUBSTRING(pp.city,1,200) , 
                        CustIPAddress=SUBSTRING(pp.CustIPAddress,1,20) , 
                        device=substring(pp.device,1,100), 
                        DerivedCampaignID=SUBSTRING(COALESCE(CASE WHEN pp.referrer LIKE '%WT.mc_id=[0-9]%' THEN 
                                                                  SUBSTRING(pp.referrer,(CHARINDEX('WT.mc_id=',pp.referrer)) + 9,CASE WHEN (PATINDEX('%[a-z,$,-,?#,%,&]%',SUBSTRING(pp.referrer,CHARINDEX('WT.mc_id=',pp.referrer) + 9,999)) - 1) = -1 
                                                                                                                                    THEN 99
												                                                                                    ELSE PATINDEX('%[a-z,$,-,?,#,%,&]%',SUBSTRING(pp.referrer,CHARINDEX('WT.mc_id=',pp.referrer) + 9,999)) - 1 
													                                                                                 END
                                                                           )
						                                         ELSE NULL
					                                             END
                                                            ,CASE WHEN pp.url LIKE '%WT.mc_id=[0-9]%' THEN SUBSTRING(pp.url,(CHARINDEX('WT.mc_id=',pp.url)) + 9
                                                                                                                         ,CASE WHEN (PATINDEX('%[a-z,$,-,?,#,%,&]%',SUBSTRING(pp.url,CHARINDEX('WT.mc_id=',pp.url) + 9,999)) - 1) = -1 
                                                                                                                               THEN 99
																												              ELSE PATINDEX('%[a-z,$,-,?,#,%,&]%',SUBSTRING(pp.url,CHARINDEX('WT.mc_id=',pp.url) + 9,999)) - 1 
																												               END)
							                                      ELSE NULL
						                                           END)
                                                   ,1,10
                                                   ),
                        DerivedEFID=CASE WHEN REPLACE(pp.referrer,'_','|underscore|') LIKE '%ef|underscore|id%' THEN SUBSTRING(pp.referrer,CHARINDEX('ef_id',pp.referrer)+6,33) 
                                         WHEN REPLACE(pp.path,'_','|underscore|') LIKE '%ef|underscore|id%' THEN SUBSTRING(pp.path,CHARINDEX('ef_id',pp.path)+6,33) 
                                         ELSE NULL
                                          END,
                        ef_id=SUBSTRING(pp.ef_id,1,33) , 
                        featured_array=replace(SUBSTRING(pp.featured_array,1,200),';',',') , 
                        tvfe.FirstEventTVisit,
                        vfe.FirstEventVisit,
                        tvle.LastEventTVisit,
                        vle.LastEventVisit,
                        link_id=left(pp.link_id,50),
                        listing_array=replace(isNULL(SUBSTRING(pp.listing_array,1,500),SUBSTRING(pp.spg,1,500) ),';',','), 
                        listingId=SUBSTRING(REPLACE(REPLACE(pp.listingId,'-',''),'.',''),1,30) , 
                        listings_per_page=isNULL(SUBSTRING(pp.listings_per_page,1,30),SUBSTRING(pp.lpp,1,30)) , 
                        neighborhood=SUBSTRING(pp.neighborhood,1,200) , 
                        operating_system=isNULL(SUBSTRING(pp.operating_system,1,30),SUBSTRING(pp.os,1,30) ), 
						operating_system_version=SUBSTRING(pp.operating_system_version,1,30),
                        [page]=
                         CASE WHEN  pp.profilekey=-1 and pp.[site] in ('www.apartmentguide.com','m.apartmentguide.com','www.rent.com','www.rent.com_kilo')--profileid <=83   --in (1,51,53) 
                          THEN
                             CASE WHEN pp.email_registration =1 THEN
                                     CASE WHEN pp.[site]='m.apartmentguide.com'--profileid=51 
                                          THEN
                                            'sign_up'
                                          else
                                            SUBSTRING(pp.[WT.cg_n],1,200)
                                          END
                                  WHEN pp.googleplus_registration=1 THEN
                                       CASE WHEN pp.[site]='m.apartmentguide.com'--profileid=51 
                                            THEN
                                            'login'
                                       ELSE
                                            SUBSTRING(pp.[WT.cg_n],1,200) 
                                       END
                                  WHEN  pp.facebook_registration=1 THEN
                                       CASE WHEN pp.[site]='m.apartmentguide.com'--profileid=51 
                                             and CHARINDEX('user_type=new',pp.[page])> 0 THEN
                                            'sign_up'
                                       WHEN pp.[site]='m.apartmentguide.com'--profileid=51 
                                            and CHARINDEX('user_type=new',pp.[page])= 0 THEN
                                            'login'
                                          ELSE
                                            SUBSTRING(isnull(pp.[WT.cg_n],''),1,200)
                                          END
                                  WHEN  pp.twitter_registration=1 THEN
                                          CASE WHEN pp.[site]='m.apartmentguide.com'--profileid=51 
                                               THEN
                                            'login'
                                          ELSE
                                            SUBSTRING(isnull(pp.[WT.cg_n],''),1,200)
                                          END

                              ELSE
                                 SUBSTRING(isnull(pp.[WT.cg_n],''),1,200)
                              END
                        ELSE
                            SUBSTRING(isnull(pp.[page],''),1,200) 
                        END, 
                        page_category=SUBSTRING(pp.page_category,1,30) , 
                        page_number=isNULL(SUBSTRING(pp.page_number,1,10),SUBSTRING(pp.PAGENUM,1,10)) , 
                        page_sub=
                        CASE WHEN  pp.profilekey=-1 and pp.[site] in ('www.apartmentguide.com','m.apartmentguide.com','www.rent.com','www.rent.com_kilo') --profileid in (1,51,53) 
                             THEN
                             CASE WHEN pp.email_registration =1 THEN
                                     CASE WHEN pp.[site] in ('www.apartmentguide.com')--profileid =1 
                                          THEN
                                            'login_button'
                                          WHEN pp.[site] in ('m.apartmentguide.com')--profileid=51 
                                          THEN
                                            'login_button'
                                          WHEN pp.[site] in ('www.rent.com','www.rent.com_kilo')--profileid=53 
                                          THEN
                                            'sign_up_button'
                                          ELSE
                                            NULL
                                          END
                                  WHEN pp.googleplus_registration=1 THEN
                                       'googleplus'                   
                                  WHEN  pp.facebook_registration=1 THEN
                                       'facebook'
                                  WHEN  pp.twitter_registration=1 THEN
                                       'twitter'
                              ELSE
                                 NULL
                              END
                        ELSE
                        SUBSTRING(pp.page_sub,1,200)
                        END , 
                        [path]=SUBSTRING(pp.[path],1,500),
                        position= 
                        CASE WHEN  pp.profilekey=-1 and pp.[site] in ('www.apartmentguide.com','m.apartmentguide.com','www.rent.com','www.rent.com_kilo') --profileid in (1,51,53)  
                             then
                             CASE WHEN pp.email_registration =1 or pp.googleplus_registration=1 or pp.facebook_registration=1 or pp.twitter_registration=1 THEN
                                       CASE WHEN pp.[site] in ('www.apartmentguide.com','www.rent.com','www.rent.com_kilo')--profileid in (1,53) 
                                         and CHARINDEX('user_type=new',pp.[page])> 0 THEN
                                       'register_dev'
                                       WHEN pp.[site] in ('www.apartmentguide.com','www.rent.com','www.rent.com_kilo')--profileid in (1,53) 
                                        and CHARINDEX('user_type=new',pp.[page])= 0 THEN
                                       'login_div'
                                       WHEN pp.[site] in ('m.apartmentguide.com')--profileid = 51 
                                        THEN
                                       'login'
                                       END
                              ELSE
                                 NULL
                              END
                        ELSE
                            isNULL(SUBSTRING(pp.position,1,200),SUBSTRING(pp.clicktype,1,100)) 
                        END, 
                        [profile]=SUBSTRING(pp.[profile],1,50) , 
                        querystring=SUBSTRING(pp.querystring,1,500),
                        referrer=SUBSTRING(pp.referrer,1,2000) , 
                        referring_domain=isNULL(SUBSTRING(pp.referring_domain,1,200),SUBSTRING(pp.RefDomain,1,200)) , 
                        refinement_array=replace(SUBSTRING(pp.refinement_array,1,500),';',',') , 
                        screen_title=left(pp.screen_title,50),
                        screen_type=SUBSTRING(pp.screen_type,1,50) , 
                        selection=SUBSTRING(pp.selection,1,50) , 
                        seq=SUBSTRING(pp.seq,1,30) , 
                        spotlight_array=replace(SUBSTRING(pp.spotlight_array,1,200),';',',') , 
                        ssSiteName=SUBSTRING(pp.ssSiteName,1,30) , 
                        ssTestName=SUBSTRING(pp.ssTestName,1,255) , 
                        ssVariationGroupName=SUBSTRING(pp.ssVariationGroupName,1,255) , 
                        [state]=SUBSTRING(pp.[state],1,50) , 
                        subprofile=SUBSTRING(pp.subprofile,1,50) ,
						t_visit=SUBSTRING(pp.t_visit,1,200) , 
						tpl_source=SUBSTRING(pp.tpl_source,1,30), 						 
                        unitlayout_id=SUBSTRING(pp.unitlayout_id,1,30) , 
                        url=SUBSTRING(pp.url,1,500) , 
                        uzid=SUBSTRING(pp.uzid,1,36) , 
                        visit=isNULL(SUBSTRING(pp.visit,1,50),SUBSTRING(pp.[WT.vt_sid],1,50)) , 
                        visitor=isNULL(SUBSTRING(pp.visitor,1,100),SUBSTRING(pp.[WT.co_f],1,100)) , 
                        x=left(pp.[x],20),
                        y=left(pp.[y],20),
                        zip_code=isNULL(SUBSTRING(pp.zip_code,1,30), SUBSTRING(pp.zip,1,30))
                    from staging.parsedPivotRecover pp
                    left join staging.TVisitFirstLastRecover tvfe on pp.parseid=tvfe.parseid and tvfe.FirstEventTvisit=1
                    left join staging.VisitFirstLastRecover vfe   on pp.parseid=vfe.parseid  and vfe.FirstEventVisit=1
                    left join staging.TVisitFirstLastRecover tvle on pp.parseid=tvle.parseid and tvle.LastEventTvisit=1
                    left join staging.VisitFirstLastRecover vle   on pp.parseid=vle.parseid  and vle.LastEventVisit=1
                    where (len(pp.ListingID)<=30 or pp.listingid is NULL)  --get rid of listingid =  ï¿½Fredericksburg/The-Mark-at-Salem-Station/16114/'/><meta class=
                      and pp.[profile] is not null
                      and pp.[subprofile] is not null
                      and profilekey <> -1
                      and pp.t_visit<>'.';

    SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
            EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                @ProcName = @ProcedureName,
                @StepName = '5 DBO.ParsedPivot reCreated',
                @VariableStates = @LocalYMDID,
                @LengthInSeconds = @LengthInSeconds,
                @Comments = 'DBO.ParsedPivot reCreated';
    SET @TrackDate = GETDATE();


----##########################################################################
----Create ParsedPivot Statistics
----##########################################################################
    BEGIN TRY
            IF @LocalYMDID = CAST(CONVERT(VARCHAR(8), GETDATE() - 1, 112) AS INT)
            OR @tableSet ='ParsedData'
            BEGIN
                exec [dbo].[pr_CreateStats] 'staging','ParsedPivot'
                exec [dbo].[pr_CreateStats] 'dbo','ParsedPivot'

            END
            ELSE
                    BEGIN
                    exec [dbo].[pr_CreateStats] 'staging','ParsedPivotRecover'
                    exec [dbo].[pr_CreateStats] 'dbo','ParsedPivotRecover'
                    END
        END TRY
        BEGIN CATCH
                      SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE());       
                     EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                       @ProcName = @ProcedureName,
                      @StepName = 'Statistic ',
                      @VariableStates = @LocalYMDID,
                    @LengthInSeconds = @LengthInSeconds,
                    @Comments = 'FAILED TO RECREATED Statistic.';
                SET @TrackDate = GETDATE();

        END CATCH
            
        SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE());       
                EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                    @ProcName = @ProcedureName,
                    @StepName = '6 Final Statistic Recreated.  End Procedure',
                    @VariableStates = @LocalYMDID,
                    @LengthInSeconds = @LengthInSeconds,
                    @Comments = '6 Final Statistic Recreated.  End Procedure';
                SET @TrackDate = GETDATE();

End Try
begin Catch
        SET @LengthInSeconds = DATEDIFF(ss, @TrackDate,GETDATE())            
                EXEC dbo.pr_Logging_StoredProcs @DatabaseName = @DatabaseName,
                    @ProcName = @ProcedureName,
                    @StepName = 'FAILED End Procedure',
                    @VariableStates = @LocalYMDID,
                    @LengthInSeconds = @LengthInSeconds,
                    @Comments = 'FAILED  End Procedure';
                SET @TrackDate = GETDATE();

throw  51000, 'Failed Procedure. [staging].[pr_ParsedPivot].  Check Staging.ParsedPivot and dbo.ParsedPivot', 1;

End Catch
END


