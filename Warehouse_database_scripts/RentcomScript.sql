USE [master]
GO
/****** Object:  Database [RentCom]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE DATABASE [RentCom]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RentCom', FILENAME = N'F:\Data\RentCom.Mdf' , SIZE = 1048576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB )
 LOG ON 
( NAME = N'RentCom_log', FILENAME = N'F:\Log\RentCom_log.ldf' , SIZE = 1048576KB , MAXSIZE = 2048GB , FILEGROWTH = 1048576KB )
GO
ALTER DATABASE [RentCom] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RentCom].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RentCom] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RentCom] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RentCom] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RentCom] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RentCom] SET ARITHABORT OFF 
GO
ALTER DATABASE [RentCom] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RentCom] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RentCom] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RentCom] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RentCom] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RentCom] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RentCom] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RentCom] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RentCom] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RentCom] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RentCom] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RentCom] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RentCom] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RentCom] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RentCom] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RentCom] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RentCom] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RentCom] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [RentCom] SET  MULTI_USER 
GO
ALTER DATABASE [RentCom] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RentCom] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RentCom] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RentCom] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [RentCom] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'RentCom', N'ON'
GO
ALTER DATABASE [RentCom] SET QUERY_STORE = OFF
GO
USE [RentCom]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [RentCom]
GO
/****** Object:  Schema [Dimension]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE SCHEMA [Dimension]
GO
/****** Object:  Schema [Fact]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE SCHEMA [Fact]
GO
/****** Object:  Schema [Mart]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE SCHEMA [Mart]
GO
/****** Object:  Schema [Reports]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE SCHEMA [Reports]
GO
/****** Object:  Schema [Staging]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE SCHEMA [Staging]
GO
/****** Object:  Table [Mart].[Listings_Legacy]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[Listings_Legacy](
	[YMDID] [int] NOT NULL,
	[YearMonth] [int] NOT NULL,
	[RentPropertyID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[ListingTypeID] [int] NOT NULL,
	[ListingType] [varchar](25) NOT NULL,
	[ListingTypeShort] [varchar](5) NOT NULL,
	[RentStatusID] [tinyint] NOT NULL,
	[ExternalID] [varchar](50) NOT NULL,
	[ExternalPriceCode] [varchar](25) NOT NULL,
	[RentLeaseMgtCoID] [int] NOT NULL,
	[LeaseMgtCoID] [int] NULL,
	[TotalPhotos] [int] NOT NULL,
	[ActivePhotos] [int] NOT NULL,
	[TotalFloorPlans] [int] NOT NULL,
	[ActiveFloorPlans] [int] NOT NULL,
	[TotalAmenities] [int] NOT NULL,
	[ActiveAmenities] [int] NOT NULL,
	[ActiveHDPhotos] [int] NOT NULL,
	[ActiveHDFloorPlans] [int] NOT NULL,
	[ShowPricing] [tinyint] NOT NULL,
	[ShowOfficeHours] [tinyint] NOT NULL,
	[ListingDescriptionLength] [int] NOT NULL,
	[LowPrice] [int] NOT NULL,
	[HighPrice] [int] NOT NULL,
	[UpsellListCoupon] [tinyint] NOT NULL,
	[UpsellPropCallRecording] [tinyint] NOT NULL,
	[UpsellRentListing] [tinyint] NOT NULL,
	[UpsellRentRewardCard] [tinyint] NOT NULL,
	[UpsellRentFeaturedPlacement] [tinyint] NOT NULL,
	[UpsellRentPTE] [tinyint] NOT NULL,
	[UpsellRentVIPPlacement] [tinyint] NOT NULL,
	[UpsellRentNoVacancy] [tinyint] NOT NULL,
	[UpsellRentMetroFL] [tinyint] NOT NULL,
	[UpsellRentSpotlight] [tinyint] NOT NULL,
	[UpsellRentSubscriptionModel] [tinyint] NOT NULL,
	[UpsellListPayPerLeaseALM] [tinyint] NOT NULL,
	[FutureUpsell04] [tinyint] NOT NULL,
	[CR3AvgOverallRating] [numeric](16, 1) NOT NULL,
	[HDActiveFloorPlansFulfilled] [tinyint] NULL,
	[HDActivePhotosFulfilled] [tinyint] NULL,
	[LinkedFloorPlanFulfilled] [tinyint] NULL,
	[Linked3DFloorPlanFulfilled] [tinyint] NULL,
	[LinkedRoomPlannerFulfilled] [tinyint] NULL,
	[MobileDealFulfilled] [tinyint] NULL,
	[CouponActiveOnSite] [tinyint] NOT NULL,
	[LastUpdateYMDID] [int] NOT NULL,
	[LinkedFloorPlan] [int] NOT NULL,
	[Linked3DFloorPlan] [int] NULL,
	[LinkedRoomPlanner] [int] NULL,
	[UniqueVisits] [int] NOT NULL,
	[MapClicks] [int] NOT NULL,
	[ClicksMgtCoWebLink] [int] NOT NULL,
	[FutureClicks01] [int] NOT NULL,
	[FutureClicks02] [int] NOT NULL,
	[FutureClicks03] [int] NOT NULL,
	[FutureClicks04] [int] NOT NULL,
	[FutureClicks05] [int] NOT NULL,
	[ImprSearchResults] [int] NOT NULL,
	[RentConnectedCalls] [int] NOT NULL,
	[RentMissedCalls] [int] NOT NULL,
	[RentOneWebConnectedCalls] [int] NOT NULL,
	[RentOneWebMissedCalls] [int] NOT NULL,
	[RentAltRegConnectedCalls] [int] NOT NULL,
	[RentAltRegMissedCalls] [int] NOT NULL,
	[RentMobileConnectedCalls] [int] NOT NULL,
	[RentMobileMissedCalls] [int] NOT NULL,
	[RentSEMConnectedCalls] [int] NOT NULL,
	[RentSEMMissedCalls] [int] NOT NULL,
	[RentMobileSEMConnectedCalls] [int] NOT NULL,
	[RentMobileSEMMissedCalls] [int] NOT NULL,
	[FutureConnectedCalls03] [int] NOT NULL,
	[FutureMissedCalls03] [int] NOT NULL,
	[RentEmailLeads] [int] NOT NULL,
	[TruliaEmailLeads] [int] NOT NULL,
	[AndroidEmailLeads] [int] NOT NULL,
	[iPadEmailLeads] [int] NOT NULL,
	[iPhoneEmailLeads] [int] NOT NULL,
	[FutureEmailLeads01] [int] NOT NULL,
	[FutureEmailLeads02] [int] NOT NULL,
	[FutureEmailLeads03] [int] NOT NULL,
	[FutureEmailLeads04] [int] NOT NULL,
	[InvoicedLeases] [int] NOT NULL,
	[InternetPhoneLeads]  AS ((((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls])+[RentSEMConnectedCalls])+[RentMobileSEMConnectedCalls]),
	[InternetPhoneLeads_NoMobile]  AS ((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentSEMConnectedCalls]),
	[InternetEmailLeads_NoMobile]  AS ([RentEmailLeads]+[TruliaEmailLeads]),
	[AllInternetLeads_NoMobile]  AS ((((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentSEMConnectedCalls])+[RentEmailLeads])+[TruliaEmailLeads]),
	[DigitalPhoneLeads]  AS ((((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls])+[RentSEMConnectedCalls])+[RentMobileSEMConnectedCalls]),
	[DigitalEmailLeads]  AS (((([RentEmailLeads]+[TruliaEmailLeads])+[AndroidEmailLeads])+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[EmailLeads]  AS (((([RentEmailLeads]+[TruliaEmailLeads])+[AndroidEmailLeads])+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[AllDigitalLeads]  AS (((((((((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls])+[RentSEMConnectedCalls])+[RentMobileSEMConnectedCalls])+[RentEmailLeads])+[TruliaEmailLeads])+[AndroidEmailLeads])+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[MobileCalls]  AS ([RentMobileConnectedCalls]+[RentMobileSEMConnectedCalls]),
	[MobileEmails]  AS (([AndroidEmailLeads]+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[MobileAllLeads]  AS (((([RentMobileConnectedCalls]+[RentMobileSEMConnectedCalls])+[AndroidEmailLeads])+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[AllLeads]  AS (((((((((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls])+[RentSEMConnectedCalls])+[RentMobileSEMConnectedCalls])+[RentEmailLeads])+[TruliaEmailLeads])+[AndroidEmailLeads])+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[AllMissedCalls]  AS ((((([RentMissedCalls]+[RentAltRegMissedCalls])+[RentOneWebMissedCalls])+[RentMobileMissedCalls])+[RentSEMMissedCalls])+[RentMobileSEMMissedCalls]),
	[AllConnectedCalls]  AS ((((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls])+[RentSEMConnectedCalls])+[RentMobileSEMConnectedCalls]),
	[WebsiteEmails]  AS ([RentEmailLeads]),
	[WebsiteCalls]  AS (((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls])+[RentSEMConnectedCalls]),
 CONSTRAINT [PK_MartListings_Legacy_new] PRIMARY KEY CLUSTERED 
(
	[YMDID] ASC,
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  View [Mart].[Listings_From_WH_To_APS]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--SELECT * FROM RentCom.Mart.Listings_From_WH_To_APS WHERE YMDID BETWEEN 20160602 AND 20160602 ORDER BY YMDID, ListingID
--DROP VIEW Mart.Listings_From_WH_To_APS
CREATE VIEW [Mart].[Listings_From_WH_To_APS]
AS
SELECT
[YMDID]  AS [YMDID]
, [YearMonth]  AS [YearMonth]
, [RentPropertyID]  AS [RentPropertyID]
, [PropertyID]  AS [PropertyID]
, [ListingID]  AS [ListingID]
, [ListingTypeID]  AS [ListingTypeID]
, [ListingType]   COLLATE Latin1_General_100_CI_AS_KS_WS AS [ListingType]
, [ListingTypeShort]   COLLATE Latin1_General_100_CI_AS_KS_WS AS [ListingTypeShort]
, [RentStatusID]  AS [RentStatusID]
, [ExternalID]   COLLATE Latin1_General_100_CI_AS_KS_WS AS [ExternalID]
, [ExternalPriceCode]   COLLATE Latin1_General_100_CI_AS_KS_WS AS [ExternalPriceCode]
, [RentLeaseMgtCoID]  AS [RentLeaseMgtCoID]
, [LeaseMgtCoID]  AS [LeaseMgtCoID]
, [TotalPhotos]  AS [TotalPhotos]
, [ActivePhotos]  AS [ActivePhotos]
, [TotalFloorPlans]  AS [TotalFloorPlans]
, [ActiveFloorPlans]  AS [ActiveFloorPlans]
, [TotalAmenities]  AS [TotalAmenities]
, [ActiveAmenities]  AS [ActiveAmenities]
, [ActiveHDPhotos]  AS [ActiveHDPhotos]
, [ActiveHDFloorPlans]  AS [ActiveHDFloorPlans]
, [ShowPricing]  AS [ShowPricing]
, [ShowOfficeHours]  AS [ShowOfficeHours]
, [ListingDescriptionLength]  AS [ListingDescriptionLength]
, [LowPrice]  AS [LowPrice]
, [HighPrice]  AS [HighPrice]
, [UpsellListCoupon]  AS [UpsellListCoupon]
, [UpsellPropCallRecording]  AS [UpsellPropCallRecording]
, [UpsellRentListing]  AS [UpsellRentListing]
, [UpsellRentRewardCard]  AS [UpsellRentRewardCard]
, [UpsellRentFeaturedPlacement]  AS [UpsellRentFeaturedPlacement]
, [UpsellRentPTE]  AS [UpsellRentPTE]
, [UpsellRentVIPPlacement]  AS [UpsellRentVIPPlacement]
, [UpsellRentNoVacancy]  AS [UpsellRentNoVacancy]
, [UpsellRentMetroFL]  AS [UpsellRentMetroFL]
, [UpsellRentSpotlight]  AS [UpsellRentSpotlight]
, [UpsellRentSubscriptionModel]  AS [UpsellRentSubscriptionModel]
, [UpsellListPayPerLeaseALM]  AS [UpsellListPayPerLeaseALM]
, [FutureUpsell04]  AS [FutureUpsell04]
, [CR3AvgOverallRating]  AS [CR3AvgOverallRating]
, [HDActiveFloorPlansFulfilled]  AS [HDActiveFloorPlansFulfilled]
, [HDActivePhotosFulfilled]  AS [HDActivePhotosFulfilled]
, [LinkedFloorPlanFulfilled]  AS [LinkedFloorPlanFulfilled]
, [Linked3DFloorPlanFulfilled]  AS [Linked3DFloorPlanFulfilled]
, [LinkedRoomPlannerFulfilled]  AS [LinkedRoomPlannerFulfilled]
, [MobileDealFulfilled]  AS [MobileDealFulfilled]
, [CouponActiveOnSite]  AS [CouponActiveOnSite]
, [LastUpdateYMDID]  AS [LastUpdateYMDID]
, [LinkedFloorPlan]  AS [LinkedFloorPlan]
, [Linked3DFloorPlan]  AS [Linked3DFloorPlan]
, [LinkedRoomPlanner]  AS [LinkedRoomPlanner]
, [UniqueVisits]  AS [UniqueVisits]
, [MapClicks]  AS [MapClicks]
, [ClicksMgtCoWebLink]  AS [ClicksMgtCoWebLink]
, [FutureClicks01]  AS [FutureClicks01]
, [FutureClicks02]  AS [FutureClicks02]
, [FutureClicks03]  AS [FutureClicks03]
, [FutureClicks04]  AS [FutureClicks04]
, [FutureClicks05]  AS [FutureClicks05]
, [ImprSearchResults]  AS [ImprSearchResults]
, [RentConnectedCalls]  AS [RentConnectedCalls]
, [RentMissedCalls]  AS [RentMissedCalls]
, [RentOneWebConnectedCalls]  AS [RentOneWebConnectedCalls]
, [RentOneWebMissedCalls]  AS [RentOneWebMissedCalls]
, [RentAltRegConnectedCalls]  AS [RentAltRegConnectedCalls]
, [RentAltRegMissedCalls]  AS [RentAltRegMissedCalls]
, [RentMobileConnectedCalls]  AS [RentMobileConnectedCalls]
, [RentMobileMissedCalls]  AS [RentMobileMissedCalls]
, [RentSEMConnectedCalls]  AS [RentSEMConnectedCalls]
, [RentSEMMissedCalls]  AS [RentSEMMissedCalls]
, [RentMobileSEMConnectedCalls]  AS [RentMobileSEMConnectedCalls]
, [RentMobileSEMMissedCalls]  AS [RentMobileSEMMissedCalls]
, [FutureConnectedCalls03]  AS [FutureConnectedCalls03]
, [FutureMissedCalls03]  AS [FutureMissedCalls03]
, [RentEmailLeads]  AS [RentEmailLeads]
, [TruliaEmailLeads]  AS [TruliaEmailLeads]
, [AndroidEmailLeads]  AS [AndroidEmailLeads]
, [iPadEmailLeads]  AS [iPadEmailLeads]
, [iPhoneEmailLeads]  AS [iPhoneEmailLeads]
, [FutureEmailLeads01]  AS [FutureEmailLeads01]
, [FutureEmailLeads02]  AS [FutureEmailLeads02]
, [FutureEmailLeads03]  AS [FutureEmailLeads03]
, [FutureEmailLeads04]  AS [FutureEmailLeads04]
, [InvoicedLeases]  AS [InvoicedLeases]
FROM RentCom.Mart.Listings_Legacy WITH (NOLOCK)



GO
/****** Object:  Table [Fact].[Call_Detail_Records]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[Call_Detail_Records](
	[YMDID] [int] NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[CallDetailRecordID] [binary](16) NULL,
	[SourceType] [varchar](10) NULL,
	[CallerPhoneNumber] [numeric](11, 0) NULL,
	[CalledPhoneNumber] [numeric](11, 0) NULL,
	[FinalDestPhoneNumber] [numeric](11, 0) NULL,
	[DateCallStarted] [datetime] NULL,
	[DateCallEnded] [datetime] NULL,
	[CallDuration] [numeric](15, 0) NULL,
	[CallStatusID] [numeric](1, 0) NULL,
	[TelephonyVendorNameID] [numeric](15, 0) NULL,
	[RecordingURL] [varchar](2000) NULL,
	[RecordingDuration] [numeric](15, 0) NULL,
	[CallerRecordingURL] [varchar](2000) NULL,
	[CalledRecordingURL] [varchar](2000) NULL,
	[TrimmedURL] [varchar](2000) NULL,
	[TrimmedDuration] [numeric](15, 0) NULL,
	[DateVendorCreated] [datetime] NULL,
	[DateCreated] [datetime] NULL,
	[DateUpdated] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [ClustIDX_FactCallDetailRecords_YMDID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_FactCallDetailRecords_YMDID] ON [Fact].[Call_Detail_Records]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[LeadMessage]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[LeadMessage](
	[LeadMessageID] [numeric](15, 0) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[TerminateDate] [datetime] NULL,
	[LeadID] [numeric](15, 0) NULL,
	[SourceType] [varchar](40) NULL,
	[RecipientType] [varchar](40) NULL,
	[SenderTrackEmailID] [numeric](15, 0) NULL,
	[EmailSubjectText] [varchar](255) NULL,
	[TrackEmailID] [numeric](15, 0) NULL,
	[FaxID] [numeric](15, 0) NULL,
	[TrackPhoneCallID] [numeric](15, 0) NULL,
	[UndeliverableDate] [datetime] NULL,
	[ReadDate] [datetime] NULL,
	[PersonID] [numeric](15, 0) NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[SmallPropertyFlag] [numeric](15, 0) NULL,
	[RenterDate] [datetime] NULL,
	[SourceID] [numeric](15, 0) NULL,
	[StateCode] [varchar](40) NULL,
	[LeadGroupID] [numeric](15, 0) NULL,
	[LeadGroupStatusID] [numeric](15, 0) NULL,
	[BusinessModelType] [varchar](40) NULL,
	[SourceName] [varchar](40) NULL,
	[SourceNameDate] [datetime] NULL,
	[MessageText] [varchar](2000) NULL,
	[ContactDate] [datetime] NULL,
	[DurationNumber] [numeric](15, 0) NULL,
	[ContactStatus] [varchar](40) NULL,
	[LoftFlag] [numeric](15, 0) NULL,
	[StudioFlag] [numeric](15, 0) NULL,
	[Bedroom1Flag] [numeric](15, 0) NULL,
	[Bedroom2Flag] [numeric](15, 0) NULL,
	[Bedroom3Flag] [numeric](15, 0) NULL,
	[Bedroom4Flag] [numeric](15, 0) NULL,
	[PasswordSource] [numeric](2, 0) NULL,
	[EmailID] [numeric](15, 0) NULL,
	[PhoneFromCallerIDFlag] [numeric](1, 0) NULL,
	[SuppliedPhoneNumber] [numeric](15, 0) NULL,
	[YMDID]  AS (CONVERT([int],CONVERT([varchar](8),[CreateDate],(112)),(0))) PERSISTED,
	[DupeLeadFlag] [varchar](2) NULL
) ON [PRIMARY]

GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [ClustIDX_FactLeadMessage_YMDID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_FactLeadMessage_YMDID] ON [Fact].[LeadMessage]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [Reports].[vw_PhoneLeads]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE VIEW [Reports].[vw_PhoneLeads]
AS
-- =============================================
-- Author:		Shetal Gandhi & Chadwick Smith
-- Create date: January 16, 2013
-- Test: exec Reports.vw_PhoneLeads
-- Description:	View to collect PhoneLeads
-- EXAMPLE
/*
SELECT COUNT(*) AS PhoneLeads
FROM Reports.vw_PhoneLeads
WHERE YMDID = 20130101
*/
--* Hist 01:	01/16/2013	SGandhi		Initial version, numara ticket 9532
--* Hist 02:	04/10/2013	SGandhi		Numara: 12041 - Added CallSource and Duration to view so it can be used for this report

-- =============================================
SELECT  'Toll Free' AS CallType
       ,YMDID
       ,ContactDate AS CallDate
       ,TrackPhoneCallID AS CallerNumber
       ,'Q' AS CallSource -- All calls in this table come from Qwest
       ,DurationNumber AS DurationInSeconds
FROM    Fact.LeadMessage lm
WHERE   lm.RecipientType = 'property'
        AND lm.SourceType = 'phone'
UNION
SELECT  'Local' AS CallType
       ,YMDID
       ,DateCallStarted AS CallDate
       ,CallerPhoneNumber AS CallerNumber
       ,CASE WHEN TelephonyVendorNameID = 1 THEN 'Q' -- Qwest
             WHEN TelephonyVendorNameID = 2 THEN 'M' -- Mongoose
             WHEN TelephonyVendorNameID = 3 THEN 'E' -- eStara
             WHEN TelephonyVendorNameID = 4 THEN 'C' -- CallSRC
             ELSE 'Unknown'
        END AS CallSource
       ,CallDuration AS DurationInSeconds
FROM    Fact.Call_Detail_Records cd





GO
/****** Object:  Table [Mart].[VisitorLeaseCount]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[VisitorLeaseCount](
	[YMDID] [int] NOT NULL,
	[Personid] [varchar](2000) NOT NULL,
	[Visitor] [varchar](256) NOT NULL,
	[TrafficSource] [varchar](32) NULL,
	[Device] [varchar](50) NULL,
	[Browser] [varchar](50) NULL,
	[SearchEngineName] [varchar](64) NULL,
	[KeyWord] [varchar](2048) NULL,
	[VisitCount] [int] NULL,
	[PageViewCount] [int] NULL,
	[SearchResultPageCount] [int] NULL,
	[PDPCount] [int] NULL,
	[MyRentCount] [int] NULL,
	[EfCount] [int] NULL,
	[LeaseCount] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [cli_YMDID_VISITOR_PERSON]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE UNIQUE CLUSTERED INDEX [cli_YMDID_VISITOR_PERSON] ON [Mart].[VisitorLeaseCount]
(
	[YMDID] ASC,
	[Personid] ASC,
	[Visitor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  View [Reports].[vw_VisitorAllLeaseCount]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [Reports].[vw_VisitorAllLeaseCount]
as
SELECT YmdIDPersonVisitor=CAST(YMDID AS VARCHAR(8))+Personid+Visitor,
YMDID, Personid, Visitor, TrafficSource, Device, Browser, SearchEngineName, KeyWord, VisitCount, PageViewCount, SearchResultPageCount, PDPCount, MyRentCount, EfCount, LeaseCount
FROM mart.visitorleasecount


GO
/****** Object:  View [Reports].[vw_VisitorLeaseWithLease]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE view [Reports].[vw_VisitorLeaseWithLease]
as
SELECT YmdIDPersonVisitor=CAST(YMDID AS VARCHAR(8))+Personid+Visitor,
YMDID, Personid, Visitor, TrafficSource, Device, Browser, SearchEngineName, KeyWord, VisitCount, PageViewCount, SearchResultPageCount, PDPCount, MyRentCount, EfCount, LeaseCount
FROM mart.visitorleasecount
WHERE leasecount > 0


GO
/****** Object:  View [Fact].[CallsRentcom]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [Fact].[CallsRentcom]

/*******************************************************************************************
* Name:	[Fact].[CallsRentcom]
* ------------------------------------------------------------------------------------------
* Desc:	
* ------------------------------------------------------------------------------------------
* Test:	SELECT TOP 100 * FROM [Fact].[CallsRentcom]
* ------------------------------------------------------------------------------------------
* Notes: 
* ------------------------------------------------------------------------------------------
* Hist:	01	05/31/2016		Colleen Rocks		Initial version; new view from APS project
********************************************************************************************/
AS 

SELECT YMDID
       ,CallID
       ,RentPropertyID
       ,PropertyID
       ,ListingID
       ,BusinessModel
       ,CallStartDateTime
       ,CallEndDateTime
       ,DurationInSeconds
       ,CallStatus
       ,CallSource
       ,CallType
       ,CallerPhoneNumber
       ,PublishedPhoneNumber
       ,TargetPhoneNumber
       ,CallerName
       ,CallerAddress
       ,CallerCity
       ,CallerState
       ,CallerZip
       ,CallerLocation
       ,LinkName
       ,LinkID
       ,AudioURL
       ,CallerURL
       ,ReceiverURL
       ,MP3URL
       ,CallerTrimSilenceURL
       ,CallLoadHour
       ,CallLoadYMDID
       ,CallEndHour
       ,DateAddedYMDID
       ,ActualCallDuration
       ,CallerTrimBeginning
       ,TotalCallerTrimTalkTime
       ,EurekaID
       ,IsAbandoned
       ,TimePriorToCallerSpeaking
       ,[Population]
       ,AvgTravelTimeToWork
       ,MedianHouseholdIncome
       ,PerCapitaIncome
       ,MedianEarnings
       ,MedianContractRent
       ,MedianRentAsked
       ,MedianGrossRent
       ,MedianPriceAsked
       ,MedianRealEstateTaxes
       ,Households
       ,OwnerHouseholds
       ,RenterHouseholds
FROM RentPath.Mart.PhoneLeads
WHERE Website = 'Rent'




GO
/****** Object:  View [Fact].[EmailsRentcom]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [Fact].[EmailsRentcom]

/*******************************************************************************************
* Name:	[Fact].[EmailsRentcom]
* ------------------------------------------------------------------------------------------
* Desc:	
* ------------------------------------------------------------------------------------------
* Test:	SELECT TOP 100 * FROM [Fact].[EmailsRentcom]
* ------------------------------------------------------------------------------------------
* Notes: 
* ------------------------------------------------------------------------------------------
* Hist:	01	05/31/2016		Colleen Rocks		Initial version; new view from APS project
********************************************************************************************/
AS 

SELECT RentPropertyID
       ,ListingID
       ,YMDID
       ,WhenEntered
       ,LeadID
       ,LeadTypeID
       ,[Status]
       ,Email
       ,FirstName
       ,LastName
       ,Address1
       ,Address2
       ,City
       ,[State]
       ,Zip
       ,DayPhone
       ,NightPhone
       ,FaxNumber
       ,MoveMonth
       ,Bedrooms
       ,Bathrooms
       ,Comments
       ,LeaseTerms
       ,LeadScore
       ,[Source]
       ,PersonalizationID
       ,CampaignID
       ,EF_ID
       ,EV_TRANS_ID
       ,SessionID
       ,reasonformove
       ,pricerange
       ,BusinessModel
       ,CompanyID
       ,UpdateYMDID
       ,Device
       ,PageType
       ,Context
       ,Endeca_ID
       ,UnitLayout_ID
FROM RentPath.Mart.EmailLeads
WHERE Website = 'Rent'
	AND FeedLead = 0




GO
/****** Object:  Table [dbo].[ImpressionPull]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ImpressionPull](
	[YMDID] [int] NULL,
	[Record_Create_DM] [datetime2](7) NULL,
	[Property_ID] [numeric](15, 0) NULL,
	[Total_Impressions] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LeaseStatusDates]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaseStatusDates](
	[YMDID] [int] NOT NULL,
	[LeaseID] [numeric](15, 0) NOT NULL,
	[Status] [varchar](2000) NOT NULL,
	[StatusDate] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mobile]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mobile](
	[DayNum] [varchar](33) NULL,
	[SEM] [decimal](15, 4) NOT NULL,
	[SEO] [decimal](15, 4) NOT NULL,
	[Direct] [decimal](15, 4) NOT NULL,
	[Other] [decimal](15, 4) NOT NULL,
	[Email] [decimal](15, 4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PageContentGroupings]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PageContentGroupings](
	[ContentGroupName] [varchar](255) NULL,
	[GroupNameMask] [varchar](255) NULL,
	[ParentGroup] [varchar](65) NULL,
	[DateCreate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParsedData]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParsedData](
	[ParseID] [bigint] NULL,
	[ProfileID] [int] NOT NULL,
	[YMDID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[MeasureType] [varchar](50) NOT NULL,
	[Measure] [varchar](7000) NOT NULL,
	[SubProfileID] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneExclusion]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneExclusion](
	[phonenumber] [varchar](8000) NULL,
	[cnt] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RentcomToAGIDDups]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentcomToAGIDDups](
	[YMDID] [int] NULL,
	[RentPropertyID] [int] NULL,
	[AGPropertyID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tablet]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tablet](
	[DayNum] [varchar](33) NULL,
	[SEM] [decimal](15, 4) NOT NULL,
	[SEO] [decimal](15, 4) NOT NULL,
	[Direct] [decimal](15, 4) NOT NULL,
	[Other] [decimal](15, 4) NOT NULL,
	[Email] [decimal](15, 4) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TempProperties]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempProperties](
	[PropertyID] [int] NULL,
	[ALM] [int] NULL,
	[CPA] [int] NULL,
	[EasyPay] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TestSFAccount]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TestSFAccount](
	[Id] [nvarchar](18) NULL,
	[IsDeleted] [bit] NULL,
	[MasterRecordId] [nvarchar](18) NULL,
	[Name] [nvarchar](255) NULL,
	[Type] [nvarchar](40) NULL,
	[RecordTypeId] [nvarchar](18) NULL,
	[ParentId] [nvarchar](18) NULL,
	[BillingStreet] [nvarchar](255) NULL,
	[BillingCity] [nvarchar](40) NULL,
	[BillingState] [nvarchar](20) NULL,
	[BillingPostalCode] [nvarchar](20) NULL,
	[BillingCountry] [nvarchar](40) NULL,
	[ShippingStreet] [nvarchar](255) NULL,
	[ShippingCity] [nvarchar](40) NULL,
	[ShippingState] [nvarchar](20) NULL,
	[ShippingPostalCode] [nvarchar](20) NULL,
	[ShippingCountry] [nvarchar](40) NULL,
	[Phone] [nvarchar](40) NULL,
	[Fax] [nvarchar](40) NULL,
	[Website] [nvarchar](255) NULL,
	[Description] [ntext] NULL,
	[Rating] [nvarchar](40) NULL,
	[OwnerId] [nvarchar](18) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedById] [nvarchar](18) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedById] [nvarchar](18) NULL,
	[SystemModstamp] [datetime] NULL,
	[LastActivityDate] [date] NULL,
	[Jigsaw] [nvarchar](20) NULL,
	[JigsawCompanyId] [nvarchar](20) NULL,
	[ofPropsManaged__c] [float] NULL,
	[Contest__c] [bit] NULL,
	[ExecutiveAccount__c] [nvarchar](255) NULL,
	[ExecAcctAssignedTo__c] [nvarchar](255) NULL,
	[PrimaryCorpContact__c] [nvarchar](50) NULL,
	[Reduced_Success_Fee__c] [float] NULL,
	[Image_Fee__c] [float] NULL,
	[Last_Contact__c] [date] NULL,
	[of_Units_Managed_SP__c] [float] NULL,
	[of_Units_Vacant_SP__c] [float] NULL,
	[Small_Property__c] [bit] NULL,
	[Account_Manager__c] [nvarchar](255) NULL,
	[Billing_Rep__c] [nvarchar](255) NULL,
	[Company_ID__c] [nvarchar](20) NULL,
	[AM_Managed_Account__c] [bit] NULL,
	[Response__c] [nvarchar](255) NULL,
	[Next_Step__c] [nvarchar](255) NULL,
	[Deacts_Authorized_By__c] [nvarchar](100) NULL,
	[Billing_Issues__c] [nvarchar](1000) NULL,
	[Introduction_Date__c] [date] NULL,
	[Last_Property_Audit__c] [date] NULL,
	[Last_Image_Audit__c] [date] NULL,
	[Last_Mgmt_Report__c] [date] NULL,
	[Last_PTE_Proposal__c] [date] NULL,
	[Last_Other_contact__c] [date] NULL,
	[Market_Comparison__c] [date] NULL,
	[Billing_Contact__c] [nvarchar](50) NULL,
	[Last_Hot_Lead_Billing_Report__c] [date] NULL,
	[Last_Updates_Report__c] [date] NULL,
	[Last_Managers_Audit__c] [date] NULL,
	[Last_Aging_Report__c] [date] NULL,
	[Last_PTE_Analysis__c] [date] NULL,
	[Last_Budget_Actuals__c] [date] NULL,
	[Rent_com_on_the_Guest_Card__c] [date] NULL,
	[Lease_Process_Discussed_With__c] [nvarchar](150) NULL,
	[Problem_Account_Level__c] [nvarchar](99) NULL,
	[Billing_Status_Date__c] [date] NULL,
	[Amount_Outstanding__c] [float] NULL,
	[Amount_60__c] [float] NULL,
	[of_Units_Managed__c] [float] NULL,
	[Billing_of_open_invoices__c] [float] NULL,
	[Property_Locations__c] [nvarchar](200) NULL,
	[Master_Agreement_Contract_ID__c] [nvarchar](5) NULL,
	[Leads_Score__c] [float] NULL,
	[Market_ID__c] [nvarchar](20) NULL,
	[Account_Also_Known_As__c] [nvarchar](55) NULL,
	[Company_ID_Created__c] [date] NULL,
	[Senior_Communities__c] [nvarchar](255) NULL,
	[Income_Restricted_Communities__c] [nvarchar](255) NULL,
	[No_Follow_Up__c] [bit] NULL,
	[Today__c] [date] NULL,
	[Today_30__c] [date] NULL,
	[Territory_Manager__c] [nvarchar](255) NULL,
	[Amount_90__c] [float] NULL,
	[Amount_120__c] [float] NULL,
	[Primary_Property_Management_Software__c] [nvarchar](255) NULL,
	[Last_Lease_Process_Guest_Card_Discussion__c] [date] NULL,
	[Dispute_Policy__c] [nvarchar](1300) NULL,
	[Review_Date__c] [date] NULL,
	[Company_Statement_Criteria__c] [nvarchar](255) NULL,
	[Date_Company_Statements_Started__c] [date] NULL,
	[Company_Statement_Sent_By__c] [nvarchar](255) NULL,
	[Dispute_Policy_Enforced__c] [nvarchar](255) NULL,
	[Dispute_Policy_Enforced_as_of__c] [date] NULL,
	[Upgrade_Started__c] [date] NULL,
	[Lead_Tracking_Service__c] [nvarchar](255) NULL,
	[Excluded_from_BHL_on__c] [date] NULL,
	[Success_Fee__c] [float] NULL,
	[Amount_1_30__c] [float] NULL,
	[Amount_31_60__c] [float] NULL,
	[Oldest_Open_Invoice__c] [float] NULL,
	[Profit_Score__c] [float] NULL,
	[Company_Statement_SAP_Job_Name__c] [nvarchar](60) NULL,
	[Percent_Balance_1_30_Days__c] [float] NULL,
	[Percent_Balance_31_60_Days__c] [float] NULL,
	[Percent_Balance_61_90_Days__c] [float] NULL,
	[Percent_Balance_91_120_Days__c] [float] NULL,
	[Percent_Balance_120_Days__c] [float] NULL,
	[Company_SAP_Account__c] [nvarchar](20) NULL,
	[Rent_com_on_Guest_Card__c] [nvarchar](255) NULL,
	[of_Units_at_Active_Props__c] [float] NULL,
	[Guest_Card_Policy_Comments__c] [ntext] NULL,
	[Total_Profit__c] [float] NULL,
	[Market__c] [nvarchar](80) NULL,
	[Outstanding_Invoices_30_Days__c] [float] NULL,
	[Primary_Corporate_Contact_Email__c] [nvarchar](80) NULL,
	[Primary_Corporate_Contact_Phone__c] [nvarchar](40) NULL,
	[PID__c] [nvarchar](15) NULL,
	[Company_Statement_SAP_Last_Run_Date__c] [date] NULL,
	[Term_Delinquent__c] [float] NULL,
	[Term_Collections__c] [float] NULL,
	[Term_Temporary__c] [float] NULL,
	[Term_No_Vacancy__c] [float] NULL,
	[Term_Pre_Reg__c] [float] NULL,
	[Term_Contract_Dispute__c] [float] NULL,
	[Term_Does_Not_Qualify__c] [float] NULL,
	[Term_Management_Change__c] [float] NULL,
	[Term_Permanent__c] [float] NULL,
	[Term_Unusual_Activity__c] [float] NULL,
	[Term_Canceled_Prior_to_Activation__c] [float] NULL,
	[Active__c] [float] NULL,
	[Property_Counts_as_of__c] [date] NULL,
	[Total_Props_Associated__c] [float] NULL,
	[Active_Properties__c] [float] NULL,
	[PTE_Balance__c] [float] NULL,
	[of_Active_Properties_as_of__c] [date] NULL,
	[of_Properties_contracted__c] [float] NULL,
	[of_Properties_to_react__c] [float] NULL,
	[As_of__c] [date] NULL,
	[Territory__c] [nvarchar](255) NULL,
	[Oldest_PTE_Invoice__c] [float] NULL,
	[Outbound_Group__c] [nvarchar](1300) NULL,
	[Oldest_Image_Invoice__c] [float] NULL,
	[Today_s_Date_Long_Format__c] [nvarchar](1300) NULL,
	[Current_Invoices__c] [nvarchar](1300) NULL,
	[Identifier_in_Parentheses__c] [nvarchar](1300) NULL,
	[Image_Fees_Outstanding__c] [float] NULL,
	[Last_Receipt_Date__c] [date] NULL,
	[Success_Fee_2011__c] [float] NULL,
	[Primary_Eligibility__c] [nvarchar](1300) NULL,
	[Last_Billing_Call__c] [date] NULL,
	[Aging_Report_Sent_by__c] [nvarchar](255) NULL,
	[Fee_Type__c] [nvarchar](255) NULL,
	[Last_Upgrade__c] [nvarchar](99) NULL,
	[Phone_Blast_Test_Property__c] [bit] NULL,
	[Notes__c] [nvarchar](500) NULL,
	[Not_Repsonding__c] [bit] NULL,
	[Person_ID__c] [nvarchar](99) NULL,
	[Software_onsite__c] [nvarchar](1300) NULL,
	[Average_units_at_Active_Props__c] [float] NULL,
	[Property_Status__c] [nvarchar](255) NULL,
	[Source_Lead__c] [nvarchar](18) NULL,
	[Source_ID__c] [nvarchar](99) NULL,
	[Special_Rules__c] [ntext] NULL,
	[Amount_Delinquent__c] [float] NULL,
	[Percent_Delinquent__c] [float] NULL,
	[Total_Upgrades_Running__c] [float] NULL,
	[Total_Bundles_Running__c] [float] NULL,
	[Total_FL_Running__c] [float] NULL,
	[Total_PTE_Running__c] [float] NULL,
	[Props_to_Upgrade__c] [float] NULL,
	[Percent_Properties_Upgraded__c] [float] NULL,
	[AccountID18__c] [nvarchar](1300) NULL,
	[Number_of_Units__c] [float] NULL,
	[Lead_to_Paid_Lease__c] [float] NULL,
	[Fee_Managed__c] [bit] NULL,
	[Company_Eligibility_Rating__c] [nvarchar](1300) NULL,
	[Days_since_last_payment__c] [float] NULL,
	[Barrier_Market__c] [bit] NULL,
	[Eligibility_Discussion__c] [date] NULL,
	[Eligiblity_Evaluation__c] [nvarchar](1300) NULL,
	[Items_discussed__c] [nvarchar](2000) NULL,
	[Eligibility_Requirements_Discussed_With__c] [nvarchar](18) NULL,
	[Properties_Won__c] [float] NULL,
	[AccountURL__c] [nvarchar](1300) NULL,
	[Eligibility_Discussion_Expiration__c] [date] NULL,
	[Lead_Email__c] [nvarchar](80) NULL,
	[Secondary_Lead_Email__c] [nvarchar](80) NULL,
	[Lifecycle_Email__c] [nvarchar](80) NULL,
	[Lifecycle_Fax__c] [nvarchar](40) NULL,
	[Vacancy_Management__c] [bit] NULL,
	[Senior_Housing__c] [bit] NULL,
	[Income_Restricted__c] [bit] NULL,
	[VaultWare__c] [bit] NULL,
	[LeadResponderatProperty__c] [bit] NULL,
	[LeadResponderOnForCompany__c] [bit] NULL,
	[Paid_in_SAP_Open_in_CS__c] [nvarchar](2000) NULL,
	[New_TM__c] [nvarchar](30) NULL,
	[PPLsubtype_StudentHousing__c] [bit] NULL,
	[Company_Score__c] [float] NULL,
	[Collection_Score__c] [float] NULL,
	[Other_Issues__c] [nvarchar](255) NULL,
	[HousingType_Apartment__c] [bit] NULL,
	[HousingType_Condo__c] [bit] NULL,
	[HousingType_MobileHome__c] [bit] NULL,
	[HousingType_House__c] [bit] NULL,
	[Primary_Objection__c] [nvarchar](255) NULL,
	[Specifically__c] [nvarchar](255) NULL,
	[Broker__c] [bit] NULL,
	[Owner__c] [bit] NULL,
	[Property_Manager__c] [bit] NULL,
	[Secondary_Objection__c] [nvarchar](255) NULL,
	[Specifically2__c] [nvarchar](255) NULL,
	[Invoicing_Name__c] [nvarchar](80) NULL,
	[Billing_Phone__c] [nvarchar](40) NULL,
	[Billing_Fax__c] [nvarchar](40) NULL,
	[Lease_Notifications_Faxed__c] [bit] NULL,
	[Lease_Notfiications_Emailed__c] [bit] NULL,
	[Hot_Leads_Faxed__c] [bit] NULL,
	[Hot_Leads_Emailed__c] [bit] NULL,
	[Billing_Email__c] [nvarchar](80) NULL,
	[Rank__c] [float] NULL,
	[Customer_Segment__c] [nvarchar](1300) NULL,
	[Billing_Managed_Account__c] [nvarchar](1300) NULL,
	[Rentdotcom_Listing__c] [nvarchar](1300) NULL,
	[Primary_Corporate_Contact__c] [nvarchar](50) NULL,
	[Centrally_Billed__c] [bit] NULL,
	[of_Delinquent_Invoices__c] [float] NULL,
	[Promise_to_Pay__c] [date] NULL,
	[Success_Fee_2010__c] [float] NULL,
	[Property_Activated__c] [date] NULL,
	[Housing_Type__c] [bit] NULL,
	[QualifiesforReducedFee__c] [bit] NULL,
	[Action_Taken__c] [nvarchar](255) NULL,
	[UserAccountManager__c] [nvarchar](18) NULL,
	[UserTerritoryManager__c] [nvarchar](18) NULL,
	[UserBillingRep__c] [nvarchar](18) NULL,
	[Potential_Add_ons__c] [float] NULL,
	[Property_City__c] [nvarchar](50) NULL,
	[Last_Property_or_Unit_Count_Confirmed__c] [date] NULL,
	[Rate_Difference__c] [float] NULL,
	[Percent_of_Active_Properties__c] [float] NULL,
	[Percent_PTE_Running__c] [float] NULL,
	[Percent_FL_Running__c] [float] NULL,
	[Percent_Bundles_Running__c] [float] NULL,
	[Property_Eligibility_Evaluation__c] [nvarchar](1300) NULL,
	[Mgmt_Company_Eligibility_Rating__c] [nvarchar](1300) NULL,
	[Mgmt_Company_Eligibility_Evaluation__c] [nvarchar](1300) NULL,
	[Property_Eligibility_Rating__c] [nvarchar](1300) NULL,
	[Primedia_Salesforce_ID__c] [nvarchar](18) NULL,
	[Managed_Props_Active_Props_Delta__c] [float] NULL,
	[Success_Fee_2012__c] [float] NULL,
	[Property_List_Attached__c] [bit] NULL,
	[Rate_Card_Rate_2013__c] [float] NULL,
	[Fee_Managers_or_Owners__c] [nvarchar](255) NULL,
	[Student_Housing_Communities__c] [nvarchar](255) NULL,
	[Check_in_Date__c] [date] NULL,
	[Success_Fee_Current__c] [float] NULL,
	[Matches_Rate_Card_2013__c] [nvarchar](1300) NULL,
	[Eligibility_Changed_Date__c] [date] NULL,
	[Last_Featured_Listing_Proposal__c] [date] NULL,
	[Last_Customer_Loyalty_Gift__c] [date] NULL,
	[Billing_Managed__c] [nvarchar](1300) NULL,
	[Upgrade_cost_per_month__c] [float] NULL,
	[Status_Category__c] [nvarchar](255) NULL,
	[Property_Email__c] [nvarchar](80) NULL,
	[Property_Lead_Response_Rate__c] [nvarchar](5) NULL,
	[Property_Score__c] [nvarchar](3) NULL,
	[Property_State__c] [nvarchar](20) NULL,
	[Property_Street__c] [nvarchar](50) NULL,
	[Terminate_Date__c] [date] NULL,
	[Property_Zip__c] [nvarchar](10) NULL,
	[Property_of_Closed_Invoices__c] [float] NULL,
	[Property_of_Invoices__c] [float] NULL,
	[Property_of_Leases__c] [float] NULL,
	[Property_of_Open_Invoices__c] [float] NULL,
	[Property_of_Paid_Invoices__c] [float] NULL,
	[Property_of_Write_Offs__c] [float] NULL,
	[Reactivated_From_Status__c] [nvarchar](255) NULL,
	[Reactivated__c] [bit] NULL,
	[Receive_Hot_Leads_via_Email__c] [bit] NULL,
	[Receive_Hot_Leads_via_Fax__c] [bit] NULL,
	[Payment_Related__c] [bit] NULL,
	[Sub_Market_Name__c] [nvarchar](50) NULL,
	[Time_Zone__c] [nvarchar](20) NULL,
	[Formula_of_Open_Invoices__c] [float] NULL,
	[Formula_Oldest_Open_Invoice__c] [date] NULL,
	[Oldest_Open_Invoice_Property__c] [float] NULL,
	[Eligibility_New_Value__c] [nvarchar](40) NULL,
	[Eligibility_Old_Value__c] [nvarchar](40) NULL,
	[Property_Profitability_Score__c] [float] NULL,
	[Promotional_Success_Fee__c] [float] NULL,
	[Company_Special_Rule__c] [ntext] NULL,
	[First_Activation_Date__c] [date] NULL,
	[ALM_Compant__c] [nvarchar](1300) NULL,
	[Centrally_Billed_on_Company__c] [nvarchar](1300) NULL,
	[Billing_Rep_on_Company__c] [nvarchar](1300) NULL,
	[Number_of_Accounts__c] [float] NULL,
	[Billing_Managed_Company__c] [nvarchar](1300) NULL,
	[Property_Collections_Score__c] [float] NULL,
	[Management_Company_Score__c] [float] NULL,
	[Last_PTE__c] [date] NULL,
	[Last_Outbound_Activity__c] [datetime] NULL,
	[Delinquent__c] [float] NULL,
	[Distressed_Market__c] [bit] NULL,
	[ALM__c] [bit] NULL,
	[Special_Rule_for_invoice__c] [nvarchar](99) NULL,
	[Property_Amount_Outstanding__c] [float] NULL,
	[Payment_Issues__c] [bit] NULL,
	[Time_Zone_on_Property__c] [nvarchar](1300) NULL,
	[of_Properties_to_React_no_contract__c] [float] NULL,
	[Other__c] [bit] NULL,
	[Low_Rent__c] [bit] NULL,
	[Commission__c] [nvarchar](255) NULL,
	[XML_Service__c] [ntext] NULL,
	[Property_Eligibility__c] [nvarchar](1300) NULL,
	[External_ID__c] [nvarchar](15) NULL,
	[External_Type__c] [nvarchar](30) NULL,
	[Bucket_on_Property__c] [float] NULL,
	[Prop_Sales_Prerequisite__c] [nvarchar](1300) NULL,
	[Success_Fee_Static__c] [float] NULL,
	[Property_Customer_Segment__c] [nvarchar](1300) NULL,
	[Subtype__c] [nvarchar](255) NULL,
	[SP_Flat_Fee__c] [float] NULL,
	[Incomplete__c] [float] NULL,
	[Incomplete_No_Billing__c] [float] NULL,
	[Potential_Duplicate__c] [float] NULL,
	[Potential_Scam__c] [float] NULL,
	[Term_UA_Property_Match__c] [float] NULL,
	[Terminated_Expired_Small_Property__c] [float] NULL,
	[Terminated_Leased_Classified__c] [float] NULL,
	[Terminated_Lessor_De_Activated__c] [float] NULL,
	[of_Units_at_Inactive_Props__c] [float] NULL,
	[Total_Senior_Properties__c] [float] NULL,
	[Total_Income_Restricted_Properties__c] [float] NULL,
	[Revenue_billed_YTD__c] [float] NULL,
	[Revenue_collected_YTD__c] [float] NULL,
	[Revenue_billed_last_month__c] [float] NULL,
	[Revenue_collected_last_month__c] [float] NULL,
	[Number_of_listings_billed_YTD__c] [float] NULL,
	[Number_of_listings_billed_last_month__c] [float] NULL,
	[Total_Apartments__c] [float] NULL,
	[Total_Condos__c] [float] NULL,
	[Total_Houses__c] [float] NULL,
	[Total_Duplexes__c] [float] NULL,
	[Total_Townhouses__c] [float] NULL,
	[Total_Triplexes__c] [float] NULL,
	[Duplex__c] [bit] NULL,
	[Townhouse__c] [bit] NULL,
	[Triplex__c] [bit] NULL,
	[Date_the_succses_fee_last_updated__c] [date] NULL,
	[Term_Banned__c] [float] NULL,
	[Term_Exceeded_Lead_Cap__c] [float] NULL,
	[Sent_to_Collections__c] [bit] NULL,
	[Images_in_feed__c] [nvarchar](255) NULL,
	[MITS_Version__c] [nvarchar](255) NULL,
	[Image_Layout__c] [nvarchar](255) NULL,
	[Specials_Accepted__c] [nvarchar](255) NULL,
	[X0_Rent_Inactivates_Floor_Plan__c] [nvarchar](255) NULL,
	[Data_Feed_Provider__c] [nvarchar](30) NULL,
	[YTD_Leads__c] [float] NULL,
	[YTD_Paid_Leases__c] [float] NULL,
	[Count_of_MgmtCo__c] [float] NULL,
	[YTD_Receipts__c] [float] NULL,
	[Upgrade_Ends__c] [date] NULL,
	[Search_Rank__c] [float] NULL,
	[Upgrade_Running__c] [nvarchar](50) NULL,
	[Upgrade_ID__c] [nvarchar](20) NULL,
	[Months_on_Upgrade__c] [float] NULL,
	[Upgrade_Max_FL_Slots__c] [float] NULL,
	[Upgrade_Available_FL_Slots__c] [float] NULL,
	[Upgrade_Available_PTE_Slots__c] [float] NULL,
	[Active_Large_Props_in_Submarket__c] [float] NULL,
	[Page_in_search__c] [float] NULL,
	[Position_in_Search__c] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[timefix]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[timefix](
	[LEAD_ID] [numeric](38, 0) NULL,
	[CREATE_DM] [datetime2](7) NULL,
	[UPDATE_DM] [datetime2](7) NULL,
	[TERMINATE_DM] [datetime2](7) NULL,
	[PURGE_DM] [datetime2](7) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpMonitorAllTimeLoads]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpMonitorAllTimeLoads](
	[tablename] [varchar](50) NULL,
	[lastrowcnt] [bigint] NULL,
	[datelastchecked] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[AGRentProducts_SG_DELETE_20150806]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[AGRentProducts_SG_DELETE_20150806](
	[ItemID] [varchar](40) NOT NULL,
	[ItemDescription] [varchar](100) NULL,
	[Combo] [char](1) NULL,
	[EasyPay] [char](1) NULL,
	[Upsell] [char](1) NULL,
	[RentSubscription] [char](1) NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[AGRentProductsSold_OLD_SG_20141030]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[AGRentProductsSold_OLD_SG_20141030](
	[ClientID] [varchar](18) NOT NULL,
	[ItemID] [varchar](40) NOT NULL,
	[ItemDescription] [varchar](100) NULL,
	[Combo] [char](1) NULL,
	[Subscription] [char](1) NULL,
	[CreateDate] [date] NULL,
	[UpdateDate] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[Campaign]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Campaign](
	[SourceID] [bigint] NOT NULL,
	[SourceName] [varchar](2000) NULL,
	[SourceType] [varchar](40) NULL,
	[CampaignID] [bigint] NOT NULL,
	[CampaignName] [varchar](80) NOT NULL,
	[SiteID] [bigint] NOT NULL,
	[SiteName] [varchar](80) NOT NULL,
	[SiteType] [varchar](20) NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Campaign] PRIMARY KEY CLUSTERED 
(
	[SourceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[Contract]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Contract](
	[ContractID] [numeric](15, 0) NULL,
	[ContractType] [varchar](40) NULL,
	[CreateDate] [datetime] NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[UpdateDate] [datetime] NULL,
	[TerminateDate] [datetime] NULL,
	[SalesRepPersonID] [numeric](15, 0) NULL,
	[ContactPersonID] [numeric](15, 0) NULL,
	[MonthsNumber] [numeric](15, 0) NULL,
	[StartDate] [datetime] NULL,
	[CostAmount] [numeric](10, 2) NULL,
	[BillingAddressName] [varchar](80) NULL,
	[BillingCityName] [varchar](80) NULL,
	[BillingStateCode] [varchar](40) NULL,
	[BillingZipCode] [varchar](40) NULL,
	[BillingPhoneCode] [varchar](40) NULL,
	[BillingFaxCode] [varchar](40) NULL,
	[BillingEmailName] [varchar](80) NULL,
	[ContractPropTerminateDate] [datetime] NULL,
	[Status] [varchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [ClustIDX_DimensionContract_ContractID_PropertyID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_DimensionContract_ContractID_PropertyID] ON [Dimension].[Contract]
(
	[ContractID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Dimension].[CourtesyListings]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[CourtesyListings](
	[YMDID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[PropertyName] [varchar](100) NOT NULL,
	[PropertyAddress] [varchar](44) NOT NULL,
	[PropertyCity] [varchar](28) NOT NULL,
	[PropertyState] [varchar](2) NOT NULL,
	[PropertyZip] [varchar](5) NOT NULL,
	[GeoLat] [varchar](28) NOT NULL,
	[GeoLong] [varchar](28) NOT NULL,
	[GeogPoint] [geography] NULL,
	[TollFreePhoneNumber] [varchar](20) NOT NULL,
	[TargetPhoneNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_CourtesyListings] PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[EmailCampaign]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[EmailCampaign](
	[EmailClassID] [bigint] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[MarketNumber] [bigint] NULL,
	[IssueNumber] [bigint] NULL,
	[Name] [varchar](80) NULL,
	[IssueID] [bigint] NULL,
	[IssueName] [varchar](80) NULL,
	[RegistrationOffsetNumber] [bigint] NULL,
	[MoveInOffsetNumber] [bigint] NULL,
	[PeriodNumber] [bigint] NULL,
	[RankNumber] [bigint] NULL,
	[UnsubscribeType] [varchar](40) NULL,
	[TerminateDate] [datetime] NULL,
	[SourceID] [bigint] NULL,
 CONSTRAINT [PK_EmailCampaign] PRIMARY KEY CLUSTERED 
(
	[EmailClassID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[Invoices]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Invoices](
	[YMDID] [int] NULL,
	[InvoiceID] [varchar](65) NULL,
	[InvoiceAmount] [money] NULL,
	[Adjustments] [money] NULL,
	[Payments] [money] NULL,
	[AmountDue] [money] NULL,
	[DocDate] [datetime] NULL,
	[DocDateYMDID] [int] NULL,
	[PropertyID] [varchar](65) NULL,
	[PropertyName] [varchar](65) NULL,
	[ContractLeaseID] [varchar](65) NULL,
	[ZuoraInvoiceItemID] [varchar](65) NULL,
	[SFDCContractID] [varchar](65) NULL,
	[ItemCode] [varchar](65) NULL,
	[ALMStatus] [varchar](65) NULL,
	[LeaseID] [varchar](65) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[Lease]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Lease](
	[YMDID] [int] NULL,
	[LeaseID] [numeric](15, 0) NOT NULL,
	[CreateDate] [datetime] NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[RenterID] [numeric](15, 0) NULL,
	[RequestID] [numeric](15, 0) NULL,
	[BountyID] [numeric](15, 0) NULL,
	[LessorFirstName] [varchar](40) NULL,
	[LessorLastName] [varchar](40) NULL,
	[RenterFirstName] [varchar](80) NULL,
	[RenterLastName] [varchar](80) NULL,
	[LessorDate] [datetime] NULL,
	[RenterDate] [datetime] NULL,
	[MoveInDate] [datetime2](0) NULL,
	[MonthlyRentAmount] [numeric](10, 2) NULL,
	[LeaseTermName] [varchar](80) NULL,
	[LeaseTermNumber] [numeric](10, 0) NULL,
	[UniteAddressName] [varchar](80) NULL,
	[UnitNumber] [varchar](80) NULL,
	[UnitCityName] [varchar](80) NULL,
	[UnitStateCode] [varchar](40) NULL,
	[UnitZipCode] [varchar](40) NULL,
	[BillingCompanyName] [varchar](80) NULL,
	[BillingAddressName] [varchar](80) NULL,
	[BillingCityName] [varchar](80) NULL,
	[BillingStateCode] [varchar](40) NULL,
	[BillingZipCode] [varchar](40) NULL,
	[LessorPhoneCode] [varchar](40) NULL,
	[RenterPhoneCode] [varchar](40) NULL,
	[GuestCardID] [numeric](15, 0) NULL,
	[BillingPhoneCode] [varchar](40) NULL,
	[BillingFaxCode] [varchar](40) NULL,
	[BillingEmailName] [varchar](80) NULL,
	[FirstRenterEventDate] [datetime] NULL,
	[FirstRenterEventID] [numeric](15, 0) NULL,
	[LastRenterEventDate] [datetime] NULL,
	[LastRenterEventID] [numeric](15, 0) NULL,
	[CosignersName] [varchar](200) NULL,
	[DiscountAmount] [numeric](10, 2) NULL,
	[FlatFeeAmount] [numeric](10, 2) NULL,
	[BountySentDate] [datetime] NULL,
	[GuestCardRequestedDate] [datetime] NULL,
	[GuestCardReceivedDate] [datetime] NULL,
	[Status] [varchar](2000) NULL,
	[ForceBountyPaymentFlag] [numeric](15, 0) NULL,
	[ClassifiedFlag] [numeric](15, 0) NULL,
	[TerminateDate] [datetime] NULL,
	[BillingCompanyID] [numeric](15, 0) NULL,
	[StickerSentDate] [datetime] NULL,
	[NotifiedOnGuestCardFlag] [numeric](1, 0) NULL,
	[NotifiedOnLeaseApplicationFlag] [numeric](1, 0) NULL,
	[NotifiedViaPhoneFlag] [numeric](1, 0) NULL,
	[NotifiedInPersonFlag] [numeric](1, 0) NULL,
	[NotifiedGavePrintoutFlag] [numeric](1, 0) NULL,
	[NotifiedForgotFlag] [numeric](1, 0) NULL,
	[NotifiedOther] [varchar](500) NULL,
	[AffiliateStatus] [varchar](2000) NULL,
	[ValidForAffiliateDate] [datetime] NULL,
	[AutoValidationFlag] [numeric](15, 0) NULL,
	[UpdateDate] [datetime] NULL,
	[SmallPropertyFlag] [numeric](15, 0) NULL,
	[PropertyConfirmationSentDate] [datetime] NULL,
	[RewardCardRequestDate] [datetime] NULL,
	[SessionEmailID] [numeric](15, 0) NULL,
	[FundsOnAccountPayableFlag] [numeric](15, 0) NULL,
	[BillingType] [varchar](40) NULL,
	[VerifyFoundOnRentDotComFlag] [numeric](22, 0) NULL,
	[VerifyToldPropertyFlag] [numeric](22, 0) NULL,
	[VerifySignedLeaseFlag] [numeric](22, 0) NULL,
	[VerifyHonestlyAnsweredFlag] [numeric](22, 0) NULL,
	[VerifyReminderSentNumber] [numeric](22, 0) NULL,
	[LeaseType] [varchar](40) NULL,
	[LeaseName] [varchar](80) NULL,
	[PropertyType] [varchar](40) NULL,
	[PropertyName] [varchar](80) NULL,
	[RequestType] [varchar](40) NULL,
	[UnitID] [numeric](22, 0) NULL,
	[UnitType] [varchar](40) NULL,
	[OfferID] [numeric](22, 0) NULL,
	[OfferType] [varchar](40) NULL,
	[RenterType] [varchar](40) NULL,
	[_RenterFirstName] [varchar](80) NULL,
	[_RenterLastName] [varchar](80) NULL,
	[LessorID] [numeric](22, 0) NULL,
	[LessorType] [varchar](40) NULL,
	[_LessorFirstName] [varchar](40) NULL,
	[_LessorLastName] [varchar](40) NULL,
	[StatusCode] [numeric](22, 0) NULL,
	[StatusDate] [datetime] NULL,
	[MonthlyRentConfirmedFlag] [numeric](22, 0) NULL,
	[MoveInConfirmedFlag] [numeric](22, 0) NULL,
	[ActivationCodeNumber] [numeric](22, 0) NULL,
	[_RenterPhoneCode] [varchar](40) NULL,
	[HasUnitNumbersFlag] [numeric](22, 0) NULL,
	[PreviousTenantFlag] [numeric](22, 0) NULL,
	[LastStatusEmailed] [varchar](2000) NULL,
	[BrowserName] [varchar](40) NULL,
	[ClientIPName] [varchar](15) NULL,
	[RewardCardAddressName] [varchar](80) NULL,
	[RewardCardCityName] [varchar](80) NULL,
	[RewardCardStateCode] [varchar](40) NULL,
	[RewardCardZipCode] [varchar](40) NULL,
	[TranAccountNumber] [numeric](22, 0) NULL,
	[BusinessModelType] [varchar](40) NULL,
	[PasswordSource] [numeric](2, 0) NULL,
	[RegDate] [datetime] NULL,
	[SourceID] [numeric](15, 0) NULL,
	[PaidFlag] [numeric](1, 0) NULL,
	[InvoiceCreatedDate] [datetime] NULL,
	[ActivationCodeName] [varchar](15) NULL,
	[SourceNameDate] [datetime] NULL,
	[SourceName] [varchar](40) NULL,
	[RenterPhoneNumber]  AS (case when replace(replace(replace(replace([renterphoneCode],' ',''),'-',''),')',''),'(','')='0000000000' then '' else replace(replace(replace(replace([renterphoneCode],' ',''),'-',''),')',''),'(','') end)
) ON [PRIMARY]

GO
/****** Object:  Index [ClustIDX_DimensionLease_YMDID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_DimensionLease_YMDID] ON [Dimension].[Lease]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Dimension].[LeaseScore]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[LeaseScore](
	[LEASEID] [numeric](15, 0) NOT NULL,
	[LeaseScore] [nvarchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cuidx_LeaseScore_LeaseID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE UNIQUE CLUSTERED INDEX [cuidx_LeaseScore_LeaseID] ON [Dimension].[LeaseScore]
(
	[LEASEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Dimension].[ListingMarket]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[ListingMarket](
	[ListingID] [int] NOT NULL,
	[MarketID] [int] NOT NULL,
	[ClientCode] [varchar](20) NULL,
	[MarketCD] [varchar](20) NULL,
	[MarketName] [varchar](50) NULL,
	[MarketType] [varchar](50) NULL,
	[NationalSalesMarket] [tinyint] NULL,
	[MaxPrimaryMarketID] [int] NULL,
	[MaxPrimaryMarketCD] [varchar](20) NULL,
	[MaxPrimaryMarketName] [varchar](50) NULL,
	[MaxSecondaryMarketID] [int] NULL,
	[MaxSecondaryMarketCD] [varchar](20) NULL,
	[MaxSecondaryMarketName] [varchar](50) NULL,
 CONSTRAINT [PK_ListingMarket_New] PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC,
	[MarketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[ListingMarketDaily]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[ListingMarketDaily](
	[YMDID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[MarketID] [int] NOT NULL,
	[ClientCode] [varchar](20) NULL,
	[MarketCD] [varchar](20) NULL,
	[MarketName] [varchar](50) NULL,
	[MarketType] [varchar](50) NULL,
	[NationalSalesMarket] [tinyint] NULL,
	[MaxPrimaryMarketID] [int] NULL,
	[MaxPrimaryMarketCD] [varchar](20) NULL,
	[MaxPrimaryMarketName] [varchar](50) NULL,
	[MaxSecondaryMarketID] [int] NULL,
	[MaxSecondaryMarketCD] [varchar](20) NULL,
	[MaxSecondaryMarketName] [varchar](50) NULL,
 CONSTRAINT [PK_ListingMarketDaily] PRIMARY KEY CLUSTERED 
(
	[YMDID] ASC,
	[ListingID] ASC,
	[MarketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[Listings]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Listings](
	[YMDID] [int] NOT NULL,
	[RentPropertyID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[ListingTypeID] [int] NULL,
	[ListingType] [varchar](25) NOT NULL,
	[ListingTypeShort] [varchar](5) NULL,
	[RentStatusID] [tinyint] NULL,
	[ExternalID] [varchar](50) NOT NULL,
	[ExternalPriceCode] [varchar](8) NOT NULL,
	[ListingDetailsSource] [varchar](20) NULL,
	[RentMgtCoID] [int] NULL,
	[MgtCoName] [varchar](100) NOT NULL,
	[RentCompanyID] [int] NULL,
	[PropertyName] [varchar](100) NOT NULL,
	[PropertyAddress] [varchar](40) NOT NULL,
	[PropertyCity] [varchar](40) NOT NULL,
	[PropertyState] [varchar](2) NOT NULL,
	[PropertyZip] [varchar](10) NOT NULL,
	[MetroName] [varchar](40) NOT NULL,
	[SectionName] [varchar](75) NOT NULL,
	[SubSectionName] [varchar](50) NOT NULL,
	[PropertyTotalUnits] [int] NULL,
	[TotalPhotos] [int] NULL,
	[ActivePhotos] [int] NULL,
	[TotalFloorPlans] [int] NULL,
	[ActiveFloorPlans] [int] NULL,
	[TotalAmenities] [int] NULL,
	[ActiveAmenities] [int] NULL,
	[ActiveHDPhotos] [int] NULL,
	[ActiveHDFloorPlans] [int] NULL,
	[ShowPricing] [tinyint] NULL,
	[ShowOfficeHours] [tinyint] NULL,
	[ListingDescriptionLength] [int] NULL,
	[UpsellListCoupon] [tinyint] NULL,
	[UpsellPropCallRecording] [tinyint] NULL,
	[UpsellRentListing] [tinyint] NULL,
	[UpsellRentRewardCard] [tinyint] NULL,
	[UpsellRentFeaturedPlacement] [tinyint] NULL,
	[UpsellRentPTE] [tinyint] NULL,
	[UpsellRentVIPPlacement] [tinyint] NULL,
	[UpsellRentNoVacancy] [tinyint] NULL,
	[UpsellRentMetroFL] [tinyint] NOT NULL,
	[UpsellRentSpotlight] [tinyint] NOT NULL,
	[UpsellRentSubscriptionModel] [tinyint] NOT NULL,
	[UpsellListPayPerLeaseALM] [tinyint] NOT NULL,
	[FutureUpsell04] [tinyint] NOT NULL,
	[FutureUpsell05] [tinyint] NOT NULL,
	[CR3AvgOverallRating] [numeric](16, 1) NOT NULL,
	[HDActiveFloorPlansFulfilled] [tinyint] NULL,
	[HDActivePhotosFulfilled] [tinyint] NULL,
	[LinkedFloorPlanFulfilled] [tinyint] NULL,
	[Linked3DFloorPlanFulfilled] [tinyint] NULL,
	[LinkedRoomPlannerFulfilled] [tinyint] NULL,
	[MobileDealFulfilled] [tinyint] NULL,
	[CouponActiveOnSite] [tinyint] NULL,
	[CouponStartDate] [datetime] NULL,
	[CouponExpirationDate] [datetime] NULL,
	[CouponText] [varchar](1000) NOT NULL,
	[RentInternetTollFree] [varchar](20) NOT NULL,
	[RentInternetTarget] [varchar](20) NOT NULL,
	[RentMobileTollFree] [varchar](20) NOT NULL,
	[RentMobileTarget] [varchar](20) NOT NULL,
	[ContactPhone] [varchar](20) NOT NULL,
	[PropertyURL] [varchar](400) NOT NULL,
	[RentLeadFax] [varchar](400) NOT NULL,
	[RentLeadEmail] [varchar](400) NOT NULL,
	[RentLeadEmailWithType] [varchar](1000) NULL,
	[VanityURL] [varchar](400) NOT NULL,
	[LastUpdateYMDID] [int] NULL,
	[DateModified] [datetime] NULL,
	[GeoLong] [decimal](10, 4) NULL,
	[GeoLat] [decimal](10, 4) NULL,
	[Whisper] [tinyint] NULL,
	[LinkedFloorPlan] [int] NULL,
	[Linked3DFloorPlan] [int] NULL,
	[LinkedRoomPlanner] [int] NULL,
	[LowPrice] [int] NOT NULL,
	[HighPrice] [int] NOT NULL,
	[CalculatedPrice] [int] NULL,
 CONSTRAINT [PK_ListingIDs] PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[Listings_Legacy]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Listings_Legacy](
	[YMDID] [int] NOT NULL,
	[RentPropertyID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[ListingTypeID] [int] NULL,
	[ListingType] [varchar](25) NOT NULL,
	[ListingTypeShort] [varchar](5) NULL,
	[RentStatusID] [tinyint] NULL,
	[ExternalID] [varchar](50) NOT NULL,
	[ExternalPriceCode] [varchar](8) NOT NULL,
	[ListingDetailsSource] [varchar](20) NULL,
	[RentMgtCoID] [int] NULL,
	[MgtCoName] [varchar](100) NOT NULL,
	[RentCompanyID] [int] NULL,
	[PropertyName] [varchar](100) NOT NULL,
	[PropertyAddress] [varchar](40) NOT NULL,
	[PropertyCity] [varchar](40) NOT NULL,
	[PropertyState] [varchar](2) NOT NULL,
	[PropertyZip] [varchar](10) NOT NULL,
	[MetroName] [varchar](40) NOT NULL,
	[SectionName] [varchar](75) NOT NULL,
	[SubSectionName] [varchar](50) NOT NULL,
	[PropertyTotalUnits] [int] NULL,
	[TotalPhotos] [int] NULL,
	[ActivePhotos] [int] NULL,
	[TotalFloorPlans] [int] NULL,
	[ActiveFloorPlans] [int] NULL,
	[TotalAmenities] [int] NULL,
	[ActiveAmenities] [int] NULL,
	[ActiveHDPhotos] [int] NULL,
	[ActiveHDFloorPlans] [int] NULL,
	[ShowPricing] [tinyint] NULL,
	[ShowOfficeHours] [tinyint] NULL,
	[ListingDescriptionLength] [int] NULL,
	[UpsellListCoupon] [tinyint] NULL,
	[UpsellPropCallRecording] [tinyint] NULL,
	[UpsellRentListing] [tinyint] NULL,
	[UpsellRentRewardCard] [tinyint] NULL,
	[UpsellRentFeaturedPlacement] [tinyint] NULL,
	[UpsellRentPTE] [tinyint] NULL,
	[UpsellRentVIPPlacement] [tinyint] NULL,
	[UpsellRentNoVacancy] [tinyint] NULL,
	[UpsellRentMetroFL] [tinyint] NOT NULL,
	[UpsellRentSpotlight] [tinyint] NOT NULL,
	[UpsellRentSubscriptionModel] [tinyint] NOT NULL,
	[UpsellListPayPerLeaseALM] [tinyint] NOT NULL,
	[FutureUpsell04] [tinyint] NOT NULL,
	[FutureUpsell05] [tinyint] NOT NULL,
	[CR3AvgOverallRating] [numeric](16, 1) NOT NULL,
	[HDActiveFloorPlansFulfilled] [tinyint] NULL,
	[HDActivePhotosFulfilled] [tinyint] NULL,
	[LinkedFloorPlanFulfilled] [tinyint] NULL,
	[Linked3DFloorPlanFulfilled] [tinyint] NULL,
	[LinkedRoomPlannerFulfilled] [tinyint] NULL,
	[MobileDealFulfilled] [tinyint] NULL,
	[CouponActiveOnSite] [tinyint] NULL,
	[CouponStartDate] [datetime] NULL,
	[CouponExpirationDate] [datetime] NULL,
	[CouponText] [varchar](1000) NOT NULL,
	[RentInternetTollFree] [varchar](20) NOT NULL,
	[RentInternetTarget] [varchar](20) NOT NULL,
	[RentMobileTollFree] [varchar](20) NOT NULL,
	[RentMobileTarget] [varchar](20) NOT NULL,
	[ContactPhone] [varchar](20) NOT NULL,
	[PropertyURL] [varchar](400) NOT NULL,
	[RentLeadFax] [varchar](400) NOT NULL,
	[RentLeadEmail] [varchar](400) NOT NULL,
	[RentLeadEmailWithType] [varchar](1000) NULL,
	[VanityURL] [varchar](400) NOT NULL,
	[LastUpdateYMDID] [int] NULL,
	[DateModified] [datetime] NULL,
	[GeoLong] [decimal](10, 4) NULL,
	[GeoLat] [decimal](10, 4) NULL,
	[Whisper] [tinyint] NULL,
	[LinkedFloorPlan] [int] NULL,
	[Linked3DFloorPlan] [int] NULL,
	[LinkedRoomPlanner] [int] NULL,
	[LowPrice] [int] NOT NULL,
	[HighPrice] [int] NOT NULL,
	[CalculatedPrice] [int] NULL,
 CONSTRAINT [PK_Listings_1] PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[Listings_old_delete20150317]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Listings_old_delete20150317](
	[YMDID] [int] NOT NULL,
	[RentPropertyID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[ListingTypeID] [int] NULL,
	[ListingType] [varchar](25) NOT NULL,
	[ListingTypeShort] [varchar](5) NULL,
	[RentStatusID] [tinyint] NULL,
	[ExternalID] [varchar](50) NOT NULL,
	[ExternalPriceCode] [varchar](8) NOT NULL,
	[ListingDetailsSource] [varchar](20) NULL,
	[RentMgtCoID] [int] NULL,
	[MgtCoName] [varchar](100) NOT NULL,
	[RentCompanyID] [int] NULL,
	[PropertyName] [varchar](100) NOT NULL,
	[PropertyAddress] [varchar](40) NOT NULL,
	[PropertyCity] [varchar](40) NOT NULL,
	[PropertyState] [varchar](2) NOT NULL,
	[PropertyZip] [varchar](10) NOT NULL,
	[MetroName] [varchar](40) NOT NULL,
	[SectionName] [varchar](75) NOT NULL,
	[SubSectionName] [varchar](50) NOT NULL,
	[PropertyTotalUnits] [int] NULL,
	[TotalPhotos] [int] NULL,
	[ActivePhotos] [int] NULL,
	[TotalFloorPlans] [int] NULL,
	[ActiveFloorPlans] [int] NULL,
	[TotalAmenities] [int] NULL,
	[ActiveAmenities] [int] NULL,
	[ActiveHDPhotos] [int] NULL,
	[ActiveHDFloorPlans] [int] NULL,
	[ShowPricing] [tinyint] NULL,
	[ShowOfficeHours] [tinyint] NULL,
	[ListingDescriptionLength] [int] NULL,
	[UpsellListCoupon] [tinyint] NULL,
	[UpsellPropCallRecording] [tinyint] NULL,
	[UpsellRentListing] [tinyint] NULL,
	[UpsellRentRewardCard] [tinyint] NULL,
	[UpsellRentFeaturedPlacement] [tinyint] NULL,
	[UpsellRentPTE] [tinyint] NULL,
	[UpsellRentVIPPlacement] [tinyint] NULL,
	[UpsellRentNoVacancy] [tinyint] NULL,
	[UpsellRentMetroFL] [tinyint] NOT NULL,
	[UpsellRentSubscriptionModel] [tinyint] NOT NULL,
	[FutureUpsell03] [tinyint] NOT NULL,
	[FutureUpsell04] [tinyint] NOT NULL,
	[FutureUpsell05] [tinyint] NOT NULL,
	[CR3AvgOverallRating] [numeric](16, 1) NOT NULL,
	[HDActiveFloorPlansFulfilled] [tinyint] NULL,
	[HDActivePhotosFulfilled] [tinyint] NULL,
	[LinkedFloorPlanFulfilled] [tinyint] NULL,
	[Linked3DFloorPlanFulfilled] [tinyint] NULL,
	[LinkedRoomPlannerFulfilled] [tinyint] NULL,
	[MobileDealFulfilled] [tinyint] NULL,
	[CouponActiveOnSite] [tinyint] NULL,
	[CouponStartDate] [datetime] NULL,
	[CouponExpirationDate] [datetime] NULL,
	[CouponText] [varchar](1000) NOT NULL,
	[RentInternetTollFree] [varchar](20) NOT NULL,
	[RentInternetTarget] [varchar](20) NOT NULL,
	[RentMobileTollFree] [varchar](20) NOT NULL,
	[RentMobileTarget] [varchar](20) NOT NULL,
	[ContactPhone] [varchar](20) NOT NULL,
	[PropertyURL] [varchar](400) NOT NULL,
	[RentLeadFax] [varchar](400) NOT NULL,
	[RentLeadEmail] [varchar](400) NOT NULL,
	[RentLeadEmailWithType] [varchar](1000) NULL,
	[VanityURL] [varchar](400) NOT NULL,
	[LastUpdateYMDID] [int] NULL,
	[DateModified] [datetime] NULL,
	[GeoLong] [decimal](10, 4) NULL,
	[GeoLat] [decimal](10, 4) NULL,
	[Whisper] [tinyint] NULL,
	[LinkedFloorPlan] [int] NULL,
	[Linked3DFloorPlan] [int] NULL,
	[LinkedRoomPlanner] [int] NULL,
	[LowPrice] [int] NOT NULL,
	[HighPrice] [int] NOT NULL,
	[CalculatedPrice] [int] NULL,
 CONSTRAINT [PK_Listings] PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[Person]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Person](
	[PersonID] [numeric](15, 0) NOT NULL,
	[PersonType] [varchar](40) NULL,
	[FirstName] [varchar](80) NULL,
	[LastName] [varchar](80) NULL,
	[PersonName] [varchar](80) NULL,
	[PersonCode] [varchar](40) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[TerminateDate] [datetime] NULL,
	[UserName] [varchar](80) NULL,
	[SourceID] [numeric](15, 0) NULL,
	[VerifyCode] [varchar](80) NULL,
	[LessorID] [numeric](15, 0) NULL,
	[RenterID] [numeric](15, 0) NULL,
	[AffiliateID] [numeric](15, 0) NULL,
	[PromoName] [varchar](80) NULL,
	[ReferrerName] [varchar](80) NULL,
	[OptinID] [numeric](15, 0) NULL,
	[MoveinDate] [datetime2](0) NULL,
	[EmailName] [varchar](80) NULL,
	[AddressName] [varchar](255) NULL,
	[CityName] [varchar](80) NULL,
	[StateCode] [varchar](40) NULL,
	[ZipCode] [varchar](40) NULL,
	[PhoneCode] [varchar](40) NULL,
	[FaxCode] [varchar](40) NULL,
	[PrecisionCode] [varchar](40) NULL,
	[LatitudeCode] [varchar](40) NULL,
	[LongitudeCode] [varchar](40) NULL,
	[LastEventID] [numeric](15, 0) NULL,
	[HuntDate] [datetime] NULL,
	[UnsubscribeDate] [datetime] NULL,
	[UndeliverableDate] [datetime] NULL,
	[Undeliverable] [varchar](2000) NULL,
	[RptExtraBitmask] [nvarchar](38) NULL,
	[UnconfirmedFlag] [numeric](15, 0) NULL,
	[CollectionsRepID] [numeric](15, 0) NULL,
	[UnwantedDate] [datetime] NULL,
	[UnwantedEmailID] [numeric](15, 0) NULL,
	[UnwantedEmailClassID] [numeric](15, 0) NULL,
	[ConfirmationNeededFlag] [numeric](15, 0) NULL,
	[ConfirmationSentDate] [datetime2](0) NULL,
	[ConfirmationOkDate] [datetime2](0) NULL,
	[UnsubscribeEmailID] [numeric](15, 0) NULL,
	[UnsubscribeEmailClassID] [numeric](15, 0) NULL,
	[RenterDate] [datetime2](0) NULL,
	[RoommateDate] [datetime] NULL,
	[PromoID] [numeric](15, 0) NULL,
	[LastLoginDate] [datetime] NULL,
	[NickName] [varchar](80) NULL,
	[RegistrationUrlName] [varchar](100) NULL,
	[CallDate] [datetime] NULL,
	[CallDispositionName] [varchar](80) NULL,
	[SapCustomerID] [numeric](15, 0) NULL,
	[HyperRREmailSentDate] [datetime] NULL,
	[AblCheckpointDate] [datetime] NULL,
	[PasswordSource] [numeric](2, 0) NULL,
	[InsiderID] [numeric](15, 0) NULL,
	[RequestACallDate] [datetime] NULL,
	[PhoneFromCallerIDFlag] [numeric](1, 0) NULL,
	[RegisterDate] [datetime] NULL,
	[VisitorID] [binary](16) NULL,
	[PasswordHash] [binary](20) NULL,
	[BrowserName] [varchar](40) NULL,
	[ClientIPName] [varchar](15) NULL,
	[SalesRepID] [numeric](15, 0) NULL,
	[Terminate] [varchar](2000) NULL,
	[ProcessedBitmask] [numeric](38, 0) NULL,
	[AgentID] [numeric](15, 0) NULL,
	[SeenRewardInterstitialDate] [datetime] NULL,
	[ClickID] [varchar](32) NULL,
	[UniversalID] [varchar](128) NULL,
	[PhoneNumber]  AS (case when replace(replace(replace(replace([phoneCode],' ',''),'-',''),')',''),'(','')='0000000000' then '' else replace(replace(replace(replace([phoneCode],' ',''),'-',''),')',''),'(','') end),
 CONSTRAINT [PK_Person] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[PropertyListings]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[PropertyListings](
	[YMDID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ExternalID] [varchar](50) NULL,
	[AccountID] [int] NULL,
	[AcountName] [varchar](100) NULL,
	[PropertyType] [varchar](50) NULL,
	[ISLargePropertyFlag] [int] NULL,
	[BusinessmodelType] [varchar](10) NULL,
	[StatusID] [int] NULL,
	[StatusDesc] [varchar](128) NULL,
	[CheckAvailabilityURL] [varchar](255) NULL,
	[SalesRepPersonID] [int] NULL,
	[MLS] [varchar](50) NULL,
	[PropertyName] [varchar](155) NOT NULL,
	[PropertyAddress] [varchar](255) NULL,
	[PropertyCity] [varchar](100) NULL,
	[PropertyState] [varchar](25) NULL,
	[PropertyZip] [varchar](25) NULL,
	[ContactPhone] [varchar](25) NULL,
	[ContactPhoneExt] [varchar](25) NULL,
	[FaxNumber] [varchar](25) NULL,
	[EmailAddress] [varchar](100) NULL,
	[MarketID] [int] NULL,
	[MarketName] [varchar](50) NULL,
	[SubMarketID] [int] NULL,
	[SubMarketName] [varchar](50) NULL,
	[AreaID] [int] NULL,
	[AreaName] [varchar](100) NULL,
	[PropertyTotalUnits] [int] NULL,
	[TotalPhotos] [int] NULL,
	[ActivePhotos] [int] NULL,
	[TotalFloorPlans] [int] NULL,
	[ActiveFloorPlans] [int] NULL,
	[TotalLogos] [int] NULL,
	[ActiveLogos] [int] NULL,
	[ActiveAmenities] [int] NULL,
	[MinRentLoft] [int] NULL,
	[MaxRentLoft] [int] NULL,
	[MinRent0Bed] [int] NULL,
	[MaxRent0Bed] [int] NULL,
	[MinRent1Bed] [int] NULL,
	[MaxRent1Bed] [int] NULL,
	[MinRent2Bed] [int] NULL,
	[MaxRent2Bed] [int] NULL,
	[MinRent3Bed] [int] NULL,
	[MaxRent3Bed] [int] NULL,
	[MinRent4Bed] [int] NULL,
	[MaxRent4Bed] [int] NULL,
	[UpsellFeaturedListing] [int] NULL,
	[UpsellPTEListing] [int] NULL,
	[Furnished] [int] NULL,
	[LowIncomeHousing] [int] NULL,
	[SeniorHousing] [int] NULL,
	[TargetPhoneNumber] [varchar](25) NULL,
	[TrackingPhoneNumber] [varchar](25) NULL,
	[GeoLong] [int] NULL,
	[GeoLat] [int] NULL,
	[BillingFirstName] [varchar](100) NULL,
	[BillingLastName] [varchar](100) NULL,
	[BillingCompany] [varchar](155) NULL,
	[BillingAddress] [varchar](255) NULL,
	[BillingCity] [varchar](100) NULL,
	[BillingState] [varchar](25) NULL,
	[BillingZip] [varchar](25) NULL,
	[BillingPhone] [varchar](25) NULL,
	[BillingPhoneExt] [varchar](25) NULL,
	[BillingFax] [varchar](25) NULL,
	[BillingEmail] [varchar](100) NULL,
	[DiscountAmount] [decimal](10, 2) NULL,
	[FlatfeeAmount] [int] NULL,
	[SourceCompanyID] [int] NULL,
	[CreateDate] [date] NULL,
	[TerminateDate] [date] NULL,
 CONSTRAINT [PK_PropertyListings] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[PropertyMap]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[PropertyMap](
	[YMDID] [int] NULL,
	[RentPropertyID] [int] NULL,
	[AGPropertyID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[RenterInvoice]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[RenterInvoice](
	[YMDID] [int] NULL,
	[InvoiceID] [varchar](25) NULL,
	[InvoiceCreateDate] [date] NULL,
	[InvoiceType] [varchar](50) NULL,
	[InvoiceStatus] [varchar](50) NULL,
	[RentInvoiceID] [varchar](25) NULL,
	[ZuoraInvoiceNumber] [varchar](40) NULL,
	[ETSentDate] [datetime] NULL,
	[LeaseID] [numeric](15, 0) NULL,
	[LeaseStatusReasonID] [numeric](15, 0) NULL,
	[LeaseStatusID] [numeric](15, 0) NULL,
	[LeaseStatusDesc] [varchar](80) NULL,
	[LeaseReasonID] [numeric](15, 0) NULL,
	[LeaseReasonDesc] [varchar](80) NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[PropertyStatus] [varchar](80) NULL,
	[PropertyName] [varchar](200) NULL,
	[PropertyCity] [varchar](80) NULL,
	[PropertyState] [varchar](2) NULL,
	[RenterFirstName] [varchar](80) NULL,
	[RenterLastName] [varchar](80) NULL,
	[UnitAddress] [varchar](80) NULL,
	[UnitNumber] [varchar](80) NULL,
	[MoveInDate] [datetime] NULL,
	[LeaseCreateDate] [datetime] NULL,
	[LeaseUsageStatusDesc] [varchar](100) NULL,
	[LeaseScore] [varchar](5) NULL,
	[adjustedmoveindate] [date] NULL,
	[leaseusagestatusid] [tinyint] NULL,
	[zuoraaccountid] [varchar](32) NULL,
	[subscriptionnumber] [varchar](80) NULL,
	[productname] [varchar](15) NULL,
	[confirmationdate] [date] NULL,
	[ZuoraInvoiceItemID] [varchar](32) NULL,
	[LeaseUsageCreateDate] [datetime] NULL,
	[ZuoraInvoiceID] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[RENTERLEASE]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[RENTERLEASE](
	[LEASEID] [int] NOT NULL,
	[PARENTLEASEID] [int] NULL,
	[DISPUTECASEID] [int] NULL,
	[DISPUTECASENUMBER] [int] NULL,
	[RENTERCASEID] [int] NULL,
	[RENTERCASENUMBER] [int] NULL,
	[REWARDCARDINQUIRYID] [int] NOT NULL,
	[LEASESTATUSREASONID] [int] NOT NULL,
	[CHARGEAMOUNT] [money] NULL,
	[PROMISETOPAY] [tinyint] NULL,
	[REWARDCARDADDRESS] [varchar](80) NULL,
	[REWARDCARDCITY] [varchar](80) NULL,
	[REWARDCARDSTATE] [varchar](80) NULL,
	[REWARDCARDZIP] [varchar](40) NULL,
	[ADJUSTEDMOVEINDATE] [date] NULL,
	[CREATEDATE] [date] NOT NULL,
	[FIRSTCONTACTDATE] [date] NULL,
	[NOTREWARDCARDELIGIBLE] [int] NULL,
	[RECOLLECTISSUEDATE] [date] NULL,
	[REPURSUEISSUEDATE] [date] NULL,
	[REWARDCARDFIRSTNAME] [varchar](80) NULL,
	[REWARDCARDLASTNAME] [varchar](80) NULL,
	[PRODUCTTYPE] [varchar](40) NULL,
	[EARLY_LATE_EXCLUDE] [tinyint] NULL,
	[CONFIRMATIONDATE] [date] NULL,
	[INSERTDATE] [date] NULL,
	[FORCENEWLEASEUSAGE] [tinyint] NULL,
	[ACCELERATE] [tinyint] NULL,
	[ACCELERATE_DATE] [date] NULL,
	[LeaseStatusDesc] [varchar](80) NULL,
	[LeaseReasonDesc] [varchar](80) NULL,
	[IsCPA] [bit] NULL,
	[RCMoveInDate] [date] NULL,
	[MoveInDateToUse] [date] NULL,
	[BasicStartDate] [date] NULL,
	[ExpectedStartDate] [date] NULL,
	[ExpectedInvoiceDate] [date] NULL,
	[leasescore] [varchar](3) NULL,
	[RCPropertyID] [int] NULL,
	[LeaseIDChar] [varchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cuidx_RenterLease_LeaseID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [cuidx_RenterLease_LeaseID] ON [Dimension].[RENTERLEASE]
(
	[LEASEID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Dimension].[RenterLeaseStatus_Send]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[RenterLeaseStatus_Send](
	[LeaseID] [int] NULL,
	[sendid] [int] NULL,
	[CreateDate] [datetime] NULL,
	[LeaseStatusReasonID] [int] NULL,
	[LeaseReasonDesc] [varchar](80) NULL,
	[LeaseStatusDesc] [varchar](80) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cuidx_LeaseStatusSend_LeaseID_Sendid]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE UNIQUE CLUSTERED INDEX [cuidx_LeaseStatusSend_LeaseID_Sendid] ON [Dimension].[RenterLeaseStatus_Send]
(
	[LeaseID] ASC,
	[sendid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Dimension].[RentProducts_DELETE_SG_20141027]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[RentProducts_DELETE_SG_20141027](
	[ClientID] [varchar](18) NOT NULL,
	[ItemID] [varchar](40) NOT NULL,
	[ItemDescription] [varchar](100) NULL,
	[Combo] [char](1) NULL,
	[Subscription] [char](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[RPTPROD_Property]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[RPTPROD_Property](
	[YMDID] [int] NULL,
	[PropertyID] [numeric](15, 0) NOT NULL,
	[PropertyName] [varchar](255) NULL,
	[PropertyAddress] [varchar](80) NULL,
	[PropertyCity] [varchar](80) NULL,
	[PropertyState] [varchar](5) NULL,
	[PropertyZipCode] [varchar](40) NULL,
	[CompanyID] [numeric](15, 0) NULL,
	[PropertyStatus] [varchar](80) NULL,
 CONSTRAINT [PK_PropertyID] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Dimension].[TrackRentComUpload]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[TrackRentComUpload](
	[ymdid] [int] NULL,
	[TableToLoad] [varchar](150) NULL,
	[LastRun] [datetime] NULL,
	[LastFailed] [datetime] NULL,
	[lastFailureMsg] [varchar](500) NULL,
	[mailsent] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ciudx_TrackRentComUpload_YMDID_TableToLoad]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ciudx_TrackRentComUpload_YMDID_TableToLoad] ON [Dimension].[TrackRentComUpload]
(
	[ymdid] ASC,
	[TableToLoad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Dimension].[Units]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Dimension].[Units](
	[ListingID] [int] NOT NULL,
	[Bedrooms] [varchar](10) NOT NULL,
	[Bathrooms] [varchar](10) NOT NULL,
	[SqFootage] [int] NULL,
	[RentPrice] [int] NULL,
 CONSTRAINT [PK_Units] PRIMARY KEY CLUSTERED 
(
	[ListingID] ASC,
	[Bedrooms] ASC,
	[Bathrooms] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Fact].[AR_Invoices]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[AR_Invoices](
	[LeaseID] [numeric](15, 0) NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[Status] [varchar](2000) NULL,
	[InvoiceID] [varchar](15) NULL,
	[InvoiceType] [varchar](20) NULL,
	[InvoiceDate] [datetime] NULL,
	[InvoiceAmount] [numeric](15, 0) NULL,
	[OutstandingAmount] [numeric](15, 0) NULL,
	[TotalcreditsAmount] [numeric](15, 0) NULL,
	[TotalreceiptsAmount] [numeric](15, 0) NULL,
	[PromisetopayDate] [datetime] NULL,
	[PromisetopaypersonID] [numeric](15, 0) NULL,
	[EmailcontractID] [numeric](15, 0) NULL,
	[CompanyID] [numeric](15, 0) NULL,
	[DonotbillFlag] [numeric](15, 0) NULL,
	[SAPInvoiceID] [varchar](15) NULL,
	[ContractID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ClustIDX_FactARInvoices_InvoiceID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_FactARInvoices_InvoiceID] ON [Fact].[AR_Invoices]
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[AR_Receipts]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[AR_Receipts](
	[LeaseID] [numeric](15, 0) NULL,
	[InvoiceID] [varchar](15) NULL,
	[InvoiceDate] [datetime] NULL,
	[CollectionAmount] [numeric](15, 0) NULL,
	[CollectionDate] [datetime] NULL,
	[ReceiptID] [varchar](50) NULL,
	[CheckNumber] [varchar](30) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ClustIDX_FactARReceipts_InvoiceID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_FactARReceipts_InvoiceID] ON [Fact].[AR_Receipts]
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[CallsRentcom_legacy20160622]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[CallsRentcom_legacy20160622](
	[YMDID] [int] NULL,
	[CallID] [varchar](50) NULL,
	[RentPropertyID] [int] NULL,
	[PropertyID] [int] NULL,
	[ListingID] [int] NULL,
	[BusinessModel] [varchar](15) NULL,
	[CallStartDateTime] [datetime] NULL,
	[CallEndDateTime] [datetime] NULL,
	[DurationInSeconds] [int] NULL,
	[CallStatus] [int] NULL,
	[CallSource] [varchar](2) NULL,
	[CallType] [varchar](25) NULL,
	[CallerPhoneNumber] [varchar](15) NULL,
	[PublishedPhoneNumber] [varchar](10) NULL,
	[TargetPhoneNumber] [varchar](10) NULL,
	[CallerName] [varchar](255) NULL,
	[CallerAddress] [varchar](255) NULL,
	[CallerCity] [varchar](255) NULL,
	[CallerState] [varchar](255) NULL,
	[CallerZip] [varchar](255) NULL,
	[CallerLocation] [varchar](255) NULL,
	[LinkName] [varchar](255) NULL,
	[LinkID] [varchar](255) NULL,
	[AudioURL] [varchar](500) NULL,
	[CallerURL] [nvarchar](255) NULL,
	[ReceiverURL] [nvarchar](255) NULL,
	[MP3URL] [nvarchar](255) NULL,
	[CallerTrimSilenceURL] [nvarchar](255) NULL,
	[CallLoadHour] [tinyint] NULL,
	[CallLoadYMDID] [int] NULL,
	[CallEndHour] [int] NULL,
	[DateAddedYMDID] [int] NULL,
	[ActualCallDuration] [int] NULL,
	[CallerTrimBeginning] [int] NULL,
	[TotalCallerTrimTalkTime] [int] NULL,
	[EurekaID] [int] NULL,
	[IsAbandoned] [int] NULL,
	[TimePriorToCallerSpeaking]  AS ([ActualCallDuration]-[CallerTrimBeginning]),
	[Population] [varchar](255) NULL,
	[AvgTravelTimeToWork] [varchar](255) NULL,
	[MedianHouseholdIncome] [varchar](255) NULL,
	[PerCapitaIncome] [varchar](255) NULL,
	[MedianEarnings] [varchar](255) NULL,
	[MedianContractRent] [varchar](255) NULL,
	[MedianRentAsked] [varchar](255) NULL,
	[MedianGrossRent] [varchar](255) NULL,
	[MedianPriceAsked] [varchar](255) NULL,
	[MedianRealEstateTaxes] [varchar](255) NULL,
	[Households] [varchar](255) NULL,
	[OwnerHouseholds] [varchar](255) NULL,
	[RenterHouseholds] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cidx_ymdid_v1]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [cidx_ymdid_v1] ON [Fact].[CallsRentcom_legacy20160622]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[CallsRentcom_OLD_20150422]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[CallsRentcom_OLD_20150422](
	[YMDID] [int] NULL,
	[CallID] [varchar](50) NULL,
	[RentPropertyID] [int] NULL,
	[PropertyID] [int] NULL,
	[ListingID] [int] NULL,
	[CallStartDateTime] [datetime] NULL,
	[CallEndDateTime] [datetime] NULL,
	[DurationInSeconds] [int] NULL,
	[CallStatus] [int] NULL,
	[CallSource] [varchar](2) NULL,
	[CallType] [varchar](25) NULL,
	[CallerPhoneNumber] [varchar](15) NULL,
	[PublishedPhoneNumber] [varchar](10) NULL,
	[TargetPhoneNumber] [varchar](10) NULL,
	[CallerName] [varchar](255) NULL,
	[CallerAddress] [varchar](255) NULL,
	[CallerCity] [varchar](255) NULL,
	[CallerState] [varchar](255) NULL,
	[CallerZip] [varchar](255) NULL,
	[CallerLocation] [varchar](255) NULL,
	[LinkName] [varchar](255) NULL,
	[LinkID] [varchar](255) NULL,
	[AudioURL] [varchar](500) NULL,
	[CallerURL] [nvarchar](255) NULL,
	[ReceiverURL] [nvarchar](255) NULL,
	[MP3URL] [nvarchar](255) NULL,
	[CallerTrimSilenceURL] [nvarchar](255) NULL,
	[CallLoadHour] [tinyint] NULL,
	[CallLoadYMDID] [int] NULL,
	[CallEndHour] [int] NULL,
	[DateAddedYMDID] [int] NULL,
	[ActualCallDuration] [int] NULL,
	[CallerTrimBeginning] [int] NULL,
	[TotalCallerTrimTalkTime] [int] NULL,
	[EurekaID] [int] NULL,
	[IsAbandoned] [int] NULL,
	[TimePriorToCallerSpeaking]  AS ([ActualCallDuration]-[CallerTrimBeginning]),
	[Population] [varchar](255) NULL,
	[AvgTravelTimeToWork] [varchar](255) NULL,
	[MedianHouseholdIncome] [varchar](255) NULL,
	[PerCapitaIncome] [varchar](255) NULL,
	[MedianEarnings] [varchar](255) NULL,
	[MedianContractRent] [varchar](255) NULL,
	[MedianRentAsked] [varchar](255) NULL,
	[MedianGrossRent] [varchar](255) NULL,
	[MedianPriceAsked] [varchar](255) NULL,
	[MedianRealEstateTaxes] [varchar](255) NULL,
	[Households] [varchar](255) NULL,
	[OwnerHouseholds] [varchar](255) NULL,
	[RenterHouseholds] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cidx_ymdid]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [cidx_ymdid] ON [Fact].[CallsRentcom_OLD_20150422]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[EmailsRentcom_legacy20160622]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[EmailsRentcom_legacy20160622](
	[RentPropertyID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[YMDID] [int] NULL,
	[WhenEntered] [datetime] NOT NULL,
	[LeadID] [numeric](20, 0) NULL,
	[LeadTypeID] [numeric](1, 0) NOT NULL,
	[Status] [numeric](1, 0) NULL,
	[Email] [varchar](255) NOT NULL,
	[FirstName] [varchar](80) NOT NULL,
	[LastName] [varchar](80) NOT NULL,
	[Address1] [varchar](80) NULL,
	[Address2] [varchar](80) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](20) NULL,
	[Zip] [varchar](20) NULL,
	[DayPhone] [varchar](30) NULL,
	[NightPhone] [varchar](30) NULL,
	[FaxNumber] [varchar](30) NULL,
	[MoveMonth] [varchar](15) NULL,
	[Bedrooms] [varchar](50) NULL,
	[Bathrooms] [varchar](3) NULL,
	[Comments] [varchar](2500) NULL,
	[LeaseTerms] [varchar](15) NULL,
	[LeadScore] [numeric](5, 2) NULL,
	[Source] [varchar](25) NULL,
	[PersonalizationID] [varchar](20) NULL,
	[CampaignID] [varchar](20) NULL,
	[EF_ID] [varchar](255) NULL,
	[EV_TRANS_ID] [varchar](255) NULL,
	[SessionID] [varchar](255) NULL,
	[reasonformove] [varchar](255) NULL,
	[pricerange] [varchar](255) NULL,
	[BusinessModel] [varchar](15) NULL,
	[CompanyID] [int] NULL,
	[UpdateYMDID] [int] NOT NULL,
	[Device] [varchar](50) NULL,
	[PageType] [varchar](50) NULL,
	[Context] [varchar](50) NULL,
	[Endeca_ID] [varchar](50) NULL,
	[UnitLayout_ID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [ClustIDX_FactEmailsRentCom_YMDID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_FactEmailsRentCom_YMDID] ON [Fact].[EmailsRentcom_legacy20160622]
(
	[YMDID] ASC,
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[EmailsRentcom_OLD_20150603]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[EmailsRentcom_OLD_20150603](
	[RentPropertyID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[YMDID] [int] NULL,
	[WhenEntered] [datetime] NOT NULL,
	[LeadID] [numeric](20, 0) NULL,
	[LeadTypeID] [numeric](1, 0) NOT NULL,
	[Status] [numeric](1, 0) NULL,
	[Email] [varchar](255) NOT NULL,
	[FirstName] [varchar](80) NOT NULL,
	[LastName] [varchar](80) NOT NULL,
	[Address1] [varchar](80) NULL,
	[Address2] [varchar](80) NULL,
	[City] [varchar](40) NULL,
	[State] [varchar](20) NULL,
	[Zip] [varchar](20) NULL,
	[DayPhone] [varchar](30) NULL,
	[NightPhone] [varchar](30) NULL,
	[FaxNumber] [varchar](30) NULL,
	[MoveMonth] [varchar](15) NULL,
	[Bedrooms] [varchar](50) NULL,
	[Bathrooms] [varchar](3) NULL,
	[Comments] [varchar](2500) NULL,
	[LeaseTerms] [varchar](15) NULL,
	[LeadScore] [numeric](5, 2) NULL,
	[Source] [varchar](25) NULL,
	[PersonalizationID] [varchar](20) NULL,
	[CampaignID] [varchar](20) NULL,
	[EF_ID] [varchar](255) NULL,
	[EV_TRANS_ID] [varchar](255) NULL,
	[SessionID] [varchar](255) NULL,
	[reasonformove] [varchar](255) NULL,
	[pricerange] [varchar](255) NULL,
	[BusinessModel] [varchar](15) NULL,
	[CompanyID] [int] NULL,
	[UpdateYMDID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Fact].[ExactTarget_PTE]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[ExactTarget_PTE](
	[ListingID] [int] NOT NULL,
	[PropertyID] [int] NULL,
	[EmailName] [varchar](100) NULL,
	[YMDID] [int] NOT NULL,
	[PTE] [varchar](50) NULL,
	[SendCount] [int] NULL,
	[DeliveredCount] [int] NULL,
	[Opens] [int] NULL,
	[Clicks] [int] NULL,
	[DT_Updated] [datetime] NULL,
	[CampaignBusinessKey] [varchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [ClusteredIndex_YMDID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClusteredIndex_YMDID] ON [Fact].[ExactTarget_PTE]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[Finance_Forecast]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[Finance_Forecast](
	[YMDID] [int] NULL,
	[DateEffective] [datetime] NULL,
	[TimeGrain] [varchar](35) NULL,
	[MetricName] [varchar](50) NULL,
	[MetricType] [varchar](35) NULL,
	[TargetValue] [numeric](16, 4) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [ClustIDX_FactFinanceForecast_YMDID_MetricName]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_FactFinanceForecast_YMDID_MetricName] ON [Fact].[Finance_Forecast]
(
	[YMDID] ASC,
	[MetricName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[Leads]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[Leads](
	[LeadID] [numeric](15, 0) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[TerminateDate] [datetime] NULL,
	[PersonID] [numeric](15, 0) NULL,
	[PersonTrackPhoneCode] [varchar](40) NULL,
	[PersonTrackExtensionCode] [varchar](40) NULL,
	[PersonTrackEmailID] [numeric](15, 0) NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[LoftFlag] [numeric](15, 0) NULL,
	[StudioFlag] [numeric](15, 0) NULL,
	[Bedroom1Flag] [numeric](15, 0) NULL,
	[Bedroom2Flag] [numeric](15, 0) NULL,
	[Bedroom3Flag] [numeric](15, 0) NULL,
	[Bedroom4Flag] [numeric](15, 0) NULL,
	[Status] [varchar](2000) NULL,
	[SessionEmailID] [numeric](15, 0) NULL,
	[RespondedFlag] [numeric](1, 0) NULL,
	[PurgeDate] [datetime] NULL,
	[YMDID]  AS (CONVERT([int],CONVERT([varchar](8),[CreateDate],(112)),(0))) PERSISTED
) ON [PRIMARY]

GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [CIDX_FactLeads_YMDID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [CIDX_FactLeads_YMDID] ON [Fact].[Leads]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[Lease_Collection]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[Lease_Collection](
	[YMDID] [int] NULL,
	[LeaseID] [nvarchar](38) NULL,
	[CollectionDate] [datetime] NULL,
	[RenterID] [numeric](15, 0) NULL,
	[SessionEmailID] [numeric](15, 0) NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[PasswordSource] [numeric](2, 0) NULL,
	[SourceID] [numeric](15, 0) NULL,
	[RegDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [ClustIDX_FactLeaseCollection_YMDID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_FactLeaseCollection_YMDID] ON [Fact].[Lease_Collection]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[Lease_DRS]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[Lease_DRS](
	[YMDID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[TerminateDate] [datetime] NULL,
	[DRSID] [numeric](15, 0) NULL,
	[DRSVersionNumber] [numeric](2, 0) NULL,
	[LeaseID] [numeric](15, 0) NULL,
	[DRSDate] [datetime] NULL,
	[DRSStatus] [varchar](2000) NULL,
	[DRS] [varchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [ClustIDX_FactLeaseDRS_YMDID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_FactLeaseDRS_YMDID] ON [Fact].[Lease_DRS]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[Lease_DRS_Perl]    Script Date: 9/5/2017 7:19:03 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[Lease_DRS_Perl](
	[YMDID] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
	[DRSID] [numeric](15, 0) NULL,
	[SubmitterID] [varchar](255) NULL,
	[DisputeReason] [varchar](32) NULL,
	[DisputeDate] [datetime] NULL,
	[ResponseType] [varchar](10) NULL,
	[RefSource] [varchar](32) NULL,
	[RefSourceRent] [numeric](1, 0) NULL,
	[RefLocator] [varchar](255) NULL,
	[RefReferral] [varchar](255) NULL,
	[RefEmployee] [varchar](255) NULL,
	[RefCreditOther] [varchar](255) NULL,
	[RefDocument] [varchar](20) NULL,
	[RefDocumentOther] [numeric](1, 0) NULL,
	[SourcesListed] [numeric](1, 0) NULL,
	[RentOption] [numeric](1, 0) NULL,
	[SourceOption] [numeric](1, 0) NULL,
	[IsBogus] [numeric](1, 0) NULL,
	[IsCosigner] [numeric](1, 0) NULL,
	[InContact] [numeric](1, 0) NULL,
	[StillMoving] [numeric](1, 0) NULL,
	[HaveTimeframe] [numeric](1, 0) NULL,
	[MoveInDate] [datetime] NULL,
	[MovedIn] [numeric](1, 0) NULL,
	[MovedInDiffDay] [numeric](1, 0) NULL,
	[MoveOutDate] [datetime] NULL,
	[AcceptLate] [numeric](1, 0) NULL,
	[OrigRenterName] [varchar](255) NULL,
	[OrigRenterMoveInDate] [datetime2](0) NULL,
	[OrigRenterIsCosigner] [numeric](1, 0) NULL,
	[InvoiceExists] [numeric](1, 0) NULL,
	[InvoicePaid] [numeric](1, 0) NULL,
	[OrigMoveInDate] [datetime2](0) NULL,
	[PropertyResponse] [varchar](20) NULL,
	[CallerName] [varchar](255) NULL,
	[SplitReferral] [numeric](1, 0) NULL,
	[ShowedMercy] [numeric](1, 0) NULL,
	[SentImpressionData] [numeric](1, 0) NULL,
	[LeaseStatus] [varchar](100) NULL,
	[PreviousLeaseStatus] [varchar](100) NULL,
	[Community] [varchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [ClustIDX_FactLeaseDRSPerl_YMDID]    Script Date: 9/5/2017 7:19:03 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_FactLeaseDRSPerl_YMDID] ON [Fact].[Lease_DRS_Perl]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[Sum_Property_Status]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[Sum_Property_Status](
	[YMDID] [int] NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[Date] [datetime] NULL,
	[BusinessModelType] [varchar](40) NULL,
	[Status] [varchar](2000) NULL,
	[CompanyID] [numeric](15, 0) NULL,
	[CompanyName] [varchar](80) NULL,
	[CheckAvailabilityURLName] [varchar](2000) NULL,
	[CompanyStatus] [varchar](80) NULL,
	[Backfilled] [varchar](1) NULL,
	[FirstActivateDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [ClustIDX_FactSumPropertyStatus_YMDID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE CLUSTERED INDEX [ClustIDX_FactSumPropertyStatus_YMDID] ON [Fact].[Sum_Property_Status]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Mart].[AdobeDailyRevenue]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[AdobeDailyRevenue](
	[YMDID] [int] NOT NULL,
	[RevenueDate] [datetime] NOT NULL,
	[RevenueAmt] [money] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[CampaignListingDaily]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[CampaignListingDaily](
	[CampaignKey] [int] NULL,
	[ProfileKey] [smallint] NOT NULL,
	[CampaignBusinessKey] [varchar](20) NOT NULL,
	[DateKey] [int] NOT NULL,
	[RentPropertyID] [varchar](64) NULL,
	[VisitCount] [int] NULL,
	[LeadTagCount] [int] NULL,
	[PhoneTagCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[CampaingListingDailyBaK]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[CampaingListingDailyBaK](
	[CampaignKey] [int] NULL,
	[ProfileKey] [smallint] NOT NULL,
	[CampaignBusinessKey] [varchar](20) NOT NULL,
	[DateKey] [int] NOT NULL,
	[RentPropertyID] [varchar](64) NULL,
	[VisitCount] [int] NULL,
	[LeadTagCount] [int] NULL,
	[PhoneTagCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[CBSADaily]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[CBSADaily](
	[YMDID] [int] NOT NULL,
	[CBSACode] [varchar](50) NULL,
	[CBSAName] [varchar](200) NULL,
	[CBSAType] [varchar](3) NULL,
	[Visits] [int] NULL,
	[DesktopVisits] [int] NULL,
	[MobileVisits] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cidx#YMDID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE CLUSTERED INDEX [cidx#YMDID] ON [Mart].[CBSADaily]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Mart].[CourtesyListings]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[CourtesyListings](
	[YMDID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[StatusID] [int] NOT NULL,
	[UniqueVisits] [int] NOT NULL,
	[ViewsListingPage] [int] NOT NULL,
	[ImprSearchResults] [int] NOT NULL,
	[ImprVisitCount] [int] NOT NULL,
	[ConnectedCalls] [int] NOT NULL,
	[BusyCalls] [int] NOT NULL,
	[MissedCalls] [int] NOT NULL,
	[TollFreePhoneNumber] [varchar](20) NOT NULL,
	[TargetPhoneNumber] [varchar](20) NOT NULL,
 CONSTRAINT [PK_ListingsYMDID] PRIMARY KEY CLUSTERED 
(
	[YMDID] ASC,
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[Invoices]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[Invoices](
	[YMDID] [int] NULL,
	[InvoiceID] [varchar](65) NULL,
	[InvoiceAmount] [money] NULL,
	[Adjustments] [money] NULL,
	[Payments] [money] NULL,
	[AmountDue] [money] NULL,
	[DocDate] [datetime] NULL,
	[DocDateYMDID] [int] NULL,
	[PropertyID] [varchar](65) NULL,
	[PropertyName] [varchar](65) NULL,
	[ContractLeaseID] [varchar](65) NULL,
	[ZuoraInvoiceItemID] [varchar](65) NULL,
	[SFDCContractID] [varchar](65) NULL,
	[ItemCode] [varchar](65) NULL,
	[ALMStatus] [varchar](65) NULL,
	[LeaseID] [varchar](65) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[Listings]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[Listings](
	[YMDID] [int] NOT NULL,
	[YearMonth] [int] NOT NULL,
	[RentPropertyID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[ListingTypeID] [int] NOT NULL,
	[ListingType] [varchar](25) NOT NULL,
	[ListingTypeShort] [varchar](5) NOT NULL,
	[RentStatusID] [tinyint] NOT NULL,
	[ExternalID] [varchar](50) NOT NULL,
	[ExternalPriceCode] [varchar](25) NOT NULL,
	[RentLeaseMgtCoID] [int] NOT NULL,
	[LeaseMgtCoID] [int] NULL,
	[TotalPhotos] [int] NOT NULL,
	[ActivePhotos] [int] NOT NULL,
	[TotalFloorPlans] [int] NOT NULL,
	[ActiveFloorPlans] [int] NOT NULL,
	[TotalAmenities] [int] NOT NULL,
	[ActiveAmenities] [int] NOT NULL,
	[ActiveHDPhotos] [int] NOT NULL,
	[ActiveHDFloorPlans] [int] NOT NULL,
	[ShowPricing] [tinyint] NOT NULL,
	[ShowOfficeHours] [tinyint] NOT NULL,
	[ListingDescriptionLength] [int] NOT NULL,
	[LowPrice] [int] NOT NULL,
	[HighPrice] [int] NOT NULL,
	[UpsellListCoupon] [tinyint] NOT NULL,
	[UpsellPropCallRecording] [tinyint] NOT NULL,
	[UpsellRentListing] [tinyint] NOT NULL,
	[UpsellRentRewardCard] [tinyint] NOT NULL,
	[UpsellRentFeaturedPlacement] [tinyint] NOT NULL,
	[UpsellRentPTE] [tinyint] NOT NULL,
	[UpsellRentVIPPlacement] [tinyint] NOT NULL,
	[UpsellRentNoVacancy] [tinyint] NOT NULL,
	[UpsellRentMetroFL] [tinyint] NOT NULL,
	[UpsellRentSpotlight] [tinyint] NOT NULL,
	[UpsellRentSubscriptionModel] [tinyint] NOT NULL,
	[UpsellListPayPerLeaseALM] [tinyint] NOT NULL,
	[FutureUpsell04] [tinyint] NOT NULL,
	[CR3AvgOverallRating] [numeric](16, 1) NOT NULL,
	[HDActiveFloorPlansFulfilled] [tinyint] NULL,
	[HDActivePhotosFulfilled] [tinyint] NULL,
	[LinkedFloorPlanFulfilled] [tinyint] NULL,
	[Linked3DFloorPlanFulfilled] [tinyint] NULL,
	[LinkedRoomPlannerFulfilled] [tinyint] NULL,
	[MobileDealFulfilled] [tinyint] NULL,
	[CouponActiveOnSite] [tinyint] NOT NULL,
	[LastUpdateYMDID] [int] NOT NULL,
	[LinkedFloorPlan] [int] NOT NULL,
	[Linked3DFloorPlan] [int] NULL,
	[LinkedRoomPlanner] [int] NULL,
	[UniqueVisits] [int] NOT NULL,
	[MapClicks] [int] NOT NULL,
	[ClicksMgtCoWebLink] [int] NOT NULL,
	[FutureClicks01] [int] NOT NULL,
	[FutureClicks02] [int] NOT NULL,
	[FutureClicks03] [int] NOT NULL,
	[FutureClicks04] [int] NOT NULL,
	[FutureClicks05] [int] NOT NULL,
	[ImprSearchResults] [int] NOT NULL,
	[RentConnectedCalls] [int] NOT NULL,
	[RentMissedCalls] [int] NOT NULL,
	[RentOneWebConnectedCalls] [int] NOT NULL,
	[RentOneWebMissedCalls] [int] NOT NULL,
	[RentAltRegConnectedCalls] [int] NOT NULL,
	[RentAltRegMissedCalls] [int] NOT NULL,
	[RentMobileConnectedCalls] [int] NOT NULL,
	[RentMobileMissedCalls] [int] NOT NULL,
	[RentSEMConnectedCalls] [int] NOT NULL,
	[RentSEMMissedCalls] [int] NOT NULL,
	[RentMobileSEMConnectedCalls] [int] NOT NULL,
	[RentMobileSEMMissedCalls] [int] NOT NULL,
	[FutureConnectedCalls03] [int] NOT NULL,
	[FutureMissedCalls03] [int] NOT NULL,
	[RentEmailLeads] [int] NOT NULL,
	[TruliaEmailLeads] [int] NOT NULL,
	[AndroidEmailLeads] [int] NOT NULL,
	[iPadEmailLeads] [int] NOT NULL,
	[iPhoneEmailLeads] [int] NOT NULL,
	[FutureEmailLeads01] [int] NOT NULL,
	[FutureEmailLeads02] [int] NOT NULL,
	[FutureEmailLeads03] [int] NOT NULL,
	[FutureEmailLeads04] [int] NOT NULL,
	[InvoicedLeases] [int] NOT NULL,
	[InternetPhoneLeads]  AS ((((((((((([RentConnectedCalls]+[RentMissedCalls])+[RentAltRegConnectedCalls])+[RentAltRegMissedCalls])+[RentOneWebConnectedCalls])+[RentOneWebMissedCalls])+[RentMobileConnectedCalls])+[RentMobileMissedCalls])+[RentSEMConnectedCalls])+[RentSEMMissedCalls])+[RentMobileSEMConnectedCalls])+[RentMobileSEMMissedCalls]),
	[InternetPhoneLeads_NoMobile]  AS ((((((([RentConnectedCalls]+[RentMissedCalls])+[RentAltRegConnectedCalls])+[RentAltRegMissedCalls])+[RentOneWebConnectedCalls])+[RentOneWebMissedCalls])+[RentSEMConnectedCalls])+[RentSEMMissedCalls]),
	[InternetEmailLeads_NoMobile]  AS ([RentEmailLeads]+[TruliaEmailLeads]),
	[AllInternetLeads_NoMobile]  AS ((((((((([RentConnectedCalls]+[RentMissedCalls])+[RentAltRegConnectedCalls])+[RentAltRegMissedCalls])+[RentOneWebConnectedCalls])+[RentOneWebMissedCalls])+[RentSEMConnectedCalls])+[RentSEMMissedCalls])+[RentEmailLeads])+[TruliaEmailLeads]),
	[DigitalPhoneLeads]  AS ((((((((((([RentConnectedCalls]+[RentMissedCalls])+[RentAltRegConnectedCalls])+[RentAltRegMissedCalls])+[RentOneWebConnectedCalls])+[RentOneWebMissedCalls])+[RentMobileConnectedCalls])+[RentMobileMissedCalls])+[RentSEMConnectedCalls])+[RentSEMMissedCalls])+[RentMobileSEMConnectedCalls])+[RentMobileSEMMissedCalls]),
	[DigitalEmailLeads]  AS (((([RentEmailLeads]+[TruliaEmailLeads])+[AndroidEmailLeads])+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[EmailLeads]  AS (((([RentEmailLeads]+[TruliaEmailLeads])+[AndroidEmailLeads])+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[AllDigitalLeads]  AS (((((((((((((((([RentConnectedCalls]+[RentMissedCalls])+[RentAltRegConnectedCalls])+[RentAltRegMissedCalls])+[RentOneWebConnectedCalls])+[RentOneWebMissedCalls])+[RentMobileConnectedCalls])+[RentMobileMissedCalls])+[RentSEMConnectedCalls])+[RentSEMMissedCalls])+[RentMobileSEMConnectedCalls])+[RentMobileSEMMissedCalls])+[RentEmailLeads])+[TruliaEmailLeads])+[AndroidEmailLeads])+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[MobileCalls]  AS ((([RentMobileConnectedCalls]+[RentMobileMissedCalls])+[RentMobileSEMConnectedCalls])+[RentMobileSEMMissedCalls]),
	[MobileEmails]  AS (([AndroidEmailLeads]+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[MobileAllLeads]  AS (((((([RentMobileConnectedCalls]+[RentMobileMissedCalls])+[RentMobileSEMConnectedCalls])+[RentMobileSEMMissedCalls])+[AndroidEmailLeads])+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[AllLeads]  AS (((((((((((((((([RentConnectedCalls]+[RentMissedCalls])+[RentAltRegConnectedCalls])+[RentAltRegMissedCalls])+[RentOneWebConnectedCalls])+[RentOneWebMissedCalls])+[RentMobileConnectedCalls])+[RentMobileMissedCalls])+[RentSEMConnectedCalls])+[RentSEMMissedCalls])+[RentMobileSEMConnectedCalls])+[RentMobileSEMMissedCalls])+[RentEmailLeads])+[TruliaEmailLeads])+[AndroidEmailLeads])+[iPadEmailLeads])+[iPhoneEmailLeads]),
	[AllMissedCalls]  AS ((((([RentMissedCalls]+[RentAltRegMissedCalls])+[RentOneWebMissedCalls])+[RentMobileMissedCalls])+[RentSEMMissedCalls])+[RentMobileSEMMissedCalls]),
	[AllConnectedCalls]  AS ((((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls])+[RentSEMConnectedCalls])+[RentMobileSEMConnectedCalls]),
	[WebsiteEmails]  AS ([RentEmailLeads]),
	[WebsiteCalls]  AS ((((((((([RentConnectedCalls]+[RentMissedCalls])+[RentAltRegConnectedCalls])+[RentAltRegMissedCalls])+[RentOneWebConnectedCalls])+[RentOneWebMissedCalls])+[RentMobileConnectedCalls])+[RentMobileMissedCalls])+[RentSEMConnectedCalls])+[RentSEMMissedCalls]),
 CONSTRAINT [PK_MartListings_new] PRIMARY KEY CLUSTERED 
(
	[YMDID] ASC,
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[Listings_OLD_20150528]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[Listings_OLD_20150528](
	[YMDID] [int] NOT NULL,
	[YearMonth] [int] NOT NULL,
	[RentPropertyID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[ListingTypeID] [int] NOT NULL,
	[ListingType] [varchar](25) NOT NULL,
	[ListingTypeShort] [varchar](5) NOT NULL,
	[RentStatusID] [tinyint] NOT NULL,
	[ExternalID] [varchar](50) NOT NULL,
	[ExternalPriceCode] [varchar](25) NOT NULL,
	[RentLeaseMgtCoID] [int] NOT NULL,
	[LeaseMgtCoID] [int] NULL,
	[TotalPhotos] [int] NOT NULL,
	[ActivePhotos] [int] NOT NULL,
	[TotalFloorPlans] [int] NOT NULL,
	[ActiveFloorPlans] [int] NOT NULL,
	[TotalAmenities] [int] NOT NULL,
	[ActiveAmenities] [int] NOT NULL,
	[ActiveHDPhotos] [int] NOT NULL,
	[ActiveHDFloorPlans] [int] NOT NULL,
	[ShowPricing] [tinyint] NOT NULL,
	[ShowOfficeHours] [tinyint] NOT NULL,
	[ListingDescriptionLength] [int] NOT NULL,
	[LowPrice] [int] NOT NULL,
	[HighPrice] [int] NOT NULL,
	[UpsellListCoupon] [tinyint] NOT NULL,
	[UpsellPropCallRecording] [tinyint] NOT NULL,
	[UpsellRentListing] [tinyint] NOT NULL,
	[UpsellRentRewardCard] [tinyint] NOT NULL,
	[UpsellRentFeaturedPlacement] [tinyint] NOT NULL,
	[UpsellRentPTE] [tinyint] NOT NULL,
	[UpsellRentVIPPlacement] [tinyint] NOT NULL,
	[UpsellRentNoVacancy] [tinyint] NOT NULL,
	[UpsellRentMetroFL] [tinyint] NOT NULL,
	[UpsellRentSpotlight] [tinyint] NOT NULL,
	[UpsellRentSubscriptionModel] [tinyint] NOT NULL,
	[FutureUpsell03] [tinyint] NOT NULL,
	[FutureUpsell04] [tinyint] NOT NULL,
	[CR3AvgOverallRating] [numeric](16, 1) NOT NULL,
	[HDActiveFloorPlansFulfilled] [tinyint] NULL,
	[HDActivePhotosFulfilled] [tinyint] NULL,
	[LinkedFloorPlanFulfilled] [tinyint] NULL,
	[Linked3DFloorPlanFulfilled] [tinyint] NULL,
	[LinkedRoomPlannerFulfilled] [tinyint] NULL,
	[MobileDealFulfilled] [tinyint] NULL,
	[CouponActiveOnSite] [tinyint] NOT NULL,
	[LastUpdateYMDID] [int] NOT NULL,
	[LinkedFloorPlan] [int] NOT NULL,
	[Linked3DFloorPlan] [int] NULL,
	[LinkedRoomPlanner] [int] NULL,
	[UniqueVisits] [int] NOT NULL,
	[MapClicks] [int] NOT NULL,
	[ClicksMgtCoWebLink] [int] NOT NULL,
	[FutureClicks01] [int] NOT NULL,
	[FutureClicks02] [int] NOT NULL,
	[FutureClicks03] [int] NOT NULL,
	[FutureClicks04] [int] NOT NULL,
	[FutureClicks05] [int] NOT NULL,
	[ImprSearchResults] [int] NOT NULL,
	[RentConnectedCalls] [int] NOT NULL,
	[RentMissedCalls] [int] NOT NULL,
	[RentOneWebConnectedCalls] [int] NOT NULL,
	[RentOneWebMissedCalls] [int] NOT NULL,
	[RentAltRegConnectedCalls] [int] NOT NULL,
	[RentAltRegMissedCalls] [int] NOT NULL,
	[RentMobileConnectedCalls] [int] NOT NULL,
	[RentMobileMissedCalls] [int] NOT NULL,
	[FutureConnectedCalls01] [int] NOT NULL,
	[FutureMissedCalls01] [int] NOT NULL,
	[FutureConnectedCalls02] [int] NOT NULL,
	[FutureMissedCalls02] [int] NOT NULL,
	[FutureConnectedCalls03] [int] NOT NULL,
	[FutureMissedCalls03] [int] NOT NULL,
	[RentEmailLeads] [int] NOT NULL,
	[TruliaEmailLeads] [int] NOT NULL,
	[FutureEmailLeads02] [int] NOT NULL,
	[InvoicedLeases] [int] NOT NULL,
	[InternetPhoneLeads]  AS ((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls]),
	[InternetPhoneLeads_NoMobile]  AS (([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls]),
	[InternetEmailLeads_NoMobile]  AS ([RentEmailLeads]+[TruliaEmailLeads]),
	[AllInternetLeads_NoMobile]  AS (((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentEmailLeads])+[TruliaEmailLeads]),
	[DigitalPhoneLeads]  AS ((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls]),
	[DigitalEmailLeads]  AS ([RentEmailLeads]+[TruliaEmailLeads]),
	[AllDigitalLeads]  AS ((((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls])+[RentEmailLeads])+[TruliaEmailLeads]),
	[MobileCalls]  AS ([RentMobileConnectedCalls]),
	[MobileEmails]  AS ((0)),
	[MobileAllLeads]  AS ([RentMobileConnectedCalls]),
	[AllLeads]  AS ((((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls])+[RentEmailLeads])+[TruliaEmailLeads]),
	[AllMissedCalls]  AS ((([RentMissedCalls]+[RentAltRegMissedCalls])+[RentOneWebMissedCalls])+[RentMobileMissedCalls]),
	[AllConnectedCalls]  AS ((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls]),
	[WebsiteEmails]  AS ([RentEmailLeads]),
	[WebsiteCalls]  AS ((([RentConnectedCalls]+[RentAltRegConnectedCalls])+[RentOneWebConnectedCalls])+[RentMobileConnectedCalls]),
 CONSTRAINT [PK_MartListings] PRIMARY KEY CLUSTERED 
(
	[YMDID] ASC,
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[Listings_TEST]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[Listings_TEST](
	[YMDID] [int] NOT NULL,
	[YearMonth] [int] NOT NULL,
	[RentPropertyID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[ListingTypeID] [int] NOT NULL,
	[ListingType] [varchar](25) NOT NULL,
	[ListingTypeShort] [varchar](5) NOT NULL,
	[RentStatusID] [tinyint] NOT NULL,
	[ExternalID] [varchar](50) NOT NULL,
	[ExternalPriceCode] [varchar](25) NOT NULL,
	[RentLeaseMgtCoID] [int] NOT NULL,
	[LeaseMgtCoID] [int] NULL,
	[TotalPhotos] [int] NOT NULL,
	[ActivePhotos] [int] NOT NULL,
	[TotalFloorPlans] [int] NOT NULL,
	[ActiveFloorPlans] [int] NOT NULL,
	[TotalAmenities] [int] NOT NULL,
	[ActiveAmenities] [int] NOT NULL,
	[ActiveHDPhotos] [int] NOT NULL,
	[ActiveHDFloorPlans] [int] NOT NULL,
	[ShowPricing] [tinyint] NOT NULL,
	[ShowOfficeHours] [tinyint] NOT NULL,
	[ListingDescriptionLength] [int] NOT NULL,
	[LowPrice] [int] NOT NULL,
	[HighPrice] [int] NOT NULL,
	[UpsellListCoupon] [tinyint] NOT NULL,
	[UpsellPropCallRecording] [tinyint] NOT NULL,
	[UpsellRentListing] [tinyint] NOT NULL,
	[UpsellRentRewardCard] [tinyint] NOT NULL,
	[UpsellRentFeaturedPlacement] [tinyint] NOT NULL,
	[UpsellRentPTE] [tinyint] NOT NULL,
	[UpsellRentVIPPlacement] [tinyint] NOT NULL,
	[UpsellRentNoVacancy] [tinyint] NOT NULL,
	[UpsellRentMetroFL] [tinyint] NOT NULL,
	[UpsellRentSpotlight] [tinyint] NOT NULL,
	[UpsellRentSubscriptionModel] [tinyint] NOT NULL,
	[UpsellListPayPerLeaseALM] [tinyint] NOT NULL,
	[FutureUpsell04] [tinyint] NOT NULL,
	[CR3AvgOverallRating] [numeric](16, 1) NOT NULL,
	[HDActiveFloorPlansFulfilled] [tinyint] NULL,
	[HDActivePhotosFulfilled] [tinyint] NULL,
	[LinkedFloorPlanFulfilled] [tinyint] NULL,
	[Linked3DFloorPlanFulfilled] [tinyint] NULL,
	[LinkedRoomPlannerFulfilled] [tinyint] NULL,
	[MobileDealFulfilled] [tinyint] NULL,
	[CouponActiveOnSite] [tinyint] NOT NULL,
	[LastUpdateYMDID] [int] NOT NULL,
	[LinkedFloorPlan] [int] NOT NULL,
	[Linked3DFloorPlan] [int] NULL,
	[LinkedRoomPlanner] [int] NULL,
	[UniqueVisits] [int] NOT NULL,
	[MapClicks] [int] NOT NULL,
	[ClicksMgtCoWebLink] [int] NOT NULL,
	[FutureClicks01] [int] NOT NULL,
	[FutureClicks02] [int] NOT NULL,
	[FutureClicks03] [int] NOT NULL,
	[FutureClicks04] [int] NOT NULL,
	[FutureClicks05] [int] NOT NULL,
	[ImprSearchResults] [int] NOT NULL,
	[RentConnectedCalls] [int] NOT NULL,
	[RentMissedCalls] [int] NOT NULL,
	[RentOneWebConnectedCalls] [int] NOT NULL,
	[RentOneWebMissedCalls] [int] NOT NULL,
	[RentAltRegConnectedCalls] [int] NOT NULL,
	[RentAltRegMissedCalls] [int] NOT NULL,
	[RentMobileConnectedCalls] [int] NOT NULL,
	[RentMobileMissedCalls] [int] NOT NULL,
	[RentSEMConnectedCalls] [int] NOT NULL,
	[RentSEMMissedCalls] [int] NOT NULL,
	[RentMobileSEMConnectedCalls] [int] NOT NULL,
	[RentMobileSEMMissedCalls] [int] NOT NULL,
	[FutureConnectedCalls03] [int] NOT NULL,
	[FutureMissedCalls03] [int] NOT NULL,
	[RentEmailLeads] [int] NOT NULL,
	[TruliaEmailLeads] [int] NOT NULL,
	[AndroidEmailLeads] [int] NOT NULL,
	[iPadEmailLeads] [int] NOT NULL,
	[iPhoneEmailLeads] [int] NOT NULL,
	[FutureEmailLeads01] [int] NOT NULL,
	[FutureEmailLeads02] [int] NOT NULL,
	[FutureEmailLeads03] [int] NOT NULL,
	[FutureEmailLeads04] [int] NOT NULL,
	[InvoicedLeases] [int] NOT NULL,
 CONSTRAINT [PK_TESTMartListings_new] PRIMARY KEY CLUSTERED 
(
	[YMDID] ASC,
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[MDimProperty]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[MDimProperty](
	[YMDID] [int] NULL,
	[RecordCreateDate] [datetime] NULL,
	[PropertyCreateDate] [datetime] NULL,
	[PropertyUpdateDate] [datetime] NULL,
	[PropertyTerminateDate] [datetime] NULL,
	[PropertyID] [int] NOT NULL,
	[UniversalID] [varchar](128) NULL,
	[ExternalID] [varchar](80) NULL,
	[Type] [varchar](80) NULL,
	[TotalUnits] [int] NULL,
	[ActiveUnitsAmount] [int] NULL,
	[UpsellListSeniorListing] [int] NULL,
	[TotalAmenities] [int] NULL,
	[ActiveAmenities] [int] NULL,
	[TotalPhotos] [int] NULL,
	[ActivePhotos] [int] NULL,
	[TotalFloorPlans] [int] NULL,
	[ActiveFloorPlans] [int] NULL,
	[UpsellPropRentalsFeatured] [int] NULL,
	[UpsellListFloorPlanUpgrade] [int] NULL,
	[UpsellListPayPerLead] [int] NULL,
	[ISRentalPropToBeDeleted] [int] NULL,
	[ListingStatusID] [varchar](80) NULL,
	[UpsellListHighlighted] [int] NULL,
	[UpsellListCoupon] [int] NULL,
	[UpsellPropEmerical] [int] NULL,
	[UpsellPropFeatureCommPlatinum] [int] NULL,
	[UpsellPropFeatureCommGold] [int] NULL,
	[UpsellPropFeatureCommSilver] [int] NULL,
	[UpsellPropVirtualBrochure] [int] NULL,
	[UpsellListCorporateListing] [int] NULL,
	[UpsellListCollegeListing] [int] NULL,
	[UpsellListMilitaryListing] [int] NULL,
	[UpsellListApartmentListing] [int] NULL,
	[UpsellPropPhotoUpgrade] [int] NULL,
	[UpsellMgmtCoLogoDisplay] [int] NULL,
	[UpsellPropLogoDisplay] [int] NULL,
	[UpsellPropPremiumUpgrade] [int] NULL,
	[UpsellPropVideoSpokesModel] [int] NULL,
	[UpsellPropFrontPage] [int] NULL,
	[UpsellPropSpanish] [int] NULL,
	[UpsellPropCallRecording] [int] NULL,
	[UpsellPropFromToPhone] [int] NULL,
	[UpsellPropRentalsPremier] [int] NULL,
	[UpsellPropRentalsListing] [int] NULL,
	[UpsellListRentalsSpotlighted] [int] NULL,
	[UpsellListSpotlight] [int] NULL,
	[UpsellListPayPerLease] [int] NULL,
	[UpsellListDiamondCity] [int] NULL,
	[UpsellListDiamondMax] [int] NULL,
	[UpsellListRentalsStandard] [int] NULL,
	[UpsellListCommunityCarousel] [int] NULL,
	[UpsellList30SecondVideo] [int] NULL,
	[UpsellList60SecondVideo] [int] NULL,
	[UpsellListRentalsCarousel] [int] NULL,
	[UpsellListRentalsStandardPlus] [int] NULL,
	[UpsellListMobileSpotlight] [int] NULL,
	[UpsellPropMobileDeal] [int] NULL,
	[UpsellPropDynamicLeadForm] [int] NULL,
	[UpsellListIncomeRestricted] [int] NULL,
	[UpsellListPetFriendly] [int] NULL,
	[UpsellListLuxuryCommunity] [int] NULL,
	[UpsellPropRepmon] [int] NULL,
	[UpsellPropSocialMediaMan] [int] NULL,
	[FutureUpsell03] [int] NULL,
	[FutureUpsell04] [int] NULL,
	[FutureUpsell05] [int] NULL,
	[FutureUpsell06] [int] NULL,
	[FutureUpsell07] [int] NULL,
	[FutureUpsell08] [int] NULL,
	[LowPrice] [numeric](15, 2) NULL,
	[Highprice] [numeric](15, 2) NULL,
	[ISSem] [int] NULL,
	[ISOverThreshold] [int] NULL,
	[CallTrackingInBook] [int] NULL,
	[CouponActiveOnSite] [int] NULL,
	[VerizonFios] [int] NULL,
	[ATTUverse] [int] NULL,
	[DirectTV] [int] NULL,
	[BrightHouse] [int] NULL,
	[Charter] [int] NULL,
	[Xfinitysp] [int] NULL,
	[Xfinitydp] [int] NULL,
	[Xfinitytp] [int] NULL,
	[TimeWarner] [int] NULL,
	[NumericRank] [int] NULL,
	[UniqueVisits_FL] [int] NULL,
	[UniqueVisits_PTE] [int] NULL,
	[UniqueVisits_None] [int] NULL,
	[UniqueVisits_Mobile] [int] NULL,
	[UniqueVisits_VIP] [int] NULL,
	[UniqueVisits_ForFutureUse2] [int] NULL,
	[UniqueVisits_ForFutureUse3] [int] NULL,
	[UniqueVisits_ForFutureUse4] [int] NULL,
	[UniqueVisits_ForFutureUse5] [int] NULL,
	[ViewsListingPage] [int] NULL,
	[ViewsListingPage_Mobile] [int] NULL,
	[ViewsListingPage_ForFutureUse1] [int] NULL,
	[ViewsListingPage_ForFutureUse2] [int] NULL,
	[ViewsListingPage_ForFutureUse3] [int] NULL,
	[ViewsListingPage_ForFutureUse4] [int] NULL,
	[ViewsListingPage_ForFutureUse5] [int] NULL,
	[ViewsEmercial] [int] NULL,
	[ViewsVirtualBrochure] [int] NULL,
	[ClicksSpotlightListing] [int] NULL,
	[ClicksSpotlightCommunityVideo] [int] NULL,
	[ClicksListingWebLink] [int] NULL,
	[ClicksMgtcoWebLink] [int] NULL,
	[ClicksOnlineAppt] [int] NULL,
	[ClicksOnlineApptSubmit] [int] NULL,
	[ClicksOnlineAppl] [int] NULL,
	[ClicksOnlineApplSubmit] [int] NULL,
	[ClicksOnlineApptCR] [int] NULL,
	[ClicksOnlineApplCR] [int] NULL,
	[ClicksSpotlightLeadSubmission] [int] NULL,
	[ClicksWeCanCallYou] [int] NULL,
	[ClicksLeadSubmission] [int] NULL,
	[ClicksPhoneSubmission] [int] NULL,
	[ClicksCommunityVideo] [int] NULL,
	[ClicksListingMap] [int] NULL,
	[ClicksMapDirections] [int] NULL,
	[ClicksPrintableGuide] [int] NULL,
	[ClicksPhotos] [int] NULL,
	[ClicksSpotlightPhotos] [int] NULL,
	[ClicksSpotlightPhotoPopup] [int] NULL,
	[ClicksFloorPlan] [int] NULL,
	[ClicksCheckYourCredit] [int] NULL,
	[ClicksWebBuilderLink] [int] NULL,
	[ClicksFeaturedMgtCo] [int] NULL,
	[ClicksFrontPagePropLead] [int] NULL,
	[ClicksLuxurySlideShow] [int] NULL,
	[ImprSearchResults] [int] NULL,
	[TotalImpressions] [int] NULL,
	[ImpreFrontCover] [int] NULL,
	[ImprVisitCount] [int] NULL,
	[ViewingFromEmail] [int] NULL,
	[TotalViewings] [int] NULL,
	[TextMsgWeb] [int] NULL,
	[TextMsgMobile] [int] NULL,
	[CheckListingAvail] [int] NULL,
	[ChecksSpotLightListingAvail] [int] NULL,
	[ChecksVirtualtourListingAvail] [int] NULL,
	[AgcPrintConnectedCalls] [int] NULL,
	[AgcPrintMissedCalls] [int] NULL,
	[AsgPrintConnectedCalls] [int] NULL,
	[AsgPrintMissedCalls] [int] NULL,
	[WebConnectedCalls] [int] NULL,
	[WebMissedCalls] [int] NULL,
	[RentalsConnectedCalls] [int] NULL,
	[RentalsMissedCalls] [int] NULL,
	[CTCConnectedCalls] [int] NULL,
	[CTCMissedCalls] [int] NULL,
	[PaidSPConnectedCalls] [int] NULL,
	[PaidSPMissedCalls] [int] NULL,
	[CombinedFeedsConnectedCalls] [int] NULL,
	[CombinedFeedsMissedCalls] [int] NULL,
	[GoogleConnectedCalls] [int] NULL,
	[GoogleMissedCalls] [int] NULL,
	[PPCConnectedCalls] [int] NULL,
	[PPCMissedCalls] [int] NULL,
	[LuxuryConnectedCalls] [int] NULL,
	[LuxuryMissedCalls] [int] NULL,
	[MarchexConnectedCalls] [int] NULL,
	[MarchexMissedCalls] [int] NULL,
	[CraigsListConnectedCalls] [int] NULL,
	[CraigsListMissedCalls] [int] NULL,
	[WebLocalTrackingNumberConnectedCalls] [int] NULL,
	[WebLocalTrackingNumberMissedCalls] [int] NULL,
	[RentalsLocalConnectedCalls] [int] NULL,
	[RentalsLocalMissedCalls] [int] NULL,
	[VideoConnectedCalls] [int] NULL,
	[VideoMissedCalls] [int] NULL,
	[SEMConnectedCalls] [int] NULL,
	[SEMMissedCalls] [int] NULL,
	[TruliaConnectedCalls] [int] NULL,
	[TruliaMissedCalls] [int] NULL,
	[FutureConnectedCalls01] [int] NULL,
	[FutureMissedCalls01] [int] NULL,
	[FutureConnectedCalls02] [int] NULL,
	[FutureMissedCalls02] [int] NULL,
	[FutureConnectedCalls03] [int] NULL,
	[FutureMissedCalls03] [int] NULL,
	[FutureConnectedCalls04] [int] NULL,
	[FutureMissedCalls04] [int] NULL,
	[FutureConnectedCalls05] [int] NULL,
	[FutureMissedCalls05] [int] NULL,
	[FutureConnectedCalls06] [int] NULL,
	[FutureMissedCalls06] [int] NULL,
	[FutureConnectedCalls07] [int] NULL,
	[FutureMissedCalls07] [int] NULL,
	[FutureConnectedCalls08] [int] NULL,
	[FutureMissedCalls08] [int] NULL,
	[FutureConnectedCalls09] [int] NULL,
	[FutureMissedCalls09] [int] NULL,
	[FutureConnectedCalls10] [int] NULL,
	[FutureMissedCalls10] [int] NULL,
	[AGEmailLeads] [int] NULL,
	[MetroEmailLeads] [int] NULL,
	[NeighborhoodEmailLeads] [int] NULL,
	[AIMCOEmailLeads] [int] NULL,
	[RentalsEmailLeads] [int] NULL,
	[RentarEmailLeads] [int] NULL,
	[RentalHousesEmailLeads] [int] NULL,
	[iPhoneEmailLeads] [int] NULL,
	[OodleEmailLeads] [int] NULL,
	[AndroidEmailLeads] [int] NULL,
	[HotpadsEmailLeads] [int] NULL,
	[LuxuryEmailLeads] [int] NULL,
	[CondoEmailLeads] [int] NULL,
	[iPadEmailLeads] [int] NULL,
	[TruliaEmailLeads] [int] NULL,
	[ZillowEmailLeads] [int] NULL,
	[VerticalbrandsEmailLeads] [int] NULL,
	[RDTFeedLeads] [int] NULL,
	[PropSolutionsFeedLeads] [int] NULL,
	[YieldFeedLeads] [int] NULL,
	[AGMobileEmailLeads] [int] NULL,
	[RentalsMobileEmailLeads] [int] NULL,
	[RentalsAndroidEmailLeads] [int] NULL,
	[RentalsiPhoneEmailLeads] [int] NULL,
	[VastEmailLeads] [int] NULL,
	[CampusHomesOnlineEmailLeads] [int] NULL,
	[AGTabletEmailLeads] [int] NULL,
	[AGKindleEmailLeads] [int] NULL,
	[Future1EmailLeads] [int] NULL,
	[Future2EmailLeads] [int] NULL,
	[Future3EmailLeads] [int] NULL,
	[Future4EmailLeads] [int] NULL,
	[Future5EmailLeads] [int] NULL,
	[Future6EmailLeads] [int] NULL,
	[Future7EmailLeads] [int] NULL,
	[Future8EmailLeads] [int] NULL,
	[Future9EmailLeads] [int] NULL,
	[Future0EmailLeads] [int] NULL,
	[PlacementTier] [int] NULL,
	[PrintProductPoints] [int] NULL,
	[InternetProductPoints] [int] NULL,
	[LegacyLoyaltyPoints] [int] NULL,
	[ContractLoyaltyPoints] [int] NULL,
	[LastUpdateYMDID] [int] NULL,
	[UpsellListBold] [int] NULL,
	[UpsellListFrontCover] [int] NULL,
	[UpsellPropPhotoFeature] [int] NULL,
	[UpsellMgmtManagementCoLogo] [int] NULL,
	[UpsellPropPropertyLogo] [int] NULL,
	[UpsellPropPremiumPackage] [int] NULL,
	[UpsellListFloorPlanPkg] [int] NULL,
	[LinkedFloorPlan] [int] NULL,
	[InternetPhoneLeads] [int] NULL,
	[InternetPhoneLeads_NoMobile] [int] NULL,
	[DigitalPhoneLeads] [int] NULL,
	[EmailLeads] [int] NULL,
	[InternetEmailLeads_NoMobile] [int] NULL,
	[DigitalEmailLeads] [int] NULL,
	[AGCMissedCalls] [int] NULL,
	[ASGMissedCalls] [int] NULL,
	[AGCAllLeads] [int] NULL,
	[ASGAllLeads] [int] NULL,
	[AllMissedCalls] [int] NULL,
	[AllConnectedCalls] [int] NULL,
	[AllLeads] [int] NULL,
	[AllInternetLeads_NoMobile] [int] NULL,
	[AllDigitalLeads] [int] NULL,
	[ThirdPartyFeedLeads] [int] NULL,
	[WebsiteCalls] [int] NULL,
	[WebsiteEmails] [int] NULL,
	[WebsiteLeads_Rentals] [int] NULL,
	[MobileEmails] [int] NULL,
	[MobileCalls] [int] NULL,
	[MobileLeads_AG] [int] NULL,
	[MobileLeads_Rentals] [int] NULL,
	[MobileAllLeads] [int] NULL,
	[MRSyndicationEmailLeads] [int] NULL,
	[MRAGEmailLeads] [int] NULL,
	[MRAGWebPhoneLeads] [int] NULL,
	[MRAppsEmailLeads] [int] NULL,
	[MRPhonecalls] [int] NULL,
	[RPLRank] [int] NULL,
	[PropertyName] [varchar](80) NULL,
	[MarketName] [varchar](80) NULL,
	[CityName] [varchar](80) NULL,
	[State] [varchar](80) NULL,
	[SearchRank] [int] NULL,
	[PageInSearch] [int] NULL,
	[UpgradeType] [varchar](80) NULL,
	[UpgradeMonthlyCost] [numeric](10, 2) NULL,
	[UpgradeStartDate] [datetime] NULL,
	[UpgradeEndDate] [datetime] NULL,
	[NaturalImpressions] [int] NULL,
	[FeaturedImpressions] [int] NULL,
	[NaturalViewings] [int] NULL,
	[FeaturedViewings] [int] NULL,
	[NaturalHotLeads] [int] NULL,
	[FeaturedHotLeads] [int] NULL,
	[TotalPhoneCall] [int] NULL,
	[NaturalPhoneCalls] [int] NULL,
	[FeaturedPhoneCalls] [int] NULL,
	[TotalHotlead] [int] NULL,
	[NaturalNRL] [int] NULL,
	[FeaturedNRL] [int] NULL,
	[TotalLeases] [int] NULL,
	[MarketNumber] [int] NULL,
	[PaidLeases] [int] NULL,
	[AvgCallDuration] [numeric](10, 2) NULL,
	[CompanyName] [varchar](80) NULL,
	[CompanyID] [int] NULL,
	[SuccessFee] [numeric](10, 2) NULL,
	[VIPImpressions] [int] NULL,
	[VIPViewings] [int] NULL,
	[VIPHotLeads] [int] NULL,
	[VIPPhoneCalls] [int] NULL,
	[VIPNRL] [int] NULL,
	[PTEImpressions] [int] NULL,
	[PTEViewings] [int] NULL,
	[PTEHotLeads] [int] NULL,
	[PTEPhonecalls] [int] NULL,
	[PTENRL] [int] NULL,
	[PropertyStatus] [varchar](80) NULL,
	[Phone] [varchar](80) NULL,
	[PropertyAddress] [varchar](80) NULL,
	[Fax] [varchar](80) NULL,
	[Email] [varchar](80) NULL,
	[HotLeadEmailID] [varchar](80) NULL,
	[HotLeadFaxID] [varchar](80) NULL,
	[UniqueHotLeads] [int] NULL,
	[UniqueViewings] [int] NULL,
	[UniquePDPOverviews] [int] NULL,
	[BillingAddress] [varchar](80) NULL,
	[BillingCity] [varchar](80) NULL,
	[BillingState] [varchar](40) NULL,
	[BillingZip] [varchar](40) NULL,
	[BillingEmail] [varchar](80) NULL,
	[BillingPhone] [varchar](40) NULL,
	[BillingFax] [varchar](40) NULL,
	[LeaseFaxed] [varchar](80) NULL,
	[LeaseEmailed] [varchar](80) NULL,
	[SubmarketNumber] [int] NULL,
	[SubmarketName] [varchar](80) NULL,
	[AreaName] [varchar](80) NULL,
	[ImageIncluded] [varchar](1) NULL,
	[Specials] [varchar](80) NULL,
	[MainImageAvailable] [varchar](1) NULL,
	[FloorPlanAvailable] [varchar](1) NULL,
	[LogoAvailable] [varchar](1) NULL,
	[LastVirtualUpload] [varchar](80) NULL,
	[Searchable] [varchar](1) NULL,
	[UniqueHotLeaders] [int] NULL,
	[NaturalSearchers] [int] NULL,
	[FeaturedSearchers] [int] NULL,
	[NaturalViewers] [int] NULL,
	[FeaturedViewers] [int] NULL,
	[NaturalHotLeaders] [int] NULL,
	[FeaturedHotLeaders] [int] NULL,
	[TotalHotLeaders] [int] NULL,
	[TotalPhoneCallers] [int] NULL,
	[FeaturedPhoneCallers] [int] NULL,
	[NaturalPhoneCallers] [int] NULL,
	[BusinessModelType] [varchar](40) NULL,
	[ActivateDate] [date] NULL,
	[ConnectedCalls] [int] NULL,
	[MissedCalls] [int] NULL,
	[OneWebConnectedCalls ] [int] NULL,
	[OneWebMissedCalls] [int] NULL,
	[AltRegConnectedCalls] [int] NULL,
	[AltRegMissedCalls] [int] NULL,
	[MobileConnectedCalls] [int] NULL,
	[MobileMissedCalls] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[PersonExpansion]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[PersonExpansion](
	[ymdid] [int] NULL,
	[visitorkey] [int] NULL,
	[visitor] [varchar](256) NULL,
	[personid] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[PersonListingEventCount]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[PersonListingEventCount](
	[ymdid] [int] NOT NULL,
	[Shadow] [int] NOT NULL,
	[personid] [varchar](50) NULL,
	[listingid] [varchar](64) NULL,
	[EventCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[PersonVisitorEFID]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[PersonVisitorEFID](
	[YMDID] [int] NULL,
	[Visitor] [varchar](2000) NULL,
	[PersonID] [varchar](2000) NULL,
	[EF_ID] [varchar](2000) NULL,
	[SEO] [int] NULL,
	[SEM] [int] NULL,
	[Direct] [int] NULL,
	[Other] [int] NULL,
	[Mobile] [int] NULL,
	[Desktop] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[PersonVisitorEFID_Clicks]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[PersonVisitorEFID_Clicks](
	[YMDID] [int] NULL,
	[Visitor] [varchar](2000) NULL,
	[PersonID] [varchar](2000) NULL,
	[EF_ID] [varchar](2000) NULL,
	[SEO] [int] NULL,
	[SEM] [int] NULL,
	[Direct] [int] NULL,
	[Other] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[Propertylistings]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[Propertylistings](
	[YMDID] [int] NULL,
	[YearMonth] [int] NULL,
	[PropertyID] [int] NULL,
	[Propertytype] [varchar](50) NULL,
	[AccountID] [int] NULL,
	[ExternalID] [varchar](50) NULL,
	[StatusID] [int] NULL,
	[StatusDesc] [varchar](128) NULL,
	[TerminateDate] [date] NULL,
	[MLS] [varchar](50) NULL,
	[SalesRepPersonID] [int] NULL,
	[CheckAvailabilityURL] [varchar](255) NULL,
	[MarketID] [int] NULL,
	[MarketName] [varchar](50) NULL,
	[SubMarketID] [int] NULL,
	[SubMarketName] [varchar](50) NULL,
	[AreaID] [int] NULL,
	[AreaName] [varchar](100) NULL,
	[BusinessmodelType] [varchar](10) NULL,
	[PropertyTotalUnits] [int] NULL,
	[TotalPhotos] [int] NULL,
	[ActivePhotos] [int] NULL,
	[TotalFloorPlans] [int] NULL,
	[ActiveFloorPlans] [int] NULL,
	[ActiveAmenities] [int] NULL,
	[TotalLogos] [int] NULL,
	[ActiveLogos] [int] NULL,
	[MinRentLoft] [int] NULL,
	[MaxRentLoft] [int] NULL,
	[MinRent0Bed] [int] NULL,
	[MaxRent0Bed] [int] NULL,
	[MinRent1Bed] [int] NULL,
	[MaxRent1Bed] [int] NULL,
	[MinRent2Bed] [int] NULL,
	[MaxRent2Bed] [int] NULL,
	[MinRent3Bed] [int] NULL,
	[MaxRent3Bed] [int] NULL,
	[MinRent4Bed] [int] NULL,
	[MaxRent4Bed] [int] NULL,
	[UpsellFeaturedListing] [int] NULL,
	[UpsellPTEListing] [int] NULL,
	[SeniorHousing] [int] NULL,
	[LowIncomeHousing] [int] NULL,
	[Furnished] [int] NULL,
	[NRL] [int] NULL,
	[PaidLease] [int] NULL,
	[InvoicedLeases] [int] NULL,
	[WrittenOff] [int] NULL,
	[RewardCardPay] [int] NULL,
	[Disputes] [int] NULL,
	[TotalGrossLeases] [decimal](10, 2) NULL,
	[TotalNetLeases] [decimal](10, 2) NULL,
	[EmailLeads] [int] NULL,
	[UniqueLeads] [int] NULL,
	[UniqueViewings] [int] NULL,
	[Viewings] [int] NULL,
	[Impressions] [int] NULL,
	[UniqueImpressions] [int] NULL,
	[Revenue] [decimal](10, 2) NULL,
	[DiscountAmount] [decimal](10, 2) NULL,
	[FlatFeeAmount] [decimal](10, 2) NULL,
	[WebConnectedCalls] [int] NULL,
	[WebBusyCalls] [int] NULL,
	[WebMissedCalls] [int] NULL,
	[WebUnknownNB] [int] NULL,
	[CreateDate] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[PropertyScore]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[PropertyScore](
	[YMDID] [int] NOT NULL,
	[RentBusinessModel] [varchar](25) NULL,
	[ListingID] [int] NOT NULL,
	[AGPropertyID] [int] NOT NULL,
	[RentPropertyID] [int] NULL,
	[CBSACode] [varchar](50) NOT NULL,
	[CBSAName] [varchar](200) NOT NULL,
	[PropertyCity] [varchar](200) NOT NULL,
	[PropertyState] [varchar](10) NOT NULL,
	[DimensionUnitCount] [int] NULL,
	[SFDCUnitCount] [int] NULL,
	[FinalUnitCount] [int] NULL,
	[LeadsToQuitLowLeads] [int] NOT NULL,
	[QuitLowLeadsDist] [decimal](17, 2) NOT NULL,
	[PropertyScore] [numeric](30, 14) NOT NULL,
	[PropertyAge] [int] NOT NULL,
	[ImageMain] [int] NOT NULL,
	[ImagePhoto] [int] NOT NULL,
	[ImageFloorPlan] [int] NOT NULL,
	[RentEmailLeads] [int] NOT NULL,
	[RentEmail_30] [int] NOT NULL,
	[RentEmail_90] [int] NOT NULL,
	[RentConnectedCalls] [int] NOT NULL,
	[RentConnectedCalls_30] [int] NOT NULL,
	[RentConnectedCalls_90] [int] NOT NULL,
	[RentImprSearchResults] [int] NOT NULL,
	[IMP_180_30] [int] NOT NULL,
	[IMP_30_0] [int] NOT NULL,
	[WillingToPay] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[YMDID] ASC,
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[RevenueFeedBase]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[RevenueFeedBase](
	[YMDID] [int] NOT NULL,
	[Visitor] [varchar](255) NULL,
	[EF_ID] [varchar](255) NULL,
	[Person] [varchar](255) NULL,
	[EventDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[RevenueFeedBase_Registered_VISITOR]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[RevenueFeedBase_Registered_VISITOR](
	[YMDID] [int] NULL,
	[Visitor] [varchar](255) NULL,
	[Visit] [varchar](255) NULL,
	[VisitDateTime] [datetime] NULL,
	[VisitEventKey] [int] NULL,
	[PersonID] [varchar](255) NULL,
	[EFID] [varchar](2000) NULL,
	[FirstPersonFlag] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[RevenueFeedBase_temp]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[RevenueFeedBase_temp](
	[YMDID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[Visitor] [varchar](255) NULL,
	[Visit] [varchar](255) NULL,
	[EF_ID] [varchar](255) NULL,
	[Person] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Mart].[RewardCards]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Mart].[RewardCards](
	[YMDID] [int] NULL,
	[RewardCardID] [int] NULL,
	[PropertyID] [int] NULL,
	[LeaseID] [int] NULL,
	[RenterID] [int] NULL,
	[Amount] [money] NULL,
	[RewardCardStatusDesc] [varchar](80) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Reports].[rpt_lease_match_t]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Reports].[rpt_lease_match_t](
	[LEADID] [varchar](50) NULL,
	[MGTCOID] [int] NULL,
	[MGTCONAME] [varchar](80) NULL,
	[LISTINGID] [int] NULL,
	[PROPERTYID] [int] NULL,
	[CLIENTID] [varchar](50) NULL,
	[PROPERTYNAME] [varchar](80) NULL,
	[PROPERTYCITY] [varchar](80) NULL,
	[PROPERTYSTATE] [nvarchar](50) NULL,
	[FIRSTNAME] [varchar](100) NULL,
	[LASTNAME] [varchar](100) NULL,
	[FULLNAME] [varchar](200) NULL,
	[ISCOMPANY] [varchar](384) NULL,
	[CONTACTMETHOD] [varchar](50) NULL,
	[LEADSOURCE] [varchar](50) NULL,
	[CONTACTDATE] [datetime] NULL,
	[ESTCONTACTDATE] [datetime] NULL,
	[EMAIL] [varchar](80) NULL,
	[PHONE] [varchar](4000) NULL,
	[ISPAYPERLEASE] [varchar](384) NULL,
	[REVERSELOOKUPSOURCE] [varchar](50) NULL,
	[WHEN_ENTERED] [datetime] NULL,
	[LEADADDRESS1] [varchar](255) NULL,
	[LEADADDRESS2] [varchar](80) NULL,
	[LEADCITY] [varchar](80) NULL,
	[LEADSTATE] [varchar](50) NULL,
	[LEADZIP] [varchar](50) NULL,
	[LEADMOVEMONTH] [varchar](50) NULL,
	[STATUS] [varchar](384) NULL,
	[CHANNEL] [varchar](384) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AGRentProducts_SG_DELETE_20150806]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AGRentProducts_SG_DELETE_20150806](
	[ItemID] [varchar](40) NOT NULL,
	[ItemDescription] [varchar](100) NULL,
	[Combo] [char](1) NULL,
	[EasyPay] [char](1) NULL,
	[Upsell] [char](1) NULL,
	[RentSubscription] [char](1) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[CallLoaderRentCom]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CallLoaderRentCom](
	[CallID] [nvarchar](255) NULL,
	[RentPropertyID] [int] NULL,
	[PropertyID] [int] NULL,
	[ListingID] [int] NULL,
	[BusinessModel] [nvarchar](255) NULL,
	[YMDID] [int] NULL,
	[TimeInitiated] [datetime] NULL,
	[DurationInSeconds] [int] NULL,
	[TollFreeNumber] [nvarchar](255) NULL,
	[PropertyNumber] [nvarchar](255) NULL,
	[UserTelephoneNumber] [nvarchar](255) NULL,
	[CallerName] [nvarchar](255) NULL,
	[CallerLocation] [nvarchar](255) NULL,
	[CallerAddress] [nvarchar](255) NULL,
	[CallerCity] [nvarchar](255) NULL,
	[CallerState] [nvarchar](255) NULL,
	[CallerZip] [nvarchar](255) NULL,
	[Var2] [nvarchar](255) NULL,
	[LinkName] [nvarchar](255) NULL,
	[LinkID] [nvarchar](255) NULL,
	[ListenURL] [nvarchar](255) NULL,
	[AudioURL] [nvarchar](255) NULL,
	[CallerURL] [nvarchar](255) NULL,
	[ReceiverURL] [nvarchar](255) NULL,
	[MP3URL] [nvarchar](255) NULL,
	[CallLoadHour] [tinyint] NULL,
	[CallLoadYMDID] [int] NULL,
	[CallSource] [nvarchar](50) NULL,
	[CallStatus] [tinyint] NULL,
	[AudioDuration] [int] NULL,
	[CallerTrimBeginning] [int] NULL,
	[CallerTrimAll] [int] NULL,
	[CallerURLTrimSilence] [nvarchar](255) NULL,
	[Population] [nvarchar](255) NULL,
	[AvgTravelTimeToWork] [nvarchar](255) NULL,
	[MedianHouseholdIncome] [nvarchar](255) NULL,
	[PerCapitaIncome] [nvarchar](255) NULL,
	[MedianEarnings] [nvarchar](255) NULL,
	[MedianContractRent] [nvarchar](255) NULL,
	[MedianRentAsked] [nvarchar](255) NULL,
	[MedianGrossRent] [nvarchar](255) NULL,
	[MedianPriceAsked] [nvarchar](255) NULL,
	[MedianRealEstateTaxes] [nvarchar](255) NULL,
	[Households] [nvarchar](255) NULL,
	[OwnerHouseholds] [nvarchar](255) NULL,
	[RenterHouseholds] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[directmatches]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[directmatches](
	[MatchValue] [varchar](80) NULL,
	[RenterID] [numeric](15, 0) NULL,
	[Expansion] [int] NOT NULL,
	[leaseID] [numeric](15, 0) NOT NULL,
	[LeadID] [varchar](100) NULL,
	[ContactMethod] [varchar](40) NULL,
	[MatchType] [varchar](5) NOT NULL,
	[LeadDate] [datetime] NULL,
	[LeaseDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[ExactTarget_PTE]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ExactTarget_PTE](
	[ListingID] [int] NULL,
	[PropertyID] [int] NULL,
	[EmailName] [varchar](100) NULL,
	[YMDID] [int] NULL,
	[PTE] [varchar](50) NULL,
	[SendCount] [int] NULL,
	[DeliveredCount] [int] NULL,
	[Opens] [int] NULL,
	[Clicks] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[FactLeadMessageCalls]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[FactLeadMessageCalls](
	[CallID] [nvarchar](255) NULL,
	[RentPropertyID] [nvarchar](255) NULL,
	[PropertyID] [nvarchar](255) NULL,
	[ListingID] [nvarchar](255) NULL,
	[BusinessModel] [nvarchar](255) NULL,
	[YMDID] [int] NULL,
	[TimeInitiated] [datetime] NULL,
	[DurationInSeconds] [int] NULL,
	[TollFreeNumber] [nvarchar](255) NULL,
	[PropertyNumber] [nvarchar](255) NULL,
	[UserTelephoneNumber] [nvarchar](255) NULL,
	[CallerName] [nvarchar](255) NULL,
	[CallerLocation] [nvarchar](255) NULL,
	[CallerAddress] [nvarchar](255) NULL,
	[CallerCity] [nvarchar](255) NULL,
	[CallerState] [nvarchar](255) NULL,
	[CallerZip] [nvarchar](255) NULL,
	[Var2] [nvarchar](255) NULL,
	[LinkName] [nvarchar](255) NULL,
	[LinkID] [nvarchar](255) NULL,
	[ListenURL] [nvarchar](255) NULL,
	[AudioURL] [nvarchar](255) NULL,
	[CallerURL] [nvarchar](255) NULL,
	[ReceiverURL] [nvarchar](255) NULL,
	[MP3URL] [nvarchar](255) NULL,
	[CallLoadHour] [tinyint] NULL,
	[CallLoadYMDID] [int] NULL,
	[CallSource] [nvarchar](50) NULL,
	[CallStatus] [tinyint] NULL,
	[AudioDuration] [int] NULL,
	[CallerTrimBeginning] [int] NULL,
	[CallerTrimAll] [int] NULL,
	[CallerURLTrimSilence] [nvarchar](255) NULL,
	[Population] [nvarchar](255) NULL,
	[AvgTravelTimeToWork] [nvarchar](255) NULL,
	[MedianHouseholdIncome] [nvarchar](255) NULL,
	[PerCapitaIncome] [nvarchar](255) NULL,
	[MedianEarnings] [nvarchar](255) NULL,
	[MedianContractRent] [nvarchar](255) NULL,
	[MedianRentAsked] [nvarchar](255) NULL,
	[MedianGrossRent] [nvarchar](255) NULL,
	[MedianPriceAsked] [nvarchar](255) NULL,
	[MedianRealEstateTaxes] [nvarchar](255) NULL,
	[Households] [nvarchar](255) NULL,
	[OwnerHouseholds] [nvarchar](255) NULL,
	[RenterHouseholds] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[fct_call_detail_records_t]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[fct_call_detail_records_t](
	[PROPERTY_ID] [numeric](15, 0) NULL,
	[CALL_DETAIL_RECORD_ID] [binary](16) NULL,
	[SOURCE_TYPE] [varchar](10) NULL,
	[CALLER_PHONE_NUMBER] [numeric](11, 0) NULL,
	[CALLED_PHONE_NUMBER] [numeric](11, 0) NULL,
	[FINAL_DEST_PHONE_NUMBER] [numeric](11, 0) NULL,
	[DATE_CALL_STARTED] [datetime] NULL,
	[DATE_CALL_ENDED] [datetime] NULL,
	[CALL_DURATION] [numeric](15, 0) NULL,
	[CALL_STATUS_ID] [numeric](1, 0) NULL,
	[TELEPHONY_VENDOR_NAME_ID] [numeric](15, 0) NULL,
	[RECORDING_URL] [varchar](2000) NULL,
	[RECORDING_DURATION] [numeric](15, 0) NULL,
	[CALLER_RECORDING_URL] [varchar](2000) NULL,
	[CALLED_RECORDING_URL] [varchar](2000) NULL,
	[TRIMMED_URL] [varchar](2000) NULL,
	[TRIMMED_DURATION] [numeric](15, 0) NULL,
	[DATE_VENDOR_CREATED] [datetime] NULL,
	[DATE_CREATED] [datetime] NULL,
	[DATE_UPDATED] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[InvoicedLeases]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[InvoicedLeases](
	[YMDID] [int] NULL,
	[RECORD_CREATE_DM] [datetime2](7) NULL,
	[PROPERTY_ID] [float] NULL,
	[INVOICED_LEASES] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[LeaseToMatch]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[LeaseToMatch](
	[leaseid] [int] NOT NULL,
	[MgmtCompany] [varchar](100) NOT NULL,
	[RentPropertyID] [int] NULL,
	[PropertyName] [varchar](100) NOT NULL,
	[PropertyStreetAddress] [varchar](80) NULL,
	[PropertyState] [varchar](40) NULL,
	[Unit] [varchar](80) NOT NULL,
	[LeaseStartDate] [datetime2](0) NULL,
	[CreateDate] [datetime] NULL,
	[ResidentLastName] [varchar](80) NULL,
	[ResidentFirstName] [varchar](80) NULL,
	[ResidentEmail] [varchar](80) NULL,
	[ResidentPhone1] [varchar](100) NOT NULL,
	[renterID] [int] NULL,
	[Expansion] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[MDIM_NotInEndeca]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[MDIM_NotInEndeca](
	[YMDID] [int] NOT NULL,
	[RECORD_CREATE_DM] [datetime2](7) NULL,
	[PROPERTY_CREATE_DM] [datetime2](7) NULL,
	[ACTIVATE_DM] [datetime2](7) NULL,
	[PROPERTY_UPDATE_DM] [datetime2](7) NULL,
	[PROPERTY_TERMINATE_DM] [datetime2](7) NULL,
	[LISTINGSTATUSID] [varchar](80) NULL,
	[PROPERTY_STATUS] [varchar](80) NULL,
	[COMPANY_ID] [float] NULL,
	[PROPERTY_ID] [numeric](15, 0) NOT NULL,
	[BUSINESSMODEL_TP] [varchar](40) NULL,
	[EXTERNAL_ID] [varchar](80) NULL,
	[EXTERNAL_TP] [varchar](80) NULL,
	[TOTAL_PHOTOS] [float] NULL,
	[ACTIVE_PHOTOS] [float] NULL,
	[TOTAL_FLOOR_PLANS] [float] NULL,
	[ACTIVE_FLOOR_PLANS] [float] NULL,
	[TOTAL_AMENITIES] [float] NULL,
	[ACTIVE_AMENITIES] [float] NULL,
	[LOWPRICE] [float] NULL,
	[HIGHPRICE] [float] NULL,
	[UPGRADE_TP] [varchar](80) NULL,
	[LINKEDFLOORPLAN] [float] NULL,
	[UNIQUEVISITS_FL] [float] NULL,
	[UNIQUEVISITS_PTE] [float] NULL,
	[UNIQUEVISITS_NONE] [float] NULL,
	[UNIQUEVISITS_MOBILE] [float] NULL,
	[UNIQUEVISITS_VIP] [float] NULL,
	[CLICKSLISTINGMAP] [float] NULL,
	[CLICKSMAPDIRECTIONS] [float] NULL,
	[CONNECTEDCALLS] [float] NULL,
	[MISSEDCALLS] [float] NULL,
	[ONEWEBCONNECTEDCALLS ] [float] NULL,
	[ONEWEBMISSEDCALLS] [float] NULL,
	[ALTREGCONNECTEDCALLS] [float] NULL,
	[ALTREGMISSEDCALLS] [float] NULL,
	[MOBILECONNECTEDCALLS] [float] NULL,
	[MOBILEMISSEDCALLS] [float] NULL,
	[TOTAL_HOTLEAD] [float] NULL,
	[INVOICED_LEASES] [float] NULL,
	[TRULIAEMAILLEADS] [float] NULL,
	[TOTAL_IMPRESSIONS] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[MDIM_Reporting]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[MDIM_Reporting](
	[YMDID] [int] NOT NULL,
	[RECORD_CREATE_DM] [datetime2](7) NULL,
	[PROPERTY_CREATE_DM] [datetime2](7) NULL,
	[PROPERTY_UPDATE_DM] [datetime2](7) NULL,
	[PROPERTY_TERMINATE_DM] [datetime2](7) NULL,
	[LISTINGSTATUSID] [varchar](80) NULL,
	[PROPERTY_STATUS] [varchar](80) NULL,
	[COMPANY_ID] [float] NULL,
	[PROPERTY_ID] [numeric](15, 0) NOT NULL,
	[BUSINESSMODEL_TP] [varchar](40) NULL,
	[EXTERNAL_ID] [varchar](80) NULL,
	[EXTERNAL_TP] [varchar](80) NULL,
	[TOTAL_PHOTOS] [float] NULL,
	[ACTIVE_PHOTOS] [float] NULL,
	[TOTAL_FLOOR_PLANS] [float] NULL,
	[ACTIVE_FLOOR_PLANS] [float] NULL,
	[TOTAL_AMENITIES] [float] NULL,
	[ACTIVE_AMENITIES] [float] NULL,
	[LOWPRICE] [float] NULL,
	[HIGHPRICE] [float] NULL,
	[UPGRADE_TP] [varchar](80) NULL,
	[LINKEDFLOORPLAN] [float] NULL,
	[UNIQUEVISITS_FL] [float] NULL,
	[UNIQUEVISITS_PTE] [float] NULL,
	[UNIQUEVISITS_NONE] [float] NULL,
	[UNIQUEVISITS_MOBILE] [float] NULL,
	[UNIQUEVISITS_VIP] [float] NULL,
	[CLICKSLISTINGMAP] [float] NULL,
	[CLICKSMAPDIRECTIONS] [float] NULL,
	[CONNECTEDCALLS] [float] NULL,
	[MISSEDCALLS] [float] NULL,
	[ONEWEBCONNECTEDCALLS ] [float] NULL,
	[ONEWEBMISSEDCALLS] [float] NULL,
	[ALTREGCONNECTEDCALLS] [float] NULL,
	[ALTREGMISSEDCALLS] [float] NULL,
	[MOBILECONNECTEDCALLS] [float] NULL,
	[MOBILEMISSEDCALLS] [float] NULL,
	[TOTAL_HOTLEAD] [float] NULL,
	[INVOICED_LEASES] [float] NULL,
	[TRULIAEMAILLEADS] [float] NULL,
	[TOTAL_IMPRESSIONS] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[OracleLeadsToMatch]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[OracleLeadsToMatch](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LEADID] [nvarchar](40) NULL,
	[MGTCOID] [numeric](9, 0) NULL,
	[MGTCONAME] [nvarchar](50) NULL,
	[LISTINGID] [nvarchar](384) NULL,
	[PROPERTYID] [numeric](9, 0) NULL,
	[CLIENTID] [nvarchar](20) NULL,
	[PROPERTYNAME] [nvarchar](100) NULL,
	[PROPERTYCITY] [nvarchar](4000) NULL,
	[PROPERTYSTATE] [nvarchar](2) NULL,
	[FIRSTNAME] [nvarchar](100) NULL,
	[LASTNAME] [nvarchar](100) NULL,
	[FULLNAME] [nvarchar](200) NULL,
	[ISCOMPANY] [nvarchar](384) NULL,
	[CONTACTMETHOD] [nvarchar](31) NULL,
	[LEADSOURCE] [nvarchar](25) NULL,
	[CONTACTDATE] [datetime2](7) NULL,
	[ESTCONTACTDATE] [datetime2](7) NULL,
	[EMAIL] [nvarchar](255) NULL,
	[PHONE] [nvarchar](4000) NULL,
	[ISPAYPERLEASE] [nvarchar](384) NULL,
	[REVERSELOOKUPSOURCE] [nvarchar](50) NULL,
	[WHEN_ENTERED] [datetime2](7) NULL,
	[LEADADDRESS1] [nvarchar](154) NULL,
	[LEADADDRESS2] [nvarchar](80) NULL,
	[LEADCITY] [nvarchar](50) NULL,
	[LEADSTATE] [nvarchar](20) NULL,
	[LEADZIP] [nvarchar](20) NULL,
	[LEADMOVEMONTH] [nvarchar](15) NULL,
	[STATUS] [nvarchar](384) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[PropertyListings]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PropertyListings](
	[YMDID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[ExternalID] [varchar](50) NULL,
	[AccountID] [int] NULL,
	[AcountName] [varchar](100) NULL,
	[PropertyType] [varchar](50) NULL,
	[ISLargePropertyFlag] [int] NULL,
	[BusinessmodelType] [varchar](10) NULL,
	[StatusID] [int] NULL,
	[StatusDesc] [varchar](128) NULL,
	[CheckAvailabilityURL] [varchar](255) NULL,
	[SalesRepPersonID] [int] NULL,
	[MLS] [varchar](50) NULL,
	[PropertyName] [varchar](155) NOT NULL,
	[PropertyAddress] [varchar](255) NULL,
	[PropertyCity] [varchar](100) NULL,
	[PropertyState] [varchar](25) NULL,
	[PropertyZip] [varchar](25) NULL,
	[ContactPhone] [varchar](25) NULL,
	[ContactPhoneExt] [varchar](25) NULL,
	[FaxNumber] [varchar](25) NULL,
	[EmailAddress] [varchar](100) NULL,
	[MarketID] [int] NULL,
	[MarketName] [varchar](50) NULL,
	[SubMarketID] [int] NULL,
	[SubMarketName] [varchar](50) NULL,
	[AreaID] [int] NULL,
	[AreaName] [varchar](100) NULL,
	[PropertyTotalUnits] [int] NULL,
	[TotalPhotos] [int] NULL,
	[ActivePhotos] [int] NULL,
	[TotalFloorPlans] [int] NULL,
	[ActiveFloorPlans] [int] NULL,
	[TotalLogos] [int] NULL,
	[ActiveLogos] [int] NULL,
	[ActiveAmenities] [int] NULL,
	[MinRentLoft] [int] NULL,
	[MaxRentLoft] [int] NULL,
	[MinRent0Bed] [int] NULL,
	[MaxRent0Bed] [int] NULL,
	[MinRent1Bed] [int] NULL,
	[MaxRent1Bed] [int] NULL,
	[MinRent2Bed] [int] NULL,
	[MaxRent2Bed] [int] NULL,
	[MinRent3Bed] [int] NULL,
	[MaxRent3Bed] [int] NULL,
	[MinRent4Bed] [int] NULL,
	[MaxRent4Bed] [int] NULL,
	[UpsellFeaturedListing] [int] NULL,
	[UpsellPTEListing] [int] NULL,
	[Furnished] [int] NULL,
	[LowIncomeHousing] [int] NULL,
	[SeniorHousing] [int] NULL,
	[TargetPhoneNumber] [varchar](25) NULL,
	[TrackingPhoneNumber] [varchar](25) NULL,
	[GeoLong] [int] NULL,
	[GeoLat] [int] NULL,
	[BillingFirstName] [varchar](100) NULL,
	[BillingLastName] [varchar](100) NULL,
	[BillingCompany] [varchar](155) NULL,
	[BillingAddress] [varchar](255) NULL,
	[BillingCity] [varchar](100) NULL,
	[BillingState] [varchar](25) NULL,
	[BillingZip] [varchar](25) NULL,
	[BillingPhone] [varchar](25) NULL,
	[BillingPhoneExt] [varchar](25) NULL,
	[BillingFax] [varchar](25) NULL,
	[BillingEmail] [varchar](100) NULL,
	[DiscountAmount] [decimal](10, 2) NULL,
	[FlatfeeAmount] [int] NULL,
	[SourceCompanyID] [int] NULL,
	[CreateDate] [date] NULL,
	[TerminateDate] [date] NULL,
 CONSTRAINT [StagingPK_PropertyListings] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[PropertyMap]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PropertyMap](
	[YMDID] [int] NULL,
	[RentPropertyID] [int] NULL,
	[AGPropertyID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentComUpdateSmallPropPhoneListingidCW20150714]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentComUpdateSmallPropPhoneListingidCW20150714](
	[leadkey] [int] NOT NULL,
	[callid] [varchar](50) NULL,
	[RentPropertyID] [int] NULL,
	[FClistingid] [int] NULL,
	[DivisionKey] [int] NOT NULL,
	[PartyKey] [int] NOT NULL,
	[AdListingKey] [int] NOT NULL,
	[listingid] [int] NULL,
	[LeadStatusKey] [int] NOT NULL,
	[LeadDateKey] [int] NOT NULL,
	[IsSmallProperty] [tinyint] NOT NULL,
	[LeadSource] [varchar](8000) NULL,
	[IsSmallPropInMart] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RenterInvoice]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RenterInvoice](
	[YMDID] [int] NULL,
	[InvoiceID] [varchar](25) NULL,
	[InvoiceCreateDate] [date] NULL,
	[InvoiceType] [varchar](50) NULL,
	[InvoiceStatus] [varchar](50) NULL,
	[RentInvoiceID] [varchar](25) NULL,
	[ZuoraInvoiceNumber] [varchar](40) NULL,
	[ETSentDate] [datetime] NULL,
	[LeaseID] [numeric](15, 0) NULL,
	[LeaseStatusReasonID] [numeric](15, 0) NULL,
	[LeaseStatusID] [numeric](15, 0) NULL,
	[LeaseStatusDesc] [varchar](80) NULL,
	[LeaseReasonID] [numeric](15, 0) NULL,
	[LeaseReasonDesc] [varchar](80) NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[PropertyStatus] [varchar](80) NULL,
	[PropertyName] [varchar](200) NULL,
	[PropertyCity] [varchar](80) NULL,
	[PropertyState] [varchar](2) NULL,
	[RenterFirstName] [varchar](80) NULL,
	[RenterLastName] [varchar](80) NULL,
	[UnitAddress] [varchar](80) NULL,
	[UnitNumber] [varchar](80) NULL,
	[MoveInDate] [datetime] NULL,
	[LeaseCreateDate] [datetime] NULL,
	[LeaseUsageStatusDesc] [varchar](100) NULL,
	[LeaseScore] [varchar](3) NULL,
	[adjustedmoveindate] [date] NULL,
	[leaseusagestatusid] [tinyint] NULL,
	[zuoraaccountid] [varchar](32) NULL,
	[subscriptionnumber] [varchar](80) NULL,
	[productname] [varchar](15) NULL,
	[confirmationdate] [date] NULL,
	[ZuoraInvoiceItemID] [varchar](32) NULL,
	[LeaseUsageCreateDate] [datetime] NULL,
	[LastDateLoaded] [date] NULL,
	[ZuoraInvoiceID] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RENTERLEASE]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RENTERLEASE](
	[LEASEID] [int] NOT NULL,
	[PARENTLEASEID] [int] NULL,
	[DISPUTECASEID] [int] NULL,
	[DISPUTECASENUMBER] [int] NULL,
	[RENTERCASEID] [int] NULL,
	[RENTERCASENUMBER] [int] NULL,
	[REWARDCARDINQUIRYID] [int] NOT NULL,
	[LEASESTATUSREASONID] [int] NOT NULL,
	[CHARGEAMOUNT] [money] NULL,
	[PROMISETOPAY] [tinyint] NULL,
	[REWARDCARDADDRESS] [varchar](80) NULL,
	[REWARDCARDCITY] [varchar](80) NULL,
	[REWARDCARDSTATE] [varchar](80) NULL,
	[REWARDCARDZIP] [varchar](40) NULL,
	[ADJUSTEDMOVEINDATE] [date] NULL,
	[CREATEDATE] [date] NOT NULL,
	[FIRSTCONTACTDATE] [date] NULL,
	[NOTREWARDCARDELIGIBLE] [int] NULL,
	[RECOLLECTISSUEDATE] [date] NULL,
	[REPURSUEISSUEDATE] [date] NULL,
	[REWARDCARDFIRSTNAME] [varchar](80) NULL,
	[REWARDCARDLASTNAME] [varchar](80) NULL,
	[PRODUCTTYPE] [varchar](40) NULL,
	[EARLY_LATE_EXCLUDE] [tinyint] NULL,
	[CONFIRMATIONDATE] [date] NULL,
	[INSERTDATE] [date] NULL,
	[FORCENEWLEASEUSAGE] [tinyint] NULL,
	[ACCELERATE] [tinyint] NULL,
	[ACCELERATE_DATE] [date] NULL,
	[LeaseStatusDesc] [varchar](80) NULL,
	[LeaseReasonDesc] [varchar](80) NULL,
	[IsCPA] [bit] NULL,
	[RCMoveInDate] [date] NULL,
	[MoveInDateToUse] [date] NULL,
	[BasicStartDate] [date] NULL,
	[ExpectedStartDate] [date] NULL,
	[ExpectedInvoiceDate] [date] NULL,
	[RCPropertyID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[rpt_finance_forecast]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[rpt_finance_forecast](
	[DATE_EFFECTIVE] [datetime] NULL,
	[TIME_GRAIN] [varchar](35) NULL,
	[METRIC_NAME] [varchar](50) NULL,
	[METRIC_TYPE] [varchar](35) NULL,
	[TARGET_VALUE] [numeric](16, 4) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[rpt_lease_match_RC]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[rpt_lease_match_RC](
	[LEADID] [varchar](50) NULL,
	[MGTCOID] [int] NULL,
	[MGTCONAME] [varchar](80) NULL,
	[LISTINGID] [int] NULL,
	[PROPERTYID] [int] NULL,
	[CLIENTID] [varchar](50) NULL,
	[PROPERTYNAME] [varchar](80) NULL,
	[PROPERTYCITY] [varchar](80) NULL,
	[PROPERTYSTATE] [nvarchar](50) NULL,
	[FIRSTNAME] [varchar](100) NULL,
	[LASTNAME] [varchar](100) NULL,
	[FULLNAME] [varchar](200) NULL,
	[ISCOMPANY] [varchar](384) NULL,
	[CONTACTMETHOD] [varchar](50) NULL,
	[LEADSOURCE] [varchar](50) NULL,
	[CONTACTDATE] [datetime] NULL,
	[ESTCONTACTDATE] [datetime] NULL,
	[EMAIL] [varchar](80) NULL,
	[PHONE] [varchar](4000) NULL,
	[ISPAYPERLEASE] [varchar](384) NULL,
	[REVERSELOOKUPSOURCE] [varchar](50) NULL,
	[WHEN_ENTERED] [datetime] NULL,
	[LEADADDRESS1] [varchar](255) NULL,
	[LEADADDRESS2] [varchar](80) NULL,
	[LEADCITY] [varchar](80) NULL,
	[LEADSTATE] [varchar](50) NULL,
	[LEADZIP] [varchar](50) NULL,
	[LEADMOVEMONTH] [varchar](50) NULL,
	[STATUS] [varchar](384) NULL,
	[CHANNEL] [varchar](384) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RPTPROD_Property]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RPTPROD_Property](
	[YMDID] [int] NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[PropertyName] [varchar](255) NULL,
	[PropertyAddress] [varchar](80) NULL,
	[PropertyCity] [varchar](80) NULL,
	[PropertyState] [varchar](5) NULL,
	[PropertyZipCode] [varchar](40) NULL,
	[CompanyID] [numeric](15, 0) NULL,
	[PropertyStatus] [varchar](80) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[StatusUpdate]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[StatusUpdate](
	[RECORD_CREATE_DM] [datetime2](7) NULL,
	[PROPERTY_ID] [numeric](15, 0) NOT NULL,
	[PROPERTY_STATUS] [varchar](80) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_dim_emailclass]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_dim_emailclass](
	[EMAILCLASS_ID] [numeric](15, 0) NULL,
	[CREATE_DM] [datetime] NULL,
	[UPDATE_DM] [datetime] NULL,
	[MARKET_NB] [numeric](15, 0) NULL,
	[ISSUE_NB] [numeric](15, 0) NULL,
	[NAME_NM] [varchar](80) NULL,
	[ISSUE_ID] [numeric](15, 0) NULL,
	[ISSUE_NM] [varchar](80) NULL,
	[REGISTRATIONOFFSET_NB] [numeric](15, 0) NULL,
	[MOVEINOFFSET_NB] [numeric](15, 0) NULL,
	[PERIOD_NB] [numeric](15, 0) NULL,
	[RANK_NB] [numeric](15, 0) NULL,
	[UNSUBSCRIBE_TP] [varchar](40) NULL,
	[TERMINATE_DM] [datetime] NULL,
	[SOURCE_ID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_dim_lease]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_dim_lease](
	[LEASE_ID] [numeric](15, 0) NULL,
	[CREATE_DM] [datetime] NULL,
	[PROPERTY_ID] [numeric](15, 0) NULL,
	[RENTER_ID] [numeric](15, 0) NULL,
	[REQUEST_ID] [numeric](15, 0) NULL,
	[BOUNTY_ID] [numeric](15, 0) NULL,
	[LESSOR_FIRST_NM] [varchar](40) NULL,
	[LESSOR_LAST_NM] [varchar](40) NULL,
	[RENTER_FIRST_NM] [varchar](80) NULL,
	[RENTER_LAST_NM] [varchar](80) NULL,
	[LESSOR_DM] [datetime] NULL,
	[RENTER_DM] [datetime] NULL,
	[MOVEIN_DM] [datetime2](0) NULL,
	[MONTHLY_RENT_AT] [numeric](10, 2) NULL,
	[LEASE_TERM_NM] [varchar](80) NULL,
	[LEASE_TERM_NB] [numeric](10, 0) NULL,
	[UNIT_ADDRESS_NM] [varchar](80) NULL,
	[UNIT_NB] [varchar](80) NULL,
	[UNIT_CITY_NM] [varchar](80) NULL,
	[UNIT_STATE_CD] [varchar](40) NULL,
	[UNIT_ZIP_CD] [varchar](40) NULL,
	[BILLING_COMPANY_NM] [varchar](80) NULL,
	[BILLING_ADDRESS_NM] [varchar](80) NULL,
	[BILLING_CITY_NM] [varchar](80) NULL,
	[BILLING_STATE_CD] [varchar](40) NULL,
	[BILLING_ZIP_CD] [varchar](40) NULL,
	[LESSOR_PHONE_CD] [varchar](40) NULL,
	[RENTER_PHONE_CD] [varchar](40) NULL,
	[GUESTCARD_ID] [numeric](15, 0) NULL,
	[BILLING_PHONE_CD] [varchar](40) NULL,
	[BILLING_FAX_CD] [varchar](40) NULL,
	[BILLING_EMAIL_NM] [varchar](80) NULL,
	[FIRST_RENTER_EVENT_DM] [datetime] NULL,
	[FIRST_RENTER_EVENT_ID] [numeric](15, 0) NULL,
	[LAST_RENTER_EVENT_DM] [datetime] NULL,
	[LAST_RENTER_EVENT_ID] [numeric](15, 0) NULL,
	[COSIGNERS_NM] [varchar](200) NULL,
	[DISCOUNT_AT] [numeric](10, 2) NULL,
	[FLATFEE_AT] [numeric](10, 2) NULL,
	[BOUNTYSENT_DM] [datetime] NULL,
	[GUESTCARDREQUESTED_DM] [datetime] NULL,
	[GUESTCARDRECEIVED_DM] [datetime] NULL,
	[STATUS_XT] [varchar](2000) NULL,
	[FORCEBOUNTYPAYMENT_FG] [numeric](15, 0) NULL,
	[CLASSIFIED_FG] [numeric](15, 0) NULL,
	[TERMINATE_DM] [datetime] NULL,
	[BILLING_COMPANY_ID] [numeric](15, 0) NULL,
	[STICKERSENT_DM] [datetime] NULL,
	[NOTIFIEDONGUESTCARD_FG] [numeric](1, 0) NULL,
	[NOTIFIEDONLEASEAPPLICATION_FG] [numeric](1, 0) NULL,
	[NOTIFIEDVIAPHONE_FG] [numeric](1, 0) NULL,
	[NOTIFIEDINPERSON_FG] [numeric](1, 0) NULL,
	[NOTIFIEDGAVEPRINTOUT_FG] [numeric](1, 0) NULL,
	[NOTIFIEDFORGOT_FG] [numeric](1, 0) NULL,
	[NOTIFIEDOTHER_XT] [varchar](500) NULL,
	[AFFILIATESTATUS_XT] [varchar](2000) NULL,
	[VALIDFORAFFILIATE_DM] [datetime] NULL,
	[AUTOVALIDATION_FG] [numeric](15, 0) NULL,
	[UPDATE_DM] [datetime] NULL,
	[SMALLPROPERTY_FG] [numeric](15, 0) NULL,
	[PROPERTYCONFIRMATIONSENT_DM] [datetime] NULL,
	[REWARDCARDREQUEST_DM] [datetime] NULL,
	[SESSION_EMAIL_ID] [numeric](15, 0) NULL,
	[FUNDSONACCOUNTPAYABLE_FG] [numeric](15, 0) NULL,
	[BILLING_TP] [varchar](40) NULL,
	[VERIFYFOUNDONRENTDOTCOM_FG] [numeric](22, 0) NULL,
	[VERIFYTOLDPROPERTY_FG] [numeric](22, 0) NULL,
	[VERIFYSIGNEDLEASE_FG] [numeric](22, 0) NULL,
	[VERIFYHONESTLYANSWERED_FG] [numeric](22, 0) NULL,
	[VERIFYREMINDERSENT_NB] [numeric](22, 0) NULL,
	[LEASE_TP] [varchar](40) NULL,
	[LEASE_NM] [varchar](80) NULL,
	[PROPERTY_TP] [varchar](40) NULL,
	[PROPERTY_NM] [varchar](80) NULL,
	[REQUEST_TP] [varchar](40) NULL,
	[UNIT_ID] [numeric](22, 0) NULL,
	[UNIT_TP] [varchar](40) NULL,
	[OFFER_ID] [numeric](22, 0) NULL,
	[OFFER_TP] [varchar](40) NULL,
	[RENTER_TP] [varchar](40) NULL,
	[RENTERFIRST_NM] [varchar](80) NULL,
	[RENTERLAST_NM] [varchar](80) NULL,
	[LESSOR_ID] [numeric](22, 0) NULL,
	[LESSOR_TP] [varchar](40) NULL,
	[LESSORFIRST_NM] [varchar](40) NULL,
	[LESSORLAST_NM] [varchar](40) NULL,
	[STATUS_CD] [numeric](22, 0) NULL,
	[STATUS_DM] [datetime] NULL,
	[MONTHLYRENTCONFIRMED_FG] [numeric](22, 0) NULL,
	[MOVEINCONFIRMED_FG] [numeric](22, 0) NULL,
	[ACTIVATIONCODE_NB] [numeric](22, 0) NULL,
	[RENTERPHONE_CD] [varchar](40) NULL,
	[HASUNITNUMBERS_FG] [numeric](22, 0) NULL,
	[PREVIOUSTENANT_FG] [numeric](22, 0) NULL,
	[LASTSTATUSEMAILED_XT] [varchar](2000) NULL,
	[BROWSER_NM] [varchar](40) NULL,
	[CLIENTIP_NM] [varchar](15) NULL,
	[REWARDCARDADDRESS_NM] [varchar](80) NULL,
	[REWARDCARDCITY_NM] [varchar](80) NULL,
	[REWARDCARDSTATE_CD] [varchar](40) NULL,
	[REWARDCARDZIP_CD] [varchar](40) NULL,
	[TRANACCOUNT_NB] [numeric](22, 0) NULL,
	[BUSINESSMODEL_TP] [varchar](40) NULL,
	[PASSWORD_SOURCE] [numeric](2, 0) NULL,
	[REG_DM] [datetime] NULL,
	[SOURCE_ID] [numeric](15, 0) NULL,
	[PAID_FG] [numeric](1, 0) NULL,
	[INVOICE_CREATED_DM] [datetime] NULL,
	[ACTIVATIONCODE_NM] [varchar](15) NULL,
	[SOURCE_NM_DM] [datetime] NULL,
	[SOURCE_NM] [varchar](40) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_dim_person]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_dim_person](
	[PERSON_ID] [numeric](15, 0) NULL,
	[PERSON_TP] [varchar](40) NULL,
	[FIRST_NM] [varchar](80) NULL,
	[LAST_NM] [varchar](80) NULL,
	[PERSON_NM] [varchar](80) NULL,
	[PERSON_CD] [varchar](40) NULL,
	[CREATE_DM] [datetime] NULL,
	[UPDATE_DM] [datetime] NULL,
	[TERMINATE_DM] [datetime] NULL,
	[USER_NM] [varchar](80) NULL,
	[SOURCE_ID] [numeric](15, 0) NULL,
	[VERIFY_CD] [varchar](80) NULL,
	[LESSOR_ID] [numeric](15, 0) NULL,
	[RENTER_ID] [numeric](15, 0) NULL,
	[AFFILIATE_ID] [numeric](15, 0) NULL,
	[PROMO_NM] [varchar](80) NULL,
	[REFERRER_NM] [varchar](80) NULL,
	[OPTIN_ID] [numeric](15, 0) NULL,
	[MOVEIN_DM] [datetime2](0) NULL,
	[EMAIL_NM] [varchar](80) NULL,
	[ADDRESS_NM] [varchar](255) NULL,
	[CITY_NM] [varchar](80) NULL,
	[STATE_CD] [varchar](40) NULL,
	[ZIP_CD] [varchar](40) NULL,
	[PHONE_CD] [varchar](40) NULL,
	[FAX_CD] [varchar](40) NULL,
	[PRECISION_CD] [varchar](40) NULL,
	[LATITUDE_CD] [varchar](40) NULL,
	[LONGITUDE_CD] [varchar](40) NULL,
	[LAST_EVENT_ID] [numeric](15, 0) NULL,
	[HUNT_DM] [datetime] NULL,
	[UNSUBSCRIBE_DM] [datetime] NULL,
	[UNDELIVERABLE_DM] [datetime] NULL,
	[UNDELIVERABLE_XT] [varchar](2000) NULL,
	[RPT_EXTRA_BT] [nvarchar](38) NULL,
	[UNCONFIRMED_FG] [numeric](15, 0) NULL,
	[COLLECTIONSREP_ID] [numeric](15, 0) NULL,
	[UNWANTED_DM] [datetime] NULL,
	[UNWANTEDEMAIL_ID] [numeric](15, 0) NULL,
	[UNWANTEDEMAILCLASS_ID] [numeric](15, 0) NULL,
	[CONFIRMATIONNEEDED_FG] [numeric](15, 0) NULL,
	[CONFIRMATIONSENT_DM] [datetime2](0) NULL,
	[CONFIRMATIONOK_DM] [datetime2](0) NULL,
	[UNSUBSCRIBEEMAIL_ID] [numeric](15, 0) NULL,
	[UNSUBSCRIBEEMAILCLASS_ID] [numeric](15, 0) NULL,
	[RENTER_DM] [datetime2](0) NULL,
	[ROOMMATE_DM] [datetime] NULL,
	[PROMO_ID] [numeric](15, 0) NULL,
	[LASTLOGIN_DM] [datetime] NULL,
	[NICK_NM] [varchar](80) NULL,
	[REGISTRATIONURL_NM] [varchar](100) NULL,
	[CALL_DM] [datetime] NULL,
	[CALLDISPOSITION_NM] [varchar](80) NULL,
	[SAP_CUSTOMER_ID] [numeric](15, 0) NULL,
	[HYPER_RR_EMAIL_SENT_DM] [datetime] NULL,
	[ABLCHECKPOINT_DM] [datetime] NULL,
	[PASSWORD_SOURCE] [numeric](2, 0) NULL,
	[INSIDER_ID] [numeric](15, 0) NULL,
	[REQUESTACALL_DM] [datetime] NULL,
	[PHONEFROMCALLERID_FG] [numeric](1, 0) NULL,
	[REGISTER_DM] [datetime] NULL,
	[VISITOR_ID] [binary](16) NULL,
	[PASSWORD_HASH] [binary](20) NULL,
	[BROWSER_NM] [varchar](40) NULL,
	[CLIENTIP_NM] [varchar](15) NULL,
	[SALESREP_ID] [numeric](15, 0) NULL,
	[TERMINATE_XT] [varchar](2000) NULL,
	[PROCESSED_BT] [numeric](38, 0) NULL,
	[AGENT_ID] [numeric](15, 0) NULL,
	[SEENREWARDINTERSTITIAL_DM] [datetime] NULL,
	[CLICK_ID] [varchar](32) NULL,
	[UNIVERSAL_ID] [varchar](128) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_fct_ar_invoices]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_fct_ar_invoices](
	[LeaseID] [numeric](15, 0) NULL,
	[PropertyID] [numeric](15, 0) NULL,
	[Status] [varchar](2000) NULL,
	[InvoiceID] [varchar](15) NULL,
	[InvoiceType] [varchar](20) NULL,
	[InvoiceDate] [datetime] NULL,
	[InvoiceAmount] [numeric](15, 0) NULL,
	[OutstandingAmount] [numeric](15, 0) NULL,
	[TotalcreditsAmount] [numeric](15, 0) NULL,
	[TotalreceiptsAmount] [numeric](15, 0) NULL,
	[PromisetopayDate] [datetime] NULL,
	[PromisetopaypersonID] [numeric](15, 0) NULL,
	[EmailcontractID] [numeric](15, 0) NULL,
	[CompanyID] [numeric](15, 0) NULL,
	[DonotbillFlag] [numeric](15, 0) NULL,
	[SAPInvoiceID] [varchar](15) NULL,
	[ContractID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_fct_ar_invoicesCW]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_fct_ar_invoicesCW](
	[LEASE_ID] [nvarchar](384) NULL,
	[INVOICE_ID] [varchar](15) NULL,
	[INVOICE_TP] [varchar](20) NULL,
	[INVOICE_DM] [datetime2](7) NOT NULL,
	[INVOICE_AT] [nvarchar](384) NULL,
	[OUTSTANDING_AT] [nvarchar](384) NULL,
	[TOTALCREDITS_AT] [nvarchar](384) NULL,
	[TOTALRECEIPTS_AT] [nvarchar](384) NULL,
	[STATUS_XT] [varchar](2000) NULL,
	[PROMISETOPAY_DM] [datetime2](7) NULL,
	[PROMISETOPAYPERSON_ID] [numeric](15, 0) NULL,
	[PROPERTY_ID] [numeric](15, 0) NULL,
	[EMAILCONTRACT_ID] [numeric](15, 0) NULL,
	[COMPANY_ID] [numeric](15, 0) NULL,
	[DONOTBILL_FG] [numeric](15, 0) NULL,
	[SAP_INVOICE_ID] [varchar](15) NULL,
	[CONTRACT_ID] [numeric](15, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_fct_leadmessage]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_fct_leadmessage](
	[LEADMESSAGE_ID] [numeric](15, 0) NULL,
	[CREATE_DM] [datetime] NULL,
	[UPDATE_DM] [datetime] NULL,
	[TERMINATE_DM] [datetime] NULL,
	[LEAD_ID] [numeric](15, 0) NULL,
	[SOURCE_TP] [varchar](40) NULL,
	[RECIPIENT_TP] [varchar](40) NULL,
	[SENDERTRACKEMAIL_ID] [numeric](15, 0) NULL,
	[EMAILSUBJECT_TX] [varchar](255) NULL,
	[TRACKEMAIL_ID] [numeric](15, 0) NULL,
	[FAX_ID] [numeric](15, 0) NULL,
	[TRACKPHONECALL_ID] [numeric](15, 0) NULL,
	[UNDELIVERABLE_DM] [datetime] NULL,
	[READ_DM] [datetime] NULL,
	[PERSON_ID] [numeric](15, 0) NULL,
	[PROPERTY_ID] [numeric](15, 0) NULL,
	[SMALLPROPERTY_FG] [numeric](15, 0) NULL,
	[RENTER_DM] [datetime] NULL,
	[SOURCE_ID] [numeric](15, 0) NULL,
	[STATE_CD] [varchar](40) NULL,
	[LEADGROUP_ID] [numeric](15, 0) NULL,
	[LEADGROUPSTATUS_ID] [numeric](15, 0) NULL,
	[BUSINESSMODEL_TP] [varchar](40) NULL,
	[SOURCE_NM] [varchar](40) NULL,
	[SOURCE_NM_DM] [datetime] NULL,
	[MESSAGE_TX] [varchar](2000) NULL,
	[CONTACT_DM] [datetime] NULL,
	[DURATION_NB] [numeric](15, 0) NULL,
	[CONTACTSTATUS_XT] [varchar](40) NULL,
	[LOFT_FG] [numeric](15, 0) NULL,
	[STUDIO_FG] [numeric](15, 0) NULL,
	[BEDROOM1_FG] [numeric](15, 0) NULL,
	[BEDROOM2_FG] [numeric](15, 0) NULL,
	[BEDROOM3_FG] [numeric](15, 0) NULL,
	[BEDROOM4_FG] [numeric](15, 0) NULL,
	[PASSWORD_SOURCE] [numeric](2, 0) NULL,
	[EMAIL_ID] [numeric](15, 0) NULL,
	[PHONEFROMCALLERID_FG] [numeric](1, 0) NULL,
	[SUPPLIEDPHONE_NB] [numeric](15, 0) NULL,
	[DUP_LEAD_FLAG] [varchar](2) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_fct_leads]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_fct_leads](
	[LEAD_ID] [numeric](15, 0) NULL,
	[CREATE_DM] [datetime] NULL,
	[UPDATE_DM] [datetime] NULL,
	[TERMINATE_DM] [datetime] NULL,
	[PERSON_ID] [numeric](15, 0) NULL,
	[PERSONTRACKPHONE_CD] [varchar](40) NULL,
	[PERSONTRACKEXTENSION_CD] [varchar](40) NULL,
	[PERSONTRACKEMAIL_ID] [numeric](15, 0) NULL,
	[PROPERTY_ID] [numeric](15, 0) NULL,
	[LOFT_FG] [numeric](15, 0) NULL,
	[STUDIO_FG] [numeric](15, 0) NULL,
	[BEDROOM1_FG] [numeric](15, 0) NULL,
	[BEDROOM2_FG] [numeric](15, 0) NULL,
	[BEDROOM3_FG] [numeric](15, 0) NULL,
	[BEDROOM4_FG] [numeric](15, 0) NULL,
	[STATUS_XT] [varchar](2000) NULL,
	[SESSION_EMAIL_ID] [numeric](15, 0) NULL,
	[RESPONDED_FG] [numeric](1, 0) NULL,
	[PURGE_DM] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_fct_lessorlease]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_fct_lessorlease](
	[LESSORLEASE_ID] [numeric](15, 0) NOT NULL,
	[LEASE_ID] [numeric](15, 0) NULL,
	[COMPANY_ID] [numeric](15, 0) NULL,
	[PROPERTY_ID] [numeric](15, 0) NULL,
	[EXTERNAL_ID] [varchar](80) NULL,
	[PROPERTY_NM] [varchar](80) NULL,
	[ADDRESS_NM] [varchar](80) NULL,
	[CITY_NM] [varchar](80) NULL,
	[STATE_CD] [varchar](40) NULL,
	[ZIP_CD] [varchar](40) NULL,
	[UNIT_NB] [varchar](80) NULL,
	[RENTERFIRST_NM] [varchar](80) NULL,
	[RENTERLAST_NM] [varchar](80) NULL,
	[RENTERPHONE_CD] [varchar](80) NULL,
	[COSIGNERS_NM] [varchar](80) NULL,
	[UNITADDRESS_NM] [varchar](80) NULL,
	[LEASETERM_NM] [varchar](80) NULL,
	[MOVEIN_DM] [datetime2](7) NULL,
	[RENTEREMAIL_NM] [varchar](80) NULL,
	[CREATE_DM] [datetime2](7) NULL,
	[UPDATE_DM] [datetime2](7) NULL,
	[RENTROLLMONTH_XT] [varchar](16) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_mdim_property]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_mdim_property](
	[YMDID] [int] NOT NULL,
	[RECORD_CREATE_DM] [datetime2](7) NULL,
	[PROPERTY_CREATE_DM] [datetime2](7) NULL,
	[PROPERTY_UPDATE_DM] [datetime2](7) NULL,
	[PROPERTY_TERMINATE_DM] [datetime2](7) NULL,
	[PROPERTY_ID] [numeric](15, 0) NOT NULL,
	[UNIVERSAL_ID] [varchar](128) NULL,
	[EXTERNAL_ID] [varchar](80) NULL,
	[TYPE_NM] [varchar](80) NULL,
	[TOTALUNITS_NB] [numeric](15, 0) NULL,
	[ACTIVE_UNITS_AT] [numeric](15, 0) NULL,
	[UPSELLLISTSENIORLISTING] [numeric](15, 0) NULL,
	[TOTAL_AMENITIES] [float] NULL,
	[ACTIVE_AMENITIES] [float] NULL,
	[TOTAL_PHOTOS] [float] NULL,
	[ACTIVE_PHOTOS] [float] NULL,
	[TOTAL_FLOOR_PLANS] [float] NULL,
	[ACTIVE_FLOOR_PLANS] [float] NULL,
	[UPSELLPROPRENTALSFEATURED] [float] NULL,
	[UPSELLLISTFLOORPLANUPGRADE] [float] NULL,
	[UPSELLLISTPAYPERLEAD] [float] NULL,
	[ISRENTALPROPTOBEDELETED] [float] NULL,
	[LISTINGSTATUSID] [varchar](80) NULL,
	[UPSELLLISTHIGHLIGHTED] [float] NULL,
	[UPSELLLISTCOUPON] [float] NULL,
	[UPSELLPROPEMERICAL] [float] NULL,
	[UPSELLPROPFEATURECOMMPLATINUM] [float] NULL,
	[UPSELLPROPFEATURECOMMGOLD] [float] NULL,
	[UPSELLPROPFEATURECOMMSILVER] [float] NULL,
	[UPSELLPROPVIRTUALBROCHURE] [float] NULL,
	[UPSELLLISTCORPORATELISTING] [float] NULL,
	[UPSELLLISTCOLLEGELISTING] [float] NULL,
	[UPSELLLISTMILITARYLISTING] [float] NULL,
	[UPSELLLISTAPARTMENTLISTING] [float] NULL,
	[UPSELLPROPPHOTOUPGRADE] [float] NULL,
	[UPSELLMGMTCOLOGODISPLAY] [float] NULL,
	[UPSELLPROPLOGODISPLAY] [float] NULL,
	[UPSELLPROPPREMIUMUPGRADE] [float] NULL,
	[UPSELLPROPVIDEOSPOKESMODEL] [float] NULL,
	[UPSELLPROPFRONTPAGE] [float] NULL,
	[UPSELLPROPSPANISH] [float] NULL,
	[UPSELLPROPCALLRECORDING] [float] NULL,
	[UPSELLPROPFROMTOPHONE] [float] NULL,
	[UPSELLPROPRENTALSPREMIER] [float] NULL,
	[UPSELLPROPRENTALSLISTING] [float] NULL,
	[UPSELLLISTRENTALSSPOTLIGHTED] [float] NULL,
	[UPSELLLISTSPOTLIGHT] [float] NULL,
	[UPSELLLISTPAYPERLEASE] [float] NULL,
	[UPSELLLISTDIAMONDCITY] [float] NULL,
	[UPSELLLISTDIAMONDMAX] [float] NULL,
	[UPSELLLISTRENTALSSTANDARD] [float] NULL,
	[UPSELLLISTCOMMUNITYCAROUSEL] [float] NULL,
	[UPSELLLIST30SECONDVIDEO] [float] NULL,
	[UPSELLLIST60SECONDVIDEO] [float] NULL,
	[UPSELLLISTRENTALSCAROUSEL] [float] NULL,
	[UPSELLLISTRENTALSSTANDARDPLUS] [float] NULL,
	[UPSELLLISTMOBILESPOTLIGHT] [float] NULL,
	[UPSELLPROPMOBILEDEAL] [float] NULL,
	[UPSELLPROPDYNAMICLEADFORM] [float] NULL,
	[UPSELLLISTINCOMERESTRICTED] [float] NULL,
	[UPSELLLISTPETFRIENDLY] [float] NULL,
	[UPSELLLISTLUXURYCOMMUNITY] [float] NULL,
	[UPSELLPROPREPMON] [float] NULL,
	[UPSELLPROPSOCIALMEDIAMAN] [float] NULL,
	[FUTUREUPSELL03] [float] NULL,
	[FUTUREUPSELL04] [float] NULL,
	[FUTUREUPSELL05] [float] NULL,
	[FUTUREUPSELL06] [float] NULL,
	[FUTUREUPSELL07] [float] NULL,
	[FUTUREUPSELL08] [float] NULL,
	[LOWPRICE] [float] NULL,
	[HIGHPRICE] [float] NULL,
	[ISSEM] [float] NULL,
	[ISOVERTHRESHOLD] [float] NULL,
	[CALLTRACKINGINBOOK] [float] NULL,
	[COUPONACTIVEONSITE] [float] NULL,
	[VERIZONFIOS] [float] NULL,
	[ATTUVERSE] [float] NULL,
	[DIRECTTV] [float] NULL,
	[BRIGHTHOUSE] [float] NULL,
	[CHARTER] [float] NULL,
	[XFINITYSP] [float] NULL,
	[XFINITYDP] [float] NULL,
	[XFINITYTP] [float] NULL,
	[TIMEWARNER] [float] NULL,
	[NUMERICRANK] [float] NULL,
	[UNIQUEVISITS_FL] [float] NULL,
	[UNIQUEVISITS_PTE] [float] NULL,
	[UNIQUEVISITS_NONE] [float] NULL,
	[UNIQUEVISITS_MOBILE] [float] NULL,
	[UNIQUEVISITS_VIP] [float] NULL,
	[UNIQUEVISITS_FORFUTUREUSE2] [float] NULL,
	[UNIQUEVISITS_FORFUTUREUSE3] [float] NULL,
	[UNIQUEVISITS_FORFUTUREUSE4] [float] NULL,
	[UNIQUEVISITS_FORFUTUREUSE5] [float] NULL,
	[VIEWSLISTINGPAGE] [float] NULL,
	[VIEWSLISTINGPAGE_MOBILE] [float] NULL,
	[VIEWSLISTINGPAGE_FORFUTUREUSE1] [float] NULL,
	[VIEWSLISTINGPAGE_FORFUTUREUSE2] [float] NULL,
	[VIEWSLISTINGPAGE_FORFUTUREUSE3] [float] NULL,
	[VIEWSLISTINGPAGE_FORFUTUREUSE4] [float] NULL,
	[VIEWSLISTINGPAGE_FORFUTUREUSE5] [float] NULL,
	[VIEWSEMERCIAL] [float] NULL,
	[VIEWSVIRTUALBROCHURE] [float] NULL,
	[CLICKSSPOTLIGHTLISTING] [float] NULL,
	[CLICKSSPOTLIGHTCOMMUNITYVIDEO] [float] NULL,
	[CLICKSLISTINGWEBLINK] [float] NULL,
	[CLICKSMGTCOWEBLINK] [float] NULL,
	[CLICKSONLINEAPPT] [float] NULL,
	[CLICKSONLINEAPPTSUBMIT] [float] NULL,
	[CLICKSONLINEAPPL] [float] NULL,
	[CLICKSONLINEAPPLSUBMIT] [float] NULL,
	[CLICKSONLINEAPPTCR] [float] NULL,
	[CLICKSONLINEAPPLCR] [float] NULL,
	[CLICKSSPOTLIGHTLEADSUBMISSION] [float] NULL,
	[CLICKSWECANCALLYOU] [float] NULL,
	[CLICKSLEADSUBMISSION] [float] NULL,
	[CLICKSPHONESUBMISSION] [float] NULL,
	[CLICKSCOMMUNITYVIDEO] [float] NULL,
	[CLICKSLISTINGMAP] [float] NULL,
	[CLICKSMAPDIRECTIONS] [float] NULL,
	[CLICKSPRINTABLEGUIDE] [float] NULL,
	[CLICKSPHOTOS] [float] NULL,
	[CLICKSSPOTLIGHTPHOTOS] [float] NULL,
	[CLICKSSPOTLIGHTPHOTOPOPUP] [float] NULL,
	[CLICKSFLOORPLAN] [float] NULL,
	[CLICKSCHECKYOURCREDIT] [float] NULL,
	[CLICKSWEBBUILDERLINK] [float] NULL,
	[CLICKSFEATUREDMGTCO] [float] NULL,
	[CLICKSFRONTPAGEPROPLEAD] [float] NULL,
	[CLICKSLUXURYSLIDESHOW] [float] NULL,
	[IMPRSEARCHRESULTS] [float] NULL,
	[TOTAL_IMPRESSIONS] [float] NULL,
	[IMPREFRONTCOVER] [float] NULL,
	[IMPRVISITCOUNT] [float] NULL,
	[VIEWING_FROM_EMAIL] [float] NULL,
	[TOTAL_VIEWINGS] [float] NULL,
	[TEXTMSGWEB] [float] NULL,
	[TEXTMSGMOBILE] [float] NULL,
	[CHECKLISTINGAVAIL] [float] NULL,
	[CHECKSSPOTLIGHTLISTINGAVAIL] [float] NULL,
	[CHECKSVIRTUALTOURLISTINGAVAIL] [float] NULL,
	[AGCPRINTCONNECTEDCALLS] [float] NULL,
	[AGCPRINTMISSEDCALLS] [float] NULL,
	[ASGPRINTCONNECTEDCALLS] [float] NULL,
	[ASGPRINTMISSEDCALLS] [float] NULL,
	[WEBCONNECTEDCALLS] [float] NULL,
	[WEBMISSEDCALLS] [float] NULL,
	[RENTALSCONNECTEDCALLS] [float] NULL,
	[RENTALSMISSEDCALLS] [float] NULL,
	[CTCONNECTEDCALLS] [float] NULL,
	[CTCMISSEDCALLS] [float] NULL,
	[PAIDSPCONNECTEDCALLS] [float] NULL,
	[PAIDSPMISSEDCALLS] [float] NULL,
	[COMBINEDFEEDSCONNECTEDCALLS] [float] NULL,
	[COMBINEDFEEDSMISSEDCALLS] [float] NULL,
	[GOOGLECONNECTEDCALLS] [float] NULL,
	[GOOGLEMISSEDCALLS] [float] NULL,
	[PPCCONNECTEDCALLS] [float] NULL,
	[PPCMISSEDCALLS] [float] NULL,
	[LUXURYCONNECTEDCALLS] [float] NULL,
	[LUXURYMISSEDCALLS] [float] NULL,
	[MARCHEXCONNECTEDCALLS] [float] NULL,
	[MARCHEXMISSEDCALLS] [float] NULL,
	[CRAIGSLISTCONNECTEDCALLS] [float] NULL,
	[CRAIGSLISTMISSEDCALLS] [float] NULL,
	[WEBLOCALTRACKNUMCONNECTCALLS] [float] NULL,
	[WEBLOCALTRACKNUMMISSEDCALLS] [float] NULL,
	[RENTALSLOCALCONNECTEDCALLS] [float] NULL,
	[RENTALSLOCALMISSEDCALLS] [float] NULL,
	[VIDEOCONNECTEDCALLS] [float] NULL,
	[VIDEOMISSEDCALLS] [float] NULL,
	[SEMCONNECTEDCALLS] [float] NULL,
	[SEMMISSEDCALLS] [float] NULL,
	[TRULIACONNECTEDCALLS] [float] NULL,
	[TRULIAMISSEDCALLS] [float] NULL,
	[FUTURECONNECTEDCALLS01] [float] NULL,
	[FUTUREMISSEDCALLS01] [float] NULL,
	[FUTURECONNECTEDCALLS02] [float] NULL,
	[FUTUREMISSEDCALLS02] [float] NULL,
	[FUTURECONNECTEDCALLS03] [float] NULL,
	[FUTUREMISSEDCALLS03] [float] NULL,
	[FUTURECONNECTEDCALLS04] [float] NULL,
	[FUTUREMISSEDCALLS04] [float] NULL,
	[FUTURECONNECTEDCALLS05] [float] NULL,
	[FUTUREMISSEDCALLS05] [float] NULL,
	[FUTURECONNECTEDCALLS06] [float] NULL,
	[FUTUREMISSEDCALLS06] [float] NULL,
	[FUTURECONNECTEDCALLS07] [float] NULL,
	[FUTUREMISSEDCALLS07] [float] NULL,
	[FUTURECONNECTEDCALLS08] [float] NULL,
	[FUTUREMISSEDCALLS08] [float] NULL,
	[FUTURECONNECTEDCALLS09] [float] NULL,
	[FUTUREMISSEDCALLS09] [float] NULL,
	[FUTURECONNECTEDCALLS10] [float] NULL,
	[FUTUREMISSEDCALLS10] [float] NULL,
	[AGEMAILLEADS] [float] NULL,
	[MAETROEMAILLEADS] [float] NULL,
	[NEIGHBORHOODEMAILLEADS] [float] NULL,
	[AIMCOEMAILLEADS] [float] NULL,
	[RENTALSEMAILLEADS] [float] NULL,
	[RENTAREMAILLEADS] [float] NULL,
	[RENTALHOUSESEMAILLEADS] [float] NULL,
	[IPHONEEMAILLEADS] [float] NULL,
	[OODLEEMAILLEADS] [float] NULL,
	[ANDROIDEMAILLEADS] [float] NULL,
	[HOTPADSEMAILLEADS] [float] NULL,
	[LUXURYEMAILLEADS] [float] NULL,
	[CONDOEMAILLEADS] [float] NULL,
	[IPADEMAILLEADS] [float] NULL,
	[TRULIAEMAILLEADS] [float] NULL,
	[ZILLOWEMAILLEADS] [float] NULL,
	[VERTICALBRANDSEMAILLEADS] [float] NULL,
	[RDTFEEDLEADS] [float] NULL,
	[PROPSOLUTIONSFEEDLEADS] [float] NULL,
	[YIELDFEEDLEADS] [float] NULL,
	[AGMOBILEEMAILLEADS] [float] NULL,
	[RENTALSMOBILEEMAILLEADS] [float] NULL,
	[RENTALSANDROIDEMAILLEADS] [float] NULL,
	[RENTALSIPHONEEMAILLEADS] [float] NULL,
	[VASTEMAILLEADS] [float] NULL,
	[CAMPUSHOMESONLINEEMAILLEADS] [float] NULL,
	[AGTABLETEMAILLEADS] [float] NULL,
	[AGKINDLEEMAILLEADS] [float] NULL,
	[FUTURE1EMAILLEADS] [float] NULL,
	[FUTURE2EMAILLEADS] [float] NULL,
	[FUTURE3EMAILLEADS] [float] NULL,
	[FUTURE4EMAILLEADS] [float] NULL,
	[FUTURE5EMAILLEADS] [float] NULL,
	[FUTURE6EMAILLEADS] [float] NULL,
	[FUTURE7EMAILLEADS] [float] NULL,
	[FUTURE8EMAILLEADS] [float] NULL,
	[FUTURE9EMAILLEADS] [float] NULL,
	[FUTURE0EMAILLEADS] [float] NULL,
	[PLACEMENTTIER] [float] NULL,
	[PRINTPRODUCTPOINTS] [float] NULL,
	[INTERNETPRODUCTPOINTS] [float] NULL,
	[LEGACYLOYALTYPOINTS] [float] NULL,
	[CONTRACTLOYALTYPOINTS] [float] NULL,
	[LASTUPDATEYMDID] [float] NULL,
	[UPSELLLISTBOLD] [float] NULL,
	[UPSELLLISTFRONTCOVER] [float] NULL,
	[UPSELLPROPPHOTOFEATURE] [float] NULL,
	[UPSELLMGMTMANAGEMENTCOLOGO] [float] NULL,
	[UPSELLPROPPROPERTYLOGO] [float] NULL,
	[UPSELLPROPPREMIUMPACKAGE] [float] NULL,
	[UPSELLLISTFLOORPLANPKG] [float] NULL,
	[LINKEDFLOORPLAN] [float] NULL,
	[INTERNETPHONELEADS] [float] NULL,
	[INTERNETPHONELEADS_NOMOBILE] [float] NULL,
	[DIGITALPHONELEADS] [float] NULL,
	[EMAILLEADS] [float] NULL,
	[INTERNETEMAILLEADS_NOMOBILE] [float] NULL,
	[DIGITALEMAILLEADS] [float] NULL,
	[AGCMISSEDCALLS] [float] NULL,
	[ASGMISSEDCALLS] [float] NULL,
	[AGCALLLEADS] [float] NULL,
	[ASGALLLEADS] [float] NULL,
	[ALLMISSEDCALLS] [float] NULL,
	[ALLCONNECTEDCALLS] [float] NULL,
	[ALLLEADS] [float] NULL,
	[ALLINTERNETLEADS_NOMOBILE] [float] NULL,
	[ALLDIGITALLEADS] [float] NULL,
	[THIRDPARTYFEEDLEADS] [float] NULL,
	[WEBSITECALLS] [float] NULL,
	[WEBSITEEMAILS] [float] NULL,
	[WEBSITELEADS_RENTALS] [float] NULL,
	[MOBILEEMAILS] [float] NULL,
	[MOBILECALLS] [float] NULL,
	[MOBILELEADS_AG] [float] NULL,
	[MOBILELEADS_RENTALS] [float] NULL,
	[MOBILEALLLEADS] [float] NULL,
	[MRSYNDICATIONEMAILLEADS] [float] NULL,
	[MRAGEMAILLEADS] [float] NULL,
	[MRAGWEBPHONELEADS] [float] NULL,
	[MRAPPSEMAILLEADS] [float] NULL,
	[MRPHONECALLS] [float] NULL,
	[RPLRANK] [float] NULL,
	[PROPERTY_NM] [varchar](80) NULL,
	[MARKET_NM] [varchar](80) NULL,
	[CITY_NM] [varchar](80) NULL,
	[STATE_CD] [varchar](80) NULL,
	[SEARCH_RANK] [float] NULL,
	[PAGE_IN_SEARCH] [float] NULL,
	[UPGRADE_TP] [varchar](80) NULL,
	[UPGRADE_MONTHLY_COST] [numeric](10, 2) NULL,
	[UPGRADE_START_DATE] [datetime2](7) NULL,
	[UPGRADE_END_DATE] [datetime2](7) NULL,
	[NATURAL_IMPRESSIONS] [float] NULL,
	[FEATURED_IMPRESSIONS] [float] NULL,
	[NATURAL_VIEWINGS] [float] NULL,
	[FEATURED_VIEWINGS] [float] NULL,
	[NATURAL_HOTLEADS] [float] NULL,
	[FEATURED_HOTLEADS] [float] NULL,
	[TOTAL_PHONECALL] [float] NULL,
	[NATURAL_PHONECALLS] [float] NULL,
	[FEATURED_PHONECALLS] [float] NULL,
	[TOTAL_HOTLEAD] [float] NULL,
	[NATURAL_NRL] [float] NULL,
	[FEATURED_NRL] [float] NULL,
	[TOTAL_LEASES] [float] NULL,
	[MARKET_NB] [float] NULL,
	[PAID_LEASES] [float] NULL,
	[AVG_CALL_DURATION] [float] NULL,
	[COMPANY_NM] [varchar](80) NULL,
	[COMPANY_ID] [float] NULL,
	[SUCCESS_FEE] [numeric](10, 2) NULL,
	[VIP_IMPRESSIONS] [float] NULL,
	[VIP_VIEWINGS] [float] NULL,
	[VIP_HOTLEADS] [float] NULL,
	[VIP_PHONECALLS] [float] NULL,
	[VIP_NRL] [float] NULL,
	[PTE_IMPRESSIONS] [float] NULL,
	[PTE_VIEWINGS] [float] NULL,
	[PTE_HOTLEADS] [float] NULL,
	[PTE_PHONECALLS] [float] NULL,
	[PTE_NRL] [float] NULL,
	[PROPERTY_STATUS] [varchar](80) NULL,
	[PHONE_CD] [varchar](80) NULL,
	[PROPERTY_ADDRESS] [varchar](80) NULL,
	[FAX_CD] [varchar](80) NULL,
	[EMAIL_NM] [varchar](80) NULL,
	[HOTLEADEMAIL_ID] [varchar](80) NULL,
	[HOTLEADFAX_ID] [varchar](80) NULL,
	[UNIQUE_HOTLEADS] [float] NULL,
	[UNIQUE_VIEWINGS] [float] NULL,
	[UNIQUE_PDP_OVERVIEWS] [float] NULL,
	[BILLING_ADDRESS] [varchar](80) NULL,
	[BILLING_CITY] [varchar](80) NULL,
	[BILLING_STATE] [varchar](40) NULL,
	[BILLING_ZIP] [varchar](40) NULL,
	[BILLING_EMAIL] [varchar](80) NULL,
	[BILLING_PHONE] [varchar](40) NULL,
	[BILLING_FAX] [varchar](40) NULL,
	[LEASE_FAXED] [varchar](80) NULL,
	[LEASE_EMAILED] [varchar](80) NULL,
	[SUBMARKET_NB] [float] NULL,
	[SUBMARKET_NM] [varchar](80) NULL,
	[AREA_NM] [varchar](80) NULL,
	[IMAGE_INCLUDED] [varchar](1) NULL,
	[SPECIALS] [varchar](80) NULL,
	[MAIN_IMAGE_AVAILABLE] [varchar](1) NULL,
	[FLOORPLAN_AVAILABLE] [varchar](1) NULL,
	[LOGO_AVAILABLE] [varchar](1) NULL,
	[LAST_VIRTUAL_UPLOAD] [varchar](80) NULL,
	[SEARCHABLE] [varchar](1) NULL,
	[UNIQUE_HOTLEADERS] [float] NULL,
	[NATURAL_SEARCHERS] [float] NULL,
	[FEATURED_SEARCHERS] [float] NULL,
	[NATURAL_VIEWERS] [float] NULL,
	[FEATURED_VIEWERS] [float] NULL,
	[NATURAL_HOTLEADERS] [float] NULL,
	[FEATURED_HOTLEADERS] [float] NULL,
	[TOTAL_HOTLEADERS] [float] NULL,
	[TOTAL_PHONECALLERS] [float] NULL,
	[FEATURED_PHONECALLERS] [float] NULL,
	[NATURAL_PHONECALLERS] [float] NULL,
	[BUSINESSMODEL_TP] [varchar](40) NULL,
	[ACTIVATE_DM] [datetime2](7) NULL,
	[CONNECTEDCALLS] [numeric](15, 0) NULL,
	[MISSEDCALLS ] [float] NULL,
	[ONEWEBCONNECTEDCALLS ] [float] NULL,
	[ONEWEBMISSEDCALLS] [float] NULL,
	[ALTREGCONNECTEDCALLS] [float] NULL,
	[ALTREGMISSEDCALLS] [float] NULL,
	[MOBILECONNECTEDCALLS] [float] NULL,
	[MOBILEMISSEDCALLS] [float] NULL,
	[EXTERNAL_TP] [varchar](80) NULL,
	[UNIQUE_IMPRESSIONS] [float] NULL,
	[INVOICED_LEASES] [float] NULL,
	[PTE_VIEWERS] [float] NULL,
	[VIP_VIEWERS] [float] NULL,
	[PTE_SEARCHERS] [float] NULL,
	[VIP_SEARCHERS] [float] NULL,
	[VIP_HOTLEADERS] [float] NULL,
	[TRULIAEMAILLEADERS] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_rpt_lease_collection]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_rpt_lease_collection](
	[LEASE_ID] [nvarchar](38) NULL,
	[COLLECTION_DM] [datetime] NULL,
	[RENTER_ID] [numeric](15, 0) NULL,
	[SESSION_EMAIL_ID] [numeric](15, 0) NULL,
	[PROPERTY_ID] [numeric](15, 0) NULL,
	[PASSWORD_SOURCE] [numeric](2, 0) NULL,
	[SOURCE_ID] [numeric](15, 0) NULL,
	[REG_DM] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[tbl_sum_property_status]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[tbl_sum_property_status](
	[PROPERTY_ID] [numeric](15, 0) NULL,
	[DATE_DM] [datetime] NULL,
	[BUSINESSMODEL_TP] [varchar](40) NULL,
	[STATUS_XT] [varchar](2000) NULL,
	[COMPANY_ID] [numeric](15, 0) NULL,
	[COMPANY_NM] [varchar](80) NULL,
	[CHECKAVAILABILITYURL_NM] [varchar](2000) NULL,
	[COMPANY_STATUS] [varchar](80) NULL,
	[BACKFILLED] [varchar](1) NULL,
	[FIRST_ACTIVATE_DM] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150515]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150515](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[_sm_ovs] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150516]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150516](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[qubprofile] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150517]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150517](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150518]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150518](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[aqs] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[es_sm] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[gws_rd] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[ie] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[oq] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[refinements] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[safesearch] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sig2] [varchar](7000) NULL,
	[sk] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sourceid] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[utm_source] [varchar](7000) NULL,
	[utm_term] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150519]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150519](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150520]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150520](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_c_class] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[property_name] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[sa] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150521]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150521](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[gs_l] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_data] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_sqstem] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[oq] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[positiof] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[referrifg_domain] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[subprgfile] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150522]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150522](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[actiof] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[fode_parent_class] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pc] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sk] [varchar](7000) NULL,
	[sort] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150523]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150523](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[gbv] [varchar](7000) NULL,
	[gs_l] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[max_price] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[oq] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[sqi] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150524]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150524](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_pa\x10ent_CH\xF1ss] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[s_chn] [varchar](7000) NULL,
	[s_it] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150525]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150525](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150526]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150526](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cad] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[client] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[ie] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[oe] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pc] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[rls] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[session_ad] [varchar](7000) NULL,
	[sig2] [varchar](7000) NULL,
	[similarId] [varchar](7000) NULL,
	[sk] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[uact] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150527]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150527](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[adultfilter] [varchar](7000) NULL,
	[aq] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[fode_parent_class] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[fr] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[max_price] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[property_name] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[similarId] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[x] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150528]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150528](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[citq] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[max_price] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[PC] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150529]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150529](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[_zk_sc_t] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[gbv] [varchar](7000) NULL,
	[gs_l] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[hl] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[oq] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150530]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150530](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[location] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150531]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150531](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[email_token] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[utm_source] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150601]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150601](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[amp;action] [varchar](7000) NULL,
	[amp;browser] [varchar](7000) NULL,
	[amp;browser_size] [varchar](7000) NULL,
	[amp;browser_version] [varchar](7000) NULL,
	[amp;device] [varchar](7000) NULL,
	[amp;first_pageview] [varchar](7000) NULL,
	[amp;operating_system] [varchar](7000) NULL,
	[amp;path] [varchar](7000) NULL,
	[amp;profile] [varchar](7000) NULL,
	[amp;referrer] [varchar](7000) NULL,
	[amp;referring_domain] [varchar](7000) NULL,
	[amp;screen_resolution] [varchar](7000) NULL,
	[amp;subprofile] [varchar](7000) NULL,
	[amp;title] [varchar](7000) NULL,
	[amp;url] [varchar](7000) NULL,
	[amp;visit] [varchar](7000) NULL,
	[amp;visitor] [varchar](7000) NULL,
	[aqs] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_versign] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[es_sm] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[gws_rd] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[hsimp] [varchar](7000) NULL,
	[ie] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[opErIting_system] [varchar](7000) NULL,
	[oq] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[p] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[param1] [varchar](7000) NULL,
	[param2] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sig2] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sourceid] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[type] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150602]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150602](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[ampaction] [varchar](7000) NULL,
	[ampbrowser] [varchar](7000) NULL,
	[ampbrowser_size] [varchar](7000) NULL,
	[ampbrowser_version] [varchar](7000) NULL,
	[ampcity] [varchar](7000) NULL,
	[ampdevice] [varchar](7000) NULL,
	[ampfirst_pageview] [varchar](7000) NULL,
	[amplistingid] [varchar](7000) NULL,
	[ampoperating_system] [varchar](7000) NULL,
	[amppath] [varchar](7000) NULL,
	[ampprofile] [varchar](7000) NULL,
	[ampscreen_resolution] [varchar](7000) NULL,
	[ampstate] [varchar](7000) NULL,
	[ampsubprofile] [varchar](7000) NULL,
	[amptitle] [varchar](7000) NULL,
	[ampurl] [varchar](7000) NULL,
	[ampuser_id] [varchar](7000) NULL,
	[ampvisit] [varchar](7000) NULL,
	[ampvisitor] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[firstWpageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[lpp] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_ad] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[nodeWname] [varchar](7000) NULL,
	[operatang_system] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[screenWresolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[utm_source] [varchar](7000) NULL,
	[utm_term] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150603]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150603](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[filters] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[ie] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[oe] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pin] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[rls] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150604]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150604](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adultfilter] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cad] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_page~iew] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[ghc] [varchar](7000) NULL,
	[go] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[max_price] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operatang_system] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[sa] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sig2] [varchar](7000) NULL,
	[sk] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[utm_source] [varchar](7000) NULL,
	[utm_term] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150605]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150605](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[|Itle] [varchar](7000) NULL,
	[ac|ion] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[bro\xF7ser[syze] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[fr2] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[hsimp] [varchar](7000) NULL,
	[hspart] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[opejat\xA9ng_systdo] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[param1] [varchar](7000) NULL,
	[param2] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[se{sion_id] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sig2] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[type] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[utm_source] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[ef_id] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150606]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150606](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_~ersion] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node\x7Fname] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pc] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[property_name] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[referring_doiain] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[scree~_resolution] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[subprofmle] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vismt] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[ef_id] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150607]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150607](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[screenWresolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[ef_id] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150608]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150608](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[gs_l] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[property_name] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[utm_source] [varchar](7000) NULL,
	[utm_term] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150609]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150609](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[_zk_sc_t] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[docid] [varchar](7000) NULL,
	[dur] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[ghc] [varchar](7000) NULL,
	[h] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[iact] [varchar](7000) NULL,
	[imgrefurl] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_ids] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[lpp] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[ndsp] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[sa] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sk] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[start] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[tbm] [varchar](7000) NULL,
	[tbnid] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[uact] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[w] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[zoom] [varchar](7000) NULL,
	[ef_id] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150610]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150610](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[b] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[client] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[f] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[gfe_rd] [varchar](7000) NULL,
	[ghc] [varchar](7000) NULL,
	[go] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[lastingid] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_ids] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[max_price] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[oe] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pc] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[rls] [varchar](7000) NULL,
	[sa] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sk] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150611]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150611](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[gperating_system] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listifgid] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[pageWsub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[PC] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[prmd] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[rls] [varchar](7000) NULL,
	[sa] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screef_resolution] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[screen_rusolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sessiof_id] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[tbm] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[ef_id] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150612]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150612](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[property_name] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[ef_id] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150613]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150613](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[go] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[nodeWclass] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[ef_id] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150614]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150614](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listifgid] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pc] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[utm_source] [varchar](7000) NULL,
	[utm_term] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150615]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150615](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[conversationid] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[max_price] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_naee] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pc] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sk] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[undefined] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[ef_id] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150616]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150616](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[browsez] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[esrc] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[frm] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listifgs_per_page] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_sqstem] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pc] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[sa] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[undefined] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[utm_source] [varchar](7000) NULL,
	[utm_term] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150617]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150617](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[adt] [varchar](7000) NULL,
	[blockedUrl] [varchar](7000) NULL,
	[blockReason] [varchar](7000) NULL,
	[browsDrWtersion] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[hostIpAddr] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_ids] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[max_price] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pc] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refinements] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sig2] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[utm_source] [varchar](7000) NULL,
	[utm_term] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[vm] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150618]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150618](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[form] [varchar](7000) NULL,
	[gbv] [varchar](7000) NULL,
	[ghc] [varchar](7000) NULL,
	[gs_l] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_ids] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[lpp] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[mkt] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[oq] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[refig] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[utm_campaign] [varchar](7000) NULL,
	[utm_medium] [varchar](7000) NULL,
	[utm_source] [varchar](7000) NULL,
	[utm_term] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.mc_id] [varchar](7000) NULL,
	[WT.srch] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150619]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150619](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[adlt] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[bvm] [varchar](7000) NULL,
	[cd] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[clickvalue] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[cvid] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[ei] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[firstWpageview] [varchar](7000) NULL,
	[FORM] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[membership] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[pq] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[q] [varchar](7000) NULL,
	[qs] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[rct] [varchar](7000) NULL,
	[safe] [varchar](7000) NULL,
	[sc] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[sig2] [varchar](7000) NULL,
	[source] [varchar](7000) NULL,
	[sp] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[src] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[unit_id] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[usg] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[ved] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[wb48617274] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[TealiumParsedPivot20150620]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[TealiumParsedPivot20150620](
	[ymdid] [int] NOT NULL,
	[parseid] [bigint] NULL,
	[profileid] [int] NOT NULL,
	[subprofileid] [smallint] NULL,
	[eventdate] [datetime] NOT NULL,
	[profile] [varchar](7000) NULL,
	[subprofile] [varchar](7000) NULL,
	[page] [varchar](7000) NULL,
	[position] [varchar](7000) NULL,
	[selection] [varchar](7000) NULL,
	[listingid] [varchar](7000) NULL,
	[action] [varchar](7000) NULL,
	[campaign_id] [varchar](7000) NULL,
	[entry_campaign_id] [varchar](7000) NULL,
	[visit] [varchar](7000) NULL,
	[session_id] [varchar](7000) NULL,
	[referrer] [varchar](7000) NULL,
	[referring_domain] [varchar](7000) NULL,
	[browser] [varchar](7000) NULL,
	[browser_size] [varchar](7000) NULL,
	[browser_version] [varchar](7000) NULL,
	[city] [varchar](7000) NULL,
	[CustIPAddress] [varchar](7000) NULL,
	[dcsuri] [varchar](7000) NULL,
	[device] [varchar](7000) NULL,
	[featured_array] [varchar](7000) NULL,
	[first_pageview] [varchar](7000) NULL,
	[hash] [varchar](7000) NULL,
	[listing_array] [varchar](7000) NULL,
	[listing_id_click] [varchar](7000) NULL,
	[listing_type] [varchar](7000) NULL,
	[listingid_lead_submission] [varchar](7000) NULL,
	[listings_per_page] [varchar](7000) NULL,
	[node_class] [varchar](7000) NULL,
	[node_g_parent_class] [varchar](7000) NULL,
	[node_g_parent_id] [varchar](7000) NULL,
	[node_g_parent_name] [varchar](7000) NULL,
	[node_great_g_parent_class] [varchar](7000) NULL,
	[node_great_g_parent_id] [varchar](7000) NULL,
	[node_great_g_parent_name] [varchar](7000) NULL,
	[node_href] [varchar](7000) NULL,
	[node_id] [varchar](7000) NULL,
	[node_name] [varchar](7000) NULL,
	[node_parent_class] [varchar](7000) NULL,
	[node_parent_href] [varchar](7000) NULL,
	[node_parent_id] [varchar](7000) NULL,
	[node_parent_name] [varchar](7000) NULL,
	[node_value] [varchar](7000) NULL,
	[operating_system] [varchar](7000) NULL,
	[os] [varchar](7000) NULL,
	[page_category] [varchar](7000) NULL,
	[page_number] [varchar](7000) NULL,
	[page_sub] [varchar](7000) NULL,
	[path] [varchar](7000) NULL,
	[pdp_listing_id] [varchar](7000) NULL,
	[propertyid] [varchar](7000) NULL,
	[querystring] [varchar](7000) NULL,
	[screen_resolution] [varchar](7000) NULL,
	[secondaryListingId] [varchar](7000) NULL,
	[secondaryListingIdPosition] [varchar](7000) NULL,
	[ServerIPAddress] [varchar](7000) NULL,
	[spotlight_array] [varchar](7000) NULL,
	[spotlight_count] [varchar](7000) NULL,
	[ssSiteName] [varchar](7000) NULL,
	[ssTestName] [varchar](7000) NULL,
	[ssVariationGroupName] [varchar](7000) NULL,
	[state] [varchar](7000) NULL,
	[This is nothing] [varchar](7000) NULL,
	[title] [varchar](7000) NULL,
	[url] [varchar](7000) NULL,
	[user_email] [varchar](7000) NULL,
	[user_id] [varchar](7000) NULL,
	[UserAgent] [varchar](7000) NULL,
	[userid] [varchar](7000) NULL,
	[value] [varchar](7000) NULL,
	[version] [varchar](7000) NULL,
	[visitor] [varchar](7000) NULL,
	[WT.ti] [varchar](7000) NULL,
	[zip_code] [varchar](7000) NULL,
	[ef_id] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[vw_SUM_SITE]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[vw_SUM_SITE](
	[SOURCE_ID] [numeric](15, 0) NULL,
	[SOURCE_NM] [varchar](2000) NULL,
	[SOURCE_TYPE] [varchar](40) NULL,
	[CAMPAIGN_ID] [numeric](15, 0) NULL,
	[CAMPAIGN_NM] [varchar](80) NULL,
	[SITE_ID] [numeric](15, 0) NULL,
	[SITE_NM] [varchar](80) NULL,
	[SITE_TP] [varchar](20) NULL,
	[UPDATE_DM] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [uidx_LeaseID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uidx_LeaseID] ON [dbo].[LeaseStatusDates]
(
	[LeaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uidx_ContentGroupName]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uidx_ContentGroupName] ON [dbo].[PageContentGroupings]
(
	[ContentGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx#MeasureType]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx#MeasureType] ON [dbo].[ParsedData]
(
	[MeasureType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx#ParseID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx#ParseID] ON [dbo].[ParsedData]
(
	[ParseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_DimLease_LeaseID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_DimLease_LeaseID] ON [Dimension].[Lease]
(
	[LeaseID] ASC
)
INCLUDE ( 	[Status]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [idx_RenterPhoneNumber]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RenterPhoneNumber] ON [Dimension].[Lease]
(
	[RenterPhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_DimListing_PropertyID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_DimListing_PropertyID] ON [Dimension].[Listings]
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_DimListing_PropIDListID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_DimListing_PropIDListID] ON [Dimension].[Listings]
(
	[RentPropertyID] ASC
)
INCLUDE ( 	[ListingID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_DimListing_RentStatusID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_DimListing_RentStatusID] ON [Dimension].[Listings]
(
	[RentStatusID] ASC
)
INCLUDE ( 	[RentPropertyID],
	[ListingID],
	[PropertyName],
	[PropertyCity],
	[PropertyState],
	[PropertyZip]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_DimListing_PropertyID_1]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_DimListing_PropertyID_1] ON [Dimension].[Listings_Legacy]
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_DimListing_PropIDListID_1]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_DimListing_PropIDListID_1] ON [Dimension].[Listings_Legacy]
(
	[RentPropertyID] ASC
)
INCLUDE ( 	[ListingID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_DimListing_RentStatusID_1]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_DimListing_RentStatusID_1] ON [Dimension].[Listings_Legacy]
(
	[RentStatusID] ASC
)
INCLUDE ( 	[RentPropertyID],
	[ListingID],
	[PropertyName],
	[PropertyCity],
	[PropertyState],
	[PropertyZip]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_DimListing_PropertyID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_DimListing_PropertyID] ON [Dimension].[Listings_old_delete20150317]
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_DimListing_PropIDListID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_DimListing_PropIDListID] ON [Dimension].[Listings_old_delete20150317]
(
	[RentPropertyID] ASC
)
INCLUDE ( 	[ListingID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_DimListing_RentStatusID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_DimListing_RentStatusID] ON [Dimension].[Listings_old_delete20150317]
(
	[RentStatusID] ASC
)
INCLUDE ( 	[RentPropertyID],
	[ListingID],
	[PropertyName],
	[PropertyCity],
	[PropertyState],
	[PropertyZip]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_EmailName]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_EmailName] ON [Dimension].[Person]
(
	[EmailName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [idx_PersonPhoneNumber]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_PersonPhoneNumber] ON [Dimension].[Person]
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_phoneCode]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_phoneCode] ON [Dimension].[Person]
(
	[PhoneCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RegisterDate]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RegisterDate] ON [Dimension].[Person]
(
	[RegisterDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_RenterInvoice_InvoiceID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RenterInvoice_InvoiceID] ON [Dimension].[RenterInvoice]
(
	[InvoiceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RenterInvoice_LeaseID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RenterInvoice_LeaseID] ON [Dimension].[RenterInvoice]
(
	[LeaseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_RenterInvoice_ZuoraInvoiceNumber]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RenterInvoice_ZuoraInvoiceNumber] ON [Dimension].[RenterInvoice]
(
	[ZuoraInvoiceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RentInvoice_InvoiceCreateDate]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RentInvoice_InvoiceCreateDate] ON [Dimension].[RenterInvoice]
(
	[InvoiceCreateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RenterLease_CreateDate]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RenterLease_CreateDate] ON [Dimension].[RENTERLEASE]
(
	[CREATEDATE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RenterLease_ExpectedInvoiceDate]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RenterLease_ExpectedInvoiceDate] ON [Dimension].[RENTERLEASE]
(
	[ExpectedInvoiceDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RenterLease_ExpectedStartDate]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RenterLease_ExpectedStartDate] ON [Dimension].[RENTERLEASE]
(
	[ExpectedStartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_RenterLease_LeaseIDChar]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RenterLease_LeaseIDChar] ON [Dimension].[RENTERLEASE]
(
	[LeaseIDChar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RenterLease_RCPropertyID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RenterLease_RCPropertyID] ON [Dimension].[RENTERLEASE]
(
	[RCPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_CallerPhone_v1]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_CallerPhone_v1] ON [Fact].[CallsRentcom_legacy20160622]
(
	[CallerPhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_listingid_v1]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_listingid_v1] ON [Fact].[CallsRentcom_legacy20160622]
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RentPropertyID_v1]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RentPropertyID_v1] ON [Fact].[CallsRentcom_legacy20160622]
(
	[RentPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_CallerPhone]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_CallerPhone] ON [Fact].[CallsRentcom_OLD_20150422]
(
	[CallerPhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_listingid]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_listingid] ON [Fact].[CallsRentcom_OLD_20150422]
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RentPropertyID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RentPropertyID] ON [Fact].[CallsRentcom_OLD_20150422]
(
	[RentPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_Email_v1]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_Email_v1] ON [Fact].[EmailsRentcom_legacy20160622]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_ListingID_v1]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_ListingID_v1] ON [Fact].[EmailsRentcom_legacy20160622]
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UX_ExactTarget_PTE]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UX_ExactTarget_PTE] ON [Fact].[ExactTarget_PTE]
(
	[YMDID] ASC,
	[ListingID] ASC,
	[PropertyID] ASC,
	[EmailName] ASC,
	[PTE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [idx_LeadMessage_SourceType_RecipientType]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_LeadMessage_SourceType_RecipientType] ON [Fact].[LeadMessage]
(
	[SourceType] ASC,
	[RecipientType] ASC
)
INCLUDE ( 	[YMDID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_propid_person]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_propid_person] ON [Fact].[LeadMessage]
(
	[PersonID] ASC,
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [cidx_FactLeads_LeadID_CreateDate]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [cidx_FactLeads_LeadID_CreateDate] ON [Fact].[Leads]
(
	[LeadID] ASC,
	[CreateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_FactLeads_CreateDate]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_FactLeads_CreateDate] ON [Fact].[Leads]
(
	[CreateDate] ASC
)
INCLUDE ( 	[LeadID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_FactLeads_UpdateDate]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_FactLeads_UpdateDate] ON [Fact].[Leads]
(
	[UpdateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [uidx_RevenueDate]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uidx_RevenueDate] ON [Mart].[AdobeDailyRevenue]
(
	[RevenueDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx#CBSACode]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx#CBSACode] ON [Mart].[CBSADaily]
(
	[CBSACode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_LisingStatusID_YMDID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_LisingStatusID_YMDID] ON [Mart].[Listings]
(
	[RentStatusID] ASC,
	[YMDID] ASC
)
INCLUDE ( 	[ListingID],
	[RentPropertyID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_ListingID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_ListingID] ON [Mart].[Listings]
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RentPropertyID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RentPropertyID] ON [Mart].[Listings]
(
	[RentPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_YearMonth]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_YearMonth] ON [Mart].[Listings]
(
	[YearMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_LisingStatusID_YMDID_2]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_LisingStatusID_YMDID_2] ON [Mart].[Listings_OLD_20150528]
(
	[RentStatusID] ASC,
	[YMDID] ASC
)
INCLUDE ( 	[ListingID],
	[RentPropertyID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_ListingID_2]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_ListingID_2] ON [Mart].[Listings_OLD_20150528]
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_RentPropertyID_2]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_RentPropertyID_2] ON [Mart].[Listings_OLD_20150528]
(
	[RentPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_YearMonth_2]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_YearMonth_2] ON [Mart].[Listings_OLD_20150528]
(
	[YearMonth] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_Visitor]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_Visitor] ON [Mart].[PersonVisitorEFID]
(
	[Visitor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_YMDID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_YMDID] ON [Mart].[PersonVisitorEFID]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_YMDID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_YMDID] ON [Mart].[PersonVisitorEFID_Clicks]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_ListingID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_ListingID] ON [Mart].[PropertyScore]
(
	[ListingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [cidx_YMDID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [cidx_YMDID] ON [Mart].[RevenueFeedBase]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_visitor_EF]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_visitor_EF] ON [Mart].[RevenueFeedBase]
(
	[Visitor] ASC,
	[EF_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uidx_VisitYMDID]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uidx_VisitYMDID] ON [Mart].[RevenueFeedBase_temp]
(
	[Visitor] ASC,
	[Visit] ASC,
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_email]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_email] ON [Staging].[rpt_lease_match_RC]
(
	[EMAIL] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_phone]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE NONCLUSTERED INDEX [idx_phone] ON [Staging].[rpt_lease_match_RC]
(
	[PHONE] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PageContentGroupings] ADD  DEFAULT (getdate()) FOR [DateCreate]
GO
ALTER TABLE [dbo].[tmpMonitorAllTimeLoads] ADD  CONSTRAINT [DF_tmpMonitorAllTimeLoads_datelastchecked]  DEFAULT (getdate()) FOR [datelastchecked]
GO
ALTER TABLE [Dimension].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [LowPrice]
GO
ALTER TABLE [Dimension].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [HighPrice]
GO
ALTER TABLE [Dimension].[Listings_old_delete20150317] ADD  DEFAULT ((0)) FOR [LowPrice]
GO
ALTER TABLE [Dimension].[Listings_old_delete20150317] ADD  DEFAULT ((0)) FOR [HighPrice]
GO
ALTER TABLE [Dimension].[TrackRentComUpload] ADD  DEFAULT ((0)) FOR [mailsent]
GO
ALTER TABLE [Fact].[EmailsRentcom_legacy20160622] ADD  DEFAULT (CONVERT([int],CONVERT([varchar](8),getdate(),(112)),(0))) FOR [UpdateYMDID]
GO
ALTER TABLE [Fact].[EmailsRentcom_OLD_20150603] ADD  DEFAULT (CONVERT([int],CONVERT([varchar](8),getdate(),(112)),(0))) FOR [UpdateYMDID]
GO
ALTER TABLE [Fact].[ExactTarget_PTE] ADD  CONSTRAINT [DF_ExactTarget_PTE_DT_UpDate]  DEFAULT (getdate()) FOR [DT_Updated]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [YMDID]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [YearMonth]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentPropertyID]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [PropertyID]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [ListingID]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [ListingTypeID]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [ListingType]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [ListingTypeShort]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentStatusID]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [ExternalID]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [ExternalPriceCode]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [TotalPhotos]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [ActivePhotos]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [TotalFloorPlans]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [ActiveFloorPlans]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [TotalAmenities]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [ActiveAmenities]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [ShowPricing]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [LowPrice]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [HighPrice]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [UpsellListCoupon]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [UpsellPropCallRecording]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [UpsellRentListing]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [UpsellRentRewardCard]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [UpsellRentFeaturedPlacement]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [UpsellRentPTE]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [UpsellRentVIPPlacement]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [UpsellRentNoVacancy]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [UpsellRentSpotlight]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [CouponActiveOnSite]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [LastUpdateYMDID]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [LinkedFloorPlan]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [UniqueVisits]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [MapClicks]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentConnectedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentMissedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentOneWebConnectedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentOneWebMissedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentAltRegConnectedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentAltRegMissedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentMobileConnectedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentMobileMissedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentSEMConnectedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentSEMMissedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentMobileSEMConnectedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentMobileSEMMissedCalls]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [FutureConnectedCalls03]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [FutureMissedCalls03]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [RentEmailLeads]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [TruliaEmailLeads]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [FutureEmailLeads02]
GO
ALTER TABLE [Mart].[Listings] ADD  DEFAULT ((0)) FOR [InvoicedLeases]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [YMDID]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [YearMonth]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentPropertyID]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [PropertyID]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [ListingID]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [ListingTypeID]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [ListingType]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [ListingTypeShort]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentStatusID]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [ExternalID]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [ExternalPriceCode]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [TotalPhotos]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [ActivePhotos]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [TotalFloorPlans]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [ActiveFloorPlans]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [TotalAmenities]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [ActiveAmenities]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [ShowPricing]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [LowPrice]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [HighPrice]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [UpsellListCoupon]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [UpsellPropCallRecording]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [UpsellRentListing]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [UpsellRentRewardCard]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [UpsellRentFeaturedPlacement]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [UpsellRentPTE]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [UpsellRentVIPPlacement]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [UpsellRentNoVacancy]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [UpsellRentSpotlight]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [CouponActiveOnSite]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [LastUpdateYMDID]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [LinkedFloorPlan]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [UniqueVisits]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [MapClicks]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentMissedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentOneWebConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentOneWebMissedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentAltRegConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentAltRegMissedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentMobileConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentMobileMissedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentSEMConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentSEMMissedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentMobileSEMConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentMobileSEMMissedCalls]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [FutureConnectedCalls03]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [FutureMissedCalls03]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [RentEmailLeads]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [TruliaEmailLeads]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [FutureEmailLeads02]
GO
ALTER TABLE [Mart].[Listings_Legacy] ADD  DEFAULT ((0)) FOR [InvoicedLeases]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [YMDID]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [YearMonth]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentPropertyID]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [PropertyID]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [ListingID]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [ListingTypeID]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [ListingType]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [ListingTypeShort]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentStatusID]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [ExternalID]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [ExternalPriceCode]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [TotalPhotos]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [ActivePhotos]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [TotalFloorPlans]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [ActiveFloorPlans]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [TotalAmenities]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [ActiveAmenities]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [ShowPricing]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [LowPrice]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [HighPrice]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [UpsellListCoupon]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [UpsellPropCallRecording]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [UpsellRentListing]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [UpsellRentRewardCard]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [UpsellRentFeaturedPlacement]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [UpsellRentPTE]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [UpsellRentVIPPlacement]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [UpsellRentNoVacancy]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [UpsellRentSpotlight]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [CouponActiveOnSite]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [LastUpdateYMDID]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [LinkedFloorPlan]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [UniqueVisits]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [MapClicks]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentMissedCalls]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentOneWebConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentOneWebMissedCalls]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentAltRegConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentAltRegMissedCalls]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentMobileConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentMobileMissedCalls]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [FutureConnectedCalls01]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [FutureMissedCalls01]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [FutureConnectedCalls02]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [FutureMissedCalls02]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [FutureConnectedCalls03]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [FutureMissedCalls03]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [RentEmailLeads]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [TruliaEmailLeads]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [FutureEmailLeads02]
GO
ALTER TABLE [Mart].[Listings_OLD_20150528] ADD  DEFAULT ((0)) FOR [InvoicedLeases]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [YMDID]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [YearMonth]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentPropertyID]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [PropertyID]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [ListingID]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [ListingTypeID]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [ListingType]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [ListingTypeShort]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentStatusID]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [ExternalID]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [ExternalPriceCode]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [TotalPhotos]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [ActivePhotos]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [TotalFloorPlans]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [ActiveFloorPlans]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [TotalAmenities]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [ActiveAmenities]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [ShowPricing]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [LowPrice]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [HighPrice]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [UpsellListCoupon]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [UpsellPropCallRecording]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [UpsellRentListing]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [UpsellRentRewardCard]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [UpsellRentFeaturedPlacement]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [UpsellRentPTE]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [UpsellRentVIPPlacement]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [UpsellRentNoVacancy]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [UpsellRentSpotlight]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [CouponActiveOnSite]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [LastUpdateYMDID]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [LinkedFloorPlan]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [UniqueVisits]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [MapClicks]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentMissedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentOneWebConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentOneWebMissedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentAltRegConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentAltRegMissedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentMobileConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentMobileMissedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentSEMConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentSEMMissedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentMobileSEMConnectedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentMobileSEMMissedCalls]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [FutureConnectedCalls03]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [FutureMissedCalls03]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [RentEmailLeads]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [TruliaEmailLeads]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [FutureEmailLeads02]
GO
ALTER TABLE [Mart].[Listings_TEST] ADD  DEFAULT ((0)) FOR [InvoicedLeases]
GO
ALTER TABLE [Staging].[RentComUpdateSmallPropPhoneListingidCW20150714] ADD  DEFAULT ((0)) FOR [IsSmallPropInMart]
GO
ALTER TABLE [Staging].[RenterInvoice] ADD  DEFAULT (getdate()) FOR [LastDateLoaded]
GO
/****** Object:  StoredProcedure [dbo].[pr_importLeaseMatchLeads]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
*
* Name:	
*
* Desc:
*
* Test:	exec [dbo].[pr_importLeaseMatchLeads] 20130301
*
* Note:
*
* Hist:	01	03/26/2014	Richard Chen		Initial Version
*
select 'exec [dbo].[pr_importLeaseMatchLeads] '+cast(ymdid as varchar(8)) from dbautility.dimension.dates where ymdid between 20130301 and 20140325
******************************************************************************************/
CREATE PROCEDURE [dbo].[pr_importLeaseMatchLeads]
(@ymdid int)
AS 
BEGIN
 declare @sql varchar(8000)   
    
 set @sql=
		'insert into rentcom.reports.rpt_lease_match_t
		(LEADID, MGTCOID, MGTCONAME, LISTINGID, PROPERTYID, CLIENTID, PROPERTYNAME, PROPERTYCITY, PROPERTYSTATE, FIRSTNAME, LASTNAME, FULLNAME, ISCOMPANY, CONTACTMETHOD, LEADSOURCE, CONTACTDATE, ESTCONTACTDATE, EMAIL, PHONE, ISPAYPERLEASE, REVERSELOOKUPSOURCE, WHEN_ENTERED, LEADADDRESS1, LEADADDRESS2, LEADCITY, LEADSTATE, LEADZIP, LEADMOVEMONTH, [STATUS], CHANNEL)
         SELECT *
		FROM OPENQUERY(RPTPROD,''
                                 SELECT *
                                 FROM reports.rpt_lease_match_t
                                 WHERE  trunc(When_Entered) =trunc(TO_DATE(''''' +cast(@ymdid as varchar(8))+''''',''''yyyymmdd'''') )
								 and contactmethod in (''''Email'''', ''''EmailDayPhoneLookup'''', ''''EmailCommentsPhoneLookup'''',''''Call'''', ''''CallDetailCall'''',''''ReverseCall'''',''''CallDetailCall'''')
								 '') AS x'

      print @sql
	  EXEC(@sql)

END	    

/*
select * from rentcom.reports.rpt_lease_match_t
delete from rentcom.reports.rpt_lease_match_t
exec [dbo].[pr_importLeaseMatchLeads] 20130301
exec [dbo].[pr_importLeaseMatchLeads] 20130302
exec [dbo].[pr_importLeaseMatchLeads] 20130303
exec [dbo].[pr_importLeaseMatchLeads] 20130304
exec [dbo].[pr_importLeaseMatchLeads] 20130305
exec [dbo].[pr_importLeaseMatchLeads] 20130306
exec [dbo].[pr_importLeaseMatchLeads] 20130307
exec [dbo].[pr_importLeaseMatchLeads] 20130308
exec [dbo].[pr_importLeaseMatchLeads] 20130309
exec [dbo].[pr_importLeaseMatchLeads] 20130310
exec [dbo].[pr_importLeaseMatchLeads] 20130311
exec [dbo].[pr_importLeaseMatchLeads] 20130312
exec [dbo].[pr_importLeaseMatchLeads] 20130313
exec [dbo].[pr_importLeaseMatchLeads] 20130314
exec [dbo].[pr_importLeaseMatchLeads] 20130315
exec [dbo].[pr_importLeaseMatchLeads] 20130316
exec [dbo].[pr_importLeaseMatchLeads] 20130317
exec [dbo].[pr_importLeaseMatchLeads] 20130318
exec [dbo].[pr_importLeaseMatchLeads] 20130319
exec [dbo].[pr_importLeaseMatchLeads] 20130320
exec [dbo].[pr_importLeaseMatchLeads] 20130321
exec [dbo].[pr_importLeaseMatchLeads] 20130322
exec [dbo].[pr_importLeaseMatchLeads] 20130323
exec [dbo].[pr_importLeaseMatchLeads] 20130324
exec [dbo].[pr_importLeaseMatchLeads] 20130325
exec [dbo].[pr_importLeaseMatchLeads] 20130326
exec [dbo].[pr_importLeaseMatchLeads] 20130327
exec [dbo].[pr_importLeaseMatchLeads] 20130328
exec [dbo].[pr_importLeaseMatchLeads] 20130329
exec [dbo].[pr_importLeaseMatchLeads] 20130330
exec [dbo].[pr_importLeaseMatchLeads] 20130331
exec [dbo].[pr_importLeaseMatchLeads] 20130401
exec [dbo].[pr_importLeaseMatchLeads] 20130402
exec [dbo].[pr_importLeaseMatchLeads] 20130403
exec [dbo].[pr_importLeaseMatchLeads] 20130404
exec [dbo].[pr_importLeaseMatchLeads] 20130405
exec [dbo].[pr_importLeaseMatchLeads] 20130406
exec [dbo].[pr_importLeaseMatchLeads] 20130407
exec [dbo].[pr_importLeaseMatchLeads] 20130408
exec [dbo].[pr_importLeaseMatchLeads] 20130409
exec [dbo].[pr_importLeaseMatchLeads] 20130410
exec [dbo].[pr_importLeaseMatchLeads] 20130411
exec [dbo].[pr_importLeaseMatchLeads] 20130412
exec [dbo].[pr_importLeaseMatchLeads] 20130413
exec [dbo].[pr_importLeaseMatchLeads] 20130414
exec [dbo].[pr_importLeaseMatchLeads] 20130415
exec [dbo].[pr_importLeaseMatchLeads] 20130416
exec [dbo].[pr_importLeaseMatchLeads] 20130417
exec [dbo].[pr_importLeaseMatchLeads] 20130418
exec [dbo].[pr_importLeaseMatchLeads] 20130419
exec [dbo].[pr_importLeaseMatchLeads] 20130420
exec [dbo].[pr_importLeaseMatchLeads] 20130421
exec [dbo].[pr_importLeaseMatchLeads] 20130422
exec [dbo].[pr_importLeaseMatchLeads] 20130423
exec [dbo].[pr_importLeaseMatchLeads] 20130424
exec [dbo].[pr_importLeaseMatchLeads] 20130425
exec [dbo].[pr_importLeaseMatchLeads] 20130426
exec [dbo].[pr_importLeaseMatchLeads] 20130427
exec [dbo].[pr_importLeaseMatchLeads] 20130428
exec [dbo].[pr_importLeaseMatchLeads] 20130429
exec [dbo].[pr_importLeaseMatchLeads] 20130430
exec [dbo].[pr_importLeaseMatchLeads] 20130501
exec [dbo].[pr_importLeaseMatchLeads] 20130502
exec [dbo].[pr_importLeaseMatchLeads] 20130503
exec [dbo].[pr_importLeaseMatchLeads] 20130504
exec [dbo].[pr_importLeaseMatchLeads] 20130505
exec [dbo].[pr_importLeaseMatchLeads] 20130506
exec [dbo].[pr_importLeaseMatchLeads] 20130507
exec [dbo].[pr_importLeaseMatchLeads] 20130508
exec [dbo].[pr_importLeaseMatchLeads] 20130509
exec [dbo].[pr_importLeaseMatchLeads] 20130510
exec [dbo].[pr_importLeaseMatchLeads] 20130511
exec [dbo].[pr_importLeaseMatchLeads] 20130512
exec [dbo].[pr_importLeaseMatchLeads] 20130513
exec [dbo].[pr_importLeaseMatchLeads] 20130514
exec [dbo].[pr_importLeaseMatchLeads] 20130515
exec [dbo].[pr_importLeaseMatchLeads] 20130516
exec [dbo].[pr_importLeaseMatchLeads] 20130517
exec [dbo].[pr_importLeaseMatchLeads] 20130518
exec [dbo].[pr_importLeaseMatchLeads] 20130519
exec [dbo].[pr_importLeaseMatchLeads] 20130520
exec [dbo].[pr_importLeaseMatchLeads] 20130521
exec [dbo].[pr_importLeaseMatchLeads] 20130522
exec [dbo].[pr_importLeaseMatchLeads] 20130523
exec [dbo].[pr_importLeaseMatchLeads] 20130524
exec [dbo].[pr_importLeaseMatchLeads] 20130525
exec [dbo].[pr_importLeaseMatchLeads] 20130526
exec [dbo].[pr_importLeaseMatchLeads] 20130527
exec [dbo].[pr_importLeaseMatchLeads] 20130528
exec [dbo].[pr_importLeaseMatchLeads] 20130529
exec [dbo].[pr_importLeaseMatchLeads] 20130530
exec [dbo].[pr_importLeaseMatchLeads] 20130531
exec [dbo].[pr_importLeaseMatchLeads] 20130601
exec [dbo].[pr_importLeaseMatchLeads] 20130602
exec [dbo].[pr_importLeaseMatchLeads] 20130603
exec [dbo].[pr_importLeaseMatchLeads] 20130604
exec [dbo].[pr_importLeaseMatchLeads] 20130605
exec [dbo].[pr_importLeaseMatchLeads] 20130606
exec [dbo].[pr_importLeaseMatchLeads] 20130607
exec [dbo].[pr_importLeaseMatchLeads] 20130608
exec [dbo].[pr_importLeaseMatchLeads] 20130609
exec [dbo].[pr_importLeaseMatchLeads] 20130610
exec [dbo].[pr_importLeaseMatchLeads] 20130611
exec [dbo].[pr_importLeaseMatchLeads] 20130612
exec [dbo].[pr_importLeaseMatchLeads] 20130613
exec [dbo].[pr_importLeaseMatchLeads] 20130614
exec [dbo].[pr_importLeaseMatchLeads] 20130615
exec [dbo].[pr_importLeaseMatchLeads] 20130616
exec [dbo].[pr_importLeaseMatchLeads] 20130617
exec [dbo].[pr_importLeaseMatchLeads] 20130618
exec [dbo].[pr_importLeaseMatchLeads] 20130619
exec [dbo].[pr_importLeaseMatchLeads] 20130620
exec [dbo].[pr_importLeaseMatchLeads] 20130621
exec [dbo].[pr_importLeaseMatchLeads] 20130622
exec [dbo].[pr_importLeaseMatchLeads] 20130623
exec [dbo].[pr_importLeaseMatchLeads] 20130624
exec [dbo].[pr_importLeaseMatchLeads] 20130625
exec [dbo].[pr_importLeaseMatchLeads] 20130626
exec [dbo].[pr_importLeaseMatchLeads] 20130627
exec [dbo].[pr_importLeaseMatchLeads] 20130628
exec [dbo].[pr_importLeaseMatchLeads] 20130629
exec [dbo].[pr_importLeaseMatchLeads] 20130630
exec [dbo].[pr_importLeaseMatchLeads] 20130701
exec [dbo].[pr_importLeaseMatchLeads] 20130702
exec [dbo].[pr_importLeaseMatchLeads] 20130703
exec [dbo].[pr_importLeaseMatchLeads] 20130704
exec [dbo].[pr_importLeaseMatchLeads] 20130705
exec [dbo].[pr_importLeaseMatchLeads] 20130706
exec [dbo].[pr_importLeaseMatchLeads] 20130707
exec [dbo].[pr_importLeaseMatchLeads] 20130708
exec [dbo].[pr_importLeaseMatchLeads] 20130709
exec [dbo].[pr_importLeaseMatchLeads] 20130710
exec [dbo].[pr_importLeaseMatchLeads] 20130711
exec [dbo].[pr_importLeaseMatchLeads] 20130712
exec [dbo].[pr_importLeaseMatchLeads] 20130713
exec [dbo].[pr_importLeaseMatchLeads] 20130714
exec [dbo].[pr_importLeaseMatchLeads] 20130715
exec [dbo].[pr_importLeaseMatchLeads] 20130716
exec [dbo].[pr_importLeaseMatchLeads] 20130717
exec [dbo].[pr_importLeaseMatchLeads] 20130718
exec [dbo].[pr_importLeaseMatchLeads] 20130719
exec [dbo].[pr_importLeaseMatchLeads] 20130720
exec [dbo].[pr_importLeaseMatchLeads] 20130721
exec [dbo].[pr_importLeaseMatchLeads] 20130722
exec [dbo].[pr_importLeaseMatchLeads] 20130723
exec [dbo].[pr_importLeaseMatchLeads] 20130724
exec [dbo].[pr_importLeaseMatchLeads] 20130725
exec [dbo].[pr_importLeaseMatchLeads] 20130726
exec [dbo].[pr_importLeaseMatchLeads] 20130727
exec [dbo].[pr_importLeaseMatchLeads] 20130728
exec [dbo].[pr_importLeaseMatchLeads] 20130729
exec [dbo].[pr_importLeaseMatchLeads] 20130730
exec [dbo].[pr_importLeaseMatchLeads] 20130731
exec [dbo].[pr_importLeaseMatchLeads] 20130801
exec [dbo].[pr_importLeaseMatchLeads] 20130802
exec [dbo].[pr_importLeaseMatchLeads] 20130803
exec [dbo].[pr_importLeaseMatchLeads] 20130804
exec [dbo].[pr_importLeaseMatchLeads] 20130805
exec [dbo].[pr_importLeaseMatchLeads] 20130806
exec [dbo].[pr_importLeaseMatchLeads] 20130807
exec [dbo].[pr_importLeaseMatchLeads] 20130808
exec [dbo].[pr_importLeaseMatchLeads] 20130809
exec [dbo].[pr_importLeaseMatchLeads] 20130810
exec [dbo].[pr_importLeaseMatchLeads] 20130811
exec [dbo].[pr_importLeaseMatchLeads] 20130812
exec [dbo].[pr_importLeaseMatchLeads] 20130813
exec [dbo].[pr_importLeaseMatchLeads] 20130814
exec [dbo].[pr_importLeaseMatchLeads] 20130815
exec [dbo].[pr_importLeaseMatchLeads] 20130816
exec [dbo].[pr_importLeaseMatchLeads] 20130817
exec [dbo].[pr_importLeaseMatchLeads] 20130818
exec [dbo].[pr_importLeaseMatchLeads] 20130819
exec [dbo].[pr_importLeaseMatchLeads] 20130820
exec [dbo].[pr_importLeaseMatchLeads] 20130821
exec [dbo].[pr_importLeaseMatchLeads] 20130822
exec [dbo].[pr_importLeaseMatchLeads] 20130823
exec [dbo].[pr_importLeaseMatchLeads] 20130824
exec [dbo].[pr_importLeaseMatchLeads] 20130825
exec [dbo].[pr_importLeaseMatchLeads] 20130826
exec [dbo].[pr_importLeaseMatchLeads] 20130827
exec [dbo].[pr_importLeaseMatchLeads] 20130828
exec [dbo].[pr_importLeaseMatchLeads] 20130829
exec [dbo].[pr_importLeaseMatchLeads] 20130830
exec [dbo].[pr_importLeaseMatchLeads] 20130831
exec [dbo].[pr_importLeaseMatchLeads] 20130901
exec [dbo].[pr_importLeaseMatchLeads] 20130902
exec [dbo].[pr_importLeaseMatchLeads] 20130903
exec [dbo].[pr_importLeaseMatchLeads] 20130904
exec [dbo].[pr_importLeaseMatchLeads] 20130905
exec [dbo].[pr_importLeaseMatchLeads] 20130906
exec [dbo].[pr_importLeaseMatchLeads] 20130907
exec [dbo].[pr_importLeaseMatchLeads] 20130908
exec [dbo].[pr_importLeaseMatchLeads] 20130909
exec [dbo].[pr_importLeaseMatchLeads] 20130910
exec [dbo].[pr_importLeaseMatchLeads] 20130911
exec [dbo].[pr_importLeaseMatchLeads] 20130912
exec [dbo].[pr_importLeaseMatchLeads] 20130913
exec [dbo].[pr_importLeaseMatchLeads] 20130914
exec [dbo].[pr_importLeaseMatchLeads] 20130915
exec [dbo].[pr_importLeaseMatchLeads] 20130916
exec [dbo].[pr_importLeaseMatchLeads] 20130917
exec [dbo].[pr_importLeaseMatchLeads] 20130918
exec [dbo].[pr_importLeaseMatchLeads] 20130919
exec [dbo].[pr_importLeaseMatchLeads] 20130920
exec [dbo].[pr_importLeaseMatchLeads] 20130921
exec [dbo].[pr_importLeaseMatchLeads] 20130922
exec [dbo].[pr_importLeaseMatchLeads] 20130923
exec [dbo].[pr_importLeaseMatchLeads] 20130924
exec [dbo].[pr_importLeaseMatchLeads] 20130925
exec [dbo].[pr_importLeaseMatchLeads] 20130926
exec [dbo].[pr_importLeaseMatchLeads] 20130927
exec [dbo].[pr_importLeaseMatchLeads] 20130928
exec [dbo].[pr_importLeaseMatchLeads] 20130929
exec [dbo].[pr_importLeaseMatchLeads] 20130930
exec [dbo].[pr_importLeaseMatchLeads] 20131001
exec [dbo].[pr_importLeaseMatchLeads] 20131002
exec [dbo].[pr_importLeaseMatchLeads] 20131003
exec [dbo].[pr_importLeaseMatchLeads] 20131004
exec [dbo].[pr_importLeaseMatchLeads] 20131005
exec [dbo].[pr_importLeaseMatchLeads] 20131006
exec [dbo].[pr_importLeaseMatchLeads] 20131007
exec [dbo].[pr_importLeaseMatchLeads] 20131008
exec [dbo].[pr_importLeaseMatchLeads] 20131009
exec [dbo].[pr_importLeaseMatchLeads] 20131010
exec [dbo].[pr_importLeaseMatchLeads] 20131011
exec [dbo].[pr_importLeaseMatchLeads] 20131012
exec [dbo].[pr_importLeaseMatchLeads] 20131013
exec [dbo].[pr_importLeaseMatchLeads] 20131014
exec [dbo].[pr_importLeaseMatchLeads] 20131015
exec [dbo].[pr_importLeaseMatchLeads] 20131016
exec [dbo].[pr_importLeaseMatchLeads] 20131017
exec [dbo].[pr_importLeaseMatchLeads] 20131018
exec [dbo].[pr_importLeaseMatchLeads] 20131019
exec [dbo].[pr_importLeaseMatchLeads] 20131020
exec [dbo].[pr_importLeaseMatchLeads] 20131021
exec [dbo].[pr_importLeaseMatchLeads] 20131022
exec [dbo].[pr_importLeaseMatchLeads] 20131023
exec [dbo].[pr_importLeaseMatchLeads] 20131024
exec [dbo].[pr_importLeaseMatchLeads] 20131025
exec [dbo].[pr_importLeaseMatchLeads] 20131026
exec [dbo].[pr_importLeaseMatchLeads] 20131027
exec [dbo].[pr_importLeaseMatchLeads] 20131028
exec [dbo].[pr_importLeaseMatchLeads] 20131029
exec [dbo].[pr_importLeaseMatchLeads] 20131030
exec [dbo].[pr_importLeaseMatchLeads] 20131031
exec [dbo].[pr_importLeaseMatchLeads] 20131101
exec [dbo].[pr_importLeaseMatchLeads] 20131102
exec [dbo].[pr_importLeaseMatchLeads] 20131103
exec [dbo].[pr_importLeaseMatchLeads] 20131104
exec [dbo].[pr_importLeaseMatchLeads] 20131105
exec [dbo].[pr_importLeaseMatchLeads] 20131106
exec [dbo].[pr_importLeaseMatchLeads] 20131107
exec [dbo].[pr_importLeaseMatchLeads] 20131108
exec [dbo].[pr_importLeaseMatchLeads] 20131109
exec [dbo].[pr_importLeaseMatchLeads] 20131110
exec [dbo].[pr_importLeaseMatchLeads] 20131111
exec [dbo].[pr_importLeaseMatchLeads] 20131112
exec [dbo].[pr_importLeaseMatchLeads] 20131113
exec [dbo].[pr_importLeaseMatchLeads] 20131114
exec [dbo].[pr_importLeaseMatchLeads] 20131115
exec [dbo].[pr_importLeaseMatchLeads] 20131116
exec [dbo].[pr_importLeaseMatchLeads] 20131117
exec [dbo].[pr_importLeaseMatchLeads] 20131118
exec [dbo].[pr_importLeaseMatchLeads] 20131119
exec [dbo].[pr_importLeaseMatchLeads] 20131120
exec [dbo].[pr_importLeaseMatchLeads] 20131121
exec [dbo].[pr_importLeaseMatchLeads] 20131122
exec [dbo].[pr_importLeaseMatchLeads] 20131123
exec [dbo].[pr_importLeaseMatchLeads] 20131124
exec [dbo].[pr_importLeaseMatchLeads] 20131125
exec [dbo].[pr_importLeaseMatchLeads] 20131126
exec [dbo].[pr_importLeaseMatchLeads] 20131127
exec [dbo].[pr_importLeaseMatchLeads] 20131128
exec [dbo].[pr_importLeaseMatchLeads] 20131129
exec [dbo].[pr_importLeaseMatchLeads] 20131130
exec [dbo].[pr_importLeaseMatchLeads] 20131201
exec [dbo].[pr_importLeaseMatchLeads] 20131202
exec [dbo].[pr_importLeaseMatchLeads] 20131203
exec [dbo].[pr_importLeaseMatchLeads] 20131204
exec [dbo].[pr_importLeaseMatchLeads] 20131205
exec [dbo].[pr_importLeaseMatchLeads] 20131206
exec [dbo].[pr_importLeaseMatchLeads] 20131207
exec [dbo].[pr_importLeaseMatchLeads] 20131208
exec [dbo].[pr_importLeaseMatchLeads] 20131209
exec [dbo].[pr_importLeaseMatchLeads] 20131210
exec [dbo].[pr_importLeaseMatchLeads] 20131211
exec [dbo].[pr_importLeaseMatchLeads] 20131212
exec [dbo].[pr_importLeaseMatchLeads] 20131213
exec [dbo].[pr_importLeaseMatchLeads] 20131214
exec [dbo].[pr_importLeaseMatchLeads] 20131215
exec [dbo].[pr_importLeaseMatchLeads] 20131216
exec [dbo].[pr_importLeaseMatchLeads] 20131217
exec [dbo].[pr_importLeaseMatchLeads] 20131218
exec [dbo].[pr_importLeaseMatchLeads] 20131219
exec [dbo].[pr_importLeaseMatchLeads] 20131220
exec [dbo].[pr_importLeaseMatchLeads] 20131221
exec [dbo].[pr_importLeaseMatchLeads] 20131222
exec [dbo].[pr_importLeaseMatchLeads] 20131223
exec [dbo].[pr_importLeaseMatchLeads] 20131224
exec [dbo].[pr_importLeaseMatchLeads] 20131225
exec [dbo].[pr_importLeaseMatchLeads] 20131226
exec [dbo].[pr_importLeaseMatchLeads] 20131227
exec [dbo].[pr_importLeaseMatchLeads] 20131228
exec [dbo].[pr_importLeaseMatchLeads] 20131229
exec [dbo].[pr_importLeaseMatchLeads] 20131230
exec [dbo].[pr_importLeaseMatchLeads] 20131231
exec [dbo].[pr_importLeaseMatchLeads] 20140101
exec [dbo].[pr_importLeaseMatchLeads] 20140102
exec [dbo].[pr_importLeaseMatchLeads] 20140103
exec [dbo].[pr_importLeaseMatchLeads] 20140104
exec [dbo].[pr_importLeaseMatchLeads] 20140105
exec [dbo].[pr_importLeaseMatchLeads] 20140106
exec [dbo].[pr_importLeaseMatchLeads] 20140107
exec [dbo].[pr_importLeaseMatchLeads] 20140108
exec [dbo].[pr_importLeaseMatchLeads] 20140109
exec [dbo].[pr_importLeaseMatchLeads] 20140110
exec [dbo].[pr_importLeaseMatchLeads] 20140111
exec [dbo].[pr_importLeaseMatchLeads] 20140112
exec [dbo].[pr_importLeaseMatchLeads] 20140113
exec [dbo].[pr_importLeaseMatchLeads] 20140114
exec [dbo].[pr_importLeaseMatchLeads] 20140115
exec [dbo].[pr_importLeaseMatchLeads] 20140116
exec [dbo].[pr_importLeaseMatchLeads] 20140117
exec [dbo].[pr_importLeaseMatchLeads] 20140118
exec [dbo].[pr_importLeaseMatchLeads] 20140119
exec [dbo].[pr_importLeaseMatchLeads] 20140120
exec [dbo].[pr_importLeaseMatchLeads] 20140121
exec [dbo].[pr_importLeaseMatchLeads] 20140122
exec [dbo].[pr_importLeaseMatchLeads] 20140123
exec [dbo].[pr_importLeaseMatchLeads] 20140124
exec [dbo].[pr_importLeaseMatchLeads] 20140125
exec [dbo].[pr_importLeaseMatchLeads] 20140126
exec [dbo].[pr_importLeaseMatchLeads] 20140127
exec [dbo].[pr_importLeaseMatchLeads] 20140128
exec [dbo].[pr_importLeaseMatchLeads] 20140129
exec [dbo].[pr_importLeaseMatchLeads] 20140130
exec [dbo].[pr_importLeaseMatchLeads] 20140131
exec [dbo].[pr_importLeaseMatchLeads] 20140201
exec [dbo].[pr_importLeaseMatchLeads] 20140202
exec [dbo].[pr_importLeaseMatchLeads] 20140203
exec [dbo].[pr_importLeaseMatchLeads] 20140204
exec [dbo].[pr_importLeaseMatchLeads] 20140205
exec [dbo].[pr_importLeaseMatchLeads] 20140206
exec [dbo].[pr_importLeaseMatchLeads] 20140207
exec [dbo].[pr_importLeaseMatchLeads] 20140208
exec [dbo].[pr_importLeaseMatchLeads] 20140209
exec [dbo].[pr_importLeaseMatchLeads] 20140210
exec [dbo].[pr_importLeaseMatchLeads] 20140211
exec [dbo].[pr_importLeaseMatchLeads] 20140212
exec [dbo].[pr_importLeaseMatchLeads] 20140213
exec [dbo].[pr_importLeaseMatchLeads] 20140214
exec [dbo].[pr_importLeaseMatchLeads] 20140215
exec [dbo].[pr_importLeaseMatchLeads] 20140216
exec [dbo].[pr_importLeaseMatchLeads] 20140217
exec [dbo].[pr_importLeaseMatchLeads] 20140218
exec [dbo].[pr_importLeaseMatchLeads] 20140219
exec [dbo].[pr_importLeaseMatchLeads] 20140220
exec [dbo].[pr_importLeaseMatchLeads] 20140221
exec [dbo].[pr_importLeaseMatchLeads] 20140222
exec [dbo].[pr_importLeaseMatchLeads] 20140223
exec [dbo].[pr_importLeaseMatchLeads] 20140224
exec [dbo].[pr_importLeaseMatchLeads] 20140225
exec [dbo].[pr_importLeaseMatchLeads] 20140226
exec [dbo].[pr_importLeaseMatchLeads] 20140227
exec [dbo].[pr_importLeaseMatchLeads] 20140228
exec [dbo].[pr_importLeaseMatchLeads] 20140301
exec [dbo].[pr_importLeaseMatchLeads] 20140302
exec [dbo].[pr_importLeaseMatchLeads] 20140303
exec [dbo].[pr_importLeaseMatchLeads] 20140304
exec [dbo].[pr_importLeaseMatchLeads] 20140305
exec [dbo].[pr_importLeaseMatchLeads] 20140306
exec [dbo].[pr_importLeaseMatchLeads] 20140307
exec [dbo].[pr_importLeaseMatchLeads] 20140308
exec [dbo].[pr_importLeaseMatchLeads] 20140309
exec [dbo].[pr_importLeaseMatchLeads] 20140310
exec [dbo].[pr_importLeaseMatchLeads] 20140311
exec [dbo].[pr_importLeaseMatchLeads] 20140312
exec [dbo].[pr_importLeaseMatchLeads] 20140313
exec [dbo].[pr_importLeaseMatchLeads] 20140314
exec [dbo].[pr_importLeaseMatchLeads] 20140315
exec [dbo].[pr_importLeaseMatchLeads] 20140316
exec [dbo].[pr_importLeaseMatchLeads] 20140317
exec [dbo].[pr_importLeaseMatchLeads] 20140318
exec [dbo].[pr_importLeaseMatchLeads] 20140319
exec [dbo].[pr_importLeaseMatchLeads] 20140320
exec [dbo].[pr_importLeaseMatchLeads] 20140321
exec [dbo].[pr_importLeaseMatchLeads] 20140322
exec [dbo].[pr_importLeaseMatchLeads] 20140323
exec [dbo].[pr_importLeaseMatchLeads] 20140324
exec [dbo].[pr_importLeaseMatchLeads] 20140325
*/        

GO
/****** Object:  StoredProcedure [dbo].[tbl_dim_lease_status_dates_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[tbl_dim_lease_status_dates_merge]
AS 

/*************************************************************************************
Proc Name:  dbo.tbl_dim_lease_status_dates_merge
Desc:       Merge in any new status change to Valid
--------------------------------------------------------------------------------------
Run Proc:   EXEC dbo.tbl_dim_lease_status_dates_merge

select * from RentCom..LeaseStatusDates  where statusdate >= '04/08/2013'

--------------------------------------------------------------------------------------
History:
01  Mary Pollard    20130408     Initial Version
*************************************************************************************/
SET NOCOUNT ON;

  ----------------------------------------------
  -- Declare & Set Variable(s)
  ----------------------------------------------
  DECLARE @ymdid int,
          @statusDate date

  SELECT @YMDID = CONVERT(int,CONVERT(varchar,getdate(),112))
  SELECT @statusDate = CONVERT(date,getdate())


    ----------------------------------------------
    -- Get any leases changed to Valid (in the last 8 days)
    ----------------------------------------------
	INSERT INTO RentCom..LeaseStatusDates (
           YMDID,
           LeaseID,
           Status,
           StatusDate)
    SELECT @YMDID,
           leases.LeaseID,
           leases.Status,
           CONVERT(date,leases.UpdateDate) StatusDate
    FROM   RentCom.dimension.Lease leases
           LEFT JOIN RentCom..LeaseStatusDates leaseStatus
             ON	leases.LeaseID = leaseStatus.LeaseID
           --INNER JOIN (SELECT LeaseID
           --            FROM   OPENQUERY(renterdb,
           --                  'SELECT LeaseID
           --                   FROM   renter.Lease lease
           --                   WHERE  lease.leasestatusreasonid = 26 ')  --->Valid Leases
           --            ) ValidLeases
           --   ON leases.LeaseID = ValidLeases.LeaseID
    WHERE  leases.Status = 'Valid'
    AND    IsNULL(leases.Status,'') <> IsNULL(leaseStatus.Status,'')
    AND    leases.UpdateDate >= DATEADD(dd,-8,getdate())



SET NOCOUNT OFF;





GO
/****** Object:  StoredProcedure [dbo].[tbl_mdim_property_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[tbl_mdim_property_merge] (@YMDID INT = NULL)
AS 
/***********************************************************************************************************************
* Name:    dbo.tbl_mdim_property_merge
* -----------------------------------------------------------------------------------------------------------------------
* Desc:   This is a copy of the Reports.Tbl_MDim_Property table on RPTProd. This is Rents version of Mart.Listings we have 
*            on the ApartmentGuide site. This is Marted data. We are only checking for updates to this table in the past
*            week
* -----------------------------------------------------------------------------------------------------------------------
* Test: EXEC dbo.tbl_mdim_property_merge

select top 10 * from staging.tbl_mdim_property
select max(ymdid) from Mart.MDimProperty with (nolock)
* -----------------------------------------------------------------------------------------------------------------------
* Note: 
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 
* 01    Shetal Gandhi   11/25/2013     Ticket 13903 - Initial Version
* 02    Mary Pollard    01/16/2014     (1) Changed UNIQUEVISITS_FORFUTUREUSE1 to UNIQUEVISITS_VIP do to this column being 
*                                          renamed from Rent's side, causing our job to fail.
*                                      (2) Added ConnectedCalls as new column do to Rent adding this to the MDIM table
***********************************************************************************************************************/
SET NOCOUNT ON

--------------------------------------------------------------------------
---- Declare & Set Variables
--------------------------------------------------------------------------
DECLARE @DatabaseName VARCHAR(128);
DECLARE @SecondsStr VARCHAR(300);
DECLARE @LastDateTime DATETIME;

DECLARE @SQL VARCHAR(8000);
DECLARE @YMDWEEKEARLIER VARCHAR(15); 
DECLARE @YMDIDCHAR VARCHAR(15);

SET @DatabaseName = DB_NAME()

IF @YMDID IS NOT NULL 
    BEGIN
        SET @YMDIDCHAR = CAST(REPLACE(CONVERT(VARCHAR(11),   CAST(CAST(@YMDID AS VARCHAR) AS DATE) , 106), ' ', '-') AS VARCHAR);
        SET @YMDWEEKEARLIER = CAST(REPLACE(CONVERT(VARCHAR(11),    DATEADD(d,-2,CAST(@YMDID AS VARCHAR) ), 106), ' ', '-') AS VARCHAR)-- check  data for 2 days only
    END
    
IF @YMDID IS NULL 
    BEGIN
        SET @YMDIDCHAR = CAST(REPLACE(CONVERT(VARCHAR(11), GETDATE()-1, 106), ' ', '-') AS VARCHAR)
        SET @YMDWEEKEARLIER = CAST(REPLACE(CONVERT(VARCHAR(11), GETDATE()-7, 106), ' ', '-') AS VARCHAR);
    END
    

    -- Patch to use Todays parse data or load previous parsed data from Archived Parsed Data
    EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
        @DatabaseName
       ,'APTG Staging.pr_tbl_mdim_property'
       ,'START Staging Table Load'
       ,'0 Seconds'
       ,0
       ,'Starting';

    
-- Rent is 3 hours behind us so add 3 hours to their datetimes

--------------------------------------------------------------------------
---- Clear out the staging table
--------------------------------------------------------------------------
TRUNCATE TABLE staging.tbl_mdim_property;

--------------------------------------------------------------------------
---- Build the select statment to run against RPTPROD
--------------------------------------------------------------------------
SET @SQL = N'
SELECT 
  cast(convert(varchar(8), RECORD_CREATE_DM, 112) as INT) as YMDID ,*
FROM OPENQUERY (RPTPROD,''select  
RECORD_CREATE_DM ,PROPERTY_CREATE_DM  ,PROPERTY_UPDATE_DM  ,PROPERTY_TERMINATE_DM  ,PROPERTY_ID,UNIVERSAL_ID  ,EXTERNAL_ID,TYPE_NM ,TOTALUNITS_NB ,ACTIVE_UNITS_AT  
,UPSELLLISTSENIORLISTING,TOTAL_AMENITIES  ,ACTIVE_AMENITIES ,TOTAL_PHOTOS  ,ACTIVE_PHOTOS ,TOTAL_FLOOR_PLANS,ACTIVE_FLOOR_PLANS  ,UPSELLPROPRENTALSFEATURED ,UPSELLLISTFLOORPLANUPGRADE
,UPSELLLISTPAYPERLEAD,ISRENTALPROPTOBEDELETED,LISTINGSTATUSID  ,UPSELLLISTHIGHLIGHTED  ,UPSELLLISTCOUPON ,UPSELLPROPEMERICAL  ,UPSELLPROPFEATURECOMMPLATINUM,UPSELLPROPFEATURECOMMGOLD 
,UPSELLPROPFEATURECOMMSILVER  ,UPSELLPROPVIRTUALBROCHURE ,UPSELLLISTCORPORATELISTING,UPSELLLISTCOLLEGELISTING  ,UPSELLLISTMILITARYLISTING ,UPSELLLISTAPARTMENTLISTING
,UPSELLPROPPHOTOUPGRADE ,UPSELLMGMTCOLOGODISPLAY,UPSELLPROPLOGODISPLAY  ,UPSELLPROPPREMIUMUPGRADE  ,UPSELLPROPVIDEOSPOKESMODEL,UPSELLPROPFRONTPAGE ,UPSELLPROPSPANISH,UPSELLPROPCALLRECORDING
,UPSELLPROPFROMTOPHONE  ,UPSELLPROPRENTALSPREMIER  ,UPSELLPROPRENTALSLISTING  ,UPSELLLISTRENTALSSPOTLIGHTED ,UPSELLLISTSPOTLIGHT ,UPSELLLISTPAYPERLEASE  ,UPSELLLISTDIAMONDCITY  
,UPSELLLISTDIAMONDMAX,UPSELLLISTRENTALSSTANDARD ,UPSELLLISTCOMMUNITYCAROUSEL  ,UPSELLLIST30SECONDVIDEO,UPSELLLIST60SECONDVIDEO,UPSELLLISTRENTALSCAROUSEL ,UPSELLLISTRENTALSSTANDARDPLUS
,UPSELLLISTMOBILESPOTLIGHT ,UPSELLPROPMOBILEDEAL,UPSELLPROPDYNAMICLEADFORM ,UPSELLLISTINCOMERESTRICTED,UPSELLLISTPETFRIENDLY  ,UPSELLLISTLUXURYCOMMUNITY ,UPSELLPROPREPMON ,UPSELLPROPSOCIALMEDIAMAN  
,FUTUREUPSELL03,FUTUREUPSELL04,FUTUREUPSELL05,FUTUREUPSELL06,FUTUREUPSELL07,FUTUREUPSELL08,LOWPRICE,HIGHPRICE  ,ISSEM,ISOVERTHRESHOLD  ,CALLTRACKINGINBOOK  ,COUPONACTIVEONSITE  
,VERIZONFIOS,ATTUVERSE  ,DIRECTTV,BRIGHTHOUSE,CHARTER ,XFINITYSP  ,XFINITYDP  ,XFINITYTP  ,TIMEWARNER ,NUMERICRANK, UNIQUEVISITS_FL  ,UNIQUEVISITS_PTE ,UNIQUEVISITS_NONE,UNIQUEVISITS_MOBILE,UNIQUEVISITS_VIP
,UNIQUEVISITS_FORFUTUREUSE2,UNIQUEVISITS_FORFUTUREUSE3,UNIQUEVISITS_FORFUTUREUSE4,UNIQUEVISITS_FORFUTUREUSE5
,VIEWSLISTINGPAGE ,VIEWSLISTINGPAGE_MOBILE,VIEWSLISTINGPAGE_FORFUTUREUSE1  ,VIEWSLISTINGPAGE_FORFUTUREUSE2  ,VIEWSLISTINGPAGE_FORFUTUREUSE3  ,VIEWSLISTINGPAGE_FORFUTUREUSE4  ,VIEWSLISTINGPAGE_FORFUTUREUSE5  
,VIEWSEMERCIAL ,VIEWSVIRTUALBROCHURE,CLICKSSPOTLIGHTLISTING ,CLICKSSPOTLIGHTCOMMUNITYVIDEO,CLICKSLISTINGWEBLINK,CLICKSMGTCOWEBLINK  
,CLICKSONLINEAPPT ,CLICKSONLINEAPPTSUBMIT ,CLICKSONLINEAPPL ,CLICKSONLINEAPPLSUBMIT ,CLICKSONLINEAPPTCR  ,CLICKSONLINEAPPLCR  
,CLICKSSPOTLIGHTLEADSUBMISSION,CLICKSWECANCALLYOU  ,CLICKSLEADSUBMISSION,CLICKSPHONESUBMISSION  ,CLICKSCOMMUNITYVIDEO,CLICKSLISTINGMAP ,CLICKSMAPDIRECTIONS ,CLICKSPRINTABLEGUIDE,CLICKSPHOTOS  
,CLICKSSPOTLIGHTPHOTOS  ,CLICKSSPOTLIGHTPHOTOPOPUP ,CLICKSFLOORPLAN  ,CLICKSCHECKYOURCREDIT  ,CLICKSWEBBUILDERLINK,CLICKSFEATUREDMGTCO ,CLICKSFRONTPAGEPROPLEAD,CLICKSLUXURYSLIDESHOW  
,IMPRSEARCHRESULTS,TOTAL_IMPRESSIONS,IMPREFRONTCOVER  ,IMPRVISITCOUNT,VIEWING_FROM_EMAIL  ,TOTAL_VIEWINGS,TEXTMSGWEB ,TEXTMSGMOBILE 
,CHECKLISTINGAVAIL,CHECKSSPOTLIGHTLISTINGAVAIL  ,CHECKSVIRTUALTOURLISTINGAVAIL,AGCPRINTCONNECTEDCALLS ,AGCPRINTMISSEDCALLS ,ASGPRINTCONNECTEDCALLS ,ASGPRINTMISSEDCALLS 
,WEBCONNECTEDCALLS,WEBMISSEDCALLS,RENTALSCONNECTEDCALLS  ,RENTALSMISSEDCALLS  ,CTCONNECTEDCALLS ,CTCMISSEDCALLS,PAIDSPCONNECTEDCALLS,PAIDSPMISSEDCALLS
,COMBINEDFEEDSCONNECTEDCALLS  ,COMBINEDFEEDSMISSEDCALLS  ,GOOGLECONNECTEDCALLS,GOOGLEMISSEDCALLS,PPCCONNECTEDCALLS,PPCMISSEDCALLS,LUXURYCONNECTEDCALLS,LUXURYMISSEDCALLS,MARCHEXCONNECTEDCALLS  ,MARCHEXMISSEDCALLS  
,CRAIGSLISTCONNECTEDCALLS  ,CRAIGSLISTMISSEDCALLS  ,WEBLOCALTRACKNUMCONNECTCALLS ,WEBLOCALTRACKNUMMISSEDCALLS  ,RENTALSLOCALCONNECTEDCALLS,RENTALSLOCALMISSEDCALLS,VIDEOCONNECTEDCALLS 
,VIDEOMISSEDCALLS ,SEMCONNECTEDCALLS,SEMMISSEDCALLS,TRULIACONNECTEDCALLS,TRULIAMISSEDCALLS
,FUTURECONNECTEDCALLS01 ,FUTUREMISSEDCALLS01 ,FUTURECONNECTEDCALLS02 ,FUTUREMISSEDCALLS02 ,FUTURECONNECTEDCALLS03 ,FUTUREMISSEDCALLS03 ,FUTURECONNECTEDCALLS04 ,FUTUREMISSEDCALLS04 
,FUTURECONNECTEDCALLS05 ,FUTUREMISSEDCALLS05 ,FUTURECONNECTEDCALLS06 ,FUTUREMISSEDCALLS06 ,FUTURECONNECTEDCALLS07 ,FUTUREMISSEDCALLS07 ,FUTURECONNECTEDCALLS08 ,FUTUREMISSEDCALLS08 
,FUTURECONNECTEDCALLS09 ,FUTUREMISSEDCALLS09 ,FUTURECONNECTEDCALLS10 ,FUTUREMISSEDCALLS10 
,AGEMAILLEADS  ,MAETROEMAILLEADS ,NEIGHBORHOODEMAILLEADS ,AIMCOEMAILLEADS  ,RENTALSEMAILLEADS,RENTAREMAILLEADS ,RENTALHOUSESEMAILLEADS ,IPHONEEMAILLEADS ,OODLEEMAILLEADS  
,ANDROIDEMAILLEADS,HOTPADSEMAILLEADS,LUXURYEMAILLEADS ,CONDOEMAILLEADS  ,IPADEMAILLEADS,TRULIAEMAILLEADS ,ZILLOWEMAILLEADS ,VERTICALBRANDSEMAILLEADS  ,RDTFEEDLEADS  ,PROPSOLUTIONSFEEDLEADS 
,YIELDFEEDLEADS,AGMOBILEEMAILLEADS  ,RENTALSMOBILEEMAILLEADS,RENTALSANDROIDEMAILLEADS  ,RENTALSIPHONEEMAILLEADS,VASTEMAILLEADS,CAMPUSHOMESONLINEEMAILLEADS  ,AGTABLETEMAILLEADS  ,AGKINDLEEMAILLEADS  
,FUTURE1EMAILLEADS,FUTURE2EMAILLEADS,FUTURE3EMAILLEADS,FUTURE4EMAILLEADS,FUTURE5EMAILLEADS,FUTURE6EMAILLEADS,FUTURE7EMAILLEADS,FUTURE8EMAILLEADS,FUTURE9EMAILLEADS,FUTURE0EMAILLEADS
,PLACEMENTTIER ,PRINTPRODUCTPOINTS  ,INTERNETPRODUCTPOINTS  ,LEGACYLOYALTYPOINTS ,CONTRACTLOYALTYPOINTS  ,LASTUPDATEYMDID  ,UPSELLLISTBOLD,UPSELLLISTFRONTCOVER,UPSELLPROPPHOTOFEATURE 
,UPSELLMGMTMANAGEMENTCOLOGO,UPSELLPROPPROPERTYLOGO ,UPSELLPROPPREMIUMPACKAGE  ,UPSELLLISTFLOORPLANPKG ,LINKEDFLOORPLAN  ,INTERNETPHONELEADS  ,INTERNETPHONELEADS_NOMOBILE  
,DIGITALPHONELEADS,EMAILLEADS ,INTERNETEMAILLEADS_NOMOBILE  ,DIGITALEMAILLEADS,AGCMISSEDCALLS,ASGMISSEDCALLS,AGCALLLEADS,ASGALLLEADS,ALLMISSEDCALLS,ALLCONNECTEDCALLS
,ALLLEADS,ALLINTERNETLEADS_NOMOBILE ,ALLDIGITALLEADS  ,THIRDPARTYFEEDLEADS ,WEBSITECALLS  ,WEBSITEEMAILS ,WEBSITELEADS_RENTALS,MOBILEEMAILS  ,MOBILECALLS,MOBILELEADS_AG
,MOBILELEADS_RENTALS ,MOBILEALLLEADS,MRSYNDICATIONEMAILLEADS,MRAGEMAILLEADS,MRAGWEBPHONELEADS,MRAPPSEMAILLEADS ,MRPHONECALLS  ,RPLRANK 
,PROPERTY_NM,MARKET_NM  ,CITY_NM ,STATE_CD,SEARCH_RANK,PAGE_IN_SEARCH,UPGRADE_TP ,UPGRADE_MONTHLY_COST,UPGRADE_START_DATE  ,UPGRADE_END_DATE 
,NATURAL_IMPRESSIONS ,FEATURED_IMPRESSIONS,NATURAL_VIEWINGS ,FEATURED_VIEWINGS,NATURAL_HOTLEADS ,FEATURED_HOTLEADS,TOTAL_PHONECALL  ,NATURAL_PHONECALLS  ,FEATURED_PHONECALLS 
,TOTAL_HOTLEAD ,NATURAL_NRL,FEATURED_NRL  ,TOTAL_LEASES  ,MARKET_NB  ,PAID_LEASES,AVG_CALL_DURATION,COMPANY_NM ,COMPANY_ID ,SUCCESS_FEE
,VIP_IMPRESSIONS  ,VIP_VIEWINGS  ,VIP_HOTLEADS  ,VIP_PHONECALLS,VIP_NRL ,PTE_IMPRESSIONS  ,PTE_VIEWINGS  ,PTE_HOTLEADS  ,PTE_PHONECALLS,PTE_NRL 
,PROPERTY_STATUS  ,PHONE_CD,PROPERTY_ADDRESS ,FAX_CD  ,EMAIL_NM,HOTLEADEMAIL_ID  ,HOTLEADFAX_ID ,UNIQUE_HOTLEADS  ,UNIQUE_VIEWINGS  ,UNIQUE_PDP_OVERVIEWS
,BILLING_ADDRESS  ,BILLING_CITY  ,BILLING_STATE ,BILLING_ZIP,BILLING_EMAIL ,BILLING_PHONE ,BILLING_FAX,LEASE_FAXED,LEASE_EMAILED ,SUBMARKET_NB  ,SUBMARKET_NM  ,AREA_NM 
,IMAGE_INCLUDED,SPECIALS,MAIN_IMAGE_AVAILABLE,FLOORPLAN_AVAILABLE ,LOGO_AVAILABLE,LAST_VIRTUAL_UPLOAD ,SEARCHABLE ,UNIQUE_HOTLEADERS,NATURAL_SEARCHERS,FEATURED_SEARCHERS  
,NATURAL_VIEWERS  ,FEATURED_VIEWERS ,NATURAL_HOTLEADERS  ,FEATURED_HOTLEADERS ,TOTAL_HOTLEADERS ,TOTAL_PHONECALLERS  ,FEATURED_PHONECALLERS  ,NATURAL_PHONECALLERS,BUSINESSMODEL_TP ,ACTIVATE_DM,CONNECTEDCALLS
from reports.tbl_mdim_property
where record_create_dm between to_date(''''' + @YMDWEEKEARLIER + ''''',''''DD-MON-YYYY'''')  and to_date(''''' + @YMDIDCHAR + ''''',''''DD-MON-YYYY'''') 
'')'
--PRINT @SQL


--------------------------------------------------------------------------
---- Run the select and insert it into the staging table
--------------------------------------------------------------------------
INSERT INTO staging.tbl_mdim_property
(YMDID,RECORD_CREATE_DM ,PROPERTY_CREATE_DM  ,PROPERTY_UPDATE_DM  ,PROPERTY_TERMINATE_DM  ,PROPERTY_ID,UNIVERSAL_ID  ,EXTERNAL_ID,TYPE_NM ,TOTALUNITS_NB ,ACTIVE_UNITS_AT  
,UPSELLLISTSENIORLISTING,TOTAL_AMENITIES  ,ACTIVE_AMENITIES ,TOTAL_PHOTOS  ,ACTIVE_PHOTOS ,TOTAL_FLOOR_PLANS,ACTIVE_FLOOR_PLANS  ,UPSELLPROPRENTALSFEATURED ,UPSELLLISTFLOORPLANUPGRADE
,UPSELLLISTPAYPERLEAD,ISRENTALPROPTOBEDELETED,LISTINGSTATUSID  ,UPSELLLISTHIGHLIGHTED  ,UPSELLLISTCOUPON ,UPSELLPROPEMERICAL  ,UPSELLPROPFEATURECOMMPLATINUM,UPSELLPROPFEATURECOMMGOLD 
,UPSELLPROPFEATURECOMMSILVER  ,UPSELLPROPVIRTUALBROCHURE ,UPSELLLISTCORPORATELISTING,UPSELLLISTCOLLEGELISTING  ,UPSELLLISTMILITARYLISTING ,UPSELLLISTAPARTMENTLISTING
,UPSELLPROPPHOTOUPGRADE ,UPSELLMGMTCOLOGODISPLAY,UPSELLPROPLOGODISPLAY  ,UPSELLPROPPREMIUMUPGRADE  ,UPSELLPROPVIDEOSPOKESMODEL,UPSELLPROPFRONTPAGE ,UPSELLPROPSPANISH,UPSELLPROPCALLRECORDING
,UPSELLPROPFROMTOPHONE  ,UPSELLPROPRENTALSPREMIER  ,UPSELLPROPRENTALSLISTING  ,UPSELLLISTRENTALSSPOTLIGHTED ,UPSELLLISTSPOTLIGHT ,UPSELLLISTPAYPERLEASE  ,UPSELLLISTDIAMONDCITY  
,UPSELLLISTDIAMONDMAX,UPSELLLISTRENTALSSTANDARD ,UPSELLLISTCOMMUNITYCAROUSEL  ,UPSELLLIST30SECONDVIDEO,UPSELLLIST60SECONDVIDEO,UPSELLLISTRENTALSCAROUSEL ,UPSELLLISTRENTALSSTANDARDPLUS
,UPSELLLISTMOBILESPOTLIGHT ,UPSELLPROPMOBILEDEAL,UPSELLPROPDYNAMICLEADFORM ,UPSELLLISTINCOMERESTRICTED,UPSELLLISTPETFRIENDLY  ,UPSELLLISTLUXURYCOMMUNITY ,UPSELLPROPREPMON ,UPSELLPROPSOCIALMEDIAMAN  
,FUTUREUPSELL03,FUTUREUPSELL04,FUTUREUPSELL05,FUTUREUPSELL06,FUTUREUPSELL07,FUTUREUPSELL08,LOWPRICE,HIGHPRICE  ,ISSEM,ISOVERTHRESHOLD  ,CALLTRACKINGINBOOK  ,COUPONACTIVEONSITE  
,VERIZONFIOS,ATTUVERSE  ,DIRECTTV,BRIGHTHOUSE,CHARTER ,XFINITYSP  ,XFINITYDP  ,XFINITYTP  ,TIMEWARNER ,NUMERICRANK, UNIQUEVISITS_FL  ,UNIQUEVISITS_PTE ,UNIQUEVISITS_NONE,UNIQUEVISITS_MOBILE,UNIQUEVISITS_VIP
,UNIQUEVISITS_FORFUTUREUSE2,UNIQUEVISITS_FORFUTUREUSE3,UNIQUEVISITS_FORFUTUREUSE4,UNIQUEVISITS_FORFUTUREUSE5
,VIEWSLISTINGPAGE ,VIEWSLISTINGPAGE_MOBILE,VIEWSLISTINGPAGE_FORFUTUREUSE1  ,VIEWSLISTINGPAGE_FORFUTUREUSE2  ,VIEWSLISTINGPAGE_FORFUTUREUSE3  ,VIEWSLISTINGPAGE_FORFUTUREUSE4  ,VIEWSLISTINGPAGE_FORFUTUREUSE5  
,VIEWSEMERCIAL ,VIEWSVIRTUALBROCHURE,CLICKSSPOTLIGHTLISTING ,CLICKSSPOTLIGHTCOMMUNITYVIDEO,CLICKSLISTINGWEBLINK,CLICKSMGTCOWEBLINK  
,CLICKSONLINEAPPT ,CLICKSONLINEAPPTSUBMIT ,CLICKSONLINEAPPL ,CLICKSONLINEAPPLSUBMIT ,CLICKSONLINEAPPTCR  ,CLICKSONLINEAPPLCR  
,CLICKSSPOTLIGHTLEADSUBMISSION,CLICKSWECANCALLYOU  ,CLICKSLEADSUBMISSION,CLICKSPHONESUBMISSION  ,CLICKSCOMMUNITYVIDEO,CLICKSLISTINGMAP ,CLICKSMAPDIRECTIONS ,CLICKSPRINTABLEGUIDE,CLICKSPHOTOS  
,CLICKSSPOTLIGHTPHOTOS  ,CLICKSSPOTLIGHTPHOTOPOPUP ,CLICKSFLOORPLAN  ,CLICKSCHECKYOURCREDIT  ,CLICKSWEBBUILDERLINK,CLICKSFEATUREDMGTCO ,CLICKSFRONTPAGEPROPLEAD,CLICKSLUXURYSLIDESHOW  
,IMPRSEARCHRESULTS,TOTAL_IMPRESSIONS,IMPREFRONTCOVER  ,IMPRVISITCOUNT,VIEWING_FROM_EMAIL  ,TOTAL_VIEWINGS,TEXTMSGWEB ,TEXTMSGMOBILE 
,CHECKLISTINGAVAIL,CHECKSSPOTLIGHTLISTINGAVAIL  ,CHECKSVIRTUALTOURLISTINGAVAIL,AGCPRINTCONNECTEDCALLS ,AGCPRINTMISSEDCALLS ,ASGPRINTCONNECTEDCALLS ,ASGPRINTMISSEDCALLS 
,WEBCONNECTEDCALLS,WEBMISSEDCALLS,RENTALSCONNECTEDCALLS  ,RENTALSMISSEDCALLS  ,CTCONNECTEDCALLS ,CTCMISSEDCALLS,PAIDSPCONNECTEDCALLS,PAIDSPMISSEDCALLS
,COMBINEDFEEDSCONNECTEDCALLS  ,COMBINEDFEEDSMISSEDCALLS  ,GOOGLECONNECTEDCALLS,GOOGLEMISSEDCALLS,PPCCONNECTEDCALLS,PPCMISSEDCALLS,LUXURYCONNECTEDCALLS,LUXURYMISSEDCALLS,MARCHEXCONNECTEDCALLS  ,MARCHEXMISSEDCALLS  
,CRAIGSLISTCONNECTEDCALLS  ,CRAIGSLISTMISSEDCALLS  ,WEBLOCALTRACKNUMCONNECTCALLS ,WEBLOCALTRACKNUMMISSEDCALLS  ,RENTALSLOCALCONNECTEDCALLS,RENTALSLOCALMISSEDCALLS,VIDEOCONNECTEDCALLS 
,VIDEOMISSEDCALLS ,SEMCONNECTEDCALLS,SEMMISSEDCALLS,TRULIACONNECTEDCALLS,TRULIAMISSEDCALLS
,FUTURECONNECTEDCALLS01 ,FUTUREMISSEDCALLS01 ,FUTURECONNECTEDCALLS02 ,FUTUREMISSEDCALLS02 ,FUTURECONNECTEDCALLS03 ,FUTUREMISSEDCALLS03 ,FUTURECONNECTEDCALLS04 ,FUTUREMISSEDCALLS04 
,FUTURECONNECTEDCALLS05 ,FUTUREMISSEDCALLS05 ,FUTURECONNECTEDCALLS06 ,FUTUREMISSEDCALLS06 ,FUTURECONNECTEDCALLS07 ,FUTUREMISSEDCALLS07 ,FUTURECONNECTEDCALLS08 ,FUTUREMISSEDCALLS08 
,FUTURECONNECTEDCALLS09 ,FUTUREMISSEDCALLS09 ,FUTURECONNECTEDCALLS10 ,FUTUREMISSEDCALLS10 
,AGEMAILLEADS  ,MAETROEMAILLEADS ,NEIGHBORHOODEMAILLEADS ,AIMCOEMAILLEADS  ,RENTALSEMAILLEADS,RENTAREMAILLEADS ,RENTALHOUSESEMAILLEADS ,IPHONEEMAILLEADS ,OODLEEMAILLEADS  
,ANDROIDEMAILLEADS,HOTPADSEMAILLEADS,LUXURYEMAILLEADS ,CONDOEMAILLEADS  ,IPADEMAILLEADS,TRULIAEMAILLEADS ,ZILLOWEMAILLEADS ,VERTICALBRANDSEMAILLEADS  ,RDTFEEDLEADS  ,PROPSOLUTIONSFEEDLEADS 
,YIELDFEEDLEADS,AGMOBILEEMAILLEADS  ,RENTALSMOBILEEMAILLEADS,RENTALSANDROIDEMAILLEADS  ,RENTALSIPHONEEMAILLEADS,VASTEMAILLEADS,CAMPUSHOMESONLINEEMAILLEADS  ,AGTABLETEMAILLEADS  ,AGKINDLEEMAILLEADS  
,FUTURE1EMAILLEADS,FUTURE2EMAILLEADS,FUTURE3EMAILLEADS,FUTURE4EMAILLEADS,FUTURE5EMAILLEADS,FUTURE6EMAILLEADS,FUTURE7EMAILLEADS,FUTURE8EMAILLEADS,FUTURE9EMAILLEADS,FUTURE0EMAILLEADS
,PLACEMENTTIER ,PRINTPRODUCTPOINTS  ,INTERNETPRODUCTPOINTS  ,LEGACYLOYALTYPOINTS ,CONTRACTLOYALTYPOINTS  ,LASTUPDATEYMDID  ,UPSELLLISTBOLD,UPSELLLISTFRONTCOVER,UPSELLPROPPHOTOFEATURE 
,UPSELLMGMTMANAGEMENTCOLOGO,UPSELLPROPPROPERTYLOGO ,UPSELLPROPPREMIUMPACKAGE  ,UPSELLLISTFLOORPLANPKG ,LINKEDFLOORPLAN  ,INTERNETPHONELEADS  ,INTERNETPHONELEADS_NOMOBILE  
,DIGITALPHONELEADS,EMAILLEADS ,INTERNETEMAILLEADS_NOMOBILE  ,DIGITALEMAILLEADS,AGCMISSEDCALLS,ASGMISSEDCALLS,AGCALLLEADS,ASGALLLEADS,ALLMISSEDCALLS,ALLCONNECTEDCALLS
,ALLLEADS,ALLINTERNETLEADS_NOMOBILE ,ALLDIGITALLEADS  ,THIRDPARTYFEEDLEADS ,WEBSITECALLS  ,WEBSITEEMAILS ,WEBSITELEADS_RENTALS,MOBILEEMAILS  ,MOBILECALLS,MOBILELEADS_AG
,MOBILELEADS_RENTALS ,MOBILEALLLEADS,MRSYNDICATIONEMAILLEADS,MRAGEMAILLEADS,MRAGWEBPHONELEADS,MRAPPSEMAILLEADS ,MRPHONECALLS  ,RPLRANK 
,PROPERTY_NM,MARKET_NM  ,CITY_NM ,STATE_CD,SEARCH_RANK,PAGE_IN_SEARCH,UPGRADE_TP ,UPGRADE_MONTHLY_COST,UPGRADE_START_DATE  ,UPGRADE_END_DATE 
,NATURAL_IMPRESSIONS ,FEATURED_IMPRESSIONS,NATURAL_VIEWINGS ,FEATURED_VIEWINGS,NATURAL_HOTLEADS ,FEATURED_HOTLEADS,TOTAL_PHONECALL  ,NATURAL_PHONECALLS  ,FEATURED_PHONECALLS 
,TOTAL_HOTLEAD ,NATURAL_NRL,FEATURED_NRL  ,TOTAL_LEASES  ,MARKET_NB  ,PAID_LEASES,AVG_CALL_DURATION,COMPANY_NM ,COMPANY_ID ,SUCCESS_FEE
,VIP_IMPRESSIONS  ,VIP_VIEWINGS  ,VIP_HOTLEADS  ,VIP_PHONECALLS,VIP_NRL ,PTE_IMPRESSIONS  ,PTE_VIEWINGS  ,PTE_HOTLEADS  ,PTE_PHONECALLS,PTE_NRL 
,PROPERTY_STATUS  ,PHONE_CD,PROPERTY_ADDRESS ,FAX_CD  ,EMAIL_NM,HOTLEADEMAIL_ID  ,HOTLEADFAX_ID ,UNIQUE_HOTLEADS  ,UNIQUE_VIEWINGS  ,UNIQUE_PDP_OVERVIEWS
,BILLING_ADDRESS  ,BILLING_CITY  ,BILLING_STATE ,BILLING_ZIP,BILLING_EMAIL ,BILLING_PHONE ,BILLING_FAX,LEASE_FAXED,LEASE_EMAILED ,SUBMARKET_NB  ,SUBMARKET_NM  ,AREA_NM 
,IMAGE_INCLUDED,SPECIALS,MAIN_IMAGE_AVAILABLE,FLOORPLAN_AVAILABLE ,LOGO_AVAILABLE,LAST_VIRTUAL_UPLOAD ,SEARCHABLE ,UNIQUE_HOTLEADERS,NATURAL_SEARCHERS,FEATURED_SEARCHERS  
,NATURAL_VIEWERS  ,FEATURED_VIEWERS ,NATURAL_HOTLEADERS  ,FEATURED_HOTLEADERS ,TOTAL_HOTLEADERS ,TOTAL_PHONECALLERS  ,FEATURED_PHONECALLERS  ,NATURAL_PHONECALLERS,BUSINESSMODEL_TP ,ACTIVATE_DM,CONNECTEDCALLS)
EXEC(@SQL)

        --where trunc(record_create_dm) between ''''' + @YMDWEEKEARLIER + ''''' and ''''' + @YMDIDCHAR + '''''
        SET @SecondsStr = CAST(DATEDIFF(ss,@lastdatetime,GETDATE()) AS VARCHAR(300)) + ' Seconds';

        EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
            @DatabaseName
            ,'APTG Staging.pr_tbl_mdim_property'
            ,'End Staging Table Load'
            ,@SecondsStr
            ,0
            ,'End'

        EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
            @DatabaseName
            ,'APTG Staging.pr_tbl_mdim_property'
            ,'START Mart.MDimProperty Table Load'
            ,'0 Seconds'
            ,0
            ,'Starting';

        DECLARE @TimeZoneOffset INT = 3

        --------------------------------------------------------------------------
        ---- Merge in results from staging table into the marted table when any
        ----    of the fields are new or changed
        --------------------------------------------------------------------------
        MERGE INTO Mart.MDimProperty AS mp
        USING Staging.tbl_mdim_property AS sp
                ON  sp.ymdid = mp.ymdid
                AND sp.Property_ID = mp.PropertyID
                WHEN MATCHED 
        AND mp.PropertyCreateDate                      <> DATEADD(hour,@TimeZoneOffset, sp.property_create_dm)
        OR mp.PropertyUpdateDate                       <> DATEADD(hour,@TimeZoneOffset, sp.property_update_dm)
        OR mp.PropertyTerminateDate                    <> DATEADD(hour,@TimeZoneOffset, sp.property_terminate_dm)
        OR mp.PropertyID                               <> CAST (sp.property_id AS INT)
        OR mp.UniversalID                              <> sp.universal_id
        OR mp.ExternalID                               <> sp.external_id
        OR mp.Type                                     <> sp.type_nm
        OR mp.TotalUnits                               <> CAST(sp.totalunits_nb AS INT)
        OR mp.ActiveUnitsAmount                        <> CAST(sp.active_units_at AS INT)
        OR mp.UpsellListSeniorListing                  <> CAST(sp.upselllistseniorlisting AS INT)
        OR mp.TotalAmenities                           <> CAST(sp.total_amenities AS INT)
        OR mp.ActiveAmenities                          <> CAST(sp.active_amenities AS INT)
        OR mp.TotalPhotos                              <> CAST(sp.total_photos AS INT)
        OR mp.ActivePhotos                             <> CAST(sp.active_photos AS INT)
        OR mp.TotalFloorPlans                          <> CAST(sp.total_floor_plans AS INT)
        OR mp.ActiveFloorPlans                         <> CAST(sp.active_floor_plans AS INT)
        OR mp.UpsellPropRentalsFeatured                <> CAST(sp.upsellproprentalsfeatured AS INT)
        OR mp.UpsellListFloorPlanUpgrade               <> CAST(sp.upselllistfloorplanupgrade AS INT)
        OR mp.UpsellListPayPerLead                     <> CAST(sp.upselllistpayperlead AS INT)
        OR mp.ISRentalPropToBeDeleted                  <> CAST(sp.isrentalproptobedeleted AS INT)
        OR mp.ListingStatusID                          <> sp.listingstatusid
        OR mp.UpsellListHighlighted                    <> CAST(sp.upselllisthighlighted  AS INT)
        OR mp.UpsellListCoupon                         <> CAST(sp.upselllistcoupon  AS INT)
        OR mp.UpsellPropEmerical                       <> CAST(sp.upsellpropemerical  AS INT)
        OR mp.UpsellPropFeatureCommPlatinum            <> CAST(sp.upsellpropfeaturecommplatinum  AS INT)
        OR mp.UpsellPropFeatureCommGold                <> CAST(sp.upsellpropfeaturecommgold  AS INT)
        OR mp.UpsellPropFeatureCommSilver              <> CAST(sp.upsellpropfeaturecommsilver  AS INT)
        OR mp.UpsellPropVirtualBrochure                <> CAST(sp.upsellpropvirtualbrochure  AS INT)
        OR mp.UpsellListCorporateListing               <> CAST(sp.upselllistcorporatelisting  AS INT)
        OR mp.UpsellListCollegeListing                 <> CAST(sp.upselllistcollegelisting   AS INT)
        OR mp.UpsellListMilitaryListing                <> CAST(sp.upselllistmilitarylisting   AS INT)
        OR mp.UpsellListApartmentListing               <> CAST(sp.upselllistapartmentlisting   AS INT)
        OR mp.UpsellPropPhotoUpgrade                   <> CAST(sp.upsellpropphotoupgrade   AS INT)
        OR mp.UpsellMgmtCoLogoDisplay                  <> CAST(sp.upsellmgmtcologodisplay   AS INT)
        OR mp.UpsellPropLogoDisplay                    <> CAST(sp.upsellproplogodisplay   AS INT)
        OR mp.UpsellPropPremiumUpgrade                 <> CAST(sp.upsellproppremiumupgrade   AS INT)
        OR mp.UpsellPropVideoSpokesModel               <> CAST(sp.upsellpropvideospokesmodel   AS INT)
        OR mp.UpsellPropFrontPage                      <> CAST(sp.upsellpropfrontpage   AS INT)
        OR mp.UpsellPropSpanish                        <> CAST(sp.upsellpropspanish   AS INT)
        OR mp.UpsellPropCallRecording                  <> CAST(sp.upsellpropcallrecording   AS INT)
        OR mp.UpsellPropFromToPhone                    <> CAST(sp.upsellpropfromtophone   AS INT)
        OR mp.UpsellPropRentalsPremier                 <> CAST(sp.upsellproprentalspremier   AS INT)
        OR mp.UpsellPropRentalsListing                 <> CAST(sp.upsellproprentalslisting   AS INT)
        OR mp.UpsellListRentalsSpotlighted             <> CAST(sp.upselllistrentalsspotlighted   AS INT)
        OR mp.UpsellListSpotlight                      <> CAST(sp.upselllistspotlight            AS INT)
        OR mp.UpsellListPayPerLease                    <> CAST(sp.upselllistpayperlease            AS INT)
        OR mp.UpsellListDiamondCity                    <> CAST(sp.upselllistdiamondcity            AS INT)
        OR mp.UpsellListDiamondMax                     <> CAST(sp.upselllistdiamondmax            AS INT)
        OR mp.UpsellListRentalsStandard                <> CAST(sp.upselllistrentalsstandard          AS INT)
        OR mp.UpsellListCommunityCarousel              <> CAST(sp.upselllistcommunitycarousel        AS INT)  
        OR mp.UpsellList30SecondVideo                  <> CAST(sp.upselllist30secondvideo            AS INT)
        OR mp.UpsellList60SecondVideo                  <> CAST(sp.upselllist60secondvideo            AS INT)
        OR mp.UpsellListRentalsCarousel                <> CAST(sp.upselllistrentalscarousel          AS INT)
        OR mp.UpsellListRentalsStandardPlus            <> CAST(sp.upselllistrentalsstandardplus      AS INT)    
        OR mp.UpsellListMobileSpotlight                <> CAST(sp.upselllistmobilespotlight          AS INT)
        OR mp.UpsellPropMobileDeal                     <> CAST(sp.upsellpropmobiledeal            AS INT)
        OR mp.UpsellPropDynamicLeadForm                <> CAST(sp.upsellpropdynamicleadform          AS INT)
        OR mp.UpsellListIncomeRestricted               <> CAST(sp.upselllistincomerestricted         AS INT) 
        OR mp.UpsellListPetFriendly                    <> CAST(sp.upselllistpetfriendly            AS INT)
        OR mp.UpsellListLuxuryCommunity                <> CAST(sp.upselllistluxurycommunity          AS INT)
        OR mp.UpsellPropRepmon                         <> CAST(sp.upsellproprepmon            AS INT)
        OR mp.UpsellPropSocialMediaMan                 <> CAST(sp.upsellpropsocialmediaman           AS INT)
        OR mp.FutureUpsell03                           <> CAST(sp.futureupsell03            AS INT)
        OR mp.FutureUpsell04                           <> CAST(sp.futureupsell04            AS INT)
        OR mp.FutureUpsell05                           <> CAST(sp.futureupsell05            AS INT)
        OR mp.FutureUpsell06                           <> CAST(sp.futureupsell06            AS INT)
        OR mp.FutureUpsell07                           <> CAST(sp.futureupsell07            AS INT)
        OR mp.FutureUpsell08                           <> CAST(sp.futureupsell08            AS INT)
        OR mp.LowPrice                                 <> CAST(sp.lowprice AS NUMERIC(15,2))
        OR mp.Highprice                                <> CAST(sp.highprice  AS NUMERIC(15,2))
        OR mp.ISSem                                    <> CAST(sp.issem  AS INT)
        OR mp.ISOverThreshold                          <> CAST(sp.isoverthreshold  AS INT)
        OR mp.CallTrackingInBook                       <> CAST(sp.calltrackinginbook  AS INT)
        OR mp.CouponActiveOnSite                       <> CAST(sp.couponactiveonsite  AS INT)
        OR mp.VerizonFios                              <> CAST(sp.verizonfios  AS INT)
        OR mp.ATTUverse                                <> CAST(sp.attuverse  AS INT)
        OR mp.DirectTV                                 <> CAST(sp.directtv  AS INT)
        OR mp.BrightHouse                              <> CAST(sp.brighthouse  AS INT)
        OR mp.Charter                                  <> CAST(sp.charter  AS INT)
        OR mp.Xfinitysp                                <> CAST(sp.xfinitysp  AS INT)
        OR mp.Xfinitydp                                <> CAST(sp.xfinitydp  AS INT)
        OR mp.Xfinitytp                                <> CAST(sp.xfinitytp  AS INT)
        OR mp.TimeWarner                               <> CAST(sp.timewarner  AS INT)
        OR mp.NumericRank                              <> CAST(sp.numericrank  AS INT)
        OR mp.UniqueVisits_FL                          <> CAST(sp.uniquevisits_fl  AS INT)
        OR mp.UniqueVisits_PTE                         <> CAST(sp.uniquevisits_pte  AS INT)
        OR mp.UniqueVisits_None                        <> CAST(sp.uniquevisits_none  AS INT)
        OR mp.UniqueVisits_Mobile                      <> CAST(sp.uniquevisits_mobile  AS INT)
        OR mp.UniqueVisits_VIP                         <> CAST(sp.uniquevisits_VIP  AS INT)
        OR mp.UniqueVisits_ForFutureUse2               <> CAST(sp.uniquevisits_forfutureuse2  AS INT)
        OR mp.UniqueVisits_ForFutureUse3               <> CAST(sp.uniquevisits_forfutureuse3  AS INT)
        OR mp.UniqueVisits_ForFutureUse4               <> CAST(sp.uniquevisits_forfutureuse4  AS INT)
        OR mp.UniqueVisits_ForFutureUse5               <> CAST(sp.uniquevisits_forfutureuse5  AS INT)
        OR mp.ViewsListingPage                         <> CAST(sp.viewslistingpage  AS INT)
        OR mp.ViewsListingPage_Mobile                  <> CAST(sp.viewslistingpage_mobile  AS INT)
        OR mp.ViewsListingPage_ForFutureUse1           <> CAST(sp.viewslistingpage_forfutureuse1  AS INT)
        OR mp.ViewsListingPage_ForFutureUse2           <> CAST(sp.viewslistingpage_forfutureuse2  AS INT)
        OR mp.ViewsListingPage_ForFutureUse3           <> CAST(sp.viewslistingpage_forfutureuse3  AS INT)
        OR mp.ViewsListingPage_ForFutureUse4           <> CAST(sp.viewslistingpage_forfutureuse4  AS INT)
        OR mp.ViewsListingPage_ForFutureUse5           <> CAST(sp.viewslistingpage_forfutureuse5 AS INT)
        OR mp.ViewsEmercial                            <> CAST(sp.viewsemercial  AS INT)
        OR mp.ViewsVirtualBrochure                     <> CAST(sp.viewsvirtualbrochure  AS INT)
        OR mp.ClicksSpotlightListing                   <> CAST(sp.clicksspotlightlisting  AS INT)
        OR mp.ClicksSpotlightCommunityVideo            <> CAST(sp.clicksspotlightcommunityvideo  AS INT)
        OR mp.ClicksListingWebLink                     <> CAST(sp.clickslistingweblink  AS INT)
        OR mp.ClicksMgtcoWebLink                       <> CAST(sp.clicksmgtcoweblink  AS INT)
        OR mp.ClicksOnlineAppt                         <> CAST(sp.clicksonlineappt  AS INT)
        OR mp.ClicksOnlineApptSubmit                   <> CAST(sp.clicksonlineapptsubmit  AS INT)
        OR mp.ClicksOnlineAppl                         <> CAST(sp.clicksonlineappl  AS INT)
        OR mp.ClicksOnlineApplSubmit                   <> CAST(sp.clicksonlineapplsubmit  AS INT)
        OR mp.ClicksOnlineApptCR                       <> CAST(sp.clicksonlineapptcr  AS INT)
        OR mp.ClicksOnlineApplCR                       <> CAST(sp.clicksonlineapplcr  AS INT)
        OR mp.ClicksSpotlightLeadSubmission            <> CAST(sp.clicksspotlightleadsubmission  AS INT)
        OR mp.ClicksWeCanCallYou                       <> CAST(sp.clickswecancallyou  AS INT)
        OR mp.ClicksLeadSubmission                     <> CAST(sp.clicksleadsubmission  AS INT)
        OR mp.ClicksPhoneSubmission                    <> CAST(sp.clicksphonesubmission  AS INT)
        OR mp.ClicksCommunityVideo                     <> CAST(sp.clickscommunityvideo  AS INT)
        OR mp.ClicksListingMap                         <> CAST(sp.clickslistingmap  AS INT)
        OR mp.ClicksMapDirections                      <> CAST(sp.clicksmapdirections  AS INT)
        OR mp.ClicksPrintableGuide                     <> CAST(sp.clicksprintableguide  AS INT)
        OR mp.ClicksPhotos                             <> CAST(sp.clicksphotos  AS INT)
        OR mp.ClicksSpotlightPhotos                    <> CAST(sp.clicksspotlightphotos  AS INT)
        OR mp.ClicksSpotlightPhotoPopup                <> CAST(sp.clicksspotlightphotopopup  AS INT)
        OR mp.ClicksFloorPlan                          <> CAST(sp.clicksfloorplan  AS INT)
        OR mp.ClicksCheckYourCredit                    <> CAST(sp.clickscheckyourcredit  AS INT)
        OR mp.ClicksWebBuilderLink                     <> CAST(sp.clickswebbuilderlink  AS INT)
        OR mp.ClicksFeaturedMgtCo                      <> CAST(sp.clicksfeaturedmgtco  AS INT)
        OR mp.ClicksFrontPagePropLead                  <> CAST(sp.clicksfrontpageproplead  AS INT)
        OR mp.ClicksLuxurySlideShow                    <> CAST(sp.clicksluxuryslideshow  AS INT)
        OR mp.ImprSearchResults                        <> CAST(sp.imprsearchresults  AS INT)
        OR mp.TotalImpressions                         <> CAST(sp.total_impressions  AS INT)
        OR mp.ImpreFrontCover                          <> CAST(sp.imprefrontcover  AS INT)
        OR mp.ImprVisitCount                           <> CAST(sp.imprvisitcount  AS INT)
        OR mp.ViewingFromEmail                         <> CAST(sp.viewing_from_email  AS INT)
        OR mp.TotalViewings                            <> CAST(sp.total_viewings  AS INT)
        OR mp.TextMsgWeb                               <> CAST(sp.textmsgweb  AS INT)
        OR mp.TextMsgMobile                            <> CAST(sp.textmsgmobile  AS INT)
        OR mp.CheckListingAvail                        <> CAST(sp.checklistingavail  AS INT)
        OR mp.ChecksSpotLightListingAvail              <> CAST(sp.checksspotlightlistingavail  AS INT)
        OR mp.ChecksVirtualtourListingAvail            <> CAST(sp.checksvirtualtourlistingavail  AS INT)
        OR mp.AgcPrintConnectedCalls                   <> CAST(sp.agcprintconnectedcalls  AS INT)
        OR mp.AgcPrintMissedCalls                      <> CAST(sp.agcprintmissedcalls  AS INT)
        OR mp.AsgPrintConnectedCalls                   <> CAST(sp.asgprintconnectedcalls  AS INT)
        OR mp.AsgPrintMissedCalls                      <> CAST(sp.asgprintmissedcalls  AS INT)
        OR mp.WebConnectedCalls                        <> CAST(sp.webconnectedcalls  AS INT)
        OR mp.WebMissedCalls                           <> CAST(sp.webmissedcalls  AS INT)
        OR mp.RentalsConnectedCalls                    <> CAST(sp.rentalsconnectedcalls  AS INT)
        OR mp.RentalsMissedCalls                       <> CAST(sp.rentalsmissedcalls  AS INT)
        OR mp.CTCConnectedCalls                        <> CAST(sp.ctconnectedcalls  AS INT)
        OR mp.CTCMissedCalls                           <> CAST(sp.ctcmissedcalls  AS INT)
        OR mp.PaidSPConnectedCalls                     <> CAST(sp.paidspconnectedcalls  AS INT)
        OR mp.PaidSPMissedCalls                        <> CAST(sp.paidspmissedcalls  AS INT)
        OR mp.CombinedFeedsConnectedCalls              <> CAST(sp.combinedfeedsconnectedcalls  AS INT)
        OR mp.CombinedFeedsMissedCalls                 <> CAST(sp.combinedfeedsmissedcalls  AS INT)
        OR mp.GoogleConnectedCalls                     <> CAST(sp.googleconnectedcalls  AS INT)
        OR mp.GoogleMissedCalls                        <> CAST(sp.googlemissedcalls  AS INT)
        OR mp.PPCConnectedCalls                        <> CAST(sp.ppcconnectedcalls  AS INT)
        OR mp.PPCMissedCalls                           <> CAST(sp.ppcmissedcalls  AS INT)
        OR mp.LuxuryConnectedCalls                     <> CAST(sp.luxuryconnectedcalls  AS INT)
        OR mp.LuxuryMissedCalls                        <> CAST(sp.luxurymissedcalls  AS INT)
        OR mp.MarchexConnectedCalls                    <> CAST(sp.marchexconnectedcalls  AS INT)
        OR mp.MarchexMissedCalls                       <> CAST(sp.marchexmissedcalls  AS INT)
        OR mp.CraigsListConnectedCalls                 <> CAST(sp.craigslistconnectedcalls  AS INT)
        OR mp.CraigsListMissedCalls                    <> CAST(sp.craigslistmissedcalls  AS INT)
        OR mp.WebLocalTrackingNumberConnectedCalls     <> CAST(sp.weblocaltracknumconnectcalls  AS INT)
        OR mp.WebLocalTrackingNumberMissedCalls        <> CAST(sp.weblocaltracknummissedcalls  AS INT)
        OR mp.RentalsLocalConnectedCalls               <> CAST(sp.rentalslocalconnectedcalls  AS INT)
        OR mp.RentalsLocalMissedCalls                  <> CAST(sp.rentalslocalmissedcalls  AS INT)
        OR mp.VideoConnectedCalls                      <> CAST(sp.videoconnectedcalls  AS INT)
        OR mp.VideoMissedCalls                         <> CAST(sp.videomissedcalls  AS INT)
        OR mp.SEMConnectedCalls                        <> CAST(sp.semconnectedcalls  AS INT)
        OR mp.SEMMissedCalls                           <> CAST(sp.semmissedcalls  AS INT)
        OR mp.TruliaConnectedCalls                     <> CAST(sp.truliaconnectedcalls  AS INT)
        OR mp.TruliaMissedCalls                        <> CAST(sp.truliamissedcalls  AS INT)
        OR mp.FutureConnectedCalls01                   <> CAST(sp.futureconnectedcalls01  AS INT)
        OR mp.FutureMissedCalls01                      <> CAST(sp.futuremissedcalls01  AS INT)
        OR mp.FutureConnectedCalls02                   <> CAST(sp.futureconnectedcalls02  AS INT)
        OR mp.FutureMissedCalls02                      <> CAST(sp.futuremissedcalls02  AS INT)
        OR mp.FutureConnectedCalls03                   <> CAST(sp.futureconnectedcalls03  AS INT)
        OR mp.FutureMissedCalls03                      <> CAST(sp.futuremissedcalls03  AS INT)
        OR mp.FutureConnectedCalls04                   <> CAST(sp.futureconnectedcalls04  AS INT)
        OR mp.FutureMissedCalls04                      <> CAST(sp.futuremissedcalls04  AS INT)
        OR mp.FutureConnectedCalls05                   <> CAST(sp.futureconnectedcalls05  AS INT)
        OR mp.FutureMissedCalls05                      <> CAST(sp.futuremissedcalls05  AS INT)
        OR mp.FutureConnectedCalls06                   <> CAST(sp.futureconnectedcalls06  AS INT)
        OR mp.FutureMissedCalls06                      <> CAST(sp.futuremissedcalls06  AS INT)
        OR mp.FutureConnectedCalls07                   <> CAST(sp.futureconnectedcalls07  AS INT)
        OR mp.FutureMissedCalls07                      <> CAST(sp.futuremissedcalls07  AS INT)
        OR mp.FutureConnectedCalls08                   <> CAST(sp.futureconnectedcalls08  AS INT)
        OR mp.FutureMissedCalls08                      <> CAST(sp.futuremissedcalls08  AS INT)
        OR mp.FutureConnectedCalls09                   <> CAST(sp.futureconnectedcalls09  AS INT)
        OR mp.FutureMissedCalls09                      <> CAST(sp.futuremissedcalls09  AS INT)
        OR mp.FutureConnectedCalls10                   <> CAST(sp.futureconnectedcalls10  AS INT)
        OR mp.FutureMissedCalls10                      <> CAST(sp.futuremissedcalls10  AS INT)
        OR mp.AGEmailLeads                             <> CAST(sp.agemailleads  AS INT)
        OR mp.MetroEmailLeads                          <> CAST(sp.maetroemailleads  AS INT)
        OR mp.NeighborhoodEmailLeads                   <> CAST(sp.neighborhoodemailleads  AS INT)
        OR mp.AIMCOEmailLeads                          <> CAST(sp.aimcoemailleads  AS INT)
        OR mp.RentalsEmailLeads                        <> CAST(sp.rentalsemailleads  AS INT)
        OR mp.RentarEmailLeads                         <> CAST(sp.rentaremailleads  AS INT)
        OR mp.RentalHousesEmailLeads                   <> CAST(sp.rentalhousesemailleads  AS INT)
        OR mp.iPhoneEmailLeads                         <> CAST(sp.iphoneemailleads  AS INT)
        OR mp.OodleEmailLeads                          <> CAST(sp.oodleemailleads  AS INT)
        OR mp.AndroidEmailLeads                        <> CAST(sp.androidemailleads  AS INT)
        OR mp.HotpadsEmailLeads                        <> CAST(sp.hotpadsemailleads  AS INT)
        OR mp.LuxuryEmailLeads                         <> CAST(sp.luxuryemailleads  AS INT)
        OR mp.CondoEmailLeads                          <> CAST(sp.condoemailleads  AS INT)
        OR mp.iPadEmailLeads                           <> CAST(sp.ipademailleads  AS INT)
        OR mp.TruliaEmailLeads                         <> CAST(sp.truliaemailleads  AS INT)
        OR mp.ZillowEmailLeads                         <> CAST(sp.zillowemailleads  AS INT)
        OR mp.VerticalbrandsEmailLeads                 <> CAST(sp.verticalbrandsemailleads  AS INT)
        OR mp.RDTFeedLeads                             <> CAST(sp.rdtfeedleads  AS INT)
        OR mp.PropSolutionsFeedLeads                   <> CAST(sp.propsolutionsfeedleads  AS INT)
        OR mp.YieldFeedLeads                           <> CAST(sp.yieldfeedleads  AS INT)
        OR mp.AGMobileEmailLeads                       <> CAST(sp.agmobileemailleads  AS INT)
        OR mp.RentalsMobileEmailLeads                  <> CAST(sp.rentalsmobileemailleads  AS INT)
        OR mp.RentalsAndroidEmailLeads                 <> CAST(sp.rentalsandroidemailleads  AS INT)
        OR mp.RentalsiPhoneEmailLeads                  <> CAST(sp.rentalsiphoneemailleads  AS INT)
        OR mp.VastEmailLeads                           <> CAST(sp.vastemailleads  AS INT)
        OR mp.CampusHomesOnlineEmailLeads              <> CAST(sp.campushomesonlineemailleads  AS INT)
        OR mp.AGTabletEmailLeads                       <> CAST(sp.agtabletemailleads  AS INT)
        OR mp.AGKindleEmailLeads                       <> CAST(sp.agkindleemailleads  AS INT)
        OR mp.Future1EmailLeads                        <> CAST(sp.future1emailleads  AS INT)
        OR mp.Future2EmailLeads                        <> CAST(sp.future2emailleads  AS INT)
        OR mp.Future3EmailLeads                        <> CAST(sp.future3emailleads  AS INT)
        OR mp.Future4EmailLeads                        <> CAST(sp.future4emailleads  AS INT)
        OR mp.Future5EmailLeads                        <> CAST(sp.future5emailleads  AS INT)
        OR mp.Future6EmailLeads                        <> CAST(sp.future6emailleads  AS INT)
        OR mp.Future7EmailLeads                        <> CAST(sp.future7emailleads  AS INT)
        OR mp.Future8EmailLeads                        <> CAST(sp.future8emailleads  AS INT)
        OR mp.Future9EmailLeads                        <> CAST(sp.future9emailleads  AS INT)
        OR mp.Future0EmailLeads                        <> CAST(sp.future0emailleads  AS INT)
        OR mp.PlacementTier                            <> CAST(sp.placementtier  AS INT)
        OR mp.PrintProductPoints                       <> CAST(sp.printproductpoints  AS INT)
        OR mp.InternetProductPoints                    <> CAST(sp.internetproductpoints  AS INT)
        OR mp.LegacyLoyaltyPoints                      <> CAST(sp.legacyloyaltypoints  AS INT)
        OR mp.ContractLoyaltyPoints                    <> CAST(sp.contractloyaltypoints  AS INT)
        OR mp.LastUpdateYMDID                          <> CAST(sp.lastupdateymdid  AS INT)
        OR mp.UpsellListBold                           <> CAST(sp.upselllistbold  AS INT)
        OR mp.UpsellListFrontCover                     <> CAST(sp.upselllistfrontcover  AS INT)
        OR mp.UpsellPropPhotoFeature                   <> CAST(sp.upsellpropphotofeature  AS INT)
        OR mp.UpsellMgmtManagementCoLogo               <> CAST(sp.upsellmgmtmanagementcologo  AS INT)
        OR mp.UpsellPropPropertyLogo                   <> CAST(sp.upsellproppropertylogo  AS INT)
        OR mp.UpsellPropPremiumPackage                 <> CAST(sp.upsellproppremiumpackage  AS INT)
        OR mp.UpsellListFloorPlanPkg                   <> CAST(sp.upselllistfloorplanpkg  AS INT)
        OR mp.LinkedFloorPlan                          <> CAST(sp.linkedfloorplan  AS INT)
        OR mp.InternetPhoneLeads                       <> CAST(sp.internetphoneleads  AS INT)
        OR mp.InternetPhoneLeads_NoMobile              <> CAST(sp.internetphoneleads_nomobile  AS INT)
        OR mp.DigitalPhoneLeads                        <> CAST(sp.digitalphoneleads  AS INT)
        OR mp.EmailLeads                               <> CAST(sp.emailleads  AS INT)
        OR mp.InternetEmailLeads_NoMobile              <> CAST(sp.internetemailleads_nomobile  AS INT)
        OR mp.DigitalEmailLeads                        <> CAST(sp.digitalemailleads  AS INT)
        OR mp.AGCMissedCalls                           <> CAST(sp.agcmissedcalls  AS INT)
        OR mp.ASGMissedCalls                           <> CAST(sp.asgmissedcalls  AS INT)
        OR mp.AGCAllLeads                              <> CAST(sp.agcallleads  AS INT)
        OR mp.ASGAllLeads                              <> CAST(sp.asgallleads  AS INT)
        OR mp.AllMissedCalls                           <> CAST(sp.allmissedcalls  AS INT)
        OR mp.AllConnectedCalls                        <> CAST(sp.allconnectedcalls  AS INT)
        OR mp.AllLeads                                 <> CAST(sp.allleads  AS INT)
        OR mp.AllInternetLeads_NoMobile                <> CAST(sp.allinternetleads_nomobile  AS INT)
        OR mp.AllDigitalLeads                          <> CAST(sp.alldigitalleads  AS INT)
        OR mp.ThirdPartyFeedLeads                      <> CAST(sp.thirdpartyfeedleads  AS INT)
        OR mp.WebsiteCalls                             <> CAST(sp.websitecalls  AS INT)
        OR mp.WebsiteEmails                            <> CAST(sp.websiteemails  AS INT)
        OR mp.WebsiteLeads_Rentals                     <> CAST(sp.websiteleads_rentals  AS INT)
        OR mp.MobileEmails                             <> CAST(sp.mobileemails  AS INT)
        OR mp.MobileCalls                              <> CAST(sp.mobilecalls  AS INT)
        OR mp.MobileLeads_AG                           <> CAST(sp.mobileleads_ag  AS INT)
        OR mp.MobileLeads_Rentals                      <> CAST(sp.mobileleads_rentals  AS INT)
        OR mp.MobileAllLeads                           <> CAST(sp.mobileallleads  AS INT)
        OR mp.MRSyndicationEmailLeads                  <> CAST(sp.mrsyndicationemailleads  AS INT)
        OR mp.MRAGEmailLeads                           <> CAST(sp.mragemailleads  AS INT)
        OR mp.MRAGWebPhoneLeads                        <> CAST(sp.mragwebphoneleads  AS INT)
        OR mp.MRAppsEmailLeads                         <> CAST(sp.mrappsemailleads  AS INT)
        OR mp.MRPhonecalls                             <> CAST(sp.mrphonecalls  AS INT)
        OR mp.RPLRank                                  <> CAST(sp.rplrank  AS INT)
        OR mp.PropertyName                             <> sp.property_nm
        OR mp.MarketName                               <> sp.market_nm
        OR mp.CityName                                 <> sp.city_nm
        OR mp.State                                    <> sp.state_cd
        OR mp.SearchRank                               <> CAST(sp.search_rank AS INT)
        OR mp.PageInSearch                             <> CAST(sp.page_in_search  AS INT)
        OR mp.UpgradeType                              <> sp.upgrade_tp
        OR mp.UpgradeMonthlyCost                       <> CAST(sp.upgrade_monthly_cost AS numeric(10,2))
        OR mp.UpgradeStartDate                         <> sp.upgrade_start_date
        OR mp.UpgradeEndDate                           <> sp.upgrade_end_date
        OR mp.NaturalImpressions                       <> CAST(sp.natural_impressions     AS INT)
        OR mp.FeaturedImpressions                      <> CAST(sp.featured_impressions   AS INT)
        OR mp.NaturalViewings                          <> CAST(sp.natural_viewings   AS INT)
        OR mp.FeaturedViewings                         <> CAST(sp.featured_viewings   AS INT)
        OR mp.NaturalHotLeads                          <> CAST(sp.natural_hotleads   AS INT)
        OR mp.FeaturedHotLeads                         <> CAST(sp.featured_hotleads   AS INT)
        OR mp.TotalPhoneCall                           <> CAST(sp.total_phonecall   AS INT)
        OR mp.NaturalPhoneCalls                        <> CAST(sp.NATURAL_PHONECALLS as FLOAT)
        OR mp.FeaturedPhoneCalls                       <> CAST(sp.featured_phonecalls as FLOAT)
        OR mp.TotalHotlead                             <> CAST(sp.total_hotlead   AS INT)
        OR mp.NaturalNRL                               <> CAST(sp.natural_nrl      AS INT)
        OR mp.FeaturedNRL                              <> CAST(sp.featured_nrl   AS INT)
        OR mp.TotalLeases                              <> CAST(sp.total_leases   AS INT)
        OR mp.MarketNumber                             <> CAST(sp.market_nb   AS INT)
        OR mp.PaidLeases                               <> CAST(sp.paid_leases   AS INT)
        OR mp.AvgCallDuration                          <> sp.avg_call_duration
        OR mp.CompanyName                              <> sp.company_nm
        OR mp.CompanyID                                <> CAST(sp.company_id AS INT)
        OR mp.SuccessFee                               <> CAST(sp.success_fee AS FLOAT)
        OR mp.VIPImpressions                           <> CAST(sp.vip_impressions AS FLOAT)   
        OR mp.VIPViewings                              <> CAST(sp.vip_viewings  AS FLOAT)
        OR mp.VIPHotLeads                              <> CAST(sp.vip_hotleads  AS FLOAT)
        OR mp.VIPPhoneCalls                            <> CAST(sp.vip_phonecalls  AS FLOAT)
        OR mp.VIPNRL                                   <> CAST(sp.vip_nrl  AS FLOAT)
        OR mp.PTEImpressions                           <> CAST(sp.pte_impressions  AS FLOAT)
        OR mp.PTEViewings                              <> CAST(sp.pte_viewings  AS FLOAT)
        OR mp.PTEHotLeads                              <> CAST(sp.pte_hotleads  AS FLOAT)
        OR mp.PTEPhonecalls                            <> CAST(sp.pte_phonecalls  AS FLOAT)
        OR mp.PTENRL                                   <> CAST(sp.pte_nrl  AS FLOAT)
        OR mp.PropertyStatus                           <> sp.property_status
        OR mp.Phone                                    <> sp.phone_cd
        OR mp.PropertyAddress                          <> sp.property_address
        OR mp.Fax                                      <> sp.fax_cd
        OR mp.Email                                    <> sp.email_nm
        OR mp.HotLeadEmailID                           <> sp.hotleademail_id
        OR mp.HotLeadFaxID                             <> sp.hotleadfax_id
        OR mp.UniqueHotLeads                           <> CAST(sp.unique_hotleads  AS FLOAT)
        OR mp.UniqueViewings                           <> CAST(sp.unique_viewings  AS FLOAT)
        OR mp.UniquePDPOverviews                       <> CAST(sp.unique_pdp_overviews  AS FLOAT)
        OR mp.BillingAddress                           <> sp.billing_address
        OR mp.BillingCity                              <> sp.billing_city
        OR mp.BillingState                             <> sp.billing_state
        OR mp.BillingZip                               <> sp.billing_zip
        OR mp.BillingEmail                             <> sp.billing_email
        OR mp.BillingPhone                             <> sp.billing_phone
        OR mp.BillingFax                               <> sp.billing_fax
        OR mp.LeaseFaxed                               <> sp.lease_faxed
        OR mp.LeaseEmailed                             <> sp.lease_emailed
        OR mp.SubmarketNumber                          <> CAST(sp.submarket_nb AS INT)
        OR mp.SubmarketName                            <> sp.submarket_nm  
        OR mp.AreaName                                 <> sp.area_nm
        OR mp.ImageIncluded                            <> sp.image_included
        OR mp.Specials                                 <> sp.specials
        OR mp.MainImageAvailable                       <> sp.main_image_available
        OR mp.FloorPlanAvailable                       <> sp.floorplan_available
        OR mp.LogoAvailable                            <> sp.logo_available
        OR mp.LastVirtualUpload                        <> sp.last_virtual_upload
        OR mp.Searchable                               <> sp.searchable
        OR mp.UniqueHotLeaders                         <> cast(sp.unique_hotleaders as float)
        OR mp.NaturalSearchers                         <> cast(sp.natural_searchers as float)
        OR mp.FeaturedSearchers                        <> cast(sp.featured_searchers as float)
        OR mp.NaturalViewers                           <> cast(sp.natural_viewers as float)
        OR mp.FeaturedViewers                          <> cast(sp.featured_viewers as float)
        OR mp.NaturalHotLeaders                        <> cast(sp.natural_hotleaders as float)
        OR mp.FeaturedHotLeaders                       <> cast(sp.featured_hotleaders as float)
        OR mp.TotalHotLeaders                          <> cast(sp.total_hotleaders as float)
        OR mp.TotalPhoneCallers                        <> cast(sp.total_phonecallers    as float)
        OR mp.FeaturedPhoneCallers                     <> cast(sp.featured_phonecallers as float)
        OR mp.NaturalPhoneCallers                      <> cast(sp.natural_phonecallers as float)
        OR mp.BusinessModelType                        <> sp.businessmodel_tp
        OR mp.ActivateDate                             <> DATEADD(hour,@TimeZoneOffset, sp.activate_dm)
        OR mp.ConnectedCalls                           <> cast(sp.ConnectedCalls as float)
                    THEN
            UPDATE       SET
         mp.RecordCreateDate                      = DATEADD(hour,@TimeZoneOffset, sp.record_create_dm)
        ,PropertyCreateDate                       = DATEADD(hour,@TimeZoneOffset, sp.property_create_dm)
        ,PropertyUpdateDate                       = DATEADD(hour,@TimeZoneOffset, sp.property_update_dm)
        ,PropertyTerminateDate                    = DATEADD(hour,@TimeZoneOffset, sp.property_terminate_dm)
        ,PropertyID                               = CAST (sp.property_id AS INT)
        ,UniversalID                              = sp.universal_id
        ,ExternalID                               = sp.external_id
        ,Type                                     = sp.type_nm
        ,TotalUnits                               = CAST(sp.totalunits_nb AS INT)
        ,ActiveUnitsAmount                        = CAST(sp.active_units_at AS INT)
        ,UpsellListSeniorListing                  = CAST(sp.upselllistseniorlisting AS INT)
        ,TotalAmenities                           = CAST(sp.total_amenities AS INT)
        ,ActiveAmenities                          = CAST(sp.active_amenities AS INT)
        ,TotalPhotos                              = CAST(sp.total_photos AS INT)
        ,ActivePhotos                             = CAST(sp.active_photos AS INT)
        ,TotalFloorPlans                          = CAST(sp.total_floor_plans AS INT)
        ,ActiveFloorPlans                         = CAST(sp.active_floor_plans AS INT)
        ,UpsellPropRentalsFeatured                = CAST(sp.upsellproprentalsfeatured AS INT)
        ,UpsellListFloorPlanUpgrade               = CAST(sp.upselllistfloorplanupgrade AS INT)
        ,UpsellListPayPerLead                     = CAST(sp.upselllistpayperlead AS INT)
        ,ISRentalPropToBeDeleted                  = CAST(sp.isrentalproptobedeleted AS INT)
        ,ListingStatusID                          = sp.listingstatusid
        ,UpsellListHighlighted                    = CAST(sp.upselllisthighlighted  AS INT)
        ,UpsellListCoupon                         = CAST(sp.upselllistcoupon  AS INT)
        ,UpsellPropEmerical                       = CAST(sp.upsellpropemerical  AS INT)
        ,UpsellPropFeatureCommPlatinum            = CAST(sp.upsellpropfeaturecommplatinum  AS INT)
        ,UpsellPropFeatureCommGold                = CAST(sp.upsellpropfeaturecommgold  AS INT)
        ,UpsellPropFeatureCommSilver              = CAST(sp.upsellpropfeaturecommsilver  AS INT)
        ,UpsellPropVirtualBrochure                = CAST(sp.upsellpropvirtualbrochure  AS INT)
        ,UpsellListCorporateListing               = CAST(sp.upselllistcorporatelisting  AS INT)
        ,UpsellListCollegeListing                 = CAST(sp.upselllistcollegelisting   AS INT)
        ,UpsellListMilitaryListing                = CAST(sp.upselllistmilitarylisting   AS INT)
        ,UpsellListApartmentListing               = CAST(sp.upselllistapartmentlisting   AS INT)
        ,UpsellPropPhotoUpgrade                   = CAST(sp.upsellpropphotoupgrade   AS INT)
        ,UpsellMgmtCoLogoDisplay                  = CAST(sp.upsellmgmtcologodisplay   AS INT)
        ,UpsellPropLogoDisplay                    = CAST(sp.upsellproplogodisplay   AS INT)
        ,UpsellPropPremiumUpgrade                 = CAST(sp.upsellproppremiumupgrade   AS INT)
        ,UpsellPropVideoSpokesModel               = CAST(sp.upsellpropvideospokesmodel   AS INT)
        ,UpsellPropFrontPage                      = CAST(sp.upsellpropfrontpage   AS INT)
        ,UpsellPropSpanish                        = CAST(sp.upsellpropspanish   AS INT)
        ,UpsellPropCallRecording                  = CAST(sp.upsellpropcallrecording   AS INT)
        ,UpsellPropFromToPhone                    = CAST(sp.upsellpropfromtophone   AS INT)
        ,UpsellPropRentalsPremier                 = CAST(sp.upsellproprentalspremier   AS INT)
        ,UpsellPropRentalsListing                 = CAST(sp.upsellproprentalslisting   AS INT)
        ,UpsellListRentalsSpotlighted             = CAST(sp.upselllistrentalsspotlighted   AS INT)
        ,UpsellListSpotlight                      = CAST(sp.upselllistspotlight            AS INT)
        ,UpsellListPayPerLease                    = CAST(sp.upselllistpayperlease            AS INT)
        ,UpsellListDiamondCity                    = CAST(sp.upselllistdiamondcity            AS INT)
        ,UpsellListDiamondMax                     = CAST(sp.upselllistdiamondmax            AS INT)
        ,UpsellListRentalsStandard                = CAST(sp.upselllistrentalsstandard          AS INT)
        ,UpsellListCommunityCarousel              = CAST(sp.upselllistcommunitycarousel        AS INT)  
        ,UpsellList30SecondVideo                  = CAST(sp.upselllist30secondvideo            AS INT)
        ,UpsellList60SecondVideo                  = CAST(sp.upselllist60secondvideo            AS INT)
        ,UpsellListRentalsCarousel                = CAST(sp.upselllistrentalscarousel          AS INT)
        ,UpsellListRentalsStandardPlus            = CAST(sp.upselllistrentalsstandardplus      AS INT)    
        ,UpsellListMobileSpotlight                = CAST(sp.upselllistmobilespotlight          AS INT)
        ,UpsellPropMobileDeal                     = CAST(sp.upsellpropmobiledeal            AS INT)
        ,UpsellPropDynamicLeadForm                = CAST(sp.upsellpropdynamicleadform          AS INT)
        ,UpsellListIncomeRestricted               = CAST(sp.upselllistincomerestricted         AS INT) 
        ,UpsellListPetFriendly                    = CAST(sp.upselllistpetfriendly            AS INT)
        ,UpsellListLuxuryCommunity                = CAST(sp.upselllistluxurycommunity          AS INT)
        ,UpsellPropRepmon                         = CAST(sp.upsellproprepmon            AS INT)
        ,UpsellPropSocialMediaMan                 = CAST(sp.upsellpropsocialmediaman           AS INT)
        ,FutureUpsell03                           = CAST(sp.futureupsell03            AS INT)
        ,FutureUpsell04                           = CAST(sp.futureupsell04            AS INT)
        ,FutureUpsell05                           = CAST(sp.futureupsell05            AS INT)
        ,FutureUpsell06                           = CAST(sp.futureupsell06            AS INT)
        ,FutureUpsell07                           = CAST(sp.futureupsell07            AS INT)
        ,FutureUpsell08                           = CAST(sp.futureupsell08            AS INT)
        ,LowPrice                                 = CAST(sp.lowprice AS NUMERIC(15,2))
        ,Highprice                                = CAST(sp.highprice  AS NUMERIC(15,2))
        ,ISSem                                    = CAST(sp.issem  AS INT)
        ,ISOverThreshold                          = CAST(sp.isoverthreshold  AS INT)
        ,CallTrackingInBook                       = CAST(sp.calltrackinginbook  AS INT)
        ,CouponActiveOnSite                       = CAST(sp.couponactiveonsite  AS INT)
        ,VerizonFios                              = CAST(sp.verizonfios  AS INT)
        ,ATTUverse                                = CAST(sp.attuverse  AS INT)
        ,DirectTV                                 = CAST(sp.directtv  AS INT)
        ,BrightHouse                              = CAST(sp.brighthouse  AS INT)
        ,Charter                                  = CAST(sp.charter  AS INT)
        ,Xfinitysp                                = CAST(sp.xfinitysp  AS INT)
        ,Xfinitydp                                = CAST(sp.xfinitydp  AS INT)
        ,Xfinitytp                                = CAST(sp.xfinitytp  AS INT)
        ,TimeWarner                               = CAST(sp.timewarner  AS INT)
        ,NumericRank                              = CAST(sp.numericrank  AS INT)
        ,UniqueVisits_FL                          = CAST(sp.uniquevisits_fl  AS INT)
        ,UniqueVisits_PTE                         = CAST(sp.uniquevisits_pte  AS INT)
        ,UniqueVisits_None                        = CAST(sp.uniquevisits_none  AS INT)
        ,UniqueVisits_Mobile                      = CAST(sp.uniquevisits_mobile  AS INT)
        ,UniqueVisits_VIP                         = CAST(sp.uniquevisits_VIP  AS INT)
        ,UniqueVisits_ForFutureUse2               = CAST(sp.uniquevisits_forfutureuse2  AS INT)
        ,UniqueVisits_ForFutureUse3               = CAST(sp.uniquevisits_forfutureuse3  AS INT)
        ,UniqueVisits_ForFutureUse4               = CAST(sp.uniquevisits_forfutureuse4  AS INT)
        ,UniqueVisits_ForFutureUse5               = CAST(sp.uniquevisits_forfutureuse5  AS INT)
        ,ViewsListingPage                         = CAST(sp.viewslistingpage  AS INT)
        ,ViewsListingPage_Mobile                  = CAST(sp.viewslistingpage_mobile  AS INT)
        ,ViewsListingPage_ForFutureUse1           = CAST(sp.viewslistingpage_forfutureuse1  AS INT)
        ,ViewsListingPage_ForFutureUse2           = CAST(sp.viewslistingpage_forfutureuse2  AS INT)
        ,ViewsListingPage_ForFutureUse3           = CAST(sp.viewslistingpage_forfutureuse3  AS INT)
        ,ViewsListingPage_ForFutureUse4           = CAST(sp.viewslistingpage_forfutureuse4  AS INT)
        ,ViewsListingPage_ForFutureUse5           = CAST(sp.viewslistingpage_forfutureuse5 AS INT)
        ,ViewsEmercial                            = CAST(sp.viewsemercial  AS INT)
        ,ViewsVirtualBrochure                     = CAST(sp.viewsvirtualbrochure  AS INT)
        ,ClicksSpotlightListing                   = CAST(sp.clicksspotlightlisting  AS INT)
        ,ClicksSpotlightCommunityVideo            = CAST(sp.clicksspotlightcommunityvideo  AS INT)
        ,ClicksListingWebLink                     = CAST(sp.clickslistingweblink  AS INT)
        ,ClicksMgtcoWebLink                       = CAST(sp.clicksmgtcoweblink  AS INT)
        ,ClicksOnlineAppt                         = CAST(sp.clicksonlineappt  AS INT)
        ,ClicksOnlineApptSubmit                   = CAST(sp.clicksonlineapptsubmit  AS INT)
        ,ClicksOnlineAppl                         = CAST(sp.clicksonlineappl  AS INT)
        ,ClicksOnlineApplSubmit                   = CAST(sp.clicksonlineapplsubmit  AS INT)
        ,ClicksOnlineApptCR                       = CAST(sp.clicksonlineapptcr  AS INT)
        ,ClicksOnlineApplCR                       = CAST(sp.clicksonlineapplcr  AS INT)
        ,ClicksSpotlightLeadSubmission            = CAST(sp.clicksspotlightleadsubmission  AS INT)
        ,ClicksWeCanCallYou                       = CAST(sp.clickswecancallyou  AS INT)
        ,ClicksLeadSubmission                     = CAST(sp.clicksleadsubmission  AS INT)
        ,ClicksPhoneSubmission                    = CAST(sp.clicksphonesubmission  AS INT)
        ,ClicksCommunityVideo                     = CAST(sp.clickscommunityvideo  AS INT)
        ,ClicksListingMap                         = CAST(sp.clickslistingmap  AS INT)
        ,ClicksMapDirections                      = CAST(sp.clicksmapdirections  AS INT)
        ,ClicksPrintableGuide                     = CAST(sp.clicksprintableguide  AS INT)
        ,ClicksPhotos                             = CAST(sp.clicksphotos  AS INT)
        ,ClicksSpotlightPhotos                    = CAST(sp.clicksspotlightphotos  AS INT)
        ,ClicksSpotlightPhotoPopup                = CAST(sp.clicksspotlightphotopopup  AS INT)
        ,ClicksFloorPlan                          = CAST(sp.clicksfloorplan  AS INT)
        ,ClicksCheckYourCredit                    = CAST(sp.clickscheckyourcredit  AS INT)
        ,ClicksWebBuilderLink                     = CAST(sp.clickswebbuilderlink  AS INT)
        ,ClicksFeaturedMgtCo                      = CAST(sp.clicksfeaturedmgtco  AS INT)
        ,ClicksFrontPagePropLead                  = CAST(sp.clicksfrontpageproplead  AS INT)
        ,ClicksLuxurySlideShow                    = CAST(sp.clicksluxuryslideshow  AS INT)
        ,ImprSearchResults                        = CAST(sp.imprsearchresults  AS INT)
        ,TotalImpressions                         = CAST(sp.total_impressions  AS INT)
        ,ImpreFrontCover                          = CAST(sp.imprefrontcover  AS INT)
        ,ImprVisitCount                           = CAST(sp.imprvisitcount  AS INT)
        ,ViewingFromEmail                         = CAST(sp.viewing_from_email  AS INT)
        ,TotalViewings                            = CAST(sp.total_viewings  AS INT)
        ,TextMsgWeb                               = CAST(sp.textmsgweb  AS INT)
        ,TextMsgMobile                            = CAST(sp.textmsgmobile  AS INT)
        ,CheckListingAvail                        = CAST(sp.checklistingavail  AS INT)
        ,ChecksSpotLightListingAvail              = CAST(sp.checksspotlightlistingavail  AS INT)
        ,ChecksVirtualtourListingAvail            = CAST(sp.checksvirtualtourlistingavail  AS INT)
        ,AgcPrintConnectedCalls                   = CAST(sp.agcprintconnectedcalls  AS INT)
        ,AgcPrintMissedCalls                      = CAST(sp.agcprintmissedcalls  AS INT)
        ,AsgPrintConnectedCalls                   = CAST(sp.asgprintconnectedcalls  AS INT)
        ,AsgPrintMissedCalls                      = CAST(sp.asgprintmissedcalls  AS INT)
        ,WebConnectedCalls                        = CAST(sp.webconnectedcalls  AS INT)
        ,WebMissedCalls                           = CAST(sp.webmissedcalls  AS INT)
        ,RentalsConnectedCalls                    = CAST(sp.rentalsconnectedcalls  AS INT)
        ,RentalsMissedCalls                       = CAST(sp.rentalsmissedcalls  AS INT)
        ,CTCConnectedCalls                        = CAST(sp.ctconnectedcalls  AS INT)
        ,CTCMissedCalls                           = CAST(sp.ctcmissedcalls  AS INT)
        ,PaidSPConnectedCalls                     = CAST(sp.paidspconnectedcalls  AS INT)
        ,PaidSPMissedCalls                        = CAST(sp.paidspmissedcalls  AS INT)
        ,CombinedFeedsConnectedCalls              = CAST(sp.combinedfeedsconnectedcalls  AS INT)
        ,CombinedFeedsMissedCalls                 = CAST(sp.combinedfeedsmissedcalls  AS INT)
        ,GoogleConnectedCalls                     = CAST(sp.googleconnectedcalls  AS INT)
        ,GoogleMissedCalls                        = CAST(sp.googlemissedcalls  AS INT)
        ,PPCConnectedCalls                        = CAST(sp.ppcconnectedcalls  AS INT)
        ,PPCMissedCalls                           = CAST(sp.ppcmissedcalls  AS INT)
        ,LuxuryConnectedCalls                     = CAST(sp.luxuryconnectedcalls  AS INT)
        ,LuxuryMissedCalls                        = CAST(sp.luxurymissedcalls  AS INT)
        ,MarchexConnectedCalls                    = CAST(sp.marchexconnectedcalls  AS INT)
        ,MarchexMissedCalls                       = CAST(sp.marchexmissedcalls  AS INT)
        ,CraigsListConnectedCalls                 = CAST(sp.craigslistconnectedcalls  AS INT)
        ,CraigsListMissedCalls                    = CAST(sp.craigslistmissedcalls  AS INT)
        ,WebLocalTrackingNumberConnectedCalls     = CAST(sp.weblocaltracknumconnectcalls  AS INT)
        ,WebLocalTrackingNumberMissedCalls        = CAST(sp.weblocaltracknummissedcalls  AS INT)
        ,RentalsLocalConnectedCalls               = CAST(sp.rentalslocalconnectedcalls  AS INT)
        ,RentalsLocalMissedCalls                  = CAST(sp.rentalslocalmissedcalls  AS INT)
        ,VideoConnectedCalls                      = CAST(sp.videoconnectedcalls  AS INT)
        ,VideoMissedCalls                         = CAST(sp.videomissedcalls  AS INT)
        ,SEMConnectedCalls                        = CAST(sp.semconnectedcalls  AS INT)
        ,SEMMissedCalls                           = CAST(sp.semmissedcalls  AS INT)
        ,TruliaConnectedCalls                     = CAST(sp.truliaconnectedcalls  AS INT)
        ,TruliaMissedCalls                        = CAST(sp.truliamissedcalls  AS INT)
        ,FutureConnectedCalls01                   = CAST(sp.futureconnectedcalls01  AS INT)
        ,FutureMissedCalls01                      = CAST(sp.futuremissedcalls01  AS INT)
        ,FutureConnectedCalls02                   = CAST(sp.futureconnectedcalls02  AS INT)
        ,FutureMissedCalls02                      = CAST(sp.futuremissedcalls02  AS INT)
        ,FutureConnectedCalls03                   = CAST(sp.futureconnectedcalls03  AS INT)
        ,FutureMissedCalls03                      = CAST(sp.futuremissedcalls03  AS INT)
        ,FutureConnectedCalls04                   = CAST(sp.futureconnectedcalls04  AS INT)
        ,FutureMissedCalls04                      = CAST(sp.futuremissedcalls04  AS INT)
        ,FutureConnectedCalls05                   = CAST(sp.futureconnectedcalls05  AS INT)
        ,FutureMissedCalls05                      = CAST(sp.futuremissedcalls05  AS INT)
        ,FutureConnectedCalls06                   = CAST(sp.futureconnectedcalls06  AS INT)
        ,FutureMissedCalls06                      = CAST(sp.futuremissedcalls06  AS INT)
        ,FutureConnectedCalls07                   = CAST(sp.futureconnectedcalls07  AS INT)
        ,FutureMissedCalls07                      = CAST(sp.futuremissedcalls07  AS INT)
        ,FutureConnectedCalls08                   = CAST(sp.futureconnectedcalls08  AS INT)
        ,FutureMissedCalls08                      = CAST(sp.futuremissedcalls08  AS INT)
        ,FutureConnectedCalls09                   = CAST(sp.futureconnectedcalls09  AS INT)
        ,FutureMissedCalls09                      = CAST(sp.futuremissedcalls09  AS INT)
        ,FutureConnectedCalls10                   = CAST(sp.futureconnectedcalls10  AS INT)
        ,FutureMissedCalls10                      = CAST(sp.futuremissedcalls10  AS INT)
        ,AGEmailLeads                             = CAST(sp.agemailleads  AS INT)
        ,MetroEmailLeads                          = CAST(sp.maetroemailleads  AS INT)
        ,NeighborhoodEmailLeads                   = CAST(sp.neighborhoodemailleads  AS INT)
        ,AIMCOEmailLeads                          = CAST(sp.aimcoemailleads  AS INT)
        ,RentalsEmailLeads                        = CAST(sp.rentalsemailleads  AS INT)
        ,RentarEmailLeads                         = CAST(sp.rentaremailleads  AS INT)
        ,RentalHousesEmailLeads                   = CAST(sp.rentalhousesemailleads  AS INT)
        ,iPhoneEmailLeads                         = CAST(sp.iphoneemailleads  AS INT)
        ,OodleEmailLeads                          = CAST(sp.oodleemailleads  AS INT)
        ,AndroidEmailLeads                        = CAST(sp.androidemailleads  AS INT)
        ,HotpadsEmailLeads                        = CAST(sp.hotpadsemailleads  AS INT)
        ,LuxuryEmailLeads                         = CAST(sp.luxuryemailleads  AS INT)
        ,CondoEmailLeads                          = CAST(sp.condoemailleads  AS INT)
        ,iPadEmailLeads                           = CAST(sp.ipademailleads  AS INT)
        ,TruliaEmailLeads                         = CAST(sp.truliaemailleads  AS INT)
        ,ZillowEmailLeads                         = CAST(sp.zillowemailleads  AS INT)
        ,VerticalbrandsEmailLeads                 = CAST(sp.verticalbrandsemailleads  AS INT)
        ,RDTFeedLeads                             = CAST(sp.rdtfeedleads  AS INT)
        ,PropSolutionsFeedLeads                   = CAST(sp.propsolutionsfeedleads  AS INT)
        ,YieldFeedLeads                           = CAST(sp.yieldfeedleads  AS INT)
        ,AGMobileEmailLeads                       = CAST(sp.agmobileemailleads  AS INT)
        ,RentalsMobileEmailLeads                  = CAST(sp.rentalsmobileemailleads  AS INT)
        ,RentalsAndroidEmailLeads                 = CAST(sp.rentalsandroidemailleads  AS INT)
        ,RentalsiPhoneEmailLeads                  = CAST(sp.rentalsiphoneemailleads  AS INT)
        ,VastEmailLeads                           = CAST(sp.vastemailleads  AS INT)
        ,CampusHomesOnlineEmailLeads              = CAST(sp.campushomesonlineemailleads  AS INT)
        ,AGTabletEmailLeads                       = CAST(sp.agtabletemailleads  AS INT)
        ,AGKindleEmailLeads                       = CAST(sp.agkindleemailleads  AS INT)
        ,Future1EmailLeads                        = CAST(sp.future1emailleads  AS INT)
        ,Future2EmailLeads                        = CAST(sp.future2emailleads  AS INT)
        ,Future3EmailLeads                        = CAST(sp.future3emailleads  AS INT)
        ,Future4EmailLeads                        = CAST(sp.future4emailleads  AS INT)
        ,Future5EmailLeads                        = CAST(sp.future5emailleads  AS INT)
        ,Future6EmailLeads                        = CAST(sp.future6emailleads  AS INT)
        ,Future7EmailLeads                        = CAST(sp.future7emailleads  AS INT)
        ,Future8EmailLeads                        = CAST(sp.future8emailleads  AS INT)
        ,Future9EmailLeads                        = CAST(sp.future9emailleads  AS INT)
        ,Future0EmailLeads                        = CAST(sp.future0emailleads  AS INT)
        ,PlacementTier                            = CAST(sp.placementtier  AS INT)
        ,PrintProductPoints                       = CAST(sp.printproductpoints  AS INT)
        ,InternetProductPoints                    = CAST(sp.internetproductpoints  AS INT)
        ,LegacyLoyaltyPoints                      = CAST(sp.legacyloyaltypoints  AS INT)
        ,ContractLoyaltyPoints                    = CAST(sp.contractloyaltypoints  AS INT)
        ,LastUpdateYMDID                          = CAST(sp.lastupdateymdid  AS INT)
        ,UpsellListBold                           = CAST(sp.upselllistbold  AS INT)
        ,UpsellListFrontCover                     = CAST(sp.upselllistfrontcover  AS INT)
        ,UpsellPropPhotoFeature                   = CAST(sp.upsellpropphotofeature  AS INT)
        ,UpsellMgmtManagementCoLogo               = CAST(sp.upsellmgmtmanagementcologo  AS INT)
        ,UpsellPropPropertyLogo                   = CAST(sp.upsellproppropertylogo  AS INT)
        ,UpsellPropPremiumPackage                 = CAST(sp.upsellproppremiumpackage  AS INT)
        ,UpsellListFloorPlanPkg                   = CAST(sp.upselllistfloorplanpkg  AS INT)
        ,LinkedFloorPlan                          = CAST(sp.linkedfloorplan  AS INT)
        ,InternetPhoneLeads                       = CAST(sp.internetphoneleads  AS INT)
        ,InternetPhoneLeads_NoMobile              = CAST(sp.internetphoneleads_nomobile  AS INT)
        ,DigitalPhoneLeads                        = CAST(sp.digitalphoneleads  AS INT)
        ,EmailLeads                               = CAST(sp.emailleads  AS INT)
        ,InternetEmailLeads_NoMobile              = CAST(sp.internetemailleads_nomobile  AS INT)
        ,DigitalEmailLeads                        = CAST(sp.digitalemailleads  AS INT)
        ,AGCMissedCalls                           = CAST(sp.agcmissedcalls  AS INT)
        ,ASGMissedCalls                           = CAST(sp.asgmissedcalls  AS INT)
        ,AGCAllLeads                              = CAST(sp.agcallleads  AS INT)
        ,ASGAllLeads                              = CAST(sp.asgallleads  AS INT)
        ,AllMissedCalls                           = CAST(sp.allmissedcalls  AS INT)
        ,AllConnectedCalls                        = CAST(sp.allconnectedcalls  AS INT)
        ,AllLeads                                 = CAST(sp.allleads  AS INT)
        ,AllInternetLeads_NoMobile                = CAST(sp.allinternetleads_nomobile  AS INT)
        ,AllDigitalLeads                          = CAST(sp.alldigitalleads  AS INT)
        ,ThirdPartyFeedLeads                      = CAST(sp.thirdpartyfeedleads  AS INT)
        ,WebsiteCalls                             = CAST(sp.websitecalls  AS INT)
        ,WebsiteEmails                            = CAST(sp.websiteemails  AS INT)
        ,WebsiteLeads_Rentals                     = CAST(sp.websiteleads_rentals  AS INT)
        ,MobileEmails                             = CAST(sp.mobileemails  AS INT)
        ,MobileCalls                              = CAST(sp.mobilecalls  AS INT)
        ,MobileLeads_AG                           = CAST(sp.mobileleads_ag  AS INT)
        ,MobileLeads_Rentals                      = CAST(sp.mobileleads_rentals  AS INT)
        ,MobileAllLeads                           = CAST(sp.mobileallleads  AS INT)
        ,MRSyndicationEmailLeads                  = CAST(sp.mrsyndicationemailleads  AS INT)
        ,MRAGEmailLeads                           = CAST(sp.mragemailleads  AS INT)
        ,MRAGWebPhoneLeads                        = CAST(sp.mragwebphoneleads  AS INT)
        ,MRAppsEmailLeads                         = CAST(sp.mrappsemailleads  AS INT)
        ,MRPhonecalls                             = CAST(sp.mrphonecalls  AS INT)
        ,RPLRank                                  = CAST(sp.rplrank  AS INT)
        ,PropertyName                             = sp.property_nm
        ,MarketName                               = sp.market_nm
        ,CityName                                 = sp.city_nm
        ,State                                    = sp.state_cd
        ,SearchRank                               = CAST(sp.search_rank AS INT)
        ,PageInSearch                             = CAST(sp.page_in_search  AS INT)
        ,UpgradeType                              = sp.upgrade_tp
        ,UpgradeMonthlyCost                       = CAST(sp.upgrade_monthly_cost AS numeric(10,2))
        ,UpgradeStartDate                         = sp.upgrade_start_date
        ,UpgradeEndDate                           = sp.upgrade_end_date
        ,NaturalImpressions                       = CAST(sp.natural_impressions     AS INT)
        ,FeaturedImpressions                      = CAST(sp.featured_impressions   AS INT)
        ,NaturalViewings                          = CAST(sp.natural_viewings   AS INT)
        ,FeaturedViewings                         = CAST(sp.featured_viewings   AS INT)
        ,NaturalHotLeads                          = CAST(sp.natural_hotleads   AS INT)
        ,FeaturedHotLeads                         = CAST(sp.featured_hotleads   AS INT)
        ,TotalPhoneCall                           = CAST(sp.total_phonecall   AS INT)
        ,NaturalPhoneCalls                        = CAST(sp.NATURAL_PHONECALLS as FLOAT)
        ,FeaturedPhoneCalls                       = CAST(sp.featured_phonecalls as FLOAT)
        ,TotalHotlead                             = CAST(sp.total_hotlead   AS INT)
        ,NaturalNRL                               = CAST(sp.natural_nrl      AS INT)
        ,FeaturedNRL                              = CAST(sp.featured_nrl   AS INT)
        ,TotalLeases                              = CAST(sp.total_leases   AS INT)
        ,MarketNumber                             = CAST(sp.market_nb   AS INT)
        ,PaidLeases                               = CAST(sp.paid_leases   AS INT)
        ,AvgCallDuration                          = sp.avg_call_duration
        ,CompanyName                              = sp.company_nm
        ,CompanyID                                = CAST(sp.company_id AS INT)
        ,SuccessFee                               = CAST(sp.success_fee AS FLOAT)
        ,VIPImpressions                           = CAST(sp.vip_impressions                    AS FLOAT)   
        ,VIPViewings                              = CAST(sp.vip_viewings  AS FLOAT)
        ,VIPHotLeads                              = CAST(sp.vip_hotleads  AS FLOAT)
        ,VIPPhoneCalls                            = CAST(sp.vip_phonecalls  AS FLOAT)
        ,VIPNRL                                   = CAST(sp.vip_nrl  AS FLOAT)
        ,PTEImpressions                           = CAST(sp.pte_impressions  AS FLOAT)
        ,PTEViewings                              = CAST(sp.pte_viewings  AS FLOAT)
        ,PTEHotLeads                              = CAST(sp.pte_hotleads  AS FLOAT)
        ,PTEPhonecalls                            = CAST(sp.pte_phonecalls  AS FLOAT)
        ,PTENRL                                   = CAST(sp.pte_nrl  AS FLOAT)
        ,PropertyStatus                           = sp.property_status
        ,Phone                                    = sp.phone_cd
        ,PropertyAddress                          = sp.property_address
        ,Fax                                      = sp.fax_cd
        ,Email                                    = sp.email_nm
        ,HotLeadEmailID                           = sp.hotleademail_id
        ,HotLeadFaxID                             = sp.hotleadfax_id
        ,UniqueHotLeads                           = CAST(sp.unique_hotleads  AS FLOAT)
        ,UniqueViewings                           = CAST(sp.unique_viewings  AS FLOAT)
        ,UniquePDPOverviews                       = CAST(sp.unique_pdp_overviews  AS FLOAT)
        ,BillingAddress                           = sp.billing_address
        ,BillingCity                              = sp.billing_city
        ,BillingState                             = sp.billing_state
        ,BillingZip                               = sp.billing_zip
        ,BillingEmail                             = sp.billing_email
        ,BillingPhone                             = sp.billing_phone
        ,BillingFax                               = sp.billing_fax
        ,LeaseFaxed                               = sp.lease_faxed
        ,LeaseEmailed                             = sp.lease_emailed
        ,SubmarketNumber                          = CAST(sp.submarket_nb AS INT)
        ,SubmarketName                            = sp.submarket_nm  
        ,AreaName                                 = sp.area_nm
        ,ImageIncluded                            = sp.image_included
        ,Specials                                 = sp.specials
        ,MainImageAvailable                       = sp.main_image_available
        ,FloorPlanAvailable                       = sp.floorplan_available
        ,LogoAvailable                            = sp.logo_available
        ,LastVirtualUpload                        = sp.last_virtual_upload
        ,Searchable                               = sp.searchable
        ,UniqueHotLeaders                         = cast(sp.unique_hotleaders as float)
        ,NaturalSearchers                         = cast(sp.natural_searchers as float)
        ,FeaturedSearchers                        = cast(sp.featured_searchers as float)
        ,NaturalViewers                           = cast(sp.natural_viewers as float)
        ,FeaturedViewers                          = cast(sp.featured_viewers as float)
        ,NaturalHotLeaders                        = cast(sp.natural_hotleaders as float)
        ,FeaturedHotLeaders                       = cast(sp.featured_hotleaders as float)
        ,TotalHotLeaders                          = cast(sp.total_hotleaders  as float)
        ,TotalPhoneCallers                        = cast(sp.total_phonecallers    as float)
        ,FeaturedPhoneCallers                     = cast(sp.featured_phonecallers as float)
        ,NaturalPhoneCallers                      = cast(sp.natural_phonecallers as float)
        ,BusinessModelType                        = sp.businessmodel_tp
        ,ActivateDate                             = DATEADD(hour,@TimeZoneOffset, sp.activate_dm)
        ,ConnectedCalls                           = cast(sp.ConnectedCalls as float) 

 
        WHEN NOT MATCHED 
                    THEN
            INSERT (
         YMDID
        ,RecordCreateDate                          
        ,PropertyCreateDate                        
        ,PropertyUpdateDate                        
        ,PropertyTerminateDate                     
        ,PropertyID                                
        ,UniversalID                               
        ,ExternalID                                
        ,Type                                      
        ,TotalUnits                                
        ,ActiveUnitsAmount                         
        ,UpsellListSeniorListing                   
        ,TotalAmenities                            
        ,ActiveAmenities                           
        ,TotalPhotos                               
        ,ActivePhotos                              
        ,TotalFloorPlans                           
        ,ActiveFloorPlans                          
        ,UpsellPropRentalsFeatured                 
        ,UpsellListFloorPlanUpgrade                
        ,UpsellListPayPerLead                      
        ,ISRentalPropToBeDeleted                   
        ,ListingStatusID                           
        ,UpsellListHighlighted                     
        ,UpsellListCoupon                          
        ,UpsellPropEmerical                        
        ,UpsellPropFeatureCommPlatinum             
        ,UpsellPropFeatureCommGold                 
        ,UpsellPropFeatureCommSilver               
        ,UpsellPropVirtualBrochure                 
        ,UpsellListCorporateListing                
        ,UpsellListCollegeListing                  
        ,UpsellListMilitaryListing                 
        ,UpsellListApartmentListing                
        ,UpsellPropPhotoUpgrade                    
        ,UpsellMgmtCoLogoDisplay                   
        ,UpsellPropLogoDisplay                     
        ,UpsellPropPremiumUpgrade                  
        ,UpsellPropVideoSpokesModel                
        ,UpsellPropFrontPage                       
        ,UpsellPropSpanish                         
        ,UpsellPropCallRecording                   
        ,UpsellPropFromToPhone                     
        ,UpsellPropRentalsPremier                  
        ,UpsellPropRentalsListing                  
        ,UpsellListRentalsSpotlighted              
        ,UpsellListSpotlight                       
        ,UpsellListPayPerLease                     
        ,UpsellListDiamondCity                     
        ,UpsellListDiamondMax                      
        ,UpsellListRentalsStandard                 
        ,UpsellListCommunityCarousel               
        ,UpsellList30SecondVideo                   
        ,UpsellList60SecondVideo                   
        ,UpsellListRentalsCarousel                 
        ,UpsellListRentalsStandardPlus             
        ,UpsellListMobileSpotlight                 
        ,UpsellPropMobileDeal                      
        ,UpsellPropDynamicLeadForm                 
        ,UpsellListIncomeRestricted                
        ,UpsellListPetFriendly                     
        ,UpsellListLuxuryCommunity                 
        ,UpsellPropRepmon                          
        ,UpsellPropSocialMediaMan                  
        ,FutureUpsell03                            
        ,FutureUpsell04                            
        ,FutureUpsell05                            
        ,FutureUpsell06                            
        ,FutureUpsell07                            
        ,FutureUpsell08                            
        ,LowPrice                                  
        ,Highprice                                 
        ,ISSem                                     
        ,ISOverThreshold                           
        ,CallTrackingInBook                        
        ,CouponActiveOnSite                        
        ,VerizonFios                               
        ,ATTUverse                                 
        ,DirectTV                                  
        ,BrightHouse                               
        ,Charter                                   
        ,Xfinitysp                                 
        ,Xfinitydp                                 
        ,Xfinitytp                                 
        ,TimeWarner                                
        ,NumericRank                               
        ,UniqueVisits_FL                           
        ,UniqueVisits_PTE                          
        ,UniqueVisits_None                         
        ,UniqueVisits_Mobile
        ,UniqueVisits_VIP 
        ,UniqueVisits_ForFutureUse2                
        ,UniqueVisits_ForFutureUse3                
        ,UniqueVisits_ForFutureUse4                
        ,UniqueVisits_ForFutureUse5                
        ,ViewsListingPage                          
        ,ViewsListingPage_Mobile                   
        ,ViewsListingPage_ForFutureUse1            
        ,ViewsListingPage_ForFutureUse2            
        ,ViewsListingPage_ForFutureUse3            
        ,ViewsListingPage_ForFutureUse4            
        ,ViewsListingPage_ForFutureUse5            
        ,ViewsEmercial                             
        ,ViewsVirtualBrochure                      
        ,ClicksSpotlightListing                    
        ,ClicksSpotlightCommunityVideo             
        ,ClicksListingWebLink                      
        ,ClicksMgtcoWebLink                        
        ,ClicksOnlineAppt                          
        ,ClicksOnlineApptSubmit                    
        ,ClicksOnlineAppl                          
        ,ClicksOnlineApplSubmit                    
        ,ClicksOnlineApptCR                        
        ,ClicksOnlineApplCR                        
        ,ClicksSpotlightLeadSubmission             
        ,ClicksWeCanCallYou                        
        ,ClicksLeadSubmission                      
        ,ClicksPhoneSubmission                     
        ,ClicksCommunityVideo                      
        ,ClicksListingMap                          
        ,ClicksMapDirections                       
        ,ClicksPrintableGuide                      
        ,ClicksPhotos                              
        ,ClicksSpotlightPhotos                     
        ,ClicksSpotlightPhotoPopup                 
        ,ClicksFloorPlan                           
        ,ClicksCheckYourCredit                     
        ,ClicksWebBuilderLink                      
        ,ClicksFeaturedMgtCo                       
        ,ClicksFrontPagePropLead                   
        ,ClicksLuxurySlideShow                     
        ,ImprSearchResults                         
        ,TotalImpressions                          
        ,ImpreFrontCover                           
        ,ImprVisitCount                            
        ,ViewingFromEmail                          
        ,TotalViewings                             
        ,TextMsgWeb                                
        ,TextMsgMobile                             
        ,CheckListingAvail                         
        ,ChecksSpotLightListingAvail               
        ,ChecksVirtualtourListingAvail             
        ,AgcPrintConnectedCalls                    
        ,AgcPrintMissedCalls                       
        ,AsgPrintConnectedCalls                    
        ,AsgPrintMissedCalls                       
        ,WebConnectedCalls                         
        ,WebMissedCalls                            
        ,RentalsConnectedCalls                     
        ,RentalsMissedCalls                        
        ,CTCConnectedCalls                         
        ,CTCMissedCalls                            
        ,PaidSPConnectedCalls                      
        ,PaidSPMissedCalls                         
        ,CombinedFeedsConnectedCalls               
        ,CombinedFeedsMissedCalls                  
        ,GoogleConnectedCalls                      
        ,GoogleMissedCalls                         
        ,PPCConnectedCalls                         
        ,PPCMissedCalls                            
        ,LuxuryConnectedCalls                      
        ,LuxuryMissedCalls                         
        ,MarchexConnectedCalls                     
        ,MarchexMissedCalls                        
        ,CraigsListConnectedCalls                  
        ,CraigsListMissedCalls                     
        ,WebLocalTrackingNumberConnectedCalls      
        ,WebLocalTrackingNumberMissedCalls         
        ,RentalsLocalConnectedCalls                
        ,RentalsLocalMissedCalls                   
        ,VideoConnectedCalls                       
        ,VideoMissedCalls                          
        ,SEMConnectedCalls                         
        ,SEMMissedCalls                            
        ,TruliaConnectedCalls                      
        ,TruliaMissedCalls                         
        ,FutureConnectedCalls01                    
        ,FutureMissedCalls01                       
        ,FutureConnectedCalls02                    
        ,FutureMissedCalls02                       
        ,FutureConnectedCalls03                    
        ,FutureMissedCalls03                       
        ,FutureConnectedCalls04                    
        ,FutureMissedCalls04                       
        ,FutureConnectedCalls05                    
        ,FutureMissedCalls05                       
        ,FutureConnectedCalls06                    
        ,FutureMissedCalls06                       
        ,FutureConnectedCalls07                    
        ,FutureMissedCalls07                       
        ,FutureConnectedCalls08                    
        ,FutureMissedCalls08                       
        ,FutureConnectedCalls09                    
        ,FutureMissedCalls09                       
        ,FutureConnectedCalls10                    
        ,FutureMissedCalls10                       
        ,AGEmailLeads                              
        ,MetroEmailLeads                           
        ,NeighborhoodEmailLeads                    
        ,AIMCOEmailLeads                           
        ,RentalsEmailLeads                         
        ,RentarEmailLeads                          
        ,RentalHousesEmailLeads                    
        ,iPhoneEmailLeads                          
        ,OodleEmailLeads                           
        ,AndroidEmailLeads                         
        ,HotpadsEmailLeads                         
        ,LuxuryEmailLeads                          
        ,CondoEmailLeads                           
        ,iPadEmailLeads                            
        ,TruliaEmailLeads                          
        ,ZillowEmailLeads                          
        ,VerticalbrandsEmailLeads                  
        ,RDTFeedLeads                              
        ,PropSolutionsFeedLeads                    
        ,YieldFeedLeads                            
        ,AGMobileEmailLeads                        
        ,RentalsMobileEmailLeads                   
        ,RentalsAndroidEmailLeads                  
        ,RentalsiPhoneEmailLeads                   
        ,VastEmailLeads                            
        ,CampusHomesOnlineEmailLeads               
        ,AGTabletEmailLeads                        
        ,AGKindleEmailLeads                        
        ,Future1EmailLeads                         
        ,Future2EmailLeads                         
        ,Future3EmailLeads                         
        ,Future4EmailLeads                         
        ,Future5EmailLeads                         
        ,Future6EmailLeads                         
        ,Future7EmailLeads                         
        ,Future8EmailLeads                         
        ,Future9EmailLeads                         
        ,Future0EmailLeads                         
        ,PlacementTier                             
        ,PrintProductPoints                        
        ,InternetProductPoints                     
        ,LegacyLoyaltyPoints                       
        ,ContractLoyaltyPoints                     
        ,LastUpdateYMDID                           
        ,UpsellListBold                            
        ,UpsellListFrontCover                      
        ,UpsellPropPhotoFeature                    
        ,UpsellMgmtManagementCoLogo                
        ,UpsellPropPropertyLogo                    
        ,UpsellPropPremiumPackage                  
        ,UpsellListFloorPlanPkg                    
        ,LinkedFloorPlan                           
        ,InternetPhoneLeads                        
        ,InternetPhoneLeads_NoMobile               
        ,DigitalPhoneLeads                         
        ,EmailLeads                                
        ,InternetEmailLeads_NoMobile               
        ,DigitalEmailLeads                         
        ,AGCMissedCalls                            
        ,ASGMissedCalls                            
        ,AGCAllLeads                               
        ,ASGAllLeads                               
        ,AllMissedCalls                            
        ,AllConnectedCalls                         
        ,AllLeads                                  
        ,AllInternetLeads_NoMobile                 
        ,AllDigitalLeads                           
        ,ThirdPartyFeedLeads                       
        ,WebsiteCalls                              
        ,WebsiteEmails                             
        ,WebsiteLeads_Rentals                      
        ,MobileEmails                              
        ,MobileCalls                               
        ,MobileLeads_AG                            
        ,MobileLeads_Rentals                       
        ,MobileAllLeads                            
        ,MRSyndicationEmailLeads                   
        ,MRAGEmailLeads                            
        ,MRAGWebPhoneLeads                         
        ,MRAppsEmailLeads                          
        ,MRPhonecalls                              
        ,RPLRank                                   
        ,PropertyName                              
        ,MarketName                                
        ,CityName                                  
        ,State                                     
        ,SearchRank                                
        ,PageInSearch                              
        ,UpgradeType                               
        ,UpgradeMonthlyCost                        
        ,UpgradeStartDate                          
        ,UpgradeEndDate                            
        ,NaturalImpressions                        
        ,FeaturedImpressions                       
        ,NaturalViewings                           
        ,FeaturedViewings                          
        ,NaturalHotLeads                           
        ,FeaturedHotLeads                          
        ,TotalPhoneCall                            
        ,NaturalPhoneCalls                         
        ,FeaturedPhoneCalls                        
        ,TotalHotlead                              
        ,NaturalNRL                                
        ,FeaturedNRL                               
        ,TotalLeases                               
        ,MarketNumber                              
        ,PaidLeases                                
        ,AvgCallDuration                           
        ,CompanyName                               
        ,CompanyID                                 
        ,SuccessFee                                
        ,VIPImpressions                            
        ,VIPViewings                               
        ,VIPHotLeads                               
        ,VIPPhoneCalls                             
        ,VIPNRL                                    
        ,PTEImpressions                            
        ,PTEViewings                               
        ,PTEHotLeads                               
        ,PTEPhonecalls                             
        ,PTENRL                                    
        ,PropertyStatus                            
        ,Phone                                     
        ,PropertyAddress                           
        ,Fax                                       
        ,Email                                     
        ,HotLeadEmailID                            
        ,HotLeadFaxID                              
        ,UniqueHotLeads                            
        ,UniqueViewings                            
        ,UniquePDPOverviews                        
        ,BillingAddress                            
        ,BillingCity                               
        ,BillingState                              
        ,BillingZip                                
        ,BillingEmail                              
        ,BillingPhone                              
        ,BillingFax                                
        ,LeaseFaxed                                
        ,LeaseEmailed                              
        ,SubmarketNumber                           
        ,SubmarketName                             
        ,AreaName                                  
        ,ImageIncluded                             
        ,Specials                                  
        ,MainImageAvailable                        
        ,FloorPlanAvailable                        
        ,LogoAvailable                             
        ,LastVirtualUpload                         
        ,Searchable                                
        ,UniqueHotLeaders                          
        ,NaturalSearchers                          
        ,FeaturedSearchers                         
        ,NaturalViewers                            
        ,FeaturedViewers                           
        ,NaturalHotLeaders                         
        ,FeaturedHotLeaders                        
        ,TotalHotLeaders                           
        ,TotalPhoneCallers                         
        ,FeaturedPhoneCallers                      
        ,NaturalPhoneCallers                       
        ,BusinessModelType                         
        ,ActivateDate
        ,ConnectedCalls          )
                       VALUES 
                    (
                    YMDID --CAST(convert(VARCHAR(8),record_create_dm,112) AS INT) 
                    ,DATEADD(hour,@TimeZoneOffset,record_create_dm)
                    ,DATEADD(hour,@TimeZoneOffset,property_create_dm)
                    ,DATEADD(hour,@TimeZoneOffset,property_update_dm)
                    ,DATEADD(hour,@TimeZoneOffset,property_terminate_dm)
                    ,CAST (property_id AS INT)
                    ,universal_id
                    ,external_id
                    ,type_nm
                    ,CAST(totalunits_nb AS INT)
                    ,CAST(active_units_at AS INT)
                    ,CAST(upselllistseniorlisting AS INT)
                    ,CAST(total_amenities AS INT)
                    ,CAST(active_amenities AS INT)
                    ,CAST(total_photos AS INT)
                    ,CAST(active_photos AS INT)
                    ,CAST(total_floor_plans AS INT)
                    ,CAST(active_floor_plans AS INT)
                    ,CAST(upsellproprentalsfeatured AS INT)
                    ,CAST(upselllistfloorplanupgrade AS INT)
                    ,CAST(upselllistpayperlead AS INT)
                    ,CAST(isrentalproptobedeleted AS INT)
                    ,listingstatusid
                    ,CAST(upselllisthighlighted  AS INT)
                    ,CAST(upselllistcoupon  AS INT)
                    ,CAST(upsellpropemerical  AS INT)
                    ,CAST(upsellpropfeaturecommplatinum  AS INT)
                    ,CAST(upsellpropfeaturecommgold  AS INT)
                    ,CAST(upsellpropfeaturecommsilver  AS INT)
                     ,CAST(upsellpropvirtualbrochure  AS INT)
                     ,CAST(upselllistcorporatelisting  AS INT)
                     ,CAST(upselllistcollegelisting           AS INT)
                     ,CAST(upselllistmilitarylisting           AS INT)
                     ,CAST(upselllistapartmentlisting           AS INT)
                     ,CAST(upsellpropphotoupgrade               AS INT)
                     ,CAST(upsellmgmtcologodisplay               AS INT)
                     ,CAST(upsellproplogodisplay               AS INT)
                     ,CAST(upsellproppremiumupgrade           AS INT)
                     ,CAST(upsellpropvideospokesmodel           AS INT)
                     ,CAST(upsellpropfrontpage                   AS INT)
                     ,CAST(upsellpropspanish                   AS INT)
                     ,CAST(upsellpropcallrecording               AS INT)
                     ,CAST(upsellpropfromtophone               AS INT)
                     ,CAST(upsellproprentalspremier           AS INT)
                     ,CAST(upsellproprentalslisting           AS INT)
                     ,CAST(upselllistrentalsspotlighted       AS INT)
                     ,CAST(upselllistspotlight                AS INT)
                     ,CAST(upselllistpayperlease                AS INT)
                     ,CAST(upselllistdiamondcity                AS INT)
                     ,CAST(upselllistdiamondmax                AS INT)
                     ,CAST(upselllistrentalsstandard          AS INT)
                     ,CAST(upselllistcommunitycarousel        AS INT)  
                     ,CAST(upselllist30secondvideo            AS INT)
                     ,CAST(upselllist60secondvideo            AS INT)
                     ,CAST(upselllistrentalscarousel          AS INT)
                     ,CAST(upselllistrentalsstandardplus      AS INT)    
                     ,CAST(upselllistmobilespotlight          AS INT)
                     ,CAST(upsellpropmobiledeal                AS INT)
                     ,CAST(upsellpropdynamicleadform          AS INT)
                     ,CAST(upselllistincomerestricted         AS INT) 
                     ,CAST(upselllistpetfriendly                AS INT)
                     ,CAST(upselllistluxurycommunity          AS INT)
                     ,CAST(upsellproprepmon                    AS INT)
                     ,CAST(upsellpropsocialmediaman           AS INT)
                     ,CAST(futureupsell03                        AS INT)
                     ,CAST(futureupsell04                        AS INT)
                     ,CAST(futureupsell05                        AS INT)
                     ,CAST(futureupsell06                        AS INT)
                     ,CAST(futureupsell07                        AS INT)
                     ,CAST(futureupsell08                        AS INT)
                     ,CAST(lowprice AS NUMERIC(15,2))
                     ,CAST(highprice  AS NUMERIC(15,2))
                     ,CAST(issem                              AS INT)
                     ,CAST(isoverthreshold                      AS INT)
                     ,CAST(calltrackinginbook                  AS INT)
                     ,CAST(couponactiveonsite                  AS INT)
                     ,CAST(verizonfios                          AS INT)
                     ,CAST(attuverse                          AS INT)
                     ,CAST(directtv                              AS INT)
                     ,CAST(brighthouse                          AS INT)
                     ,CAST(charter                              AS INT)
                     ,CAST(xfinitysp                          AS INT)
                     ,CAST(xfinitydp                          AS INT)
                     ,CAST(xfinitytp                          AS INT)
                     ,CAST(timewarner                          AS INT)
                     ,CAST(numericrank                          AS INT)
                     ,CAST(uniquevisits_fl                      AS INT)
                     ,CAST(uniquevisits_pte                      AS INT)
                     ,CAST(uniquevisits_none                  AS INT)
                     ,CAST(uniquevisits_mobile                  AS INT)
                     ,CAST(uniquevisits_VIP                  AS INT)
                     ,CAST(uniquevisits_forfutureuse2          AS INT)
                     ,CAST(uniquevisits_forfutureuse3          AS INT)
                     ,CAST(uniquevisits_forfutureuse4          AS INT)
                      ,CAST(uniquevisits_forfutureuse5              AS INT)
                      ,CAST(viewslistingpage                          AS INT)
                      ,CAST(viewslistingpage_mobile                  AS INT)
                      ,CAST(viewslistingpage_forfutureuse1          AS INT)
                      ,CAST(viewslistingpage_forfutureuse2          AS INT)
                      ,CAST(viewslistingpage_forfutureuse3          AS INT)
                      ,CAST(viewslistingpage_forfutureuse4          AS INT)
                      ,CAST(viewslistingpage_forfutureuse5             AS INT)
                      ,CAST(viewsemercial                          AS INT)
                      ,CAST(viewsvirtualbrochure                      AS INT)
                      ,CAST(clicksspotlightlisting                  AS INT)
                      ,CAST(clicksspotlightcommunityvideo          AS INT)
                      ,CAST(clickslistingweblink                      AS INT)
                      ,CAST(clicksmgtcoweblink                      AS INT)
                      ,CAST(clicksonlineappt                          AS INT)
                      ,CAST(clicksonlineapptsubmit                  AS INT)
                      ,CAST(clicksonlineappl                          AS INT)
                      ,CAST(clicksonlineapplsubmit                  AS INT)
                      ,CAST(clicksonlineapptcr                      AS INT)
                      ,CAST(clicksonlineapplcr                      AS INT)
                      ,CAST(clicksspotlightleadsubmission          AS INT)
                      ,CAST(clickswecancallyou                      AS INT)
                      ,CAST(clicksleadsubmission                      AS INT)
                      ,CAST(clicksphonesubmission                  AS INT)
                      ,CAST(clickscommunityvideo                      AS INT)
                      ,CAST(clickslistingmap                          AS INT)
                      ,CAST(clicksmapdirections                      AS INT)
                      ,CAST(clicksprintableguide                      AS INT)
                      ,CAST(clicksphotos                              AS INT)
                      ,CAST(clicksspotlightphotos                  AS INT)
                      ,CAST(clicksspotlightphotopopup              AS INT)
                      ,CAST(clicksfloorplan                          AS INT)
                      ,CAST(clickscheckyourcredit                  AS INT)
                      ,CAST(clickswebbuilderlink                      AS INT)
                      ,CAST(clicksfeaturedmgtco                      AS INT)
                      ,CAST(clicksfrontpageproplead                  AS INT)
                      ,CAST(clicksluxuryslideshow                  AS INT)
                      ,CAST(imprsearchresults                      AS INT)
                      ,CAST(total_impressions                      AS INT)
                      ,CAST(imprefrontcover                          AS INT)
                      ,CAST(imprvisitcount                          AS INT)
                      ,CAST(viewing_from_email                      AS INT)
                      ,CAST(total_viewings                          AS INT)
                      ,CAST(textmsgweb                              AS INT)
                      ,CAST(textmsgmobile                          AS INT)
                      ,CAST(checklistingavail                      AS INT)
                      ,CAST(checksspotlightlistingavail              AS INT)
                      ,CAST(checksvirtualtourlistingavail          AS INT)
                      ,CAST(agcprintconnectedcalls                  AS INT)
                      ,CAST(agcprintmissedcalls                      AS INT)
                      ,CAST(asgprintconnectedcalls                  AS INT)
                      ,CAST(asgprintmissedcalls                      AS INT)
                      ,CAST(webconnectedcalls                      AS INT)
                      ,CAST(webmissedcalls                          AS INT)
                      ,CAST(rentalsconnectedcalls                  AS INT)
                      ,CAST(rentalsmissedcalls                      AS INT)
                      ,CAST(ctconnectedcalls                          AS INT)
                      ,CAST(ctcmissedcalls                          AS INT)
                      ,CAST(paidspconnectedcalls                      AS INT)
                      ,CAST(paidspmissedcalls                      AS INT)
                      ,CAST(combinedfeedsconnectedcalls              AS INT)
                      ,CAST(combinedfeedsmissedcalls                  AS INT)
                      ,CAST(googleconnectedcalls                      AS INT)
                      ,CAST(googlemissedcalls                      AS INT)
                      ,CAST(ppcconnectedcalls                      AS INT)
                      ,CAST(ppcmissedcalls                          AS INT)
                      ,CAST(luxuryconnectedcalls                      AS INT)
                      ,CAST(luxurymissedcalls                      AS INT)
                      ,CAST(marchexconnectedcalls                  AS INT)
                      ,CAST(marchexmissedcalls                      AS INT)
                      ,CAST(craigslistconnectedcalls                  AS INT)
                      ,CAST(craigslistmissedcalls                  AS INT)
                      ,CAST(weblocaltracknumconnectcalls              AS INT)
                      ,CAST(weblocaltracknummissedcalls              AS INT)
                      ,CAST(rentalslocalconnectedcalls              AS INT)
                      ,CAST(rentalslocalmissedcalls                  AS INT)
                      ,CAST(videoconnectedcalls                      AS INT)
                      ,CAST(videomissedcalls                          AS INT)
                      ,CAST(semconnectedcalls                      AS INT)
                      ,CAST(semmissedcalls                          AS INT)
                      ,CAST(truliaconnectedcalls                      AS INT)
                      ,CAST(truliamissedcalls                      AS INT)
                      ,CAST(futureconnectedcalls01                  AS INT)
                      ,CAST(futuremissedcalls01                      AS INT)
                      ,CAST(futureconnectedcalls02                  AS INT)
                      ,CAST(futuremissedcalls02                      AS INT)
                      ,CAST(futureconnectedcalls03                  AS INT)
                      ,CAST(futuremissedcalls03                      AS INT)
                      ,CAST(futureconnectedcalls04                  AS INT)
                      ,CAST(futuremissedcalls04                      AS INT)
                      ,CAST(futureconnectedcalls05                  AS INT)
                      ,CAST(futuremissedcalls05                      AS INT)
                      ,CAST(futureconnectedcalls06                  AS INT)
                      ,CAST(futuremissedcalls06                      AS INT)
                      ,CAST(futureconnectedcalls07                  AS INT)
                      ,CAST(futuremissedcalls07                      AS INT)
                      ,CAST(futureconnectedcalls08                  AS INT)
                      ,CAST(futuremissedcalls08                      AS INT)
                      ,CAST(futureconnectedcalls09                  AS INT)
                      ,CAST(futuremissedcalls09                      AS INT)
                      ,CAST(futureconnectedcalls10                  AS INT)
                      ,CAST(futuremissedcalls10                      AS INT)
                      ,CAST(agemailleads                              AS INT)
                      ,CAST(maetroemailleads                          AS INT)
                      ,CAST(neighborhoodemailleads                  AS INT)
                      ,CAST(aimcoemailleads                          AS INT)
                      ,CAST(rentalsemailleads                      AS INT)
                      ,CAST(rentaremailleads                          AS INT)
                      ,CAST(rentalhousesemailleads                  AS INT)
                      ,CAST(iphoneemailleads                          AS INT)
                      ,CAST(oodleemailleads                          AS INT)
                      ,CAST(androidemailleads                      AS INT)
                      ,CAST(hotpadsemailleads                      AS INT)
                      ,CAST(luxuryemailleads                          AS INT)
                      ,CAST(condoemailleads                          AS INT)
                      ,CAST(ipademailleads                          AS INT)
                      ,CAST(truliaemailleads                      AS INT)
                      ,CAST(zillowemailleads                      AS INT)
                      ,CAST(verticalbrandsemailleads              AS INT)
                      ,CAST(rdtfeedleads                          AS INT)
                      ,CAST(propsolutionsfeedleads                  AS INT)
                      ,CAST(yieldfeedleads                          AS INT)
                      ,CAST(agmobileemailleads                      AS INT)
                      ,CAST(rentalsmobileemailleads                  AS INT)
                      ,CAST(rentalsandroidemailleads              AS INT)
                      ,CAST(rentalsiphoneemailleads                  AS INT)
                      ,CAST(vastemailleads                          AS INT)
                      ,CAST(campushomesonlineemailleads              AS INT)
                      ,CAST(agtabletemailleads                      AS INT)
                      ,CAST(agkindleemailleads                      AS INT)
                      ,CAST(future1emailleads                      AS INT)
                      ,CAST(future2emailleads                      AS INT)
                      ,CAST(future3emailleads                      AS INT)
                      ,CAST(future4emailleads                      AS INT)
                      ,CAST(future5emailleads                      AS INT)
                      ,CAST(future6emailleads                      AS INT)
                      ,CAST(future7emailleads                      AS INT)
                      ,CAST(future8emailleads                      AS INT)
                      ,CAST(future9emailleads                      AS INT)
                      ,CAST(future0emailleads                      AS INT)
                      ,CAST(placementtier                          AS INT)
                      ,CAST(printproductpoints                      AS INT)
                      ,CAST(internetproductpoints                  AS INT)
                      ,CAST(legacyloyaltypoints                      AS INT)
                      ,CAST(contractloyaltypoints                  AS INT)
                      ,CAST(lastupdateymdid                          AS INT)
                      ,CAST(upselllistbold                          AS INT)
                      ,CAST(upselllistfrontcover                  AS INT)
                      ,CAST(upsellpropphotofeature                  AS INT)
                      ,CAST(upsellmgmtmanagementcologo              AS INT)
                      ,CAST(upsellproppropertylogo                  AS INT)
                      ,CAST(upsellproppremiumpackage              AS INT)
                      ,CAST(upselllistfloorplanpkg                  AS INT)
                      ,CAST(linkedfloorplan                          AS INT)
                      ,CAST(internetphoneleads                      AS INT)
                      ,CAST(internetphoneleads_nomobile              AS INT)
                      ,CAST(digitalphoneleads                      AS INT)
                      ,CAST(emailleads                              AS INT)
                      ,CAST(internetemailleads_nomobile              AS INT)
                      ,CAST(digitalemailleads                      AS INT)
                      ,CAST(agcmissedcalls                          AS INT)
                      ,CAST(asgmissedcalls                          AS INT)
                      ,CAST(agcallleads                              AS INT)
                      ,CAST(asgallleads                              AS INT)
                      ,CAST(allmissedcalls                          AS INT)
                      ,CAST(allconnectedcalls                      AS INT)
                      ,CAST(allleads                              AS INT)
                      ,CAST(allinternetleads_nomobile              AS INT)
                      ,CAST(alldigitalleads                          AS INT)
                      ,CAST(thirdpartyfeedleads                      AS INT)
                      ,CAST(websitecalls                          AS INT)
                      ,CAST(websiteemails                          AS INT)
                      ,CAST(websiteleads_rentals                  AS INT)
                      ,CAST(mobileemails                          AS INT)
                      ,CAST(mobilecalls                              AS INT)
                      ,CAST(mobileleads_ag                          AS INT)
                      ,CAST(mobileleads_rentals                      AS INT)
                      ,CAST(mobileallleads                          AS INT)
                      ,CAST(mrsyndicationemailleads                  AS INT)
                      ,CAST(mragemailleads                          AS INT)
                      ,CAST(mragwebphoneleads                      AS INT)
                      ,CAST(mrappsemailleads                      AS INT)
                      ,CAST(mrphonecalls                          AS INT)
                      ,CAST(rplrank                                  AS INT)
                      ,property_nm
                      ,market_nm
                      ,city_nm
                      ,state_cd
                      ,CAST(search_rank AS INT)
                      ,CAST(page_in_search  AS INT)

                      ,upgrade_tp
                      ,CAST(upgrade_monthly_cost AS NUMERIC(10,2))
                      ,upgrade_start_date
                      ,upgrade_end_date
                      ,CAST(sp.natural_impressions     AS INT)
                      ,CAST(sp.featured_impressions   AS INT)
                      ,CAST(sp.natural_viewings   AS INT)
                      ,CAST(sp.featured_viewings   AS INT)
                      ,CAST(sp.natural_hotleads   AS INT)
                      ,CAST(sp.featured_hotleads   AS INT)
                      ,CAST(sp.total_phonecall   AS INT)
                      ,CAST(sp.NATURAL_PHONECALLS as FLOAT)
                      ,CAST(sp.featured_phonecalls as FLOAT)
                      ,CAST(sp.total_hotlead   AS INT)
                      ,CAST(sp.natural_nrl      AS INT)
                      ,CAST(sp.featured_nrl   AS INT)
                      ,CAST(sp.total_leases   AS INT)
                      ,CAST(sp.market_nb   AS INT)
                      ,CAST(sp.paid_leases   AS INT)
                      ,sp.avg_call_duration
                      ,sp.company_nm
                      ,CAST(sp.company_id AS INT)
                      ,CAST(sp.success_fee AS FLOAT)
                      ,CAST(vip_impressions                    AS FLOAT)   

                      ,CAST(vip_viewings                          AS FLOAT)
                      ,CAST(vip_hotleads                          AS FLOAT)
                      ,CAST(vip_phonecalls                      AS FLOAT)
                      ,CAST(vip_nrl                              AS FLOAT)
                      ,CAST(pte_impressions                      AS FLOAT)
                      ,CAST(pte_viewings                          AS FLOAT)
                      ,CAST(pte_hotleads                          AS FLOAT)
                      ,CAST(pte_phonecalls                      AS FLOAT)
                      ,CAST(pte_nrl                              AS FLOAT)
                      ,property_status
                      ,phone_cd
                      ,property_address
                      ,fax_cd
                      ,email_nm
                      ,hotleademail_id
                      ,hotleadfax_id
                      ,CAST(unique_hotleads  AS FLOAT)
                      ,CAST(unique_viewings  AS FLOAT)
                      ,CAST(unique_pdp_overviews  AS FLOAT)
                      ,billing_address
                      ,billing_city
                      ,billing_state
                      ,billing_zip
                      ,billing_email
                      ,billing_phone
                      ,billing_fax
                      ,lease_faxed
                      ,lease_emailed
                      ,CAST(submarket_nb AS INT)
                      ,submarket_nm  
                      ,area_nm
                      ,image_included
                      ,specials
                      ,main_image_available
                      ,floorplan_available
                      ,logo_available
                      ,last_virtual_upload
                      ,searchable
                      ,cast(unique_hotleaders as float)
                      ,cast(natural_searchers as float)
                      ,cast(featured_searchers as float)
                      ,cast(sp.natural_viewers as float)
                      ,cast(sp.featured_viewers as float)
                      ,cast(sp.natural_hotleaders as float)
                      ,cast(sp.featured_hotleaders as float)
                      ,cast(sp.total_hotleaders as float)
                      ,cast(total_phonecallers    as float)
                      ,cast(featured_phonecallers as float)
                      ,cast(natural_phonecallers as float)
                      ,businessmodel_tp
                      ,DATEADD(hour,@TimeZoneOffset,activate_dm)
                      ,cast(sp.ConnectedCalls as float) );
            
              
EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
    @DatabaseName
   ,'APTG Staging.pr_tbl_mdim_property'
   ,'End Mart.MDimProperty Table Load'
   ,@SecondsStr
   ,0
   ,'End'
        

GO
/****** Object:  StoredProcedure [Dimension].[pr_listingmarket]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Dimension].[pr_listingmarket]
/*************************************************************************************************
*
* Name:	Dimension.pr_ListingMarket
*
* Desc: This pulls the Market for the Listing based on SFDC data	
*
* Test:	EXEC Dimension.pr_ListingMarket
*
* Note: This was created for Rentcom because of the change initiated on the AG side by the CDS team because of reporting issues. 
*		Before, the ListingMarket table was populated for both AG and Rent listings because it was pulling from Oracle. But now
*		we have separate procedures due to the SF XREF JOIN. There is a possibility for dupes to occur (most likely at the XREF level)
*		but we are not going to account for them in this procedure. They will need to be addressed at the source per DMac.
*
* Hist:	01	05/13/2014		Sarah Mims			Initial Version. Ticket # 15469
*		02	05/14/2014		Sarah Mims			Ticket # 15469 ISNULL MarketCD to 99999 and MarketName
*												to NoMarket per conversation with DMac
*		03	06/02/2014		Sarah Mims			No ticket - there were dupe issues in AG so I added WHERE rownum=1
*												to this proc as well to avoid any duplication issues
* Hist: 04	04/22/2016		Clinton Woody		Ticket #22366;  replaced community__c with VIEW
* Hist:	05	06/23/2016		Don Wert			Ticket 23374 - Rentcom.dimension.pr_listingsmarket was changed to use the VW_SalesForceCommunity 
*												view rather than the Community__c table per ticket 22366.  Since VW_SalesForceCommunity contains 
*												all the columns needed for the query, and the AG version was coded to use only that table, update 
*												the code to use the simplified version and to ignore any dimension records with RentPropertyID = 0.
**************************************************************************************************/
AS

SET NOCOUNT ON

-------------------------------------------------------
--Declare and set variables
-------------------------------------------------------
DECLARE @YMDID INT;

SET @YMDID = CAST(CONVERT(VARCHAR(8),GETDATE() - 1,112) AS INT);

-------------------------------------------------------
--Truncate the table
-------------------------------------------------------

TRUNCATE TABLE Rentcom.Dimension.ListingMarket

-------------------------------------------------------
--Populate the Listing Market table
-------------------------------------------------------

INSERT INTO Rentcom.Dimension.ListingMarket
        (ListingID
        ,MarketID
        ,ClientCode
        ,MarketCD
        ,MarketName
        ,MarketType
        ,NationalSalesMarket
        ,MaxPrimaryMarketID
        ,MaxPrimaryMarketCD
        ,MaxPrimaryMarketName
        ,MaxSecondaryMarketID
        ,MaxSecondaryMarketCD
        ,MaxSecondaryMarketName)
SELECT x.ListingID
        ,x.MarketID
        ,x.ClientCode
        ,x.MarketCD
        ,x.MarketName
        ,x.MarketType
        ,x.NationalSalesMarket
        ,x.MaxPrimaryMarketID
        ,x.MaxPrimaryMarketCD
        ,x.MaxPrimaryMarketName
        ,x.MaxSecondaryMarketID
        ,x.MaxSecondaryMarketCD
        ,x.MaxSecondaryMarketName
FROM
	(
	SELECT dl.ListingID
	,ISNULL(cc.[GEOMarketID],0)														AS MarketID
	,cc.RentMaxClientID																AS ClientCode			--use Salesforce.Dimension.Salesforce_XRef
	,ISNULL(cc.[GEOMarketMaxTerritoryID],99999)										AS MarketCD
	,ISNULL(cc.[GEOMarketName],'No Market')											AS MarketName
	,'RENT'																			AS MarketType			--Hard Coded to AGC per David
	,CASE WHEN cc.Centralized_Nat_l_Account__c = 'Centralized' THEN 1 ELSE 0 END	AS NationalSalesMarket	--Is there a flag in SF. If not, hard code to zero.
	,ISNULL(cc.[GEOMarketID],0)														AS MaxPrimaryMarketID
	,ISNULL(cc.[GEOMarketMaxTerritoryID],99999)										AS MaxPrimaryMarketCD
	,ISNULL(cc.[GEOMarketName],'No Market')											AS MaxPrimaryMarketName
	,ISNULL(cc.[GEOMarketID],0)														AS MaxSecondaryMarketID
	,ISNULL(cc.[GEOMarketMaxTerritoryID],99999)										AS MaxSecondaryMarketCD
	,ISNULL(cc.[GEOMarketName],'No Market')											AS MaxSecondaryMarketName
	,ROW_NUMBER() OVER(PARTITION BY dl.ListingID,cc.[GEOMarketMaxTerritoryID] ORDER BY cc.[RentMaxClientID]) AS RowNum
	FROM RentCom.Dimension.Listings AS dl
	LEFT OUTER JOIN Salesforce.dbo.VW_SalesForceCommunity AS cc  --Community__c AS cc
		ON dl.RentPropertyID = cc.RentPropertyID
	WHERE dl.RentPropertyID <> 0

/*
	SELECT dl.ListingID
	,ISNULL(smc.Market_ID__c,0)														AS MarketID
	,s.RENTBILLINGID																AS ClientCode			--use Salesforce.Dimension.Salesforce_XRef
	,ISNULL(smc.Max_Territory_Id__c,99999)											AS MarketCD
	,ISNULL(smc.Name,'No Market')													AS MarketName
	,'RENT'																			AS MarketType			--Hard Coded to AGC per David
	,CASE WHEN cc.Centralized_Nat_l_Account__c = 'Centralized' THEN 1 ELSE 0 END		AS NationalSalesMarket	--Is there a flag in SF. If not, hard code to zero.
	,ISNULL(smc.Market_ID__c,0)														AS MaxPrimaryMarketID
	,ISNULL(smc.Max_Territory_Id__c,99999)											AS MaxPrimaryMarketCD
	,ISNULL(smc.Name,'No Market')													AS MaxPrimaryMarketName
	,ISNULL(smc.Market_ID__c,0)														AS MaxSecondaryMarketID
	,ISNULL(smc.Max_Territory_Id__c,99999)											AS MaxSecondaryMarketCD
	,ISNULL(smc.Name,'No Market')													AS MaxSecondaryMarketName
	,ROW_NUMBER() OVER(PARTITION BY dl.ListingID,smc.Max_Territory_Id__c ORDER BY s.RENTBILLINGID) AS RowNum
	FROM RentCom.Dimension.Listings AS dl
	LEFT OUTER JOIN Salesforce.dimension.SALESFORCE_XREF AS s
		ON dl.RentPropertyID = s.RENTPROPERTYID
	LEFT OUTER JOIN Salesforce.dbo.VW_SalesForceCommunity AS cc  --Community__c AS cc
		ON s.SalesForceCommunityID = cc.CommunityID
	LEFT OUTER JOIN Salesforce.dbo.GEO_Area__c AS gac
		ON cc.GEOAreaId__c = gac.Id
	LEFT OUTER JOIN Salesforce.dbo.Sales_Market__c AS smc
		ON gac.Sales_Market__c = smc.ID
*/
	) AS x
WHERE x.RowNum = 1


-------------------------------------------------------
--Populate the Listing Market Daily table
-------------------------------------------------------

  DELETE  FROM [Dimension].[ListingMarketDaily]
  WHERE   ymdid = @YMDID


 INSERT  INTO [Dimension].[ListingMarketDaily]
            (YMDID
            ,[ListingID]
            ,[MarketID]
            ,[ClientCode]
            ,[MarketCD]
            ,[MarketName]
            ,[MarketType]
            ,[NationalSalesMarket]
            ,[MaxPrimaryMarketID]
            ,[MaxPrimaryMarketCD]
            ,[MaxPrimaryMarketName]
            ,[MaxSecondaryMarketID]
            ,[MaxSecondaryMarketCD]
            ,[MaxSecondaryMarketName])
            SELECT  @YMDID
                   ,[ListingID]
                   ,[MarketID]
                   ,[ClientCode]
                   ,[MarketCD]
                   ,[MarketName]
                   ,[MarketType]
                   ,[NationalSalesMarket]
                   ,[MaxPrimaryMarketID]
                   ,[MaxPrimaryMarketCD]
                   ,[MaxPrimaryMarketName]
                   ,[MaxSecondaryMarketID]
                   ,[MaxSecondaryMarketCD]
                   ,[MaxSecondaryMarketName]
            FROM    Dimension.ListingMarket

SET NOCOUNT OFF











GO
/****** Object:  StoredProcedure [Mart].[ListingsReplaceFromAPSProcessing]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/*--######################################################################################
*
* Name:	[Mart].[ListingsReplaceFromAPSProcessing]
*
* Desc:	Replace in Mart.Listings the data that was thrown over from APS processing for Mart.Listings
*
* Test:	EXEC Mart.ListingsReplaceFromAPSProcessing
*
* Hist:	01	06/03/2016	Bob Langley		Ticket 23334 - Initial Version 
--#######################################################################################*/
CREATE PROCEDURE [Mart].[ListingsReplaceFromAPSProcessing]
AS 
BEGIN
    SET NOCOUNT ON;

	DECLARE
		@ErrorMessage					NVARCHAR(4000),
		@ErrorNumber					INT,
		@ErrorSeverity					INT,
		@ErrorState						INT,
		@ErrorLine						INT,
		@ErrorProcedure					NVARCHAR(200)

	DECLARE @codesection	varchar(2000)



	/* ===================================================================================================================== */
	SET @codesection = 'Start Processing'
	
	BEGIN TRY
		if EXISTS(SELECT DISTINCT YMDID FROM RentCom.Staging.MartListingsAPSThrowOver)
			BEGIN
				BEGIN TRANSACTION
					PRINT 'In transaction'

					SET @codesection = 'Delete from Mart.Listings where the YMDID is in the YMDID values in throw over data table.'

					DELETE FROM RentCom.Mart.Listings
					WHERE YMDID IN (SELECT DISTINCT YMDID FROM RentCom.Staging.MartListingsAPSThrowOver)


					SET @codesection = 'Insert into Mart.Listings the data that is in the throw over table.'

					INSERT INTO RentCom.Mart.Listings				-- To be the live table when done testing.
					(
					[YMDID]
					, [YearMonth]
					, [RentPropertyID]
					, [PropertyID]
					, [ListingID]
					, [ListingTypeID]
					, [ListingType]
					, [ListingTypeShort]
					, [RentStatusID]
					, [ExternalID]
					, [ExternalPriceCode]
					, [RentLeaseMgtCoID]
					, [LeaseMgtCoID]
					, [TotalPhotos]
					, [ActivePhotos]
					, [TotalFloorPlans]
					, [ActiveFloorPlans]
					, [TotalAmenities]
					, [ActiveAmenities]
					, [ActiveHDPhotos]
					, [ActiveHDFloorPlans]
					, [ShowPricing]
					, [ShowOfficeHours]
					, [ListingDescriptionLength]
					, [LowPrice]
					, [HighPrice]
					, [UpsellListCoupon]
					, [UpsellPropCallRecording]
					, [UpsellRentListing]
					, [UpsellRentRewardCard]
					, [UpsellRentFeaturedPlacement]
					, [UpsellRentPTE]
					, [UpsellRentVIPPlacement]
					, [UpsellRentNoVacancy]
					, [UpsellRentMetroFL]
					, [UpsellRentSpotlight]
					, [UpsellRentSubscriptionModel]
					, [UpsellListPayPerLeaseALM]
					, [FutureUpsell04]
					, [CR3AvgOverallRating]
					, [HDActiveFloorPlansFulfilled]
					, [HDActivePhotosFulfilled]
					, [LinkedFloorPlanFulfilled]
					, [Linked3DFloorPlanFulfilled]
					, [LinkedRoomPlannerFulfilled]
					, [MobileDealFulfilled]
					, [CouponActiveOnSite]
					, [LastUpdateYMDID]
					, [LinkedFloorPlan]
					, [Linked3DFloorPlan]
					, [LinkedRoomPlanner]
					, [UniqueVisits]
					, [MapClicks]
					, [ClicksMgtCoWebLink]
					, [FutureClicks01]
					, [FutureClicks02]
					, [FutureClicks03]
					, [FutureClicks04]
					, [FutureClicks05]
					, [ImprSearchResults]
					, [RentConnectedCalls]
					, [RentMissedCalls]
					, [RentOneWebConnectedCalls]
					, [RentOneWebMissedCalls]
					, [RentAltRegConnectedCalls]
					, [RentAltRegMissedCalls]
					, [RentMobileConnectedCalls]
					, [RentMobileMissedCalls]
					, [RentSEMConnectedCalls]
					, [RentSEMMissedCalls]
					, [RentMobileSEMConnectedCalls]
					, [RentMobileSEMMissedCalls]
					, [FutureConnectedCalls03]
					, [FutureMissedCalls03]
					, [RentEmailLeads]
					, [TruliaEmailLeads]
					, [AndroidEmailLeads]
					, [iPadEmailLeads]
					, [iPhoneEmailLeads]
					, [FutureEmailLeads01]
					, [FutureEmailLeads02]
					, [FutureEmailLeads03]
					, [FutureEmailLeads04]
					, [InvoicedLeases]
					)
					SELECT
					[YMDID]
					, [YearMonth]
					, [RentPropertyID]
					, [PropertyID]
					, [ListingID]
					, [ListingTypeID]
					, [ListingType]
					, [ListingTypeShort]
					, [RentStatusID]
					, [ExternalID]
					, [ExternalPriceCode]
					, [RentLeaseMgtCoID]
					, [LeaseMgtCoID]
					, [TotalPhotos]
					, [ActivePhotos]
					, [TotalFloorPlans]
					, [ActiveFloorplans]
					, [TotalAmenities]
					, [ActiveAmenities]
					, [ActiveHDPhotos]
					, [ActiveHDFloorPlans]
					, [ShowPricing]
					, [ShowOfficeHours]
					, [ListingDescriptionLength]
					, [LowPrice]
					, [HighPrice]
					, [UpsellListCoupon]
					, [UpsellPropCallRecording]
					, [UpsellRentListing]
					, [UpsellRentRewardCard]
					, [UpsellRentFeaturedPlacement]
					, [UpsellRentPTE]
					, [UpsellRentVIPPlacement]
					, [UpsellRentNoVacancy]
					, [UpsellRentMetroFL]
					, [UpsellRentSpotlight]
					, [UpsellRentSubscriptionModel]
					, [UpsellListPayPerLeaseALM]
					, [FutureUpsell04]
					, [CR3AvgOverallRating]
					, [HDActiveFloorPlansFulfilled]
					, [HDActivePhotosFulfilled]
					, [LinkedFloorPlanFulfilled]
					, [Linked3DFloorPlanFulfilled]
					, [LinkedRoomPlannerFulfilled]
					, [MobileDealFulfilled]
					, [CouponActiveOnSite]
					, [LastUpdateYMDID]
					, [LinkedFloorPlan]
					, [Linked3DFloorPlan]
					, [LinkedRoomPlanner]
					, [UniqueVisits]
					, [MapClicks]
					, [ClicksMgtCoWebLink]
					, [FutureClicks01]
					, [FutureClicks02]
					, [FutureClicks03]
					, [FutureClicks04]
					, [FutureClicks05]
					, [ImprSearchResults]
					, [RentConnectedCalls]
					, [RentMissedCalls]
					, [RentOneWebConnectedCalls]
					, [RentOneWebMissedCalls]
					, [RentAltRegConnectedCalls]
					, [RentAltRegMissedCalls]
					, [RentMobileConnectedCalls]
					, [RentMobileMissedCalls]
					, [RentSEMConnectedCalls]
					, [RentSEMMissedCalls]
					, [RentMobileSEMConnectedCalls]
					, [RentMobileSEMMissedCalls]
					, [FutureConnectedCalls03]
					, [FutureMissedCalls03]
					, [RentEmailLeads]
					, [TruliaEmailLeads]
					, [AndroidEmailLeads]
					, [iPadEmailLeads]
					, [iPhoneEmailLeads]
					, [FutureEmailLeads01]
					, [FutureEmailLeads02]
					, [FutureEmailLeads03]
					, [FutureEmailLeads04]
					, [InvoicedLeases]
					FROM RentCom.Staging.MartListingsAPSThrowOver
					ORDER BY YMDID, ListingID




				COMMIT TRANSACTION
			END

		SET @codesection = 'Committed transaction of writing to Mart.Listings table the throw over records'

	END TRY
	BEGIN CATCH
		SELECT 
			@ErrorMessage		= ERROR_MESSAGE(),
			@ErrorNumber		= ERROR_NUMBER(),
			@ErrorSeverity		= ERROR_SEVERITY(),
			@ErrorState			= ERROR_STATE(),
			@ErrorLine			= ERROR_LINE(),
			@ErrorProcedure		= ISNULL(ERROR_PROCEDURE(), '-');
		
		SET @ErrorMessage = 'Attempting to load Mart.Listings with APS throw over data records. Error in code section - ' + @codesection + '   Error - ' + @ErrorMessage


		if @@trancount > 0
			ROLLBACK TRANSACTION


		raiserror(@ErrorMessage,16,1) with log;

		RETURN 0		-- for SPROC              This jumps out of the code or SPROC.  Note that RAISEERROR no longer jumps out, must have RETURN to make it stop execution.
	
	END CATCH





	SET @codesection = 'Finished Processing'



	SET NOCOUNT OFF;
END;




GO
/****** Object:  StoredProcedure [Mart].[pr_ExactTarget_PTE]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Mart].[pr_ExactTarget_PTE]
    

/*******************************************************************************************
* Name:	mart.pr_ExactTarget_PTE
* ------------------------------------------------------------------------------------------
* Desc:	
* ------------------------------------------------------------------------------------------
* Test:	EXEC mart.pr_ExactTarget_PTE
        
* ------------------------------------------------------------------------------------------
* Notes: 
* ------------------------------------------------------------------------------------------
* Hist:	01	06/25/2015	Richard Chen       Initial Version, Ticket 19523
********************************************************************************************/
AS 
    BEGIN
        SET NOCOUNT ON;
        BEGIN TRY
            BEGIN TRANSACTION
            MERGE INTO RentCom.Fact.ExactTarget_PTE AS tgt
                USING 
                    ( SELECT    ymdid ,
                                PropertyID ,
                                ListingID ,
                                EmailName ,
                                PTE ,
                                Sendcount         = MAX(sendcount) ,
                                deliveredCount    = MAX(deliveredcount) ,
                                Opens             = MAX(Opens) ,
                                Clicks            = MAX(Clicks),
								CampaignBusinessKey=REVERSE(SUBSTRING(REVERSE(emailname),1, charindex('_',REVERSE(emailname))-1))
                      FROM      Staging.ExactTarget_PTE
                      GROUP BY  ymdid ,
                                PropertyID ,
                                ListingID ,
                                EmailName ,
                                PTE
                    ) AS src
                ON tgt.ymdid = src.Ymdid
                    AND tgt.propertyid = src.propertyid
                    AND tgt.listingid = src.listingid
                    AND tgt.EmailName = src.EmailName
                    AND tgt.PTE = src.PTE

------------------------------------------
/*When there is a match within the target 
and source tables and any of the column values 
are different then update all attributes*/ 
-------------------------------------------
                WHEN MATCHED AND ( tgt.Sendcount         <> src.Sendcount
                                   OR tgt.deliveredCount <> src.deliveredCount
                                   OR tgt.Opens          <> src.Opens
                                   OR tgt.Clicks         <> src.Clicks
                                 )
                    THEN UPDATE
                         SET    tgt.Sendcount         = src.Sendcount ,
                                tgt.deliveredCount    = src.deliveredCount ,
                                tgt.Opens             = src.Opens ,
                                tgt.Clicks            = src.Clicks,
								tgt.DT_Updated        = GETDATE(),
								tgt.CampaignBusinessKey=src.CampaignBusinessKey


------------------------------------------
/*When there is a listing id in the source
that is not in the target then insert the 
new listing ids from the source*/ 
------------------------------------------
                WHEN NOT MATCHED BY TARGET 
                    THEN INSERT (
                                  ListingID ,
                                  PropertyID ,
                                  EmailName ,
                                  YMDID ,
                                  PTE ,
                                  SendCount ,
                                  DeliveredCount ,
                                  Opens ,
                                  Clicks,
								  DT_Updated,
								  CampaignBusinessKey
                                )
                         VALUES ( src.ListingID ,
                                  src.PropertyID ,
                                  src.EmailName ,
                                  src.YMDID ,
                                  src.PTE ,
                                  src.SendCount ,
                                  src.DeliveredCount ,
                                  src.Opens ,
                                  src.Clicks,
								  GETDATE(),
								  src.CampaignBusinessKey
		                        );
            COMMIT;
        END TRY
        BEGIN CATCH
	--SET @ErrMessageText1 = ERROR_MESSAGE();
            ROLLBACK TRANSACTION;
    --SET @FailFlag = 1;
        END CATCH	

        SET NOCOUNT OFF;

    END





GO
/****** Object:  StoredProcedure [Mart].[pr_Listings]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







CREATE PROCEDURE [Mart].[pr_Listings] (@YMDID INT = NULL)

/****************************************************************************************************************************************************
* Name: Mart.pr_Listings
* Desc: Marts the listing grain. One row per listing per day
* ----------------------------------------------------------------------------------------------------------
* Test: EXEC Mart.pr_Listings
* ----------------------------------------------------------------------------------------------------------
* Note:	Can be rerun multiple times, as it will clean-up before loading
*       If it is run for a day in the past, the listing dimension data
*       will reflect current status, so only do so if necessary
* ----------------------------------------------------------------------------------------------------------
* Hist: 01	12/11/2013    	Brian Trembley		Initial version. Ticket #14084.
*		02	12/17/2013		Sarah Mims			Added Rent Calls. Ticket #14084.
*		03	12/18/2013		Sarah Mims			Added Rent Emails. Ticket # 14084.
*		04	12/19/2013		Sarah Mims			Modified to pull leads from Fact instead of dbo tables because I changed the schema	
*		05	01/14/2014		Sarah Mims			Ticket # 14084 added LowPrice and HighPrice since they are in Dimension.Listings now. Also added
*												some future columns.	
*		06	02/27/2014		Sarah Mims			Ticket # 14084 added logic to pull Invoiced Leases Dimension.Invoices (this is a table built on a view 
*												from Epicor and is what will be used when we go to production). Also added Trulia Email leads and changed
*												the name from RENT for the email source to the actual email source.
*		07	03/17/2014		Sarah Mims			Ticket # 14435 added RentLeaseMgtCoID and LeaseMgtCoID
*		08	03/19/2014		Sarah Mims			Ticket # 14084 added "original" to "default" for RentConnected/MissedCalls. This is per direction from
*												Ripta Pasay at Rent.
*		09	04/23/2014		Sarah Mims			Ticket # 15259 Added ImprSearchResults and ClicksMgtCoWebLink
*		10	04/23/2014		Sarah Mims			Ticket # 125321 Added ActiveHDPhotos, ActiveHDVideos, ShowOfficeHours,ListingDescriptionLength,
*												HDActiveFloorPlansFulfilled, HDActivePhotosFulfilled, LinkedFloorPlanFulfilled
*		11	05/07/2014		Don Wert			Ticket # 15463, add CR3AvgOverallRating.
*		12	05/21/2014		Sarah Mims			Ticket # 15668 added UpsellRentMetroFL and UpsellRentSubscriptionModel
*		13	06/04/2014		Sarah Mims			Ticket # 15834 - moved the Marting of Invoiced Leases to an update procedure named Mart.pr_UpdateInvoicedLeases
*		14	06/06/2014		Sarah Mims			No ticket - reviewed code based on job failure and realized I was pulling in ImprSearchResults and ClicksMgtCoWebLink
*												based on ListingID and NOT RentPropertyID which is wrong. Changed the join to RentPropertyID.
*												I'm not going back and remarting this data so there! :)
*		15	07/14/2014		Chadwick Smith		Ticket # 16085 - added Linked3DFloorPlanFulfilled, LinkedRoomPlannerFulfilled, MobileDealFulfilled, Linked3DFloorPlan, LinkedRoomPlanner
*		16	10/28/2014		Don Wert			Ticket 17251, update email count to include Status=1
*		17	11/11/2014		Sarah Mims			Ticket # 17396 - update email source of 'trulia_hl' to only include Status = 1
* 		18	03/12/2015		Don Wert			Ticket 18410, add UpsellRentSpotlight
*		19	05/21/2015		Sarah Mims			Ticket # 19441 - updated Rent Email pull
*		20	05/27/2015		Sarah Mims			Ticket # 19582 - updated Rent Email pull AGAIN.
*		21	05/29/2015		Sarah Mims			Ticket # 19582 - Added Rent SEM Calls and SEM Mobile Calls
*		22	08/20/2015		Don Wert			Ticket 20210, add UpsellListPayPerLeaseALM
*		23	06/21/2016		Bob Langley			Ticket 23334 - Changed to use Mart.Listings_Legacy instead of Mart.Listings.  Sending all new info to _Legacy table for safekeeping for now.
*****************************************************************************************************************************************************/
AS 
SET NOCOUNT ON;

DECLARE @DatabaseName VARCHAR(128)
SET @DatabaseName = DB_NAME()
	
-- Patch to use Todays parse data or load previous parsed data from Archived Parsed Data
EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
    @DatabaseName
   ,'RentCom Mart.pr_Listings'
   ,'START'
   ,'0 Seconds'
   ,0
   ,'Starting';

-- used for debuggin	
DECLARE @LastDateTime DATETIME;
DECLARE @SecondsStr VARCHAR(300);
DECLARE @TotalSecondsStr VARCHAR(300);
DECLARE @YMID INT;

SET @lastdateTime = GETDATE();

-------------------------------------------------------
-- Default to yesterday
-------------------------------------------------------
IF @YMDID IS NULL 
    BEGIN
        SET @YMDID = CAST(CONVERT(VARCHAR(8),GETDATE() - 1,112) AS INT);
    END

SET @YMID = @YMDID / 100

-------------------------------------------------------
-- Create a temporary table to hold the UniqueVisits data by listingid
-------------------------------------------------------
	

BEGIN TRY
    DROP TABLE #UniqueVisits
END TRY
BEGIN CATCH
END CATCH

SELECT ListingID = p1.measure
    ,UniqueVisits = COUNT(DISTINCT p2.Measure)
INTO #UniqueVisits
FROM   RentCom.dbo.ParsedData AS p1
INNER JOIN RentCom.dbo.ParsedData AS p2
    ON p1.ParseID = p2.ParseID
WHERE  (p1.MeasureType = 'a_l_pv'
        OR p1.MeasureType = 'DPG')
    AND p2.MeasureType = 'WT.vt_sid'
GROUP BY p1.measure

-- remove invalid listings
delete from #UniqueVisits
where ISNUMERIC(ListingID) = 0
        OR CHARINDEX('a',ListingID) = 1
        OR CHARINDEX('b',ListingID) = 1
        OR CHARINDEX('c',ListingID) = 1
        OR CHARINDEX('d',ListingID) = 1
        OR CHARINDEX('e',ListingID) = 1
        OR CHARINDEX('f',ListingID) = 1

DELETE FROM #UniqueVisits
WHERE CAST(listingid AS FLOAT) > 2111777777

--CREATE UNIQUE INDEX uidx#ListingID ON #UniqueVisits(ListingID)
--drop index uidx#ListingID ON #UniqueVisits

SET @SecondsStr = CAST(DATEDIFF(ss,@lastdatetime,GETDATE()) AS VARCHAR(300)) + ' Seconds';
EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
    @DatabaseName
   ,'RentCom Mart.pr_Listings'
   ,'EndBuildVisit'
   ,@SecondsStr
   ,0
   ,'End'
SET @lastdateTime = GETDATE();    

-------------------------------------------------------
-- Create a temporary table to hold the MapClicks data by listingid
-------------------------------------------------------
IF OBJECT_ID('tempdb..#MapClicks') IS NOT NULL
	BEGIN 
		DROP TABLE #MapClicks
	END 

-------------------------------------------------------
-- Mart web listing pageviews and visits for mobile
-------------------------------------------------------

SELECT  ListingID
       ,SUM(1) AS MapClicks
INTO    #MapClicks
FROM    (
         SELECT ParseID
               ,ProfileID
               ,YMDID
               ,EventDate
               ,MeasureType
               ,Measure
         FROM   dbo.ParsedData
         WHERE  YMDID = @YMDID
                AND MeasureType IN ('listingid','wt.dl','clicktype','clickvalue')
        ) X PIVOT ( MAX(Measure) FOR MeasureType IN ([listingid],[wt.dl],[clicktype],[clickvalue]) ) P
WHERE   (p.clicktype = 'mapview'
         OR p.clicktype = 'mapsDirections'
         OR p.clickvalue = 'Map')
        AND p.[wt.dl] = 'click'
        AND ISNUMERIC(ISNULL(p.[listingid],0)) = 1
GROUP BY ListingID


-- remove invalid listings
delete from #MapClicks
where ISNUMERIC(ListingID) = 0
        OR CHARINDEX('a',ListingID) = 1
        OR CHARINDEX('b',ListingID) = 1
        OR CHARINDEX('c',ListingID) = 1
        OR CHARINDEX('d',ListingID) = 1
        OR CHARINDEX('e',ListingID) = 1
        OR CHARINDEX('f',ListingID) = 1

DELETE FROM #MapClicks
WHERE CAST(listingid AS FLOAT) > 2111777777

--CREATE UNIQUE INDEX uidx#ListingID ON #MapClicks(ListingID)
--drop index uidx#ListingID ON #MapClicks

SET @SecondsStr = CAST(DATEDIFF(ss,@lastdatetime,GETDATE()) AS VARCHAR(300)) + ' Seconds';
EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
    @DatabaseName
   ,'RentCom Mart.pr_Listings'
   ,'EndBuildMapClicks'
   ,@SecondsStr
   ,0
   ,'End'
SET @lastdateTime = GETDATE();    


-------------------------------------------------------
-- Delete for passed-in date, in case this is a rerun
-------------------------------------------------------
DELETE  FROM Mart.Listings_Legacy
WHERE   YMDID = @YMDID
    
SET @SecondsStr = CAST(DATEDIFF(ss,@lastdatetime,GETDATE()) AS VARCHAR(300)) + ' Seconds';
EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
    @DatabaseName
   ,'RentCom Mart.pr_Listings'
   ,'BeginMartListing'
   ,@SecondsStr
   ,0
   ,'Begin'
SET @lastdateTime = GETDATE();

-------------------------------------------------------
-- Now we can mart the data for the day
-------------------------------------------------------
INSERT  INTO Mart.Listings_Legacy
        SELECT  @YMDID					AS YMDID
               ,@YMID					AS YearMonth 
			   ,dl.RentPropertyID						  
               ,dl.PropertyID
			   ,dl.ListingID
               ,dl.ListingTypeID
               ,dl.ListingType
               ,dl.ListingTypeShort
               ,dl.RentStatusID
               ,dl.ExternalID
               ,dl.ExternalPriceCode
			   ,ISNULL(dl.RentCompanyID,0)		AS RentLeaseMgtCoID
			   ,dl.RentMgtCoID					AS LeaseMgtCoID
               ,dl.TotalPhotos
               ,dl.ActivePhotos
               ,dl.TotalFloorPlans
               ,dl.ActiveFloorPlans
               ,dl.TotalAmenities
               ,dl.ActiveAmenities
			   ,dl.ActiveHDPhotos
			   ,dl.ActiveHDFloorPlans
               ,dl.ShowPricing
			   ,dl.ShowOfficeHours
			   ,dl.ListingDescriptionLength
			   ,dl.LowPrice
			   ,dl.HighPrice
               ,dl.UpsellListCoupon
               ,dl.UpsellPropCallRecording
               ,dl.UpsellRentListing
               ,dl.UpsellRentRewardCard
               ,dl.UpsellRentFeaturedPlacement
               ,dl.UpsellRentPTE
               ,dl.UpsellRentVIPPlacement
			   ,dl.UpsellRentNoVacancy
			   ,dl.UpsellRentMetroFL
			   ,dl.UpsellRentSpotlight
			   ,dl.UpsellRentSubscriptionModel
			   ,dl.UpsellListPayPerLeaseALM
			   ,CAST(0 AS INT)										AS FutureUpsell04
			   ,dl.CR3AvgOverallRating
			   ,dl.HDActiveFloorPlansFulfilled
			   ,dl.HDActivePhotosFulfilled
			   ,dl.LinkedFloorPlanFulfilled
			   ,dl.Linked3DFloorPlanFulfilled
			   ,dl.LinkedRoomPlannerFulfilled
			   ,dl.MobileDealFulfilled
               ,dl.CouponActiveOnSite
               ,dl.LastUpdateYMDID
               ,dl.LinkedFloorPlan
			   ,dl.Linked3DFloorPlan
			   ,dl.LinkedRoomPlanner
               ,ISNULL(UV.UniqueVisits,0)							AS UniqueVisits		
               ,ISNULL(MC.MapClicks,0)								AS MapClicks
			   ,ISNULL(p.ClicksMgtCoWebLink,0)						AS ClicksMgtCoWebLink
			   ,CAST(0 AS INT)										AS FutureClicks01
			   ,CAST(0 AS INT)										AS FutureClicks02
			   ,CAST(0 AS INT)										AS FutureClicks03
			   ,CAST(0 AS INT)										AS FutureClicks04
			   ,CAST(0 AS INT)										AS FutureClicks05
			   ,CAST(ISNULL(imp.Impressions,0) AS INT)				AS ImprSearchResults		
			   ,CAST(ISNULL(rc.RentConnectedCalls,0) AS INT)		AS RentConnectedCalls
               ,CAST(ISNULL(rc.RentMissedCalls,0) AS INT)			AS RentMissedCalls
               ,CAST(ISNULL(rc.RentOneWebConnectedCalls,0) AS INT)	AS RentOneWebConnectedCalls
               ,CAST(ISNULL(rc.RentOneWebMissedCalls,0) AS INT)		AS RentOneWebMissedCalls
               ,CAST(ISNULL(rc.RentAltRegConnectedCalls,0) AS INT)	AS RentAltRegConnectedCalls
               ,CAST(ISNULL(rc.RentAltRegMissedCalls,0) AS INT)		AS RentAltRegMissedCalls
               ,CAST(ISNULL(rc.RentMobileConnectedCalls,0) AS INT)	AS RentMobileConnectedCalls
               ,CAST(ISNULL(rc.RentMobileMissedCalls,0) AS INT)		AS RentMobileMissedCalls
			   ,CAST(ISNULL(rc.RentSEMConnectedCalls,0) AS INT)		AS RentSEMConnectedCalls
			   ,CAST(ISNULL(rc.RentSEMMissedCalls,0) AS INT)		AS RentSEMMissedCalls
			   ,CAST(ISNULL(rc.RentMobileSEMConnectedCalls,0) AS INT)	AS RentMobileSEMConnectedCalls
			   ,CAST(ISNULL(rc.RentMobileSEMMissedCalls,0) AS INT)		AS RentMobileSEMMissedCalls
			   ,CAST(0 AS INT)										AS FutureConnectedCalls03
			   ,CAST(0 AS INT)										AS FutureMissedCalls03
			   ,CAST(ISNULL(rl.RentEmailLeads,0) AS INT)			AS RentEmailLeads
			   ,CAST(ISNULL(rl.TruliaEmailLeads,0) AS INT)			AS TruliaEmailLeads
			   ,CAST(ISNULL(rl.AndroidEmailLeads,0) AS INT)			AS AndroidEmailLeads
			   ,CAST(ISNULL(rl.iPadEmailLeads,0) AS INT)			AS iPadEmailLeads
			   ,CAST(ISNULL(rl.iPhoneEmailLeads,0) AS INT)			AS iPhoneEmailLeads
			   ,CAST(0 AS INT)										AS FutureEmailLeads01
			   ,CAST(0 AS INT)										AS FutureEmailLeads02
			   ,CAST(0 AS INT)										AS FutureEmailLeads03
			   ,CAST(0 AS INT)										AS FutureEmailLeads04
			   ,CAST(0 AS INT)										AS InvoicedLeases		
        FROM    Rentcom.Dimension.Listings_Legacy AS dl
        LEFT JOIN #UniqueVisits AS UV
                ON dl.RentPropertyID = UV.ListingID
        LEFT JOIN #MapClicks MC
                ON dl.RentPropertyID = MC.ListingID
		----------------------------------------------------
		--Mart Call Leads
		----------------------------------------------------
		LEFT OUTER JOIN 
					   (
                       SELECT   ListingID
                               ,RentConnectedCalls = SUM(CASE WHEN CallType IN ('default','original')
                                                                   AND CallStatus = 1 THEN 1
                                                              ELSE 0
                                                         END)
                               ,RentMissedCalls = SUM(CASE WHEN CallType IN ('default','original')
                                                                AND CallStatus <> 1 THEN 1
                                                           ELSE 0
                                                      END)
                               ,RentOneWebConnectedCalls = SUM(CASE WHEN CallType IN ('oneweb','onewebs')
                                                                         AND CallStatus = 1 THEN 1
                                                                    ELSE 0
                                                               END)
                               ,RentOneWebMissedCalls = SUM(CASE WHEN CallType IN ('oneweb','onewebs')
                                                                      AND CallStatus <> 1 THEN 1
                                                                 ELSE 0
                                                            END)
                               ,RentAltRegConnectedCalls = SUM(CASE WHEN CallType IN ('altreg','altregs')
                                                                         AND CallStatus = 1 THEN 1
                                                                    ELSE 0
                                                               END)
                               ,RentAltRegMissedCalls = SUM(CASE WHEN CallType IN ('altreg','altregs')
                                                                      AND CallStatus <> 1 THEN 1
                                                                 ELSE 0
                                                            END)
                               ,RentMobileConnectedCalls = SUM(CASE WHEN CallType IN ('mobile','mobiles')
                                                                         AND CallStatus = 1 THEN 1
                                                                    ELSE 0
                                                               END)
                               ,RentMobileMissedCalls = SUM(CASE WHEN CallType IN ('mobile','mobiles')
                                                                      AND CallStatus <> 1 THEN 1
                                                                 ELSE 0
                                                            END)
                               ,RentSEMConnectedCalls = SUM(CASE WHEN CallType = 'SEM'
                                                                         AND CallStatus = 1 THEN 1
                                                                    ELSE 0
                                                               END)
                               ,RentSEMMissedCalls = SUM(CASE WHEN CallType = 'SEM'
                                                                      AND CallStatus <> 1 THEN 1
                                                                 ELSE 0
                                                            END)
                               ,RentMobileSEMConnectedCalls = SUM(CASE WHEN CallType = 'MOBILESEM'
                                                                         AND CallStatus = 1 THEN 1
                                                                    ELSE 0
                                                               END)
                               ,RentMobileSEMMissedCalls = SUM(CASE WHEN CallType = 'MOBILESEM'
                                                                      AND CallStatus <> 1 THEN 1
                                                                 ELSE 0
                                                            END)

                       FROM     Rentcom.Fact.CallsRentCom
                       WHERE    YMDID = @YMDID
                       GROUP BY ListingID
					   ) AS rc
		ON dl.ListingID = rc.ListingID

		----------------------------------------------------
		--Mart Email Leads
		----------------------------------------------------
		LEFT OUTER JOIN
						(
						SELECT  ListingID
							   ,RentEmailLeads = SUM(CASE WHEN source IN ('hotlead','RENT') AND Status = 1 THEN 1 ELSE 0 END)
							   ,TruliaEmailLeads = SUM(CASE WHEN source = 'trulia_hl' AND Status = 1 THEN 1 ELSE 0 END) 
							   ,AndroidEmailLeads = SUM(CASE WHEN Source = 'ANDROIDRENT' AND Status = 1 THEN 1 ELSE 0 END)
							   ,iPadEmailLeads = SUM(CASE WHEN Source = 'IPADRENT' AND Status = 1 THEN 1 ELSE 0 END)
							   ,iPhoneEmailLeads = SUM(CASE WHEN Source = 'IPHONERENT' AND Status = 1 THEN 1 ELSE 0 END)                                                         
						FROM    Rentcom.Fact.EmailsRentCom
						WHERE   YMDID = @YMDID
						GROUP BY ListingID
						) AS rl
		ON dl.ListingID = rl.ListingID

        -------------------------------------------------------
        -- Mart Impressions per listing
        -------------------------------------------------------
        LEFT OUTER JOIN (
                         SELECT ListingID
                               ,Impressions
                         FROM   (
                                 SELECT ListingID = s.measure
                                       ,Impressions = COUNT(*)
                                 FROM   Rentcom.dbo.ParsedData AS p
                                 CROSS APPLY DBAUtility.dbo.fn_Split(REPLACE(REPLACE(REPLACE(REPLACE(p.Measure,'<',''),'>',''),'&lt;',''),'&gt;',''),';') AS s
                                 WHERE  p.MeasureType = 'a_l_imp'
                                        OR p.measuretype = 'SPG'
                                 GROUP BY s.measure
                                ) AS x
                        ) AS imp
                ON CAST(dl.RentPropertyID AS VARCHAR) = imp.ListingID


        -------------------------------------------------------
        -- Mart Clicks per listing
        -------------------------------------------------------
		LEFT OUTER JOIN (
                         SELECT ListingID = LTRIM(RTRIM(Measure))                              
                               ,ClicksMgtCoWebLink = SUM(CASE WHEN MeasureType = 'CompanyBrandedSearch' THEN 1
                                                              ELSE 0
                                                         END)                          
                         FROM   Rentcom.dbo.ParsedData WITH (NOLOCK)
                         WHERE  ISNUMERIC(measure) = 1
                         GROUP BY LTRIM(RTRIM(Measure))
                        ) AS p
                ON CAST(dl.RentPropertyID AS VARCHAR) = p.ListingID

   -------------------------------------------------------
    -- Logging
    -------------------------------------------------------
SET @SecondsStr = CAST(DATEDIFF(ss,@lastdatetime,GETDATE()) AS VARCHAR(300)) + ' Seconds';
EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
    @DatabaseName
   ,'RentCom Mart.pr_Listings'
   ,'EndMartListing'
   ,@SecondsStr
   ,0
   ,'End'
SET @lastdateTime = GETDATE();
	

PRINT 'Listings Marted'
	
SET NOCOUNT OFF







GO
/****** Object:  StoredProcedure [Mart].[pr_ModifyToChangeMartListingBuckets]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE PROCEDURE [Mart].[pr_ModifyToChangeMartListingBuckets]
/*************************************************************************************************
*
* Name:	Mart.pr_ModifyToChangeMartListingBuckets
*
* Desc:	Drops the computed columns in mart.Listings and recreates them with updated definitions
*
* Test:	EXEC Rentcom.Mart.pr_ModifyToChangeMartListingBuckets
*
* Note: You *MUST* change and compile these column definitions before running this script or 
*       there wont be a change in the data that comprises the computed columns
*
* Hist:	01	12/19/2013		Sarah Mims			Initial Version. Ticket #14084.
*		02	03/11/2014		Sarah Mims			Added Trulia Email Leads. Ticket # 14084.
*		03	08/13/2014		Sarah Mims			Ticket # 16512 - Added WebsiteCalls and WebsiteEmails
*		04	05/27/2015		Sarah Mims			Ticket # 19852 - Added iPhone, iPad and Android Emails
*		05	05/29/2015		Sarah Mims			Ticket # 19582 - Added SEM and Mobile SEM Calls
*		06	08/24/2015		Sarah Mims			Ticket # 20499 - Add emailleads bucket that matches digitalemailleads for dashboard reporting
* Hist: 07	10/26/2016		Bob Langley			Ticket 24212 - Changed to add MissedCalls to leads (where does connectedcalls)
**************************************************************************************************/
AS

SET NOCOUNT ON

-------------------------------------------------------------
-- Drop computed columns
-------------------------------------------------------------

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN InternetPhoneLeads
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN InternetPhoneLeads_NoMobile
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN InternetEmailLeads_NoMobile
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN AllInternetLeads_NoMobile
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN DigitalPhoneLeads
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN DigitalEmailLeads
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN EmailLeads
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN AllDigitalLeads
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN MobileCalls
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN MobileEmails
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE RentCom.Mart.Listings
    DROP COLUMN MobileAllLeads
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE Rentcom.Mart.Listings
    DROP COLUMN AllLeads
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE Rentcom.Mart.Listings
    DROP COLUMN AllMissedCalls
END TRY
BEGIN CATCH
END CATCH


BEGIN TRY
    ALTER TABLE Rentcom.Mart.Listings
    DROP COLUMN AllConnectedCalls
END TRY
BEGIN CATCH
END CATCH


BEGIN TRY
    ALTER TABLE Rentcom.Mart.Listings
    DROP COLUMN WebsiteEmails
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    ALTER TABLE Rentcom.Mart.Listings
    DROP COLUMN WebsiteCalls
END TRY
BEGIN CATCH
END CATCH

-------------------------------------------------------------
-- Add the computed columns back with new column definitions
-------------------------------------------------------------
ALTER TABLE RentCom.Mart.Listings
ADD 

-------------------------------------
--InternetPhoneLeads
-------------------------------------
InternetPhoneLeads
AS 
RentConnectedCalls				+RentMissedCalls
+RentAltRegConnectedCalls		+RentAltRegMissedCalls
+RentOneWebConnectedCalls		+RentOneWebMissedCalls
+RentMobileConnectedCalls		+RentMobileMissedCalls
+RentSEMConnectedCalls			+RentSEMMissedCalls
+RentMobileSEMConnectedCalls	+RentMobileSEMMissedCalls


-------------------------------------
--InternetPhoneLeads_NoMobile
-------------------------------------
,InternetPhoneLeads_NoMobile
AS 
RentConnectedCalls				+RentMissedCalls
+RentAltRegConnectedCalls		+RentAltRegMissedCalls
+RentOneWebConnectedCalls		+RentOneWebMissedCalls
+RentSEMConnectedCalls			+RentSEMMissedCalls

-------------------------------------
--InternetEmailLeads_NoMobile
-------------------------------------
,InternetEmailLeads_NoMobile
AS
RentEmailLeads
+TruliaEmailLeads

-------------------------------------
--AllInternetLeads_NoMobile
-------------------------------------
,AllInternetLeads_NoMobile
AS
RentConnectedCalls				+RentMissedCalls
+RentAltRegConnectedCalls		+RentAltRegMissedCalls
+RentOneWebConnectedCalls		+RentOneWebMissedCalls
+RentSEMConnectedCalls			+RentSEMMissedCalls
+RentEmailLeads
+TruliaEmailLeads

-------------------------------------
--DigitalPhoneLeads
-------------------------------------
,DigitalPhoneLeads
AS
RentConnectedCalls				+RentMissedCalls
+RentAltRegConnectedCalls		+RentAltRegMissedCalls
+RentOneWebConnectedCalls		+RentOneWebMissedCalls
+RentMobileConnectedCalls		+RentMobileMissedCalls
+RentSEMConnectedCalls			+RentSEMMissedCalls
+RentMobileSEMConnectedCalls	+RentMobileSEMMissedCalls

-------------------------------------
--DigitalEmailLeads
-------------------------------------
,DigitalEmailLeads
AS
RentEmailLeads
+TruliaEmailLeads
+ AndroidEmailLeads
+ iPadEmailLeads
+ iPhoneEmailLeads

-------------------------------------
--EmailLeads
-------------------------------------
,EmailLeads
AS
RentEmailLeads
+TruliaEmailLeads
+ AndroidEmailLeads
+ iPadEmailLeads
+ iPhoneEmailLeads

-------------------------------------
--AllDigitalLeads
-------------------------------------
,AllDigitalLeads
AS
RentConnectedCalls					+RentMissedCalls
+RentAltRegConnectedCalls			+RentAltRegMissedCalls
+RentOneWebConnectedCalls			+RentOneWebMissedCalls
+RentMobileConnectedCalls			+RentMobileMissedCalls
+RentSEMConnectedCalls				+RentSEMMissedCalls
+RentMobileSEMConnectedCalls		+RentMobileSEMMissedCalls
+RentEmailLeads
+TruliaEmailLeads
+ AndroidEmailLeads
+ iPadEmailLeads
+ iPhoneEmailLeads

-------------------------------------
--MobileCalls
-------------------------------------
,MobileCalls
AS
RentMobileConnectedCalls			+RentMobileMissedCalls
+RentMobileSEMConnectedCalls		+RentMobileSEMMissedCalls

-------------------------------------
--MobileEmails
-------------------------------------
,MobileEmails
AS
AndroidEmailLeads
+ iPadEmailLeads
+ iPhoneEmailLeads

-------------------------------------
--MobileAllLeads
-------------------------------------
,MobileAllLeads
AS
RentMobileConnectedCalls			+RentMobileMissedCalls
+RentMobileSEMConnectedCalls		+RentMobileSEMMissedCalls
+ AndroidEmailLeads
+ iPadEmailLeads
+ iPhoneEmailLeads

-------------------------------------
--AllLeads
-------------------------------------
,AllLeads
AS
RentConnectedCalls					+RentMissedCalls
+RentAltRegConnectedCalls			+RentAltRegMissedCalls
+RentOneWebConnectedCalls			+RentOneWebMissedCalls
+RentMobileConnectedCalls			+RentMobileMissedCalls
+RentSEMConnectedCalls				+RentSEMMissedCalls
+RentMobileSEMConnectedCalls		+RentMobileSEMMissedCalls
+RentEmailLeads
+TruliaEmailLeads
+ AndroidEmailLeads
+ iPadEmailLeads
+ iPhoneEmailLeads

-----------------------------------
--AllMissedCalls
-------------------------------------
,AllMissedCalls
AS
RentMissedCalls
+RentAltRegMissedCalls
+RentOneWebMissedCalls
+RentMobileMissedCalls
+RentSEMMissedCalls
+RentMobileSEMMissedCalls

-----------------------------------
--AllConnectedCalls
-------------------------------------
,AllConnectedCalls
AS
RentConnectedCalls
+RentAltRegConnectedCalls
+RentOneWebConnectedCalls
+RentMobileConnectedCalls
+RentSEMConnectedCalls
+RentMobileSEMConnectedCalls

-------------------------------------
--WebsiteEmails
-------------------------------------
,WebsiteEmails
AS
RentEmailLeads
-------------------------------------
--WebsiteCalls
-------------------------------------
,WebsiteCalls
AS
RentConnectedCalls				+RentMissedCalls
+RentAltRegConnectedCalls		+RentAltRegMissedCalls
+RentOneWebConnectedCalls		+RentOneWebMissedCalls
+RentMobileConnectedCalls		+RentMobileMissedCalls
+RentSEMConnectedCalls			+RentSEMMissedCalls


SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [Mart].[pr_PersonVisitorEFID]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Mart].[pr_PersonVisitorEFID] (
       @YMDID INT = NULL)
AS 
/******************************************************************************************
* Name:    Mart.pr_PersonVisitorEFID
* -----------------------------------------------------------------------------------------
* Desc:    Marts EF_ID with Person Daily
* -----------------------------------------------------------------------------------------
* Test:    EXEC Mart.pr_PersonVisitorEFID 20130410

select ymdid,sum(sem) sem from RentCom.mart.PersonVisitorEFID group by ymdid order by 1 desc

select ymdid, 
       sum(seo) seo, 
       sum(sem) sem 
from   RentCom.mart.PersonVisitorEFID 
where  ymdid >= 20130408
group  by ymdid
order  by ymdid


* -----------------------------------------------------------------------------------------
* Note:    
* Hist: 01    02/25/2013    Mary Pollard    Initial Version
*       02    04/01/2013    Mary Pollard    Added Mobile Device columns
******************************************************************************************/



-------------------------------------------------------------------------------------------------------------
---- There are three different updates in this proc. They are necessary to account for the following
---- scenarios: 
---- 1) Update today from today:
----    For the current day, not all records have the PersonID measureType associated with it. So, once
----    we have a 1:1 Visitor-to-Person match within the current day, we update all the other Visitor records
----    with that PersonID.
---- 2) Update today from yesterday:
----    For the current day, we might have Visitors that dont have any PersonID associated with them. But,
----    during a previous day, we had that same Visitor that did have a PersonID. We do a look back and update 
----    all the records from today with the PersonID from that previous day, if we have a 1:1 Visitor-to-PersonID match.
---- 3) Update yesterday from today:
----    For the current day, we might now have a visitor that now has a PersonID show up for the first time, 
----    and the Visitor was also present in a previous days transactions but never had a PersonID. Since we now
----    have a PersonID for that visitor we update the older records with the PersonID that we now know, 
----    when we have a 1:1 Visitor-to-PersonID match.
-------------------------------------------------------------------------------------------------------------

----DECLARE @YMDID int
----SET @YMDID = 20130331

SET NOCOUNT ON


IF @YMDID IS NULL
    BEGIN SET @YMDID = CONVERT(int,CONVERT(varchar,DATEADD(dd,-1,getdate()),112)) END


--------------------------------------------------
--  Drop temp tables
--------------------------------------------------
IF OBJECT_ID('tempdb..#WebevtPerson') IS NOT NULL 
   BEGIN DROP TABLE #WebevtPerson END
IF OBJECT_ID('tempdb..#dcsref') IS NOT NULL 
   BEGIN DROP TABLE #dcsref END
IF OBJECT_ID('tempdb..#temp') IS NOT NULL 
   BEGIN DROP TABLE #temp END
IF OBJECT_ID('tempdb..#VisitorMultiplePersons') IS NOT NULL 
   BEGIN DROP TABLE #VisitorMultiplePersons END

    --------------------------------------------------
    --  Get base dataset - webevent & person data
    --------------------------------------------------
    SELECT webevt.WebEventKey,
           webevt.EventDateKey,
           traffic.TrafficSourceName,
           deviceType.MobileDevice,
           REPLACE(person.PersonBusinessKey,'No Person','') PersonID,
           visitor.VisitorMeasure Visitor,
           webevt.VisitEventKey
    INTO   #WebevtPerson
    FROM   Warehouse.Fact.WebEvent webevt with (nolock)
           INNER JOIN Warehouse.Conformed.Person person with (nolock)
              ON webevt.PersonKey = person.PersonKey
           INNER JOIN Warehouse.Conformed.Visitor visitor with (nolock)
              ON webevt.VisitorKey = visitor.VisitorKey
           INNER JOIN Warehouse.Conformed.TrafficSource traffic with (nolock)
              ON webevt.TrafficSourceKey = traffic.TrafficSourceKey
           INNER JOIN warehouse.Conformed.useragent deviceType with (nolock)
              ON webevt.UserAgentKey = deviceType.userAgentKey
    WHERE  webevt.EventDateKey = @YMDID
    AND    webevt.ProfileKey IN (53,59)

    CREATE INDEX idx_tempWebevtPerson ON #WebevtPerson (WebEventKey)
    CREATE INDEX idx_tempVisitor ON #WebevtPerson (Visitor)



    --------------------------------------------------
    -- pivot out the dcsref and path, we ll use this to 
    --    parse out the EF_ID value later. This table 
    --------------------------------------------------
    --- drop table #dcsref
    SELECT WebEventKey,
           [82] dcsref,
           [1152] path
    INTO   #dcsref
    FROM ( SELECT webevt.WebEventKey,
                  MeasureTypeKey,
                  Measure
           FROM   #WebevtPerson webperson
                  INNER JOIN Warehouse.Fact.WebDetailsSingle webevt with (nolock)
                     ON webperson.WebEventKey = webevt.WebEventKey
           WHERE  webevt.EventDateKey = @YMDID
           AND    webevt.MeasureTypeKey IN (82,1152)
        ) X
    PIVOT (
        MAX(Measure)
        FOR X.MeasureTypeKey IN ([82],[1152])
    ) P

    CREATE INDEX idx_tempDcsref ON #dcsref (WebEventKey)


        --------------------------------------------------------------
        -- Add a column for EF_ID and find the EF_ID, if available,
        --   by looking first at dcsref and then path.
        --------------------------------------------------------------
        ALTER TABLE #dcsref ADD EF_ID varchar(2000)

        UPDATE #dcsref
        SET    EF_ID = COALESCE(
                           CASE WHEN dcsref like '%ef_id=%' 
                                THEN SUBSTRING(dcsref,CHARINDEX('ef_id=',dcsref) + 6,CHARINDEX(':s',SUBSTRING(dcsref,CHARINDEX('ef_id=',dcsref) + 6,99)) + 1)
                                ELSE NULL
                                END,
                           CASE WHEN [path] like '%ef_id=%'
                                THEN SUBSTRING([path],CHARINDEX('ef_id=',[path]) + 6,CHARINDEX(':s',SUBSTRING([path],CHARINDEX('ef_id=',[path]) + 6,99)) + 1)
                                ELSE NULL
                                END
                                )


---------------------------------------------------------------------------------------------
--- UPDATE SCENARIO #1 : Update today from today
---------------------------------------------------------------------------------------------

        --------------------------------------------------------------
        --- Create a list of visitors not to update because they have multiple
        --- persons associated with them and the correct personid cannot be
        --- determined
        --------------------------------------------------------------
        SELECT Visitor
        INTO   #VisitorMultiplePersons
        FROM   #WebevtPerson
        WHERE  personid NOT IN ('','0') -->not null
        GROUP  BY visitor
        HAVING COUNT(DISTINCT personid) >1 -->has more than 1 personID


        --- Update today from today
        UPDATE main
        SET    main.PersonID = temp.PersonID
        FROM   #WebevtPerson main
               INNER JOIN ( SELECT DISTINCT
                                   pd2.Visitor,
                                   pd2.PersonID
                            FROM   #WebevtPerson pd1
                                   INNER JOIN #WebevtPerson pd2
                                      ON pd1.Visitor = pd2.Visitor
                                     AND IsNULL(pd1.PersonID,'') = ''
                                     AND IsNULL(pd2.PersonID,'') <> ''
                                    ---dont update any of the visitors with multiple personIDs
                                    LEFT JOIN #VisitorMultiplePersons multi
                                      ON pd1.Visitor = multi.Visitor
                            WHERE  multi.visitor is null
                   )temp
                  ON main.Visitor = temp.Visitor
                 AND IsNULL(main.PersonID,'') = ''
                 AND IsNULL(temp.PersonID,'') <> ''


---------------------------------------------------------------------------------------------
--- UPDATE SCENARIO #2 : Update today from yesterday
---------------------------------------------------------------------------------------------

        --------------------------------------------------------------
        --- Create a list of visitors not to update because they have multiple
        --- persons associated with them and the correct personid cannot be
        --- determined
        --------------------------------------------------------------
        IF OBJECT_ID('tempdb..#VisitorMultiplePersons') IS NOT NULL 
            BEGIN TRUNCATE TABLE #VisitorMultiplePersons END

        INSERT INTO #VisitorMultiplePersons
        SELECT DISTINCT 
               pd1.Visitor Visitor
        FROM   #WebevtPerson pd1
               INNER JOIN RentCom.mart.PersonVisitorEFID pd2 with (nolock)
                  ON pd1.Visitor = pd2.Visitor    -->same visitor
                 AND pd1.PersonID <> pd2.PersonID -->different PersonIDs
                 AND pd1.PersonID NOT IN ('','0') -->1st tbl is not null
                 AND pd2.PersonID NOT IN ('','0') -->2nd tbl is not null

        ---Update today from yesterday
        UPDATE main
        SET    main.PersonID = temp.PersonID
        FROM   #WebevtPerson main
               INNER JOIN ( SELECT DISTINCT
                                   fullTbl.Visitor,
                                   fullTbl.PersonID
                            FROM   #WebevtPerson pd1
                                   INNER JOIN RentCom.mart.PersonVisitorEFID fullTbl
                                      ON pd1.Visitor = fullTbl.Visitor
                                    AND IsNULL(pd1.PersonID,'') = ''
                                     AND IsNULL(fullTbl.PersonID,'') <> ''
                                    ---dont update any of the visitors with multiple personIDs
                                    LEFT JOIN #VisitorMultiplePersons multi
                                      ON pd1.Visitor = multi.Visitor
                            WHERE  multi.visitor is null
                   )temp
                  ON main.Visitor = temp.Visitor
                 AND IsNULL(main.PersonID,'') = ''
                 AND IsNULL(temp.PersonID,'') <> ''

---------------------------------------------------------------------------------------------
-- INSERT TODAYS DATA
---------------------------------------------------------------------------------------------
DELETE FROM RentCom.mart.PersonVisitorEFID WHERE YMDID = @YMDID

        INSERT INTO RentCom.mart.PersonVisitorEFID (
               YMDID,
               Visitor,
               PersonID,
               EF_ID,
               SEO,
               SEM,
               Direct,
               Other,
               Mobile,
               Desktop )
        ---only get those records that have an SEO or SEM visit
        SELECT YMDID,
               Visitor,
               PersonID,
               EF_ID,
               SEO,
               SEM,
               Direct,
               Other,
               Mobile,
               Desktop
        FROM (
                SELECT webevt.EventDateKey YMDID,
                       webevt.Visitor Visitor,
                       webevt.PersonID,
                       dcsref.EF_ID,
                       COUNT(DISTINCT
                             CASE WHEN webevt.TrafficSourceName = 'SEO'
                                  AND  dcsref.EF_ID IS NULL
                                  THEN webevt.VisitEventKey
                                  ELSE NULL
                                  END) SEO,
                       COUNT(DISTINCT
                             CASE WHEN dcsref.EF_ID IS NOT NULL
                                  THEN webevt.VisitEventKey
                                  ELSE NULL
                                  END) SEM,
                       COUNT(DISTINCT
                             CASE WHEN dcsref.EF_ID IS NULL
                                  AND  webevt.TrafficSourceName = 'Direct'
                                  THEN webevt.VisitEventKey
                                  ELSE NULL
                                  END) Direct,
                       COUNT(DISTINCT
                             CASE WHEN dcsref.EF_ID IS NULL
                                  AND  webevt.TrafficSourceName NOT IN ('SEO','Direct')
                                  THEN webevt.VisitEventKey
                                  ELSE NULL
                                  END) Other,
                       COUNT(DISTINCT
                             CASE WHEN webevt.MobileDevice = 'true'
                                  THEN webevt.VisitEventKey
                                  ELSE NULL
                                  END) Mobile,
                       COUNT(DISTINCT
                             CASE WHEN webevt.MobileDevice  = 'false'
                                  THEN webevt.VisitEventKey
                                  ELSE NULL
                                  END) Desktop
                FROM   #WebevtPerson webevt
                       LEFT JOIN #dcsref dcsref
                         ON webevt.WebEventKey = dcsref.WebEventKey
                GROUP  BY webevt.EventDateKey,
                       webevt.Visitor,
                       webevt.PersonID,
                       dcsref.EF_ID
            ) final
            WHERE SEO+SEM >0;

    ALTER INDEX [idx_Visitor] ON [Mart].[PersonVisitorEFID] REBUILD;
    ALTER INDEX [idx_YMDID] ON [Mart].[PersonVisitorEFID] REBUILD;


---------------------------------------------------------------------------------------------
--- UPDATE SCENARIO #3 : Update yesterday from today
---------------------------------------------------------------------------------------------

        --------------------------------------------------------------
        --- Create a list of visitors not to update because they have multiple
        --- persons associated with them and the correct personid cannot be
        --- determined
        --------------------------------------------------------------
        IF OBJECT_ID('tempdb..#VisitorMultiplePersons') IS NOT NULL 
            BEGIN TRUNCATE TABLE #VisitorMultiplePersons END

        INSERT INTO #VisitorMultiplePersons
        SELECT Visitor
        FROM   RentCom.mart.PersonVisitorEFID 
        WHERE  personid  NOT IN ('','0') -->Where there is a personID
        GROUP  BY visitor
        HAVING COUNT(DISTINCT personid) >1 -->And the Visitor has more than 1

        ---Update yesterday from today
        UPDATE fullTable
        SET    fullTable.PersonID = temp.PersonID
        FROM   RentCom.mart.PersonVisitorEFID fullTable
               INNER JOIN ( SELECT DISTINCT
                                   tab2.Visitor,
                                   tab2.PersonID
                            FROM   RentCom.mart.PersonVisitorEFID tab1 with (nolock)
                                   INNER JOIN RentCom.mart.PersonVisitorEFID tab2 with (nolock)
                                      ON tab1.Visitor = tab2.Visitor   -->Same Visitor
                                     AND tab1.YMDID <> tab2.YMDID      -->Different days
                                     AND IsNULL(tab1.PersonID,'') = '' -->One doesnt have a PersonID
                                     AND IsNULL(tab2.PersonID,'') <> ''-->The other does have a PersonID
                                    LEFT JOIN #VisitorMultiplePersons multi
                                      ON tab1.Visitor = multi.Visitor
                            WHERE  multi.Visitor IS NULL
                            AND    tab2.YMDID = @YMDID  -->That show up in this days run
                         )temp
                  ON fullTable.Visitor = temp.Visitor
                 AND IsNULL(fullTable.PersonID,'') = '' -->Where the PersonID in the main table is null
                 AND IsNULL(temp.PersonID,'') <> ''     -->But the PersonID from the lookup query is not null




SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [Mart].[pr_PropertyScore]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Mart].[pr_PropertyScore]
	(
	@YMDID INT = NULL
	)
/*************************************************************************************************
*
* Name:	Mart.pr_PropertyScore
*
* Desc:	This marts the property scores for Rent properties. 
*
* Test:	EXEC Mart.pr_PropertyScore
*
* Note: Currently it is only for AG Syndication to Rent so RentBusinessModel is hardcoded for now.
*
* Hist:	01	10/29/2014		Sarah Mims			Initial Version. Ticket # 16672.
* Hist: 02	04/22/2016		Clinton Woody		Ticket #22366;  replaced community__c with VIEW
* Hist: 03	08/01/2016		Colleen Rocks		Ticket 23452; replaced salesforcecommunityid with salesforceaccountid
**************************************************************************************************/
AS

SET NOCOUNT ON

------------------------------------------------------------------
--Declare and set variables for error handling
------------------------------------------------------------------
DECLARE @SubjectText VARCHAR(200);
DECLARE @MessageText VARCHAR(4000);
DECLARE @ErrMessageText NVARCHAR(4000);
DECLARE @RecipientsText VARCHAR(500);
DECLARE @SuccessFlag INT;


SET @SubjectText = 'Rentcom.Mart.pr_PropertyScore Procedure did not run successfully.';
SET @RecipientsText = 'smims@rentpath.com';
SET @ErrMessageText = 'There was an issue with scoring AG Syndication listings to Rent.';
SET @MessageText = 'Rentcom.Mart.pr_PropertyScore Procedure aborted due to the following error: ' + CAST(@ErrMessageText AS VARCHAR(8000)) + ' This email was generated by the stored procedure Rentcom.Mart.pr_PropertyScore Procedure';
SET @SuccessFlag = 0

--------------------------------------
--Declare and set procedure variables
--------------------------------------

DECLARE @Date			DATETIME
,@Imp180Start			INT
,@Imp180End				INT
,@ThirtyDayStart		INT
,@NinetyDayStart		INT


SET @YMDID = ISNULL(@YMDID, (SELECT MAX(YMDID) FROM ApartmentGuide.Mart.AGSyndicationToRent WITH (NOLOCK)))
SET @Date = CAST(CONVERT(VARCHAR(8),@YMDID,121) AS DATETIME)
SET @Imp180Start = CAST(CONVERT(VARCHAR(8),DATEADD(d,-180,DATEADD(d,-30,@Date)),112) AS INT)
SET @Imp180End = CAST(CONVERT(VARCHAR(8),DATEADD(d,180,DATEADD(d,-180,DATEADD(d,-30,@Date))),112) AS INT)
SET @ThirtyDayStart = CAST(CONVERT(VARCHAR(8),DATEADD(d,-30,@Date),112) AS INT)
SET @NinetyDayStart = CAST(CONVERT(VARCHAR(8),DATEADD(d,-90,@Date),112) AS INT)

----------------------------------------------------------------------------
-- Prevent parameter sniffing here
-----------------------------------------------------------------------------
DECLARE @YMDID2			INT
,@Date2					DATETIME
,@Imp180Start2			INT
,@Imp180End2			INT
,@ThirtyDayStart2		INT
,@NinetyDayStart2		INT

SET @YMDID2 = @YMDID
SET @Date2 = @Date
SET @Imp180Start2 = @Imp180Start
SET @Imp180End2	= 	@Imp180End	
SET @ThirtyDayStart2 = 	@ThirtyDayStart
SET @NinetyDayStart2 =	@NinetyDayStart

---------------------------------------------------
--Drop temp tables if NOT NULL
--------------------------------------------------- 
IF OBJECT_ID('tempdb..#PropertyAge') IS NOT NULL
	BEGIN
		DROP TABLE #PropertyAge
	END	  

IF OBJECT_ID('tempdb..#ScoreData') IS NOT NULL
	BEGIN
		DROP TABLE #ScoreData
	END	 

----------------------------------------
--Get Property Age of AG Only Listings
----------------------------------------
SELECT x.ListingID
,DATEDIFF(d,CAST(CONVERT(VARCHAR(8),FirstDayActive,121) AS DATETIME),GETDATE()) AS Age
,CAST(CONVERT(VARCHAR(8),FirstDayActive,121) AS DATETIME)						AS FirstDayActive
INTO #PropertyAge
FROM
	(
	SELECT l.ListingID
	,MIN(l.YMDID) AS FirstDayActive
	FROM ApartmentGuide.Mart.Listings AS l
	JOIN 
		(
		SELECT ListingID
		FROM ApartmentGuide.Mart.AGSyndicationToRent
		WHERE YMDID = @YMDID2
		) AS ao
		ON l.ListingID = ao.ListingID
	WHERE l.ListingStatusID = 1
	GROUP BY l.ListingID
	) AS X

---------------------------------------------------
--Get data for score
---------------------------------------------------
SELECT l.ListingID
,l.PropertyID																								AS AGPropertyID
,pm.RENTPROPERTYID																							AS RentPropertyID
,rs.CBSACode
,rs.CBSAName
,rs.PropertyCity
,rs.PropertyState
,MAX(l.PropertyTotalUnits)																					AS DimensionUnitCount
,CAST(MAX(cc.Number_of_Units__c) AS INT)																	AS SFDCUnitCount
,CASE WHEN ISNULL(CAST(MAX(cc.Number_of_Units__c) AS INT),0) = 0 THEN MAX(l.PropertyTotalUnits)
	ELSE CAST(MAX(cc.Number_of_Units__c) AS INT)
	END																										AS FinalUnitCount
,MAX(pa.Age)																								AS PropertyAge
,1																											AS ImageMain
,MAX(l.ActivePhotos) - 1																					AS ImagePhoto
,MAX(l.ActiveFloorPlans)																					AS ImageFloorPlan
,SUM(ml.RentEmailLeads)																						AS RentEmailLeads
,SUM(CASE WHEN ml.YMDID BETWEEN @ThirtyDayStart2 AND @YMDID2 THEN ml.RentEmailLeads ELSE 0 END)				AS RentEmail_30
,SUM(CASE WHEN ml.YMDID BETWEEN @NinetyDayStart2 AND @YMDID2 THEN ml.RentEmailLeads ELSE 0 END)				AS RentEmail_90
,SUM(ml.AllRentCalls)																						AS RentConnectedCalls
,SUM(CASE WHEN ml.YMDID BETWEEN @ThirtyDayStart2 AND @YMDID2 THEN ml.AllRentCalls ELSE 0 END)				AS RentConnectedCalls_30
,SUM(CASE WHEN ml.YMDID BETWEEN @NinetyDayStart2 AND @YMDID2 THEN ml.AllRentCalls ELSE 0 END)				AS RentConnectedCalls_90
,SUM(ml.ImprSearchResults_Rent)																				AS RentImprSearchResults
,SUM(CASE WHEN ml.YMDID BETWEEN @Imp180Start2 AND @Imp180End2 THEN ml.ImprSearchResults_Rent ELSE 0 END)	AS IMP_180_30
,SUM(CASE WHEN ml.YMDID BETWEEN @ThirtyDayStart2 AND @YMDID2 THEN ml.ImprSearchResults_Rent ELSE 0 END)		AS IMP_30_0
,MAX(rs.WillingToPay)																						AS WillingToPay
,MAX(rs.LeadsToQuitLowLeads)																				AS LeadsToQuitLowLeads
,MAX(rs.QuitLowLeadsDist)																					AS QuitLowLeadsDist
INTO #ScoreData
FROM ApartmentGuide.Dimension.Listings AS l
JOIN ApartmentGuide.Mart.Listings AS ml
	ON l.ListingID = ml.ListingID
JOIN
	( 
	SELECT  sr.YMDID
	       ,sr.ListingID
	       ,sr.CBSACode
	       ,sr.CBSAName
	       ,sr.PropertyCity
	       ,sr.PropertyState
	       ,sr.LeadsToQuitLowLeads
	       ,sr.QuitLowLeadsDist
	       ,sr.IncludeInSyndication
	       ,sr.WillingToPay
	FROM ApartmentGuide.Mart.AGSyndicationToRent AS sr
	WHERE YMDID = @YMDID2
		AND IncludeInSyndication = 1
	) AS rs
	ON l.ListingID = rs.ListingID
LEFT OUTER JOIN 
			(
			SELECT AGPropertyID
			,MAX(RentPropertyID) AS RentPropertyID
			FROM Rentcom.Dimension.PropertyMap 
			GROUP BY AGPropertyID
			)
			AS pm
	ON l.PropertyID = pm.AGPropertyID
LEFT OUTER JOIN Salesforce.dimension.SALESFORCE_XREF AS s
	ON l.PropertyID = s.AGPROPERTYID
LEFT OUTER JOIN Salesforce.dbo.VW_SalesForceCommunity AS cc  --Community__c AS cc
	ON s.SalesforceAccountID = cc.PropAccountID
LEFT OUTER JOIN #PropertyAge AS pa
	ON l.ListingID = pa.ListingID
WHERE l.StatusID = 1
	AND ml.YMDID BETWEEN @Imp180Start2 AND @YMDID2
GROUP BY l.ListingID
,l.PropertyID
,pm.RENTPROPERTYID
,rs.CBSACode
,rs.CBSAName
,rs.PropertyCity
,rs.PropertyState

-------------------------------------------------------------------------------
--Delete the data and re-populate the table with the data for the YMDID date
-------------------------------------------------------------------------------
IF OBJECT_ID('tempdb..#ScoreData') IS NOT NULL
	BEGIN
		SET @SuccessFlag = (SELECT COUNT(*) FROM #ScoreData)
	END
ELSE
	BEGIN    
		SET @SuccessFlag = 0
	END    

IF @SuccessFlag > 0 

BEGIN

	DELETE FROM RentCom.Mart.PropertyScore
	WHERE YMDID = @YMDID

	INSERT INTO Rentcom.Mart.PropertyScore
			(YMDID
			,RentBusinessModel
			,ListingID
			,AGPropertyID
			,RentPropertyID
			,CBSACode
			,CBSAName
			,PropertyCity
			,PropertyState
			,DimensionUnitCount
			,SFDCUnitCount
			,FinalUnitCount
			,LeadsToQuitLowLeads
			,QuitLowLeadsDist
			,PropertyScore
			,PropertyAge
			,ImageMain
			,ImagePhoto
			,ImageFloorPlan
			,RentEmailLeads
			,RentEmail_30
			,RentEmail_90
			,RentConnectedCalls
			,RentConnectedCalls_30
			,RentConnectedCalls_90
			,RentImprSearchResults
			,IMP_180_30
			,IMP_30_0
			,WillingToPay
			)
	SELECT @YMDID 
		   ,'ppl' AS RentBusinessModel --This hardcoded value will need to change
		   ,ListingID
		   ,AGPropertyID
		   ,RentPropertyID
		   ,CBSACode
		   ,CBSAName
		   ,PropertyCity
		   ,PropertyState
		   ,DimensionUnitCount
		   ,SFDCUnitCount
		   ,FinalUnitCount
		   ,LeadsToQuitLowLeads
		   ,QuitLowLeadsDist
		   ,PropertyScore = 
			--(
			--	(
			--	CASE WHEN (sd.IMP_180_30 + sd.IMP_30_0) > 0 
			--	THEN (
			--			.99*
			--			(
			--				(
			--					(sd.RentEmail_90 + sd.RentConnectedCalls_90)*2
			--				)
			--			/
			--				(
			--				CASE WHEN (sd.IMP_180_30 + sd.IMP_30_0) < 1000 THEN 1000 ELSE (sd.IMP_180_30 + sd.IMP_30_0) END  
			--				/
			--				1000
			--				) 
			--			)
			--		 )	
			--	ELSE 0 END
			--	)
	---------------------------------------------------------------
	--Excludes 180 Day Imp Metric since it isn't complete
		(
				(
				CASE WHEN (sd.IMP_30_0) > 0 
				THEN (
						.99*
						(
							(
								(sd.RentEmail_90 + sd.RentConnectedCalls_90) * 2
							)
						/
							(
							CASE WHEN (sd.IMP_30_0) < 1000 THEN 1000 ELSE (sd.IMP_30_0) END  
							/
							1000
							) 
						)
					 )	
				ELSE 0 END
				)
	---------------------------------------------------------------
				+
				(
				.01*
					(
						(CASE WHEN 5 - sd.PropertyAge < 0 THEN 0 ELSE 5 - sd.PropertyAge END)
				
						+

						(CASE WHEN 15 - (sd.RentEmail_30 + sd.RentConnectedCalls_30) < 0 THEN 0 ELSE 15 - (sd.RentEmail_30 + sd.RentConnectedCalls_30) END)
				
						+   
				
						(CASE WHEN (sd.ImageMain + sd.ImagePhoto) * 0.5 > 5 THEN 5 ELSE (sd.ImageMain + sd.ImagePhoto) * 0.5 END)

						+

						(CASE WHEN sd.ImageFloorPlan * 0.5 > 5 THEN 5 ELSE sd.ImageFloorPlan * 0.5 END)
					)
				)
			)
			/
			--CASE WHEN (sd.IMP_180_30 + sd.IMP_30_0) < 500 THEN 10 ELSE 1 END
			CASE WHEN sd.IMP_30_0 < 500 THEN 10 ELSE 1 END
        
			+ 20000 
		
			* CASE WHEN sd.FinalUnitCount < 50 THEN CASE WHEN (sd.RentEmail_30 + sd.RentConnectedCalls_30) > 35 THEN .5 ELSE 1 END
				   WHEN sd.FinalUnitCount < 100 AND sd.FinalUnitCount >= 50 THEN CASE WHEN (sd.RentEmail_30 + sd.RentConnectedCalls_30) > 40 THEN .5 ELSE 1 END
				   WHEN sd.FinalUnitCount < 200 AND sd.FinalUnitCount >= 100 THEN CASE WHEN (sd.RentEmail_30 + sd.RentConnectedCalls_30) > 40 THEN .5 ELSE 1 END
				   WHEN sd.FinalUnitCount < 300 AND sd.FinalUnitCount >= 200 THEN CASE WHEN (sd.RentEmail_30 + sd.RentConnectedCalls_30) > 40 THEN .5 ELSE 1 END
				   WHEN sd.FinalUnitCount < 450 AND sd.FinalUnitCount >= 300 THEN CASE WHEN (sd.RentEmail_30 + sd.RentConnectedCalls_30) > 50 THEN .5 ELSE 1 END
				   WHEN sd.FinalUnitCount < 550 AND sd.FinalUnitCount >= 450 THEN CASE WHEN (sd.RentEmail_30 + sd.RentConnectedCalls_30) > 55 THEN .5 ELSE 1 END
				   WHEN sd.FinalUnitCount < 700 AND sd.FinalUnitCount >= 550 THEN CASE WHEN (sd.RentEmail_30 + sd.RentConnectedCalls_30) > 60 THEN .5 ELSE 1 END
				   WHEN sd.FinalUnitCount < 850 AND sd.FinalUnitCount >= 700 THEN CASE WHEN (sd.RentEmail_30 + sd.RentConnectedCalls_30) > 65 THEN .5 ELSE 1 END
				   WHEN sd.FinalUnitCount >= 850 THEN CASE WHEN (sd.RentEmail_30 + sd.RentConnectedCalls_30) > 75 THEN .5 ELSE 1 END
			   ELSE 
					CASE WHEN (sd.RentEmail_30 + sd.RentConnectedCalls_30) > 35 THEN .5 ELSE 1 END
			   END	
			--+ CASE WHEN sd.QuitLowLeadsDist <=.5 THEN .05 ELSE 0 END	               
		   ,PropertyAge
		   ,ImageMain
		   ,ImagePhoto
		   ,ImageFloorPlan
		   ,RentEmailLeads
		   ,RentEmail_30
		   ,RentEmail_90
		   ,RentConnectedCalls
		   ,RentConnectedCalls_30
		   ,RentConnectedCalls_90
		   ,RentImprSearchResults
		   ,IMP_180_30
		   ,IMP_30_0
		   ,WillingToPay  	      
	FROM #ScoreData AS sd

	END
ELSE 
	BEGIN
		 EXEC msdb.dbo.sp_send_dbmail 
						@recipients = @RecipientsText
					   ,@subject = @SubjectText
					   ,@body = @MessageText
					   ,@importance = 'HIGH'
					   ,@body_format = 'TEXT'
		PRINT @ErrMessageText
	END		

SET NOCOUNT OFF;








GO
/****** Object:  StoredProcedure [Mart].[pr_RevenueFeedBase]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Mart].[pr_RevenueFeedBase] (@YMDID INT = NULL)

/******************************************************************************************
*
* Name:	Mart.[pr_RevenueFeedBase]
*
* Desc:	Marts EF_ID with Person Daily
*
* Test:	EXEC Mart.[pr_RevenueFeedBase] 20121004
*
* Note:	
*
* Hist:	01	11/06/2012	Richard Chen		Initial Version
* Hist: 02  02/14/2013  Richard Chen        WebparseData going away.  Change code to read from archiveparsedData
* Hist:	03	04/18/2013	John Brennan		modified to point to new ArchivedStaging.ArchiveParsedData table
******************************************************************************************/
AS 
SET NOCOUNT ON
--declare @YMDID INT
--set @YMDID=20121001
DECLARE @UseLocalTable TINYINT

IF @YMDID IS NULL 
    BEGIN
        SET @YMDID = CAST(CONVERT(VARCHAR(8),GETDATE() - 1,112) AS INT)
    END
        
-- See if the data we want is already in the local table
IF @YMDID = (
             SELECT TOP 1
                    YMDID
             FROM   dbo.ParsedData
            ) 
    SET @UseLocalTable = 1
    -- If we're running for yesterday, use the local ParsedDate. Otherwise, use the Archive
    -- to create the temp table to work with
BEGIN TRY
    DROP TABLE #tmpParsedData;
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    DROP TABLE #pivotParse;
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    DROP TABLE #newVEP;
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    DROP TABLE #visitorEF;
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    DROP TABLE #visitorPerson;
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
    DROP TABLE #newVisEf;
END TRY
BEGIN CATCH
END CATCH


CREATE TABLE #tmpParsedData (
    ParseID BIGINT
   ,YMDID INT
   ,EventDate DATETIME
   ,MeasureType VARCHAR(50)
   ,Measure VARCHAR(7000))

	
IF @UseLocalTable = 1 
    BEGIN

        INSERT  INTO #tmpParsedData
                SELECT  ParseID
                       ,YMDID
                       ,EventDate
                       ,MeasureType
                       ,Measure = CASE WHEN measure LIKE '%ef_id=%' THEN SUBSTRING(measure,CHARINDEX('ef_id=',measure) + 6,CHARINDEX(':s',SUBSTRING(measure,CHARINDEX('ef_id=',measure) + 6,99)) + 1)
                                       ELSE Measure
                                  END
                FROM    dbo.ParsedData
                WHERE   (measureType IN ('WT.co_f','person_id')
                         OR (MeasureType IN ('path','dcsref')
                             AND Measure LIKE '%ef_id=%'))
    END
ELSE 
    BEGIN
		
        INSERT  INTO #tmpParsedData
                SELECT  ParseID
                       ,YMDID
                       ,EventDate
                       ,MeasureType
                       ,Measure = CASE WHEN measure LIKE '%ef_id=%' THEN SUBSTRING(measure,CHARINDEX('ef_id=',measure) + 6,CHARINDEX(':s',SUBSTRING(measure,CHARINDEX('ef_id=',measure) + 6,99)) + 1)
                                       ELSE Measure
                                  END
                FROM    [archivedStaging].[dbo].[ArchivedParsedData]
                WHERE   YMDID = @YMDID
                        AND (measureType IN ('WT.co_f','person_id')
                             OR (MeasureType IN ('path','dcsref')
                                 AND Measure LIKE '%ef_id=%'))
                        AND ProfileID IN (53,59)
    END

DELETE  FROM Mart.RevenueFeedBase
WHERE   YMDID = @ymdid

SELECT  parseid
       ,YMDID
       ,EventDate
       ,Visitor = [WT.co_f]
       ,ef_id = COALESCE([dcsref],[path])
       ,person = [person_id]
INTO    #pivotParse
FROM    (
         SELECT ParseID
               ,YMDID
               ,EventDate
               ,MeasureType
               ,Measure
         FROM   #tmpParsedData
        ) X PIVOT ( MAX(X.Measure) FOR X.MeasureType IN ([WT.co_f],[person_id],[path],[dcsref]) ) P	



--select top 1000 * from #pivotParse
--drop table #visitorEF

SELECT  a.ymdid
       ,eventDate = COALESCE(MIN(b.eventDate),MIN(a.eventDate))
       ,a.visitor
       ,ef_id = COALESCE(a.ef_id,b.ef_id)
INTO    #visitorEF
FROM    (
         SELECT ymdid
               ,eventDate = MIN(eventDate)
               ,visitor
               ,ef_id
         FROM   #pivotParse
         GROUP BY ymdid
               ,visitor
               ,ef_id
        ) a
LEFT OUTER JOIN (
                 SELECT ymdid
                       ,eventDate = MIN(eventDate)
                       ,visitor
                       ,ef_id
                 FROM   #pivotParse
                 GROUP BY ymdid
                       ,visitor
                       ,ef_id
                 HAVING ef_id IS NOT NULL
                ) b
        ON a.ymdid = b.ymdid
           AND a.visitor = b.visitor
GROUP BY a.ymdid
       ,a.visitor
       ,COALESCE(a.ef_id,b.ef_id)
/*
SELECT * FROM #VISITOREF WHERE VISITOR in 
(select VISITOR FROM #VISITOReF GROUP BY VISITOR HAVING COUNT(1) > 1)
order by visitor
*/

--SELECT * FROM #VISITOREF WHERE VISITOR ='1323673429084'

SELECT  ymdid
       ,visitor
       ,person
INTO    #visitorPerson
FROM    #pivotParse
GROUP BY ymdid
       ,visitor
       ,person
HAVING  person IS NOT NULL
        AND person <> ''



--1)insert new ef, person combination
--Drop table #newVisEF
--SELECT  *
--INTO    #newVisEF
--FROM    (
--         SELECT DISTINCT
--                visitor
--               ,ef_id
--         FROM   #visitorEF
--         WHERE  ef_id IS NOT NULL
--         EXCEPT
--         SELECT DISTINCT
--                visitor
--               ,Ef_id
--         FROM   Mart.RevenueFeedBase
--         WHERE  EF_ID IS NOT NULL
--        ) v


SELECT  a.visitor
       ,a.ef_id
       ,a.eventDate
INTO    #newVisEF
FROM    (
         SELECT visitor
               ,ef_id
               ,eventDate
         FROM   #visitorEF
         WHERE  ef_id IS NOT NULL
        ) a
LEFT OUTER JOIN (
                 SELECT DISTINCT
                        visitor
                       ,Ef_id
                 FROM   Mart.RevenueFeedBase
                 WHERE  EF_ID IS NOT NULL
                ) b
        ON a.visitor = b.visitor
           AND a.ef_id = b.ef_id
WHERE   b.visitor IS NULL
        AND b.ef_id IS NULL      


--select * from Mart.revenuefeedBase
--select * from #newVisEf
--delete from mart.revenueFeedBase where ef_id is null
INSERT  INTO Mart.RevenueFeedBase
        (ymdid
        ,visitor
        ,EF_ID
        ,Person
        ,EventDate)
        SELECT  @YMDID
               ,visitor
               ,EF_ID
               ,NULL
               ,EventDate
        FROM    #newVisEF

--2) Update those record in mart with person=null
--select Visitor, ef_id from Mart.RevenueFeedBase
--group by Visitor, EF_ID having COUNT(1) > 1
--select * from #visitorPerson


--Udate person (only person is null) for EF 
-- Delete for passed-in date, in case this is a rerun
UPDATE  r
SET     r.Person = P.person
FROM    Mart.RevenueFeedBase r
JOIN    #visitorPerson p
        ON r.Visitor = p.visitor
WHERE   r.Person IS NULL
        AND P.person IS NOT NULL

--3)Find new visitor, ef_id, person combination
--SELECT  v.visitor
--       ,v.ef_id
--       ,v.person
--INTO    #newVEP
--FROM    (
--         SELECT DISTINCT
--                e.visitor
--               ,e.ef_id
--               ,p.person
--         FROM   #visitorEF e
--         JOIN   #visitorPerson p
--                ON e.visitor = P.person
--         WHERE  e.visitor IS NOT NULL
--                AND e.ef_id IS NOT NULL
--                AND P.person IS NOT NULL
--         EXCEPT
--         SELECT DISTINCT
--                visitor
--               ,ef_id
--               ,person
--         FROM   Mart.RevenueFeedBase
--         WHERE  visitor IS NOT NULL
--                AND ef_id IS NOT NULL
--                AND person IS NOT NULL
--        ) v

SELECT  a.visitor
       ,a.ef_id
       ,a.person
       ,a.eventDate
INTO    #newVEP
FROM    (
         SELECT --DISTINCT
                e.visitor
               ,e.ef_id
               ,p.person
               ,eventDate = MIN(e.eventDate)
         FROM   #visitorEF e
         JOIN   #visitorPerson p
                ON e.visitor = P.person
         WHERE  e.visitor IS NOT NULL
                AND e.ef_id IS NOT NULL
                AND P.person IS NOT NULL
         GROUP BY e.visitor
               ,e.ef_id
               ,P.person
        ) a
LEFT OUTER JOIN (
                 SELECT DISTINCT
                        visitor
                       ,ef_id
                       ,person
                 FROM   Mart.RevenueFeedBase
                 WHERE  visitor IS NOT NULL
                        AND ef_id IS NOT NULL
                        AND person IS NOT NULL
                ) b
        ON a.visitor = b.visitor
           AND a.ef_id = b.ef_id
           AND a.person = b.person
WHERE   b.visitor IS NULL
        AND b.ef_id IS NULL
        AND b.person IS NULL


INSERT  INTO Mart.RevenueFeedBase
        SELECT  @YMDID
               ,visitor
               ,EF_ID
               ,Person
               ,eventDate
        FROM    #newVEP

--4)Scenario to clone 
-- If the same visitor has new parseid, clone visitor, person with the new parseID
--SELECT  *
--INTO    #newVisEF2
--FROM    (
--         SELECT DISTINCT
--                visitor
--               ,ef_id
--         FROM   #visitorEF
--         WHERE  ef_id IS NOT NULL
--         EXCEPT
--         SELECT DISTINCT
--                visitor
--               ,EF_id
--         FROM   Mart.RevenueFeedBase
--         WHERE  EF_ID IS NOT NULL
--        ) v

SELECT  a.*
INTO    #newVisEF2
FROM    (
         SELECT visitor
               ,ef_id
               ,eventDate = MIN(eventDate)
         FROM   #visitorEF
         WHERE  ef_id IS NOT NULL
         GROUP BY visitor
               ,ef_id
        ) a
LEFT OUTER JOIN (
                 SELECT DISTINCT
                        visitor
                       ,EF_id
                 FROM   Mart.RevenueFeedBase
                 WHERE  EF_ID IS NOT NULL
                ) b
        ON a.visitor = b.Visitor
           AND a.ef_id = b.EF_ID
WHERE   b.Visitor IS NULL
        AND b.EF_ID IS NULL


SELECT  Ymdid = @YMDID
       ,r.Visitor
       ,v.EF_ID
       ,r.person
       ,v.eventDate
INTO    #cloneVisitorPerson
FROM    Mart.RevenueFeedBase r
JOIN    (
         SELECT visitor
               ,ef_id
               ,eventDate = MIN(eventDate)
         FROM   #newVisEF2
         GROUP BY visitor
               ,ef_id
        ) v
        ON r.Visitor = v.visitor
           AND r.Person IS NOT NULL
           AND v.ef_id IS NOT NULL


INSERT  INTO mart.RevenueFeedBase
        SELECT  Ymdid
               ,Visitor
               ,EF_ID
               ,person
               ,EventDate
        FROM    #cloneVisitorPerson
        

SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [Mart].[pr_TBL_MDIM_PROPERTY_MERGE]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Mart].[pr_TBL_MDIM_PROPERTY_MERGE] (@YMDID INT = NULL)
AS /********************************************************************************************************************************************
* Name:    Mart.pr_TBL_MDIM_PROPERTY_MERGE
* -----------------------------------------------------------------------------------------------------------------------
* Desc:   This is a copy of the Reports.Tbl_MDim_Property table on RPTProd. This is Rents version of Mart.Listings we have 
*            on the ApartmentGuide site. This is Marted data. We are only checking for updates to this table in the past
*            week
* -----------------------------------------------------------------------------------------------------------------------
* Test: EXEC Mart.pr_TBL_MDIM_PROPERTY_MERGE
*
select top 10 * from staging.tbl_mdim_property
select max(ymdid) from Mart.MDimProperty with (nolock)
* -----------------------------------------------------------------------------------------------------------------------
* Note: 
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 
* 01    Shetal Gandhi   11/25/2013     Ticket 13903 - Initial Version
* 02    Mary Pollard    01/16/2014     (1) Changed UNIQUEVISITS_FORFUTUREUSE1 to UNIQUEVISITS_VIP do to this column being 
*                                          renamed from Rent's side, causing our job to fail.
*                                      (2) Added ConnectedCalls as new column do to Rent adding this to the MDIM table
* 03	Sarah Mims		01/17/2013	   JIRA Ticket BI-392 and Numara ticket #14369 - Changed datatypes/structure of the Staging and Mart tables
*									   (They way they used to be: tbl_mdim_property_OLD and Mart.MDimProperty_OLD). I also added 
*									   the following columns: MissedCalls, OneWebConnectedCalls, OneWebMissedCalls, AltRegConnectedCalls,
*									   AltRegMissedCalls, MobileConnectedCalls, MobileMissedCalls. Once Georgia has completed the necessary
*									   tasks on Rent's end, I am going to put this procedure into a job.
* 04	Sarah Mims		03/14/2014	   Added additional colummns: EXTERNAL_TP,UNIQUE_IMPRESSIONS,INVOICED_LEASES ,PTE_VIEWERS,VIP_VIEWERS 
*									   ,PTE_SEARCHERS ,VIP_SEARCHERS ,VIP_HOTLEADERS ,TRULIAEMAILLEADERS
********************************************************************************************************************************************/
SET NOCOUNT ON

--------------------------------------------------------------------------
---- Declare & Set Variables
--------------------------------------------------------------------------
DECLARE @DatabaseName VARCHAR(128);
DECLARE @SecondsStr VARCHAR(300);
DECLARE @LastDateTime DATETIME;

DECLARE @SQL VARCHAR(8000);
DECLARE @YMDWEEKEARLIER VARCHAR(15); 
DECLARE @YMDIDCHAR VARCHAR(15);

SET @DatabaseName = DB_NAME()

IF @YMDID IS NOT NULL 
    BEGIN
        SET @YMDIDCHAR = CAST(REPLACE(CONVERT(VARCHAR(11),CAST(CAST(@YMDID AS VARCHAR) AS DATE),106),' ','-') AS VARCHAR);
        SET @YMDWEEKEARLIER = CAST(REPLACE(CONVERT(VARCHAR(11),DATEADD(d,-2,CAST(@YMDID AS VARCHAR)),106),' ','-') AS VARCHAR)-- check  data for 2 days only
    END
    
IF @YMDID IS NULL 
    BEGIN
        SET @YMDIDCHAR = CAST(REPLACE(CONVERT(VARCHAR(11),GETDATE() - 1,106),' ','-') AS VARCHAR)
        SET @YMDWEEKEARLIER = CAST(REPLACE(CONVERT(VARCHAR(11),GETDATE() - 7,106),' ','-') AS VARCHAR);
    END
    
--SET @YMDIDCHAR = '31-JAN-2013'
--SET @YMDWEEKEARLIER = '01-JAN-2013' 

    -- Patch to use Todays parse data or load previous parsed data from Archived Parsed Data
EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
    @DatabaseName
   ,'APTG Staging.pr_tbl_mdim_property'
   ,'START Staging Table Load'
   ,'0 Seconds'
   ,0
   ,'Starting';

    
-- Rent is 3 hours behind us so add 3 hours to their datetimes

--------------------------------------------------------------------------
---- Clear out the staging table
--------------------------------------------------------------------------
TRUNCATE TABLE staging.tbl_mdim_property;

--------------------------------------------------------------------------
---- Build the select statment to run against RPTPROD
--------------------------------------------------------------------------
SET @SQL = N'
SELECT 
  CAST(CONVERT(VARCHAR(8), RECORD_CREATE_DM, 112) as INT) AS YMDID ,*
FROM OPENQUERY (RPTPROD,''select  
RECORD_CREATE_DM ,PROPERTY_CREATE_DM  ,PROPERTY_UPDATE_DM  ,PROPERTY_TERMINATE_DM  ,PROPERTY_ID,UNIVERSAL_ID  ,EXTERNAL_ID,TYPE_NM ,TOTALUNITS_NB ,ACTIVE_UNITS_AT  
,UPSELLLISTSENIORLISTING,TOTAL_AMENITIES  ,ACTIVE_AMENITIES ,TOTAL_PHOTOS  ,ACTIVE_PHOTOS ,TOTAL_FLOOR_PLANS,ACTIVE_FLOOR_PLANS  ,UPSELLPROPRENTALSFEATURED ,UPSELLLISTFLOORPLANUPGRADE
,UPSELLLISTPAYPERLEAD,ISRENTALPROPTOBEDELETED,LISTINGSTATUSID  ,UPSELLLISTHIGHLIGHTED  ,UPSELLLISTCOUPON ,UPSELLPROPEMERICAL  ,UPSELLPROPFEATURECOMMPLATINUM,UPSELLPROPFEATURECOMMGOLD 
,UPSELLPROPFEATURECOMMSILVER  ,UPSELLPROPVIRTUALBROCHURE ,UPSELLLISTCORPORATELISTING,UPSELLLISTCOLLEGELISTING  ,UPSELLLISTMILITARYLISTING ,UPSELLLISTAPARTMENTLISTING
,UPSELLPROPPHOTOUPGRADE ,UPSELLMGMTCOLOGODISPLAY,UPSELLPROPLOGODISPLAY  ,UPSELLPROPPREMIUMUPGRADE  ,UPSELLPROPVIDEOSPOKESMODEL,UPSELLPROPFRONTPAGE ,UPSELLPROPSPANISH,UPSELLPROPCALLRECORDING
,UPSELLPROPFROMTOPHONE  ,UPSELLPROPRENTALSPREMIER  ,UPSELLPROPRENTALSLISTING  ,UPSELLLISTRENTALSSPOTLIGHTED ,UPSELLLISTSPOTLIGHT ,UPSELLLISTPAYPERLEASE  ,UPSELLLISTDIAMONDCITY  
,UPSELLLISTDIAMONDMAX,UPSELLLISTRENTALSSTANDARD ,UPSELLLISTCOMMUNITYCAROUSEL  ,UPSELLLIST30SECONDVIDEO,UPSELLLIST60SECONDVIDEO,UPSELLLISTRENTALSCAROUSEL ,UPSELLLISTRENTALSSTANDARDPLUS
,UPSELLLISTMOBILESPOTLIGHT ,UPSELLPROPMOBILEDEAL,UPSELLPROPDYNAMICLEADFORM ,UPSELLLISTINCOMERESTRICTED,UPSELLLISTPETFRIENDLY  ,UPSELLLISTLUXURYCOMMUNITY ,UPSELLPROPREPMON ,UPSELLPROPSOCIALMEDIAMAN  
,FUTUREUPSELL03,FUTUREUPSELL04,FUTUREUPSELL05,FUTUREUPSELL06,FUTUREUPSELL07,FUTUREUPSELL08,LOWPRICE,HIGHPRICE  ,ISSEM,ISOVERTHRESHOLD  ,CALLTRACKINGINBOOK  ,COUPONACTIVEONSITE  
,VERIZONFIOS,ATTUVERSE  ,DIRECTTV,BRIGHTHOUSE,CHARTER ,XFINITYSP  ,XFINITYDP  ,XFINITYTP  ,TIMEWARNER ,NUMERICRANK, UNIQUEVISITS_FL  ,UNIQUEVISITS_PTE ,UNIQUEVISITS_NONE,UNIQUEVISITS_MOBILE,UNIQUEVISITS_VIP
,UNIQUEVISITS_FORFUTUREUSE2,UNIQUEVISITS_FORFUTUREUSE3,UNIQUEVISITS_FORFUTUREUSE4,UNIQUEVISITS_FORFUTUREUSE5
,VIEWSLISTINGPAGE ,VIEWSLISTINGPAGE_MOBILE,VIEWSLISTINGPAGE_FORFUTUREUSE1  ,VIEWSLISTINGPAGE_FORFUTUREUSE2  ,VIEWSLISTINGPAGE_FORFUTUREUSE3  ,VIEWSLISTINGPAGE_FORFUTUREUSE4  ,VIEWSLISTINGPAGE_FORFUTUREUSE5  
,VIEWSEMERCIAL ,VIEWSVIRTUALBROCHURE,CLICKSSPOTLIGHTLISTING ,CLICKSSPOTLIGHTCOMMUNITYVIDEO,CLICKSLISTINGWEBLINK,CLICKSMGTCOWEBLINK  
,CLICKSONLINEAPPT ,CLICKSONLINEAPPTSUBMIT ,CLICKSONLINEAPPL ,CLICKSONLINEAPPLSUBMIT ,CLICKSONLINEAPPTCR  ,CLICKSONLINEAPPLCR  
,CLICKSSPOTLIGHTLEADSUBMISSION,CLICKSWECANCALLYOU  ,CLICKSLEADSUBMISSION,CLICKSPHONESUBMISSION  ,CLICKSCOMMUNITYVIDEO,CLICKSLISTINGMAP ,CLICKSMAPDIRECTIONS ,CLICKSPRINTABLEGUIDE,CLICKSPHOTOS  
,CLICKSSPOTLIGHTPHOTOS  ,CLICKSSPOTLIGHTPHOTOPOPUP ,CLICKSFLOORPLAN  ,CLICKSCHECKYOURCREDIT  ,CLICKSWEBBUILDERLINK,CLICKSFEATUREDMGTCO ,CLICKSFRONTPAGEPROPLEAD,CLICKSLUXURYSLIDESHOW  
,IMPRSEARCHRESULTS,TOTAL_IMPRESSIONS,IMPREFRONTCOVER  ,IMPRVISITCOUNT,VIEWING_FROM_EMAIL  ,TOTAL_VIEWINGS,TEXTMSGWEB ,TEXTMSGMOBILE 
,CHECKLISTINGAVAIL,CHECKSSPOTLIGHTLISTINGAVAIL  ,CHECKSVIRTUALTOURLISTINGAVAIL,AGCPRINTCONNECTEDCALLS ,AGCPRINTMISSEDCALLS ,ASGPRINTCONNECTEDCALLS ,ASGPRINTMISSEDCALLS 
,WEBCONNECTEDCALLS,WEBMISSEDCALLS,RENTALSCONNECTEDCALLS  ,RENTALSMISSEDCALLS  ,CTCONNECTEDCALLS ,CTCMISSEDCALLS,PAIDSPCONNECTEDCALLS,PAIDSPMISSEDCALLS
,COMBINEDFEEDSCONNECTEDCALLS  ,COMBINEDFEEDSMISSEDCALLS  ,GOOGLECONNECTEDCALLS,GOOGLEMISSEDCALLS,PPCCONNECTEDCALLS,PPCMISSEDCALLS,LUXURYCONNECTEDCALLS,LUXURYMISSEDCALLS,MARCHEXCONNECTEDCALLS  ,MARCHEXMISSEDCALLS  
,CRAIGSLISTCONNECTEDCALLS  ,CRAIGSLISTMISSEDCALLS  ,WEBLOCALTRACKNUMCONNECTCALLS ,WEBLOCALTRACKNUMMISSEDCALLS  ,RENTALSLOCALCONNECTEDCALLS,RENTALSLOCALMISSEDCALLS,VIDEOCONNECTEDCALLS 
,VIDEOMISSEDCALLS ,SEMCONNECTEDCALLS,SEMMISSEDCALLS,TRULIACONNECTEDCALLS,TRULIAMISSEDCALLS
,FUTURECONNECTEDCALLS01 ,FUTUREMISSEDCALLS01 ,FUTURECONNECTEDCALLS02 ,FUTUREMISSEDCALLS02 ,FUTURECONNECTEDCALLS03 ,FUTUREMISSEDCALLS03 ,FUTURECONNECTEDCALLS04 ,FUTUREMISSEDCALLS04 
,FUTURECONNECTEDCALLS05 ,FUTUREMISSEDCALLS05 ,FUTURECONNECTEDCALLS06 ,FUTUREMISSEDCALLS06 ,FUTURECONNECTEDCALLS07 ,FUTUREMISSEDCALLS07 ,FUTURECONNECTEDCALLS08 ,FUTUREMISSEDCALLS08 
,FUTURECONNECTEDCALLS09 ,FUTUREMISSEDCALLS09 ,FUTURECONNECTEDCALLS10 ,FUTUREMISSEDCALLS10 
,AGEMAILLEADS  ,MAETROEMAILLEADS ,NEIGHBORHOODEMAILLEADS ,AIMCOEMAILLEADS  ,RENTALSEMAILLEADS,RENTAREMAILLEADS ,RENTALHOUSESEMAILLEADS ,IPHONEEMAILLEADS ,OODLEEMAILLEADS  
,ANDROIDEMAILLEADS,HOTPADSEMAILLEADS,LUXURYEMAILLEADS ,CONDOEMAILLEADS  ,IPADEMAILLEADS,TRULIAEMAILLEADS ,ZILLOWEMAILLEADS ,VERTICALBRANDSEMAILLEADS  ,RDTFEEDLEADS  ,PROPSOLUTIONSFEEDLEADS 
,YIELDFEEDLEADS,AGMOBILEEMAILLEADS  ,RENTALSMOBILEEMAILLEADS,RENTALSANDROIDEMAILLEADS  ,RENTALSIPHONEEMAILLEADS,VASTEMAILLEADS,CAMPUSHOMESONLINEEMAILLEADS  ,AGTABLETEMAILLEADS  ,AGKINDLEEMAILLEADS  
,FUTURE1EMAILLEADS,FUTURE2EMAILLEADS,FUTURE3EMAILLEADS,FUTURE4EMAILLEADS,FUTURE5EMAILLEADS,FUTURE6EMAILLEADS,FUTURE7EMAILLEADS,FUTURE8EMAILLEADS,FUTURE9EMAILLEADS,FUTURE0EMAILLEADS
,PLACEMENTTIER ,PRINTPRODUCTPOINTS  ,INTERNETPRODUCTPOINTS  ,LEGACYLOYALTYPOINTS ,CONTRACTLOYALTYPOINTS  ,LASTUPDATEYMDID  ,UPSELLLISTBOLD,UPSELLLISTFRONTCOVER,UPSELLPROPPHOTOFEATURE 
,UPSELLMGMTMANAGEMENTCOLOGO,UPSELLPROPPROPERTYLOGO ,UPSELLPROPPREMIUMPACKAGE  ,UPSELLLISTFLOORPLANPKG ,LINKEDFLOORPLAN  ,INTERNETPHONELEADS  ,INTERNETPHONELEADS_NOMOBILE  
,DIGITALPHONELEADS,EMAILLEADS ,INTERNETEMAILLEADS_NOMOBILE  ,DIGITALEMAILLEADS,AGCMISSEDCALLS,ASGMISSEDCALLS,AGCALLLEADS,ASGALLLEADS,ALLMISSEDCALLS,ALLCONNECTEDCALLS
,ALLLEADS,ALLINTERNETLEADS_NOMOBILE ,ALLDIGITALLEADS  ,THIRDPARTYFEEDLEADS ,WEBSITECALLS  ,WEBSITEEMAILS ,WEBSITELEADS_RENTALS,MOBILEEMAILS  ,MOBILECALLS,MOBILELEADS_AG
,MOBILELEADS_RENTALS ,MOBILEALLLEADS,MRSYNDICATIONEMAILLEADS,MRAGEMAILLEADS,MRAGWEBPHONELEADS,MRAPPSEMAILLEADS ,MRPHONECALLS  ,RPLRANK 
,PROPERTY_NM,MARKET_NM  ,CITY_NM ,STATE_CD,SEARCH_RANK,PAGE_IN_SEARCH,UPGRADE_TP ,UPGRADE_MONTHLY_COST,UPGRADE_START_DATE  ,UPGRADE_END_DATE 
,NATURAL_IMPRESSIONS ,FEATURED_IMPRESSIONS,NATURAL_VIEWINGS ,FEATURED_VIEWINGS,NATURAL_HOTLEADS ,FEATURED_HOTLEADS,TOTAL_PHONECALL  ,NATURAL_PHONECALLS  ,FEATURED_PHONECALLS 
,TOTAL_HOTLEAD ,NATURAL_NRL,FEATURED_NRL  ,TOTAL_LEASES  ,MARKET_NB  ,PAID_LEASES,AVG_CALL_DURATION,COMPANY_NM ,COMPANY_ID ,SUCCESS_FEE
,VIP_IMPRESSIONS  ,VIP_VIEWINGS  ,VIP_HOTLEADS  ,VIP_PHONECALLS,VIP_NRL ,PTE_IMPRESSIONS  ,PTE_VIEWINGS  ,PTE_HOTLEADS  ,PTE_PHONECALLS,PTE_NRL 
,PROPERTY_STATUS  ,PHONE_CD,PROPERTY_ADDRESS ,FAX_CD  ,EMAIL_NM,HOTLEADEMAIL_ID  ,HOTLEADFAX_ID ,UNIQUE_HOTLEADS  ,UNIQUE_VIEWINGS  ,UNIQUE_PDP_OVERVIEWS
,BILLING_ADDRESS  ,BILLING_CITY  ,BILLING_STATE ,BILLING_ZIP,BILLING_EMAIL ,BILLING_PHONE ,BILLING_FAX,LEASE_FAXED,LEASE_EMAILED ,SUBMARKET_NB  ,SUBMARKET_NM  ,AREA_NM 
,IMAGE_INCLUDED,SPECIALS,MAIN_IMAGE_AVAILABLE,FLOORPLAN_AVAILABLE ,LOGO_AVAILABLE,LAST_VIRTUAL_UPLOAD ,SEARCHABLE ,UNIQUE_HOTLEADERS,NATURAL_SEARCHERS,FEATURED_SEARCHERS  
,NATURAL_VIEWERS  ,FEATURED_VIEWERS ,NATURAL_HOTLEADERS  ,FEATURED_HOTLEADERS ,TOTAL_HOTLEADERS ,TOTAL_PHONECALLERS  ,FEATURED_PHONECALLERS  ,NATURAL_PHONECALLERS,BUSINESSMODEL_TP ,ACTIVATE_DM,CONNECTEDCALLS
,MISSEDCALLS,ONEWEBCONNECTEDCALLS,ONEWEBMISSEDCALLS,ALTREGCONNECTEDCALLS,ALTREGMISSEDCALLS,MOBILECONNECTEDCALLS,MOBILEMISSEDCALLS, EXTERNAL_TP,UNIQUE_IMPRESSIONS,INVOICED_LEASES ,PTE_VIEWERS,VIP_VIEWERS ,PTE_SEARCHERS ,VIP_SEARCHERS ,VIP_HOTLEADERS 
,TRULIAEMAILLEADERS
FROM reports.tbl_mdim_property
WHERE record_create_dm between to_date(''''' + @YMDWEEKEARLIER + ''''',''''DD-MON-YYYY'''')  and to_date(''''' + @YMDIDCHAR + ''''',''''DD-MON-YYYY'''') 
'')'
--PRINT @SQL


--------------------------------------------------------------------------
---- Run the select and insert it into the staging table
--------------------------------------------------------------------------
INSERT  INTO staging.tbl_mdim_property
        (YMDID
        ,RECORD_CREATE_DM
        ,PROPERTY_CREATE_DM
        ,PROPERTY_UPDATE_DM
        ,PROPERTY_TERMINATE_DM
        ,PROPERTY_ID
        ,UNIVERSAL_ID
        ,EXTERNAL_ID
        ,TYPE_NM
        ,TOTALUNITS_NB
        ,ACTIVE_UNITS_AT
        ,UPSELLLISTSENIORLISTING
        ,TOTAL_AMENITIES
        ,ACTIVE_AMENITIES
        ,TOTAL_PHOTOS
        ,ACTIVE_PHOTOS
        ,TOTAL_FLOOR_PLANS
        ,ACTIVE_FLOOR_PLANS
        ,UPSELLPROPRENTALSFEATURED
        ,UPSELLLISTFLOORPLANUPGRADE
        ,UPSELLLISTPAYPERLEAD
        ,ISRENTALPROPTOBEDELETED
        ,LISTINGSTATUSID
        ,UPSELLLISTHIGHLIGHTED
        ,UPSELLLISTCOUPON
        ,UPSELLPROPEMERICAL
        ,UPSELLPROPFEATURECOMMPLATINUM
        ,UPSELLPROPFEATURECOMMGOLD
        ,UPSELLPROPFEATURECOMMSILVER
        ,UPSELLPROPVIRTUALBROCHURE
        ,UPSELLLISTCORPORATELISTING
        ,UPSELLLISTCOLLEGELISTING
        ,UPSELLLISTMILITARYLISTING
        ,UPSELLLISTAPARTMENTLISTING
        ,UPSELLPROPPHOTOUPGRADE
        ,UPSELLMGMTCOLOGODISPLAY
        ,UPSELLPROPLOGODISPLAY
        ,UPSELLPROPPREMIUMUPGRADE
        ,UPSELLPROPVIDEOSPOKESMODEL
        ,UPSELLPROPFRONTPAGE
        ,UPSELLPROPSPANISH
        ,UPSELLPROPCALLRECORDING
        ,UPSELLPROPFROMTOPHONE
        ,UPSELLPROPRENTALSPREMIER
        ,UPSELLPROPRENTALSLISTING
        ,UPSELLLISTRENTALSSPOTLIGHTED
        ,UPSELLLISTSPOTLIGHT
        ,UPSELLLISTPAYPERLEASE
        ,UPSELLLISTDIAMONDCITY
        ,UPSELLLISTDIAMONDMAX
        ,UPSELLLISTRENTALSSTANDARD
        ,UPSELLLISTCOMMUNITYCAROUSEL
        ,UPSELLLIST30SECONDVIDEO
        ,UPSELLLIST60SECONDVIDEO
        ,UPSELLLISTRENTALSCAROUSEL
        ,UPSELLLISTRENTALSSTANDARDPLUS
        ,UPSELLLISTMOBILESPOTLIGHT
        ,UPSELLPROPMOBILEDEAL
        ,UPSELLPROPDYNAMICLEADFORM
        ,UPSELLLISTINCOMERESTRICTED
        ,UPSELLLISTPETFRIENDLY
        ,UPSELLLISTLUXURYCOMMUNITY
        ,UPSELLPROPREPMON
        ,UPSELLPROPSOCIALMEDIAMAN
        ,FUTUREUPSELL03
        ,FUTUREUPSELL04
        ,FUTUREUPSELL05
        ,FUTUREUPSELL06
        ,FUTUREUPSELL07
        ,FUTUREUPSELL08
        ,LOWPRICE
        ,HIGHPRICE
        ,ISSEM
        ,ISOVERTHRESHOLD
        ,CALLTRACKINGINBOOK
        ,COUPONACTIVEONSITE
        ,VERIZONFIOS
        ,ATTUVERSE
        ,DIRECTTV
        ,BRIGHTHOUSE
        ,CHARTER
        ,XFINITYSP
        ,XFINITYDP
        ,XFINITYTP
        ,TIMEWARNER
        ,NUMERICRANK
        ,UNIQUEVISITS_FL
        ,UNIQUEVISITS_PTE
        ,UNIQUEVISITS_NONE
        ,UNIQUEVISITS_MOBILE
        ,UNIQUEVISITS_VIP
        ,UNIQUEVISITS_FORFUTUREUSE2
        ,UNIQUEVISITS_FORFUTUREUSE3
        ,UNIQUEVISITS_FORFUTUREUSE4
        ,UNIQUEVISITS_FORFUTUREUSE5
        ,VIEWSLISTINGPAGE
        ,VIEWSLISTINGPAGE_MOBILE
        ,VIEWSLISTINGPAGE_FORFUTUREUSE1
        ,VIEWSLISTINGPAGE_FORFUTUREUSE2
        ,VIEWSLISTINGPAGE_FORFUTUREUSE3
        ,VIEWSLISTINGPAGE_FORFUTUREUSE4
        ,VIEWSLISTINGPAGE_FORFUTUREUSE5
        ,VIEWSEMERCIAL
        ,VIEWSVIRTUALBROCHURE
        ,CLICKSSPOTLIGHTLISTING
        ,CLICKSSPOTLIGHTCOMMUNITYVIDEO
        ,CLICKSLISTINGWEBLINK
        ,CLICKSMGTCOWEBLINK
        ,CLICKSONLINEAPPT
        ,CLICKSONLINEAPPTSUBMIT
        ,CLICKSONLINEAPPL
        ,CLICKSONLINEAPPLSUBMIT
        ,CLICKSONLINEAPPTCR
        ,CLICKSONLINEAPPLCR
        ,CLICKSSPOTLIGHTLEADSUBMISSION
        ,CLICKSWECANCALLYOU
        ,CLICKSLEADSUBMISSION
        ,CLICKSPHONESUBMISSION
        ,CLICKSCOMMUNITYVIDEO
        ,CLICKSLISTINGMAP
        ,CLICKSMAPDIRECTIONS
        ,CLICKSPRINTABLEGUIDE
        ,CLICKSPHOTOS
        ,CLICKSSPOTLIGHTPHOTOS
        ,CLICKSSPOTLIGHTPHOTOPOPUP
        ,CLICKSFLOORPLAN
        ,CLICKSCHECKYOURCREDIT
        ,CLICKSWEBBUILDERLINK
        ,CLICKSFEATUREDMGTCO
        ,CLICKSFRONTPAGEPROPLEAD
        ,CLICKSLUXURYSLIDESHOW
        ,IMPRSEARCHRESULTS
        ,TOTAL_IMPRESSIONS
        ,IMPREFRONTCOVER
        ,IMPRVISITCOUNT
        ,VIEWING_FROM_EMAIL
        ,TOTAL_VIEWINGS
        ,TEXTMSGWEB
        ,TEXTMSGMOBILE
        ,CHECKLISTINGAVAIL
        ,CHECKSSPOTLIGHTLISTINGAVAIL
        ,CHECKSVIRTUALTOURLISTINGAVAIL
        ,AGCPRINTCONNECTEDCALLS
        ,AGCPRINTMISSEDCALLS
        ,ASGPRINTCONNECTEDCALLS
        ,ASGPRINTMISSEDCALLS
        ,WEBCONNECTEDCALLS
        ,WEBMISSEDCALLS
        ,RENTALSCONNECTEDCALLS
        ,RENTALSMISSEDCALLS
        ,CTCONNECTEDCALLS
        ,CTCMISSEDCALLS
        ,PAIDSPCONNECTEDCALLS
        ,PAIDSPMISSEDCALLS
        ,COMBINEDFEEDSCONNECTEDCALLS
        ,COMBINEDFEEDSMISSEDCALLS
        ,GOOGLECONNECTEDCALLS
        ,GOOGLEMISSEDCALLS
        ,PPCCONNECTEDCALLS
        ,PPCMISSEDCALLS
        ,LUXURYCONNECTEDCALLS
        ,LUXURYMISSEDCALLS
        ,MARCHEXCONNECTEDCALLS
        ,MARCHEXMISSEDCALLS
        ,CRAIGSLISTCONNECTEDCALLS
        ,CRAIGSLISTMISSEDCALLS
        ,WEBLOCALTRACKNUMCONNECTCALLS
        ,WEBLOCALTRACKNUMMISSEDCALLS
        ,RENTALSLOCALCONNECTEDCALLS
        ,RENTALSLOCALMISSEDCALLS
        ,VIDEOCONNECTEDCALLS
        ,VIDEOMISSEDCALLS
        ,SEMCONNECTEDCALLS
        ,SEMMISSEDCALLS
        ,TRULIACONNECTEDCALLS
        ,TRULIAMISSEDCALLS
        ,FUTURECONNECTEDCALLS01
        ,FUTUREMISSEDCALLS01
        ,FUTURECONNECTEDCALLS02
        ,FUTUREMISSEDCALLS02
        ,FUTURECONNECTEDCALLS03
        ,FUTUREMISSEDCALLS03
        ,FUTURECONNECTEDCALLS04
        ,FUTUREMISSEDCALLS04
        ,FUTURECONNECTEDCALLS05
        ,FUTUREMISSEDCALLS05
        ,FUTURECONNECTEDCALLS06
        ,FUTUREMISSEDCALLS06
        ,FUTURECONNECTEDCALLS07
        ,FUTUREMISSEDCALLS07
        ,FUTURECONNECTEDCALLS08
        ,FUTUREMISSEDCALLS08
        ,FUTURECONNECTEDCALLS09
        ,FUTUREMISSEDCALLS09
        ,FUTURECONNECTEDCALLS10
        ,FUTUREMISSEDCALLS10
        ,AGEMAILLEADS
        ,MAETROEMAILLEADS
        ,NEIGHBORHOODEMAILLEADS
        ,AIMCOEMAILLEADS
        ,RENTALSEMAILLEADS
        ,RENTAREMAILLEADS
        ,RENTALHOUSESEMAILLEADS
        ,IPHONEEMAILLEADS
        ,OODLEEMAILLEADS
        ,ANDROIDEMAILLEADS
        ,HOTPADSEMAILLEADS
        ,LUXURYEMAILLEADS
        ,CONDOEMAILLEADS
        ,IPADEMAILLEADS
        ,TRULIAEMAILLEADS
        ,ZILLOWEMAILLEADS
        ,VERTICALBRANDSEMAILLEADS
        ,RDTFEEDLEADS
        ,PROPSOLUTIONSFEEDLEADS
        ,YIELDFEEDLEADS
        ,AGMOBILEEMAILLEADS
        ,RENTALSMOBILEEMAILLEADS
        ,RENTALSANDROIDEMAILLEADS
        ,RENTALSIPHONEEMAILLEADS
        ,VASTEMAILLEADS
        ,CAMPUSHOMESONLINEEMAILLEADS
        ,AGTABLETEMAILLEADS
        ,AGKINDLEEMAILLEADS
        ,FUTURE1EMAILLEADS
        ,FUTURE2EMAILLEADS
        ,FUTURE3EMAILLEADS
        ,FUTURE4EMAILLEADS
        ,FUTURE5EMAILLEADS
        ,FUTURE6EMAILLEADS
        ,FUTURE7EMAILLEADS
        ,FUTURE8EMAILLEADS
        ,FUTURE9EMAILLEADS
        ,FUTURE0EMAILLEADS
        ,PLACEMENTTIER
        ,PRINTPRODUCTPOINTS
        ,INTERNETPRODUCTPOINTS
        ,LEGACYLOYALTYPOINTS
        ,CONTRACTLOYALTYPOINTS
        ,LASTUPDATEYMDID
        ,UPSELLLISTBOLD
        ,UPSELLLISTFRONTCOVER
        ,UPSELLPROPPHOTOFEATURE
        ,UPSELLMGMTMANAGEMENTCOLOGO
        ,UPSELLPROPPROPERTYLOGO
        ,UPSELLPROPPREMIUMPACKAGE
        ,UPSELLLISTFLOORPLANPKG
        ,LINKEDFLOORPLAN
        ,INTERNETPHONELEADS
        ,INTERNETPHONELEADS_NOMOBILE
        ,DIGITALPHONELEADS
        ,EMAILLEADS
        ,INTERNETEMAILLEADS_NOMOBILE
        ,DIGITALEMAILLEADS
        ,AGCMISSEDCALLS
        ,ASGMISSEDCALLS
        ,AGCALLLEADS
        ,ASGALLLEADS
        ,ALLMISSEDCALLS
        ,ALLCONNECTEDCALLS
        ,ALLLEADS
        ,ALLINTERNETLEADS_NOMOBILE
        ,ALLDIGITALLEADS
        ,THIRDPARTYFEEDLEADS
        ,WEBSITECALLS
        ,WEBSITEEMAILS
        ,WEBSITELEADS_RENTALS
        ,MOBILEEMAILS
        ,MOBILECALLS
        ,MOBILELEADS_AG
        ,MOBILELEADS_RENTALS
        ,MOBILEALLLEADS
        ,MRSYNDICATIONEMAILLEADS
        ,MRAGEMAILLEADS
        ,MRAGWEBPHONELEADS
        ,MRAPPSEMAILLEADS
        ,MRPHONECALLS
        ,RPLRANK
        ,PROPERTY_NM
        ,MARKET_NM
        ,CITY_NM
        ,STATE_CD
        ,SEARCH_RANK
        ,PAGE_IN_SEARCH
        ,UPGRADE_TP
        ,UPGRADE_MONTHLY_COST
        ,UPGRADE_START_DATE
        ,UPGRADE_END_DATE
        ,NATURAL_IMPRESSIONS
        ,FEATURED_IMPRESSIONS
        ,NATURAL_VIEWINGS
        ,FEATURED_VIEWINGS
        ,NATURAL_HOTLEADS
        ,FEATURED_HOTLEADS
        ,TOTAL_PHONECALL
        ,NATURAL_PHONECALLS
        ,FEATURED_PHONECALLS
        ,TOTAL_HOTLEAD
        ,NATURAL_NRL
        ,FEATURED_NRL
        ,TOTAL_LEASES
        ,MARKET_NB
        ,PAID_LEASES
        ,AVG_CALL_DURATION
        ,COMPANY_NM
        ,COMPANY_ID
        ,SUCCESS_FEE
        ,VIP_IMPRESSIONS
        ,VIP_VIEWINGS
        ,VIP_HOTLEADS
        ,VIP_PHONECALLS
        ,VIP_NRL
        ,PTE_IMPRESSIONS
        ,PTE_VIEWINGS
        ,PTE_HOTLEADS
        ,PTE_PHONECALLS
        ,PTE_NRL
        ,PROPERTY_STATUS
        ,PHONE_CD
        ,PROPERTY_ADDRESS
        ,FAX_CD
        ,EMAIL_NM
        ,HOTLEADEMAIL_ID
        ,HOTLEADFAX_ID
        ,UNIQUE_HOTLEADS
        ,UNIQUE_VIEWINGS
        ,UNIQUE_PDP_OVERVIEWS
        ,BILLING_ADDRESS
        ,BILLING_CITY
        ,BILLING_STATE
        ,BILLING_ZIP
        ,BILLING_EMAIL
        ,BILLING_PHONE
        ,BILLING_FAX
        ,LEASE_FAXED
        ,LEASE_EMAILED
        ,SUBMARKET_NB
        ,SUBMARKET_NM
        ,AREA_NM
        ,IMAGE_INCLUDED
        ,SPECIALS
        ,MAIN_IMAGE_AVAILABLE
        ,FLOORPLAN_AVAILABLE
        ,LOGO_AVAILABLE
        ,LAST_VIRTUAL_UPLOAD
        ,SEARCHABLE
        ,UNIQUE_HOTLEADERS
        ,NATURAL_SEARCHERS
        ,FEATURED_SEARCHERS
        ,NATURAL_VIEWERS
        ,FEATURED_VIEWERS
        ,NATURAL_HOTLEADERS
        ,FEATURED_HOTLEADERS
        ,TOTAL_HOTLEADERS
        ,TOTAL_PHONECALLERS
        ,FEATURED_PHONECALLERS
        ,NATURAL_PHONECALLERS
        ,BUSINESSMODEL_TP
        ,ACTIVATE_DM
        ,CONNECTEDCALLS
        ,MISSEDCALLS
        ,ONEWEBCONNECTEDCALLS
        ,ONEWEBMISSEDCALLS
        ,ALTREGCONNECTEDCALLS
        ,ALTREGMISSEDCALLS
        ,MOBILECONNECTEDCALLS
        ,MOBILEMISSEDCALLS
		,EXTERNAL_TP
		,UNIQUE_IMPRESSIONS
		,INVOICED_LEASES
		,PTE_VIEWERS
		,VIP_VIEWERS
		,PTE_SEARCHERS
		,VIP_SEARCHERS
		,VIP_HOTLEADERS
		,TRULIAEMAILLEADERS)
        EXEC (@SQL)

        --where trunc(record_create_dm) between ''''' + @YMDWEEKEARLIER + ''''' and ''''' + @YMDIDCHAR + '''''
SET @SecondsStr = CAST(DATEDIFF(ss,@lastdatetime,GETDATE()) AS VARCHAR(300)) + ' Seconds';

EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
    @DatabaseName
   ,'APTG Staging.pr_tbl_mdim_property'
   ,'End Staging Table Load'
   ,@SecondsStr
   ,0
   ,'End'

EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
    @DatabaseName
   ,'APTG Staging.pr_tbl_mdim_property'
   ,'START Mart.MDimProperty Table Load'
   ,'0 Seconds'
   ,0
   ,'Starting';

DECLARE @TimeZoneOffset INT = 3

--        --------------------------------------------------------------------------
--        ---- Merge in results from staging table into the marted table when any
--        ----    of the fields are new or changed
--        --------------------------------------------------------------------------
--MERGE INTO Mart.MDimProperty AS mp
--    USING Staging.tbl_mdim_property AS sp
--    ON  sp.ymdid = mp.ymdid
--        AND sp.Property_ID = mp.PropertyID
--    WHEN MATCHED ---------------------------------------------------------------------------------------------------
--		--When the records match on PropertyID and YMDID and one of the following is different, update the
--		--record
--		---------------------------------------------------------------------------------------------------
--        AND mp.PropertyCreateDate <> DATEADD(hour,@TimeZoneOffset,sp.property_create_dm)
--        OR mp.PropertyUpdateDate <> DATEADD(hour,@TimeZoneOffset,sp.property_update_dm)
--        OR mp.PropertyTerminateDate <> DATEADD(hour,@TimeZoneOffset,sp.property_terminate_dm)
--        OR mp.PropertyID <> CAST(sp.property_id AS INT)
--        OR mp.UniversalID <> sp.universal_id
--        OR mp.ExternalID <> sp.external_id
--        OR mp.Type <> sp.type_nm
--        OR mp.TotalUnits <> CAST(ROUND(sp.totalunits_nb,0) AS INT)
--        OR mp.ActiveUnitsAmount <> CAST(ROUND(sp.active_units_at,0) AS INT)
--        OR mp.UpsellListSeniorListing <> CAST(ROUND(sp.upselllistseniorlisting,0) AS INT)
--        OR mp.TotalAmenities <> CAST(ROUND(sp.total_amenities,0) AS INT)
--        OR mp.ActiveAmenities <> CAST(ROUND(sp.active_amenities,0) AS INT)
--        OR mp.TotalPhotos <> CAST(ROUND(sp.total_photos,0) AS INT)
--        OR mp.ActivePhotos <> CAST(ROUND(sp.active_photos,0) AS INT)
--        OR mp.TotalFloorPlans <> CAST(ROUND(sp.total_floor_plans,0) AS INT)
--        OR mp.ActiveFloorPlans <> CAST(ROUND(sp.active_floor_plans,0) AS INT)
--        OR mp.UpsellPropRentalsFeatured <> CAST(ROUND(sp.upsellproprentalsfeatured,0) AS INT)
--        OR mp.UpsellListFloorPlanUpgrade <> CAST(ROUND(sp.upselllistfloorplanupgrade,0) AS INT)
--        OR mp.UpsellListPayPerLead <> CAST(ROUND(sp.upselllistpayperlead,0) AS INT)
--        OR mp.ISRentalPropToBeDeleted <> CAST(ROUND(sp.isrentalproptobedeleted,0) AS INT)
--        OR mp.ListingStatusID <> sp.listingstatusid
--        OR mp.UpsellListHighlighted <> CAST(ROUND(sp.upselllisthighlighted,0) AS INT)
--        OR mp.UpsellListCoupon <> CAST(ROUND(sp.upselllistcoupon,0) AS INT)
--        OR mp.UpsellPropEmerical <> CAST(ROUND(sp.upsellpropemerical,0) AS INT)
--        OR mp.UpsellPropFeatureCommPlatinum <> CAST(ROUND(sp.upsellpropfeaturecommplatinum,0) AS INT)
--        OR mp.UpsellPropFeatureCommGold <> CAST(ROUND(sp.upsellpropfeaturecommgold,0) AS INT)
--        OR mp.UpsellPropFeatureCommSilver <> CAST(ROUND(sp.upsellpropfeaturecommsilver,0) AS INT)
--        OR mp.UpsellPropVirtualBrochure <> CAST(ROUND(sp.upsellpropvirtualbrochure,0) AS INT)
--        OR mp.UpsellListCorporateListing <> CAST(ROUND(sp.upselllistcorporatelisting,0) AS INT)
--        OR mp.UpsellListCollegeListing <> CAST(ROUND(sp.upselllistcollegelisting,0) AS INT)
--        OR mp.UpsellListMilitaryListing <> CAST(ROUND(sp.upselllistmilitarylisting,0) AS INT)
--        OR mp.UpsellListApartmentListing <> CAST(ROUND(sp.upselllistapartmentlisting,0) AS INT)
--        OR mp.UpsellPropPhotoUpgrade <> CAST(ROUND(sp.upsellpropphotoupgrade,0) AS INT)
--        OR mp.UpsellMgmtCoLogoDisplay <> CAST(ROUND(sp.upsellmgmtcologodisplay,0) AS INT)
--        OR mp.UpsellPropLogoDisplay <> CAST(ROUND(sp.upsellproplogodisplay,0) AS INT)
--        OR mp.UpsellPropPremiumUpgrade <> CAST(ROUND(sp.upsellproppremiumupgrade,0) AS INT)
--        OR mp.UpsellPropVideoSpokesModel <> CAST(ROUND(sp.upsellpropvideospokesmodel,0) AS INT)
--        OR mp.UpsellPropFrontPage <> CAST(ROUND(sp.upsellpropfrontpage,0) AS INT)
--        OR mp.UpsellPropSpanish <> CAST(ROUND(sp.upsellpropspanish,0) AS INT)
--        OR mp.UpsellPropCallRecording <> CAST(ROUND(sp.upsellpropcallrecording,0) AS INT)
--        OR mp.UpsellPropFromToPhone <> CAST(ROUND(sp.upsellpropfromtophone,0) AS INT)
--        OR mp.UpsellPropRentalsPremier <> CAST(ROUND(sp.upsellproprentalspremier,0) AS INT)
--        OR mp.UpsellPropRentalsListing <> CAST(ROUND(sp.upsellproprentalslisting,0) AS INT)
--        OR mp.UpsellListRentalsSpotlighted <> CAST(ROUND(sp.upselllistrentalsspotlighted,0) AS INT)
--        OR mp.UpsellListSpotlight <> CAST(ROUND(sp.upselllistspotlight,0) AS INT)
--        OR mp.UpsellListPayPerLease <> CAST(ROUND(sp.upselllistpayperlease,0) AS INT)
--        OR mp.UpsellListDiamondCity <> CAST(ROUND(sp.upselllistdiamondcity,0) AS INT)
--        OR mp.UpsellListDiamondMax <> CAST(ROUND(sp.upselllistdiamondmax,0) AS INT)
--        OR mp.UpsellListRentalsStandard <> CAST(ROUND(sp.upselllistrentalsstandard,0) AS INT)
--        OR mp.UpsellListCommunityCarousel <> CAST(ROUND(sp.upselllistcommunitycarousel,0) AS INT)
--        OR mp.UpsellList30SecondVideo <> CAST(ROUND(sp.upselllist30secondvideo,0) AS INT)
--        OR mp.UpsellList60SecondVideo <> CAST(ROUND(sp.upselllist60secondvideo,0) AS INT)
--        OR mp.UpsellListRentalsCarousel <> CAST(ROUND(sp.upselllistrentalscarousel,0) AS INT)
--        OR mp.UpsellListRentalsStandardPlus <> CAST(ROUND(sp.upselllistrentalsstandardplus,0) AS INT)
--        OR mp.UpsellListMobileSpotlight <> CAST(ROUND(sp.upselllistmobilespotlight,0) AS INT)
--        OR mp.UpsellPropMobileDeal <> CAST(ROUND(sp.upsellpropmobiledeal,0) AS INT)
--        OR mp.UpsellPropDynamicLeadForm <> CAST(ROUND(sp.upsellpropdynamicleadform,0) AS INT)
--        OR mp.UpsellListIncomeRestricted <> CAST(ROUND(sp.upselllistincomerestricted,0) AS INT)
--        OR mp.UpsellListPetFriendly <> CAST(ROUND(sp.upselllistpetfriendly,0) AS INT)
--        OR mp.UpsellListLuxuryCommunity <> CAST(ROUND(sp.upselllistluxurycommunity,0) AS INT)
--        OR mp.UpsellPropRepmon <> CAST(ROUND(sp.upsellproprepmon,0) AS INT)
--        OR mp.UpsellPropSocialMediaMan <> CAST(ROUND(sp.upsellpropsocialmediaman,0) AS INT)
--        OR mp.FutureUpsell03 <> CAST(ROUND(sp.futureupsell03,0) AS INT)
--        OR mp.FutureUpsell04 <> CAST(ROUND(sp.futureupsell04,0) AS INT)
--        OR mp.FutureUpsell05 <> CAST(ROUND(sp.futureupsell05,0) AS INT)
--        OR mp.FutureUpsell06 <> CAST(ROUND(sp.futureupsell06,0) AS INT)
--        OR mp.FutureUpsell07 <> CAST(ROUND(sp.futureupsell07,0) AS INT)
--        OR mp.FutureUpsell08 <> CAST(ROUND(sp.futureupsell08,0) AS INT)
--        OR mp.LowPrice <> CAST(sp.lowprice AS NUMERIC(15,2))
--        OR mp.Highprice <> CAST(sp.highprice AS NUMERIC(15,2))
--        OR mp.ISSem <> CAST(ROUND(sp.issem,0) AS INT)
--        OR mp.ISOverThreshold <> CAST(ROUND(sp.isoverthreshold,0) AS INT)
--        OR mp.CallTrackingInBook <> CAST(ROUND(sp.calltrackinginbook,0) AS INT)
--        OR mp.CouponActiveOnSite <> CAST(ROUND(sp.couponactiveonsite,0) AS INT)
--        OR mp.VerizonFios <> CAST(ROUND(sp.verizonfios,0) AS INT)
--        OR mp.ATTUverse <> CAST(ROUND(sp.attuverse,0) AS INT)
--        OR mp.DirectTV <> CAST(ROUND(sp.directtv,0) AS INT)
--        OR mp.BrightHouse <> CAST(ROUND(sp.brighthouse,0) AS INT)
--        OR mp.Charter <> CAST(ROUND(sp.charter,0) AS INT)
--        OR mp.Xfinitysp <> CAST(ROUND(sp.xfinitysp,0) AS INT)
--        OR mp.Xfinitydp <> CAST(ROUND(sp.xfinitydp,0) AS INT)
--        OR mp.Xfinitytp <> CAST(ROUND(sp.xfinitytp,0) AS INT)
--        OR mp.TimeWarner <> CAST(ROUND(sp.timewarner,0) AS INT)
--        OR mp.NumericRank <> CAST(ROUND(sp.numericrank,0) AS INT)
--        OR mp.UniqueVisits_FL <> CAST(ROUND(sp.uniquevisits_fl,0) AS INT)
--        OR mp.UniqueVisits_PTE <> CAST(ROUND(sp.uniquevisits_pte,0) AS INT)
--        OR mp.UniqueVisits_None <> CAST(ROUND(sp.uniquevisits_none,0) AS INT)
--        OR mp.UniqueVisits_Mobile <> CAST(ROUND(sp.uniquevisits_mobile,0) AS INT)
--        OR mp.UniqueVisits_VIP <> CAST(ROUND(sp.uniquevisits_VIP,0) AS INT)
--        OR mp.UniqueVisits_ForFutureUse2 <> CAST(ROUND(sp.uniquevisits_forfutureuse2,0) AS INT)
--        OR mp.UniqueVisits_ForFutureUse3 <> CAST(ROUND(sp.uniquevisits_forfutureuse3,0) AS INT)
--        OR mp.UniqueVisits_ForFutureUse4 <> CAST(ROUND(sp.uniquevisits_forfutureuse4,0) AS INT)
--        OR mp.UniqueVisits_ForFutureUse5 <> CAST(ROUND(sp.uniquevisits_forfutureuse5,0) AS INT)
--        OR mp.ViewsListingPage <> CAST(ROUND(sp.viewslistingpage,0) AS INT)
--        OR mp.ViewsListingPage_Mobile <> CAST(ROUND(sp.viewslistingpage_mobile,0) AS INT)
--        OR mp.ViewsListingPage_ForFutureUse1 <> CAST(ROUND(sp.viewslistingpage_forfutureuse1,0) AS INT)
--        OR mp.ViewsListingPage_ForFutureUse2 <> CAST(ROUND(sp.viewslistingpage_forfutureuse2,0) AS INT)
--        OR mp.ViewsListingPage_ForFutureUse3 <> CAST(ROUND(sp.viewslistingpage_forfutureuse3,0) AS INT)
--        OR mp.ViewsListingPage_ForFutureUse4 <> CAST(ROUND(sp.viewslistingpage_forfutureuse4,0) AS INT)
--        OR mp.ViewsListingPage_ForFutureUse5 <> CAST(ROUND(sp.viewslistingpage_forfutureuse5,0) AS INT)
--        OR mp.ViewsEmercial <> CAST(ROUND(sp.viewsemercial,0) AS INT)
--        OR mp.ViewsVirtualBrochure <> CAST(ROUND(sp.viewsvirtualbrochure,0) AS INT)
--        OR mp.ClicksSpotlightListing <> CAST(ROUND(sp.clicksspotlightlisting,0) AS INT)
--        OR mp.ClicksSpotlightCommunityVideo <> CAST(ROUND(sp.clicksspotlightcommunityvideo,0) AS INT)
--        OR mp.ClicksListingWebLink <> CAST(ROUND(sp.clickslistingweblink,0) AS INT)
--        OR mp.ClicksMgtcoWebLink <> CAST(ROUND(sp.clicksmgtcoweblink,0) AS INT)
--        OR mp.ClicksOnlineAppt <> CAST(ROUND(sp.clicksonlineappt,0) AS INT)
--        OR mp.ClicksOnlineApptSubmit <> CAST(ROUND(sp.clicksonlineapptsubmit,0) AS INT)
--        OR mp.ClicksOnlineAppl <> CAST(ROUND(sp.clicksonlineappl,0) AS INT)
--        OR mp.ClicksOnlineApplSubmit <> CAST(ROUND(sp.clicksonlineapplsubmit,0) AS INT)
--        OR mp.ClicksOnlineApptCR <> CAST(ROUND(sp.clicksonlineapptcr,0) AS INT)
--        OR mp.ClicksOnlineApplCR <> CAST(ROUND(sp.clicksonlineapplcr,0) AS INT)
--        OR mp.ClicksSpotlightLeadSubmission <> CAST(ROUND(sp.clicksspotlightleadsubmission,0) AS INT)
--        OR mp.ClicksWeCanCallYou <> CAST(ROUND(sp.clickswecancallyou,0) AS INT)
--        OR mp.ClicksLeadSubmission <> CAST(ROUND(sp.clicksleadsubmission,0) AS INT)
--        OR mp.ClicksPhoneSubmission <> CAST(ROUND(sp.clicksphonesubmission,0) AS INT)
--        OR mp.ClicksCommunityVideo <> CAST(ROUND(sp.clickscommunityvideo,0) AS INT)
--        OR mp.ClicksListingMap <> CAST(ROUND(sp.clickslistingmap,0) AS INT)
--        OR mp.ClicksMapDirections <> CAST(ROUND(sp.clicksmapdirections,0) AS INT)
--        OR mp.ClicksPrintableGuide <> CAST(ROUND(sp.clicksprintableguide,0) AS INT)
--        OR mp.ClicksPhotos <> CAST(ROUND(sp.clicksphotos,0) AS INT)
--        OR mp.ClicksSpotlightPhotos <> CAST(ROUND(sp.clicksspotlightphotos,0) AS INT)
--        OR mp.ClicksSpotlightPhotoPopup <> CAST(ROUND(sp.clicksspotlightphotopopup,0) AS INT)
--        OR mp.ClicksFloorPlan <> CAST(ROUND(sp.clicksfloorplan,0) AS INT)
--        OR mp.ClicksCheckYourCredit <> CAST(ROUND(sp.clickscheckyourcredit,0) AS INT)
--        OR mp.ClicksWebBuilderLink <> CAST(ROUND(sp.clickswebbuilderlink,0) AS INT)
--        OR mp.ClicksFeaturedMgtCo <> CAST(ROUND(sp.clicksfeaturedmgtco,0) AS INT)
--        OR mp.ClicksFrontPagePropLead <> CAST(ROUND(sp.clicksfrontpageproplead,0) AS INT)
--        OR mp.ClicksLuxurySlideShow <> CAST(ROUND(sp.clicksluxuryslideshow,0) AS INT)
--        OR mp.ImprSearchResults <> CAST(ROUND(sp.imprsearchresults,0) AS INT)
--        OR mp.TotalImpressions <> CAST(ROUND(sp.total_impressions,0) AS INT)
--        OR mp.ImpreFrontCover <> CAST(ROUND(sp.imprefrontcover,0) AS INT)
--        OR mp.ImprVisitCount <> CAST(ROUND(sp.imprvisitcount,0) AS INT)
--        OR mp.ViewingFromEmail <> CAST(ROUND(sp.viewing_from_email,0) AS INT)
--        OR mp.TotalViewings <> CAST(ROUND(sp.total_viewings,0) AS INT)
--        OR mp.TextMsgWeb <> CAST(ROUND(sp.textmsgweb,0) AS INT)
--        OR mp.TextMsgMobile <> CAST(ROUND(sp.textmsgmobile,0) AS INT)
--        OR mp.CheckListingAvail <> CAST(ROUND(sp.checklistingavail,0) AS INT)
--        OR mp.ChecksSpotLightListingAvail <> CAST(ROUND(sp.checksspotlightlistingavail,0) AS INT)
--        OR mp.ChecksVirtualtourListingAvail <> CAST(ROUND(sp.checksvirtualtourlistingavail,0) AS INT)
--        OR mp.AgcPrintConnectedCalls <> CAST(ROUND(sp.agcprintconnectedcalls,0) AS INT)
--        OR mp.AgcPrintMissedCalls <> CAST(ROUND(sp.agcprintmissedcalls,0) AS INT)
--        OR mp.AsgPrintConnectedCalls <> CAST(ROUND(sp.asgprintconnectedcalls,0) AS INT)
--        OR mp.AsgPrintMissedCalls <> CAST(ROUND(sp.asgprintmissedcalls,0) AS INT)
--        OR mp.WebConnectedCalls <> CAST(ROUND(sp.webconnectedcalls,0) AS INT)
--        OR mp.WebMissedCalls <> CAST(ROUND(sp.webmissedcalls,0) AS INT)
--        OR mp.RentalsConnectedCalls <> CAST(ROUND(sp.rentalsconnectedcalls,0) AS INT)
--        OR mp.RentalsMissedCalls <> CAST(ROUND(sp.rentalsmissedcalls,0) AS INT)
--        OR mp.CTCConnectedCalls <> CAST(ROUND(sp.ctconnectedcalls,0) AS INT)
--        OR mp.CTCMissedCalls <> CAST(ROUND(sp.ctcmissedcalls,0) AS INT)
--        OR mp.PaidSPConnectedCalls <> CAST(ROUND(sp.paidspconnectedcalls,0) AS INT)
--        OR mp.PaidSPMissedCalls <> CAST(ROUND(sp.paidspmissedcalls,0) AS INT)
--        OR mp.CombinedFeedsConnectedCalls <> CAST(ROUND(sp.combinedfeedsconnectedcalls,0) AS INT)
--        OR mp.CombinedFeedsMissedCalls <> CAST(ROUND(sp.combinedfeedsmissedcalls,0) AS INT)
--        OR mp.GoogleConnectedCalls <> CAST(ROUND(sp.googleconnectedcalls,0) AS INT)
--        OR mp.GoogleMissedCalls <> CAST(ROUND(sp.googlemissedcalls,0) AS INT)
--        OR mp.PPCConnectedCalls <> CAST(ROUND(sp.ppcconnectedcalls,0) AS INT)
--        OR mp.PPCMissedCalls <> CAST(ROUND(sp.ppcmissedcalls,0) AS INT)
--        OR mp.LuxuryConnectedCalls <> CAST(ROUND(sp.luxuryconnectedcalls,0) AS INT)
--        OR mp.LuxuryMissedCalls <> CAST(ROUND(sp.luxurymissedcalls,0) AS INT)
--        OR mp.MarchexConnectedCalls <> CAST(ROUND(sp.marchexconnectedcalls,0) AS INT)
--        OR mp.MarchexMissedCalls <> CAST(ROUND(sp.marchexmissedcalls,0) AS INT)
--        OR mp.CraigsListConnectedCalls <> CAST(ROUND(sp.craigslistconnectedcalls,0) AS INT)
--        OR mp.CraigsListMissedCalls <> CAST(ROUND(sp.craigslistmissedcalls,0) AS INT)
--        OR mp.WebLocalTrackingNumberConnectedCalls <> CAST(ROUND(sp.weblocaltracknumconnectcalls,0) AS INT)
--        OR mp.WebLocalTrackingNumberMissedCalls <> CAST(ROUND(sp.weblocaltracknummissedcalls,0) AS INT)
--        OR mp.RentalsLocalConnectedCalls <> CAST(ROUND(sp.rentalslocalconnectedcalls,0) AS INT)
--        OR mp.RentalsLocalMissedCalls <> CAST(ROUND(sp.rentalslocalmissedcalls,0) AS INT)
--        OR mp.VideoConnectedCalls <> CAST(ROUND(sp.videoconnectedcalls,0) AS INT)
--        OR mp.VideoMissedCalls <> CAST(ROUND(sp.videomissedcalls,0) AS INT)
--        OR mp.SEMConnectedCalls <> CAST(ROUND(sp.semconnectedcalls,0) AS INT)
--        OR mp.SEMMissedCalls <> CAST(ROUND(sp.semmissedcalls,0) AS INT)
--        OR mp.TruliaConnectedCalls <> CAST(ROUND(sp.truliaconnectedcalls,0) AS INT)
--        OR mp.TruliaMissedCalls <> CAST(ROUND(sp.truliamissedcalls,0) AS INT)
--        OR mp.FutureConnectedCalls01 <> CAST(ROUND(sp.futureconnectedcalls01,0) AS INT)
--        OR mp.FutureMissedCalls01 <> CAST(ROUND(sp.futuremissedcalls01,0) AS INT)
--        OR mp.FutureConnectedCalls02 <> CAST(ROUND(sp.futureconnectedcalls02,0) AS INT)
--        OR mp.FutureMissedCalls02 <> CAST(ROUND(sp.futuremissedcalls02,0) AS INT)
--        OR mp.FutureConnectedCalls03 <> CAST(ROUND(sp.futureconnectedcalls03,0) AS INT)
--        OR mp.FutureMissedCalls03 <> CAST(ROUND(sp.futuremissedcalls03,0) AS INT)
--        OR mp.FutureConnectedCalls04 <> CAST(ROUND(sp.futureconnectedcalls04,0) AS INT)
--        OR mp.FutureMissedCalls04 <> CAST(ROUND(sp.futuremissedcalls04,0) AS INT)
--        OR mp.FutureConnectedCalls05 <> CAST(ROUND(sp.futureconnectedcalls05,0) AS INT)
--        OR mp.FutureMissedCalls05 <> CAST(ROUND(sp.futuremissedcalls05,0) AS INT)
--        OR mp.FutureConnectedCalls06 <> CAST(ROUND(sp.futureconnectedcalls06,0) AS INT)
--        OR mp.FutureMissedCalls06 <> CAST(ROUND(sp.futuremissedcalls06,0) AS INT)
--        OR mp.FutureConnectedCalls07 <> CAST(ROUND(sp.futureconnectedcalls07,0) AS INT)
--        OR mp.FutureMissedCalls07 <> CAST(ROUND(sp.futuremissedcalls07,0) AS INT)
--        OR mp.FutureConnectedCalls08 <> CAST(ROUND(sp.futureconnectedcalls08,0) AS INT)
--        OR mp.FutureMissedCalls08 <> CAST(ROUND(sp.futuremissedcalls08,0) AS INT)
--        OR mp.FutureConnectedCalls09 <> CAST(ROUND(sp.futureconnectedcalls09,0) AS INT)
--        OR mp.FutureMissedCalls09 <> CAST(ROUND(sp.futuremissedcalls09,0) AS INT)
--        OR mp.FutureConnectedCalls10 <> CAST(ROUND(sp.futureconnectedcalls10,0) AS INT)
--        OR mp.FutureMissedCalls10 <> CAST(ROUND(sp.futuremissedcalls10,0) AS INT)
--        OR mp.AGEmailLeads <> CAST(ROUND(sp.agemailleads,0) AS INT)
--        OR mp.MetroEmailLeads <> CAST(ROUND(sp.maetroemailleads,0) AS INT)
--        OR mp.NeighborhoodEmailLeads <> CAST(ROUND(sp.neighborhoodemailleads,0) AS INT)
--        OR mp.AIMCOEmailLeads <> CAST(ROUND(sp.aimcoemailleads,0) AS INT)
--        OR mp.RentalsEmailLeads <> CAST(ROUND(sp.rentalsemailleads,0) AS INT)
--        OR mp.RentarEmailLeads <> CAST(ROUND(sp.rentaremailleads,0) AS INT)
--        OR mp.RentalHousesEmailLeads <> CAST(ROUND(sp.rentalhousesemailleads,0) AS INT)
--        OR mp.iPhoneEmailLeads <> CAST(ROUND(sp.iphoneemailleads,0) AS INT)
--        OR mp.OodleEmailLeads <> CAST(ROUND(sp.oodleemailleads,0) AS INT)
--        OR mp.AndroidEmailLeads <> CAST(ROUND(sp.androidemailleads,0) AS INT)
--        OR mp.HotpadsEmailLeads <> CAST(ROUND(sp.hotpadsemailleads,0) AS INT)
--        OR mp.LuxuryEmailLeads <> CAST(ROUND(sp.luxuryemailleads,0) AS INT)
--        OR mp.CondoEmailLeads <> CAST(ROUND(sp.condoemailleads,0) AS INT)
--        OR mp.iPadEmailLeads <> CAST(ROUND(sp.ipademailleads,0) AS INT)
--        OR mp.TruliaEmailLeads <> CAST(ROUND(sp.truliaemailleads,0) AS INT)
--        OR mp.ZillowEmailLeads <> CAST(ROUND(sp.zillowemailleads,0) AS INT)
--        OR mp.VerticalbrandsEmailLeads <> CAST(ROUND(sp.verticalbrandsemailleads,0) AS INT)
--        OR mp.RDTFeedLeads <> CAST(ROUND(sp.rdtfeedleads,0) AS INT)
--        OR mp.PropSolutionsFeedLeads <> CAST(ROUND(sp.propsolutionsfeedleads,0) AS INT)
--        OR mp.YieldFeedLeads <> CAST(ROUND(sp.yieldfeedleads,0) AS INT)
--        OR mp.AGMobileEmailLeads <> CAST(ROUND(sp.agmobileemailleads,0) AS INT)
--        OR mp.RentalsMobileEmailLeads <> CAST(ROUND(sp.rentalsmobileemailleads,0) AS INT)
--        OR mp.RentalsAndroidEmailLeads <> CAST(ROUND(sp.rentalsandroidemailleads,0) AS INT)
--        OR mp.RentalsiPhoneEmailLeads <> CAST(ROUND(sp.rentalsiphoneemailleads,0) AS INT)
--        OR mp.VastEmailLeads <> CAST(ROUND(sp.vastemailleads,0) AS INT)
--        OR mp.CampusHomesOnlineEmailLeads <> CAST(ROUND(sp.campushomesonlineemailleads,0) AS INT)
--        OR mp.AGTabletEmailLeads <> CAST(ROUND(sp.agtabletemailleads,0) AS INT)
--        OR mp.AGKindleEmailLeads <> CAST(ROUND(sp.agkindleemailleads,0) AS INT)
--        OR mp.Future1EmailLeads <> CAST(ROUND(sp.future1emailleads,0) AS INT)
--        OR mp.Future2EmailLeads <> CAST(ROUND(sp.future2emailleads,0) AS INT)
--        OR mp.Future3EmailLeads <> CAST(ROUND(sp.future3emailleads,0) AS INT)
--        OR mp.Future4EmailLeads <> CAST(ROUND(sp.future4emailleads,0) AS INT)
--        OR mp.Future5EmailLeads <> CAST(ROUND(sp.future5emailleads,0) AS INT)
--        OR mp.Future6EmailLeads <> CAST(ROUND(sp.future6emailleads,0) AS INT)
--        OR mp.Future7EmailLeads <> CAST(ROUND(sp.future7emailleads,0) AS INT)
--        OR mp.Future8EmailLeads <> CAST(ROUND(sp.future8emailleads,0) AS INT)
--        OR mp.Future9EmailLeads <> CAST(ROUND(sp.future9emailleads,0) AS INT)
--        OR mp.Future0EmailLeads <> CAST(ROUND(sp.future0emailleads,0) AS INT)
--        OR mp.PlacementTier <> CAST(ROUND(sp.placementtier,0) AS INT)
--        OR mp.PrintProductPoints <> CAST(ROUND(sp.printproductpoints,0) AS INT)
--        OR mp.InternetProductPoints <> CAST(ROUND(sp.internetproductpoints,0) AS INT)
--        OR mp.LegacyLoyaltyPoints <> CAST(ROUND(sp.legacyloyaltypoints,0) AS INT)
--        OR mp.ContractLoyaltyPoints <> CAST(ROUND(sp.contractloyaltypoints,0) AS INT)
--        OR mp.LastUpdateYMDID <> CAST(ROUND(sp.lastupdateymdid,0) AS INT)
--        OR mp.UpsellListBold <> CAST(ROUND(sp.upselllistbold,0) AS INT)
--        OR mp.UpsellListFrontCover <> CAST(ROUND(sp.upselllistfrontcover,0) AS INT)
--        OR mp.UpsellPropPhotoFeature <> CAST(ROUND(sp.upsellpropphotofeature,0) AS INT)
--        OR mp.UpsellMgmtManagementCoLogo <> CAST(ROUND(sp.upsellmgmtmanagementcologo,0) AS INT)
--        OR mp.UpsellPropPropertyLogo <> CAST(ROUND(sp.upsellproppropertylogo,0) AS INT)
--        OR mp.UpsellPropPremiumPackage <> CAST(ROUND(sp.upsellproppremiumpackage,0) AS INT)
--        OR mp.UpsellListFloorPlanPkg <> CAST(ROUND(sp.upselllistfloorplanpkg,0) AS INT)
--        OR mp.LinkedFloorPlan <> CAST(ROUND(sp.linkedfloorplan,0) AS INT)
--        OR mp.InternetPhoneLeads <> CAST(ROUND(sp.internetphoneleads,0) AS INT)
--        OR mp.InternetPhoneLeads_NoMobile <> CAST(ROUND(sp.internetphoneleads_nomobile,0) AS INT)
--        OR mp.DigitalPhoneLeads <> CAST(ROUND(sp.digitalphoneleads,0) AS INT)
--        OR mp.EmailLeads <> CAST(ROUND(sp.emailleads,0) AS INT)
--        OR mp.InternetEmailLeads_NoMobile <> CAST(ROUND(sp.internetemailleads_nomobile,0) AS INT)
--        OR mp.DigitalEmailLeads <> CAST(ROUND(sp.digitalemailleads,0) AS INT)
--        OR mp.AGCMissedCalls <> CAST(ROUND(sp.agcmissedcalls,0) AS INT)
--        OR mp.ASGMissedCalls <> CAST(ROUND(sp.asgmissedcalls,0) AS INT)
--        OR mp.AGCAllLeads <> CAST(ROUND(sp.agcallleads,0) AS INT)
--        OR mp.ASGAllLeads <> CAST(ROUND(sp.asgallleads,0) AS INT)
--        OR mp.AllMissedCalls <> CAST(ROUND(sp.allmissedcalls,0) AS INT)
--        OR mp.AllConnectedCalls <> CAST(ROUND(sp.allconnectedcalls,0) AS INT)
--        OR mp.AllLeads <> CAST(ROUND(sp.allleads,0) AS INT)
--        OR mp.AllInternetLeads_NoMobile <> CAST(ROUND(sp.allinternetleads_nomobile,0) AS INT)
--        OR mp.AllDigitalLeads <> CAST(ROUND(sp.alldigitalleads,0) AS INT)
--        OR mp.ThirdPartyFeedLeads <> CAST(ROUND(sp.thirdpartyfeedleads,0) AS INT)
--        OR mp.WebsiteCalls <> CAST(ROUND(sp.websitecalls,0) AS INT)
--        OR mp.WebsiteEmails <> CAST(ROUND(sp.websiteemails,0) AS INT)
--        OR mp.WebsiteLeads_Rentals <> CAST(ROUND(sp.websiteleads_rentals,0) AS INT)
--        OR mp.MobileEmails <> CAST(ROUND(sp.mobileemails,0) AS INT)
--        OR mp.MobileCalls <> CAST(ROUND(sp.mobilecalls,0) AS INT)
--        OR mp.MobileLeads_AG <> CAST(ROUND(sp.mobileleads_ag,0) AS INT)
--        OR mp.MobileLeads_Rentals <> CAST(ROUND(sp.mobileleads_rentals,0) AS INT)
--        OR mp.MobileAllLeads <> CAST(ROUND(sp.mobileallleads,0) AS INT)
--        OR mp.MRSyndicationEmailLeads <> CAST(ROUND(sp.mrsyndicationemailleads,0) AS INT)
--        OR mp.MRAGEmailLeads <> CAST(ROUND(sp.mragemailleads,0) AS INT)
--        OR mp.MRAGWebPhoneLeads <> CAST(ROUND(sp.mragwebphoneleads,0) AS INT)
--        OR mp.MRAppsEmailLeads <> CAST(ROUND(sp.mrappsemailleads,0) AS INT)
--        OR mp.MRPhonecalls <> CAST(ROUND(sp.mrphonecalls,0) AS INT)
--        OR mp.RPLRank <> CAST(ROUND(sp.rplrank,0) AS INT)
--        OR mp.PropertyName <> sp.property_nm
--        OR mp.MarketName <> sp.market_nm
--        OR mp.CityName <> sp.city_nm
--        OR mp.State <> sp.state_cd
--        OR mp.SearchRank <> CAST(ROUND(sp.search_rank,0) AS INT)
--        OR mp.PageInSearch <> CAST(ROUND(sp.page_in_search,0) AS INT)
--        OR mp.UpgradeType <> sp.upgrade_tp
--        OR mp.UpgradeMonthlyCost <> CAST(sp.upgrade_monthly_cost AS NUMERIC(10,2))
--        OR mp.UpgradeStartDate <> sp.upgrade_start_date
--        OR mp.UpgradeEndDate <> sp.upgrade_end_date
--        OR mp.NaturalImpressions <> CAST(ROUND(sp.natural_impressions,0) AS INT)
--        OR mp.FeaturedImpressions <> CAST(ROUND(sp.featured_impressions,0) AS INT)
--        OR mp.NaturalViewings <> CAST(ROUND(sp.natural_viewings,0) AS INT)
--        OR mp.FeaturedViewings <> CAST(ROUND(sp.featured_viewings,0) AS INT)
--        OR mp.NaturalHotLeads <> CAST(ROUND(sp.natural_hotleads,0) AS INT)
--        OR mp.FeaturedHotLeads <> CAST(ROUND(sp.featured_hotleads,0) AS INT)
--        OR mp.TotalPhoneCall <> CAST(ROUND(sp.total_phonecall,0) AS INT)
--        OR mp.NaturalPhoneCalls <> CAST(ROUND(sp.NATURAL_PHONECALLS,0) AS FLOAT)
--        OR mp.FeaturedPhoneCalls <> CAST(ROUND(sp.featured_phonecalls,0) AS FLOAT)
--        OR mp.TotalHotlead <> CAST(ROUND(sp.total_hotlead,0) AS INT)
--        OR mp.NaturalNRL <> CAST(ROUND(sp.natural_nrl,0) AS INT)
--        OR mp.FeaturedNRL <> CAST(ROUND(sp.featured_nrl,0) AS INT)
--        OR mp.TotalLeases <> CAST(ROUND(sp.total_leases,0) AS INT)
--        OR mp.MarketNumber <> CAST(ROUND(sp.market_nb,0) AS INT)
--        OR mp.PaidLeases <> CAST(ROUND(sp.paid_leases,0) AS INT)
--        OR mp.AvgCallDuration <> CAST(sp.avg_call_duration AS NUMERIC(10,2))
--        OR mp.CompanyName <> sp.company_nm
--        OR mp.CompanyID <> CAST(ROUND(sp.company_id,0) AS INT)
--        OR mp.SuccessFee <> CAST(ROUND(sp.success_fee,0) AS INT)
--        OR mp.VIPImpressions <> CAST(ROUND(sp.vip_impressions,0) AS INT)
--        OR mp.VIPViewings <> CAST(ROUND(sp.vip_viewings,0) AS INT)
--        OR mp.VIPHotLeads <> CAST(ROUND(sp.vip_hotleads,0) AS INT)
--        OR mp.VIPPhoneCalls <> CAST(ROUND(sp.vip_phonecalls,0) AS INT)
--        OR mp.VIPNRL <> CAST(ROUND(sp.vip_nrl,0) AS INT)
--        OR mp.PTEImpressions <> CAST(ROUND(sp.pte_impressions,0) AS INT)
--        OR mp.PTEViewings <> CAST(ROUND(sp.pte_viewings,0) AS INT)
--        OR mp.PTEHotLeads <> CAST(ROUND(sp.pte_hotleads,0) AS INT)
--        OR mp.PTEPhonecalls <> CAST(ROUND(sp.pte_phonecalls,0) AS INT)
--        OR mp.PTENRL <> CAST(ROUND(sp.pte_nrl,0) AS INT)
--        OR mp.PropertyStatus <> sp.property_status
--        OR mp.Phone <> sp.phone_cd
--        OR mp.PropertyAddress <> sp.property_address
--        OR mp.Fax <> sp.fax_cd
--        OR mp.Email <> sp.email_nm
--        OR mp.HotLeadEmailID <> sp.hotleademail_id
--        OR mp.HotLeadFaxID <> sp.hotleadfax_id
--        OR mp.UniqueHotLeads <> CAST(ROUND(sp.unique_hotleads,0) AS INT)
--        OR mp.UniqueViewings <> CAST(ROUND(sp.unique_viewings,0) AS INT)
--        OR mp.UniquePDPOverviews <> CAST(ROUND(sp.unique_pdp_overviews,0) AS INT)
--        OR mp.BillingAddress <> sp.billing_address
--        OR mp.BillingCity <> sp.billing_city
--        OR mp.BillingState <> sp.billing_state
--        OR mp.BillingZip <> sp.billing_zip
--        OR mp.BillingEmail <> sp.billing_email
--        OR mp.BillingPhone <> sp.billing_phone
--        OR mp.BillingFax <> sp.billing_fax
--        OR mp.LeaseFaxed <> sp.lease_faxed
--        OR mp.LeaseEmailed <> sp.lease_emailed
--        OR mp.SubmarketNumber <> CAST(ROUND(sp.submarket_nb,0) AS INT)
--        OR mp.SubmarketName <> sp.submarket_nm
--        OR mp.AreaName <> sp.area_nm
--        OR mp.ImageIncluded <> sp.image_included
--        OR mp.Specials <> sp.specials
--        OR mp.MainImageAvailable <> sp.main_image_available
--        OR mp.FloorPlanAvailable <> sp.floorplan_available
--        OR mp.LogoAvailable <> sp.logo_available
--        OR mp.LastVirtualUpload <> sp.last_virtual_upload
--        OR mp.Searchable <> sp.searchable
--        OR mp.UniqueHotLeaders <> CAST(ROUND(sp.unique_hotleaders,0) AS INT)
--        OR mp.NaturalSearchers <> CAST(ROUND(sp.natural_searchers,0) AS INT)
--        OR mp.FeaturedSearchers <> CAST(ROUND(sp.featured_searchers,0) AS INT)
--        OR mp.NaturalViewers <> CAST(ROUND(sp.natural_viewers,0) AS INT)
--        OR mp.FeaturedViewers <> CAST(ROUND(sp.featured_viewers,0) AS INT)
--        OR mp.NaturalHotLeaders <> CAST(ROUND(sp.natural_hotleaders,0) AS INT)
--        OR mp.FeaturedHotLeaders <> CAST(ROUND(sp.featured_hotleaders,0) AS INT)
--        OR mp.TotalHotLeaders <> CAST(ROUND(sp.total_hotleaders,0) AS INT)
--        OR mp.TotalPhoneCallers <> CAST(ROUND(sp.total_phonecallers,0) AS INT)
--        OR mp.FeaturedPhoneCallers <> CAST(ROUND(sp.featured_phonecallers,0) AS INT)
--        OR mp.NaturalPhoneCallers <> CAST(ROUND(sp.natural_phonecallers,0) AS INT)
--        OR mp.BusinessModelType <> sp.businessmodel_tp
--        OR mp.ActivateDate <> DATEADD(hour,@TimeZoneOffset,sp.activate_dm)
--        OR mp.ConnectedCalls <> CAST(ROUND(sp.ConnectedCalls,0) AS INT)
--        OR mp.MissedCalls <> CAST(ROUND(sp.MissedCalls,0) AS INT)
--        OR mp.OneWebConnectedCalls <> CAST(ROUND(sp.OneWebConnectedCalls,0) AS INT)
--        OR mp.OneWebMissedCalls <> CAST(ROUND(sp.OneWebMissedCalls,0) AS INT)
--        OR mp.AltRegConnectedCalls <> CAST(ROUND(sp.AltRegConnectedCalls,0) AS INT)
--        OR mp.AltRegMissedCalls <> CAST(ROUND(sp.AltRegMissedCalls,0) AS INT)
--        OR mp.MobileConnectedCalls <> CAST(ROUND(sp.MobileConnectedCalls,0) AS INT)
--        OR mp.MobileMissedCalls <> CAST(ROUND(sp.MobileMissedCalls,0) AS INT)

--        THEN UPDATE
--          SET       mp.RecordCreateDate = DATEADD(hour,@TimeZoneOffset,sp.record_create_dm)
--                   ,PropertyCreateDate = DATEADD(hour,@TimeZoneOffset,sp.property_create_dm)
--                   ,PropertyUpdateDate = DATEADD(hour,@TimeZoneOffset,sp.property_update_dm)
--                   ,PropertyTerminateDate = DATEADD(hour,@TimeZoneOffset,sp.property_terminate_dm)
--                   ,PropertyID = CAST (sp.property_id AS INT)
--                   ,UniversalID = sp.universal_id
--                   ,ExternalID = sp.external_id
--                   ,Type = sp.type_nm
--                   ,TotalUnits = CAST(ROUND(sp.totalunits_nb,0) AS INT)
--                   ,ActiveUnitsAmount = CAST(ROUND(sp.active_units_at,0) AS INT)
--                   ,UpsellListSeniorListing = CAST(ROUND(sp.upselllistseniorlisting,0) AS INT)
--                   ,TotalAmenities = CAST(ROUND(sp.total_amenities,0) AS INT)
--                   ,ActiveAmenities = CAST(ROUND(sp.active_amenities,0) AS INT)
--                   ,TotalPhotos = CAST(ROUND(sp.total_photos,0) AS INT)
--                   ,ActivePhotos = CAST(ROUND(sp.active_photos,0) AS INT)
--                   ,TotalFloorPlans = CAST(ROUND(sp.total_floor_plans,0) AS INT)
--                   ,ActiveFloorPlans = CAST(ROUND(sp.active_floor_plans,0) AS INT)
--                   ,UpsellPropRentalsFeatured = CAST(ROUND(sp.upsellproprentalsfeatured,0) AS INT)
--                   ,UpsellListFloorPlanUpgrade = CAST(ROUND(sp.upselllistfloorplanupgrade,0) AS INT)
--                   ,UpsellListPayPerLead = CAST(ROUND(sp.upselllistpayperlead,0) AS INT)
--                   ,ISRentalPropToBeDeleted = CAST(ROUND(sp.isrentalproptobedeleted,0) AS INT)
--                   ,ListingStatusID = sp.listingstatusid
--                   ,UpsellListHighlighted = CAST(ROUND(sp.upselllisthighlighted,0) AS INT)
--                   ,UpsellListCoupon = CAST(ROUND(sp.upselllistcoupon,0) AS INT)
--                   ,UpsellPropEmerical = CAST(ROUND(sp.upsellpropemerical,0) AS INT)
--                   ,UpsellPropFeatureCommPlatinum = CAST(ROUND(sp.upsellpropfeaturecommplatinum,0) AS INT)
--                   ,UpsellPropFeatureCommGold = CAST(ROUND(sp.upsellpropfeaturecommgold,0) AS INT)
--                   ,UpsellPropFeatureCommSilver = CAST(ROUND(sp.upsellpropfeaturecommsilver,0) AS INT)
--                   ,UpsellPropVirtualBrochure = CAST(ROUND(sp.upsellpropvirtualbrochure,0) AS INT)
--                   ,UpsellListCorporateListing = CAST(ROUND(sp.upselllistcorporatelisting,0) AS INT)
--                   ,UpsellListCollegeListing = CAST(ROUND(sp.upselllistcollegelisting,0) AS INT)
--                   ,UpsellListMilitaryListing = CAST(ROUND(sp.upselllistmilitarylisting,0) AS INT)
--                   ,UpsellListApartmentListing = CAST(ROUND(sp.upselllistapartmentlisting,0) AS INT)
--                   ,UpsellPropPhotoUpgrade = CAST(ROUND(sp.upsellpropphotoupgrade,0) AS INT)
--                   ,UpsellMgmtCoLogoDisplay = CAST(ROUND(sp.upsellmgmtcologodisplay,0) AS INT)
--                   ,UpsellPropLogoDisplay = CAST(ROUND(sp.upsellproplogodisplay,0) AS INT)
--                   ,UpsellPropPremiumUpgrade = CAST(ROUND(sp.upsellproppremiumupgrade,0) AS INT)
--                   ,UpsellPropVideoSpokesModel = CAST(ROUND(sp.upsellpropvideospokesmodel,0) AS INT)
--                   ,UpsellPropFrontPage = CAST(ROUND(sp.upsellpropfrontpage,0) AS INT)
--                   ,UpsellPropSpanish = CAST(ROUND(sp.upsellpropspanish,0) AS INT)
--                   ,UpsellPropCallRecording = CAST(ROUND(sp.upsellpropcallrecording,0) AS INT)
--                   ,UpsellPropFromToPhone = CAST(ROUND(sp.upsellpropfromtophone,0) AS INT)
--                   ,UpsellPropRentalsPremier = CAST(ROUND(sp.upsellproprentalspremier,0) AS INT)
--                   ,UpsellPropRentalsListing = CAST(ROUND(sp.upsellproprentalslisting,0) AS INT)
--                   ,UpsellListRentalsSpotlighted = CAST(ROUND(sp.upselllistrentalsspotlighted,0) AS INT)
--                   ,UpsellListSpotlight = CAST(ROUND(sp.upselllistspotlight,0) AS INT)
--                   ,UpsellListPayPerLease = CAST(ROUND(sp.upselllistpayperlease,0) AS INT)
--                   ,UpsellListDiamondCity = CAST(ROUND(sp.upselllistdiamondcity,0) AS INT)
--                   ,UpsellListDiamondMax = CAST(ROUND(sp.upselllistdiamondmax,0) AS INT)
--                   ,UpsellListRentalsStandard = CAST(ROUND(sp.upselllistrentalsstandard,0) AS INT)
--                   ,UpsellListCommunityCarousel = CAST(ROUND(sp.upselllistcommunitycarousel,0) AS INT)
--                   ,UpsellList30SecondVideo = CAST(ROUND(sp.upselllist30secondvideo,0) AS INT)
--                   ,UpsellList60SecondVideo = CAST(ROUND(sp.upselllist60secondvideo,0) AS INT)
--                   ,UpsellListRentalsCarousel = CAST(ROUND(sp.upselllistrentalscarousel,0) AS INT)
--                   ,UpsellListRentalsStandardPlus = CAST(ROUND(sp.upselllistrentalsstandardplus,0) AS INT)
--                   ,UpsellListMobileSpotlight = CAST(ROUND(sp.upselllistmobilespotlight,0) AS INT)
--                   ,UpsellPropMobileDeal = CAST(ROUND(sp.upsellpropmobiledeal,0) AS INT)
--                   ,UpsellPropDynamicLeadForm = CAST(ROUND(sp.upsellpropdynamicleadform,0) AS INT)
--                   ,UpsellListIncomeRestricted = CAST(ROUND(sp.upselllistincomerestricted,0) AS INT)
--                   ,UpsellListPetFriendly = CAST(ROUND(sp.upselllistpetfriendly,0) AS INT)
--                   ,UpsellListLuxuryCommunity = CAST(ROUND(sp.upselllistluxurycommunity,0) AS INT)
--                   ,UpsellPropRepmon = CAST(ROUND(sp.upsellproprepmon,0) AS INT)
--                   ,UpsellPropSocialMediaMan = CAST(ROUND(sp.upsellpropsocialmediaman,0) AS INT)
--                   ,FutureUpsell03 = CAST(ROUND(sp.futureupsell03,0) AS INT)
--                   ,FutureUpsell04 = CAST(ROUND(sp.futureupsell04,0) AS INT)
--                   ,FutureUpsell05 = CAST(ROUND(sp.futureupsell05,0) AS INT)
--                   ,FutureUpsell06 = CAST(ROUND(sp.futureupsell06,0) AS INT)
--                   ,FutureUpsell07 = CAST(ROUND(sp.futureupsell07,0) AS INT)
--                   ,FutureUpsell08 = CAST(ROUND(sp.futureupsell08,0) AS INT)
--                   ,LowPrice = CAST(sp.lowprice AS NUMERIC(15,2))
--                   ,Highprice = CAST(sp.highprice AS NUMERIC(15,2))
--                   ,ISSem = CAST(ROUND(sp.issem,0) AS INT)
--                   ,ISOverThreshold = CAST(ROUND(sp.isoverthreshold,0) AS INT)
--                   ,CallTrackingInBook = CAST(ROUND(sp.calltrackinginbook,0) AS INT)
--                   ,CouponActiveOnSite = CAST(ROUND(sp.couponactiveonsite,0) AS INT)
--                   ,VerizonFios = CAST(ROUND(sp.verizonfios,0) AS INT)
--                   ,ATTUverse = CAST(ROUND(sp.attuverse,0) AS INT)
--                   ,DirectTV = CAST(ROUND(sp.directtv,0) AS INT)
--                   ,BrightHouse = CAST(ROUND(sp.brighthouse,0) AS INT)
--                   ,Charter = CAST(ROUND(sp.charter,0) AS INT)
--                   ,Xfinitysp = CAST(ROUND(sp.xfinitysp,0) AS INT)
--                   ,Xfinitydp = CAST(ROUND(sp.xfinitydp,0) AS INT)
--                   ,Xfinitytp = CAST(ROUND(sp.xfinitytp,0) AS INT)
--                   ,TimeWarner = CAST(ROUND(sp.timewarner,0) AS INT)
--                   ,NumericRank = CAST(ROUND(sp.numericrank,0) AS INT)
--                   ,UniqueVisits_FL = CAST(ROUND(sp.uniquevisits_fl,0) AS INT)
--                   ,UniqueVisits_PTE = CAST(ROUND(sp.uniquevisits_pte,0) AS INT)
--                   ,UniqueVisits_None = CAST(ROUND(sp.uniquevisits_none,0) AS INT)
--                   ,UniqueVisits_Mobile = CAST(ROUND(sp.uniquevisits_mobile,0) AS INT)
--                   ,UniqueVisits_VIP = CAST(ROUND(sp.uniquevisits_VIP,0) AS INT)
--                   ,UniqueVisits_ForFutureUse2 = CAST(ROUND(sp.uniquevisits_forfutureuse2,0) AS INT)
--                   ,UniqueVisits_ForFutureUse3 = CAST(ROUND(sp.uniquevisits_forfutureuse3,0) AS INT)
--                   ,UniqueVisits_ForFutureUse4 = CAST(ROUND(sp.uniquevisits_forfutureuse4,0) AS INT)
--                   ,UniqueVisits_ForFutureUse5 = CAST(ROUND(sp.uniquevisits_forfutureuse5,0) AS INT)
--                   ,ViewsListingPage = CAST(ROUND(sp.viewslistingpage,0) AS INT)
--                   ,ViewsListingPage_Mobile = CAST(ROUND(sp.viewslistingpage_mobile,0) AS INT)
--                   ,ViewsListingPage_ForFutureUse1 = CAST(ROUND(sp.viewslistingpage_forfutureuse1,0) AS INT)
--                   ,ViewsListingPage_ForFutureUse2 = CAST(ROUND(sp.viewslistingpage_forfutureuse2,0) AS INT)
--                   ,ViewsListingPage_ForFutureUse3 = CAST(ROUND(sp.viewslistingpage_forfutureuse3,0) AS INT)
--                   ,ViewsListingPage_ForFutureUse4 = CAST(ROUND(sp.viewslistingpage_forfutureuse4,0) AS INT)
--                   ,ViewsListingPage_ForFutureUse5 = CAST(ROUND(sp.viewslistingpage_forfutureuse5,0) AS INT)
--                   ,ViewsEmercial = CAST(ROUND(sp.viewsemercial,0) AS INT)
--                   ,ViewsVirtualBrochure = CAST(ROUND(sp.viewsvirtualbrochure,0) AS INT)
--                   ,ClicksSpotlightListing = CAST(ROUND(sp.clicksspotlightlisting,0) AS INT)
--                   ,ClicksSpotlightCommunityVideo = CAST(ROUND(sp.clicksspotlightcommunityvideo,0) AS INT)
--                   ,ClicksListingWebLink = CAST(ROUND(sp.clickslistingweblink,0) AS INT)
--                   ,ClicksMgtcoWebLink = CAST(ROUND(sp.clicksmgtcoweblink,0) AS INT)
--                   ,ClicksOnlineAppt = CAST(ROUND(sp.clicksonlineappt,0) AS INT)
--                   ,ClicksOnlineApptSubmit = CAST(ROUND(sp.clicksonlineapptsubmit,0) AS INT)
--                   ,ClicksOnlineAppl = CAST(ROUND(sp.clicksonlineappl,0) AS INT)
--                   ,ClicksOnlineApplSubmit = CAST(ROUND(sp.clicksonlineapplsubmit,0) AS INT)
--                   ,ClicksOnlineApptCR = CAST(ROUND(sp.clicksonlineapptcr,0) AS INT)
--                   ,ClicksOnlineApplCR = CAST(ROUND(sp.clicksonlineapplcr,0) AS INT)
--                   ,ClicksSpotlightLeadSubmission = CAST(ROUND(sp.clicksspotlightleadsubmission,0) AS INT)
--                   ,ClicksWeCanCallYou = CAST(ROUND(sp.clickswecancallyou,0) AS INT)
--                   ,ClicksLeadSubmission = CAST(ROUND(sp.clicksleadsubmission,0) AS INT)
--                   ,ClicksPhoneSubmission = CAST(ROUND(sp.clicksphonesubmission,0) AS INT)
--                   ,ClicksCommunityVideo = CAST(ROUND(sp.clickscommunityvideo,0) AS INT)
--                   ,ClicksListingMap = CAST(ROUND(sp.clickslistingmap,0) AS INT)
--                   ,ClicksMapDirections = CAST(ROUND(sp.clicksmapdirections,0) AS INT)
--                   ,ClicksPrintableGuide = CAST(ROUND(sp.clicksprintableguide,0) AS INT)
--                   ,ClicksPhotos = CAST(ROUND(sp.clicksphotos,0) AS INT)
--                   ,ClicksSpotlightPhotos = CAST(ROUND(sp.clicksspotlightphotos,0) AS INT)
--                   ,ClicksSpotlightPhotoPopup = CAST(ROUND(sp.clicksspotlightphotopopup,0) AS INT)
--                   ,ClicksFloorPlan = CAST(ROUND(sp.clicksfloorplan,0) AS INT)
--                   ,ClicksCheckYourCredit = CAST(ROUND(sp.clickscheckyourcredit,0) AS INT)
--                   ,ClicksWebBuilderLink = CAST(ROUND(sp.clickswebbuilderlink,0) AS INT)
--                   ,ClicksFeaturedMgtCo = CAST(ROUND(sp.clicksfeaturedmgtco,0) AS INT)
--                   ,ClicksFrontPagePropLead = CAST(ROUND(sp.clicksfrontpageproplead,0) AS INT)
--                   ,ClicksLuxurySlideShow = CAST(ROUND(sp.clicksluxuryslideshow,0) AS INT)
--                   ,ImprSearchResults = CAST(ROUND(sp.imprsearchresults,0) AS INT)
--                   ,TotalImpressions = CAST(ROUND(sp.total_impressions,0) AS INT)
--                   ,ImpreFrontCover = CAST(ROUND(sp.imprefrontcover,0) AS INT)
--                   ,ImprVisitCount = CAST(ROUND(sp.imprvisitcount,0) AS INT)
--                   ,ViewingFromEmail = CAST(ROUND(sp.viewing_from_email,0) AS INT)
--                   ,TotalViewings = CAST(ROUND(sp.total_viewings,0) AS INT)
--                   ,TextMsgWeb = CAST(ROUND(sp.textmsgweb,0) AS INT)
--                   ,TextMsgMobile = CAST(ROUND(sp.textmsgmobile,0) AS INT)
--                   ,CheckListingAvail = CAST(ROUND(sp.checklistingavail,0) AS INT)
--                   ,ChecksSpotLightListingAvail = CAST(ROUND(sp.checksspotlightlistingavail,0) AS INT)
--                   ,ChecksVirtualtourListingAvail = CAST(ROUND(sp.checksvirtualtourlistingavail,0) AS INT)
--                   ,AgcPrintConnectedCalls = CAST(ROUND(sp.agcprintconnectedcalls,0) AS INT)
--                   ,AgcPrintMissedCalls = CAST(ROUND(sp.agcprintmissedcalls,0) AS INT)
--                   ,AsgPrintConnectedCalls = CAST(ROUND(sp.asgprintconnectedcalls,0) AS INT)
--                   ,AsgPrintMissedCalls = CAST(ROUND(sp.asgprintmissedcalls,0) AS INT)
--                   ,WebConnectedCalls = CAST(ROUND(sp.webconnectedcalls,0) AS INT)
--                   ,WebMissedCalls = CAST(ROUND(sp.webmissedcalls,0) AS INT)
--                   ,RentalsConnectedCalls = CAST(ROUND(sp.rentalsconnectedcalls,0) AS INT)
--                   ,RentalsMissedCalls = CAST(ROUND(sp.rentalsmissedcalls,0) AS INT)
--                   ,CTCConnectedCalls = CAST(ROUND(sp.ctconnectedcalls,0) AS INT)
--                   ,CTCMissedCalls = CAST(ROUND(sp.ctcmissedcalls,0) AS INT)
--                   ,PaidSPConnectedCalls = CAST(ROUND(sp.paidspconnectedcalls,0) AS INT)
--                   ,PaidSPMissedCalls = CAST(ROUND(sp.paidspmissedcalls,0) AS INT)
--                   ,CombinedFeedsConnectedCalls = CAST(ROUND(sp.combinedfeedsconnectedcalls,0) AS INT)
--                   ,CombinedFeedsMissedCalls = CAST(ROUND(sp.combinedfeedsmissedcalls,0) AS INT)
--                   ,GoogleConnectedCalls = CAST(ROUND(sp.googleconnectedcalls,0) AS INT)
--                   ,GoogleMissedCalls = CAST(ROUND(sp.googlemissedcalls,0) AS INT)
--                   ,PPCConnectedCalls = CAST(ROUND(sp.ppcconnectedcalls,0) AS INT)
--                   ,PPCMissedCalls = CAST(ROUND(sp.ppcmissedcalls,0) AS INT)
--                   ,LuxuryConnectedCalls = CAST(ROUND(sp.luxuryconnectedcalls,0) AS INT)
--                   ,LuxuryMissedCalls = CAST(ROUND(sp.luxurymissedcalls,0) AS INT)
--                   ,MarchexConnectedCalls = CAST(ROUND(sp.marchexconnectedcalls,0) AS INT)
--                   ,MarchexMissedCalls = CAST(ROUND(sp.marchexmissedcalls,0) AS INT)
--                   ,CraigsListConnectedCalls = CAST(ROUND(sp.craigslistconnectedcalls,0) AS INT)
--                   ,CraigsListMissedCalls = CAST(ROUND(sp.craigslistmissedcalls,0) AS INT)
--                   ,WebLocalTrackingNumberConnectedCalls = CAST(ROUND(sp.weblocaltracknumconnectcalls,0) AS INT)
--                   ,WebLocalTrackingNumberMissedCalls = CAST(ROUND(sp.weblocaltracknummissedcalls,0) AS INT)
--                   ,RentalsLocalConnectedCalls = CAST(ROUND(sp.rentalslocalconnectedcalls,0) AS INT)
--                   ,RentalsLocalMissedCalls = CAST(ROUND(sp.rentalslocalmissedcalls,0) AS INT)
--                   ,VideoConnectedCalls = CAST(ROUND(sp.videoconnectedcalls,0) AS INT)
--                   ,VideoMissedCalls = CAST(ROUND(sp.videomissedcalls,0) AS INT)
--                   ,SEMConnectedCalls = CAST(ROUND(sp.semconnectedcalls,0) AS INT)
--                   ,SEMMissedCalls = CAST(ROUND(sp.semmissedcalls,0) AS INT)
--                   ,TruliaConnectedCalls = CAST(ROUND(sp.truliaconnectedcalls,0) AS INT)
--                   ,TruliaMissedCalls = CAST(ROUND(sp.truliamissedcalls,0) AS INT)
--                   ,FutureConnectedCalls01 = CAST(ROUND(sp.futureconnectedcalls01,0) AS INT)
--                   ,FutureMissedCalls01 = CAST(ROUND(sp.futuremissedcalls01,0) AS INT)
--                   ,FutureConnectedCalls02 = CAST(ROUND(sp.futureconnectedcalls02,0) AS INT)
--                   ,FutureMissedCalls02 = CAST(ROUND(sp.futuremissedcalls02,0) AS INT)
--                   ,FutureConnectedCalls03 = CAST(ROUND(sp.futureconnectedcalls03,0) AS INT)
--                   ,FutureMissedCalls03 = CAST(ROUND(sp.futuremissedcalls03,0) AS INT)
--                   ,FutureConnectedCalls04 = CAST(ROUND(sp.futureconnectedcalls04,0) AS INT)
--                   ,FutureMissedCalls04 = CAST(ROUND(sp.futuremissedcalls04,0) AS INT)
--                   ,FutureConnectedCalls05 = CAST(ROUND(sp.futureconnectedcalls05,0) AS INT)
--                   ,FutureMissedCalls05 = CAST(ROUND(sp.futuremissedcalls05,0) AS INT)
--                   ,FutureConnectedCalls06 = CAST(ROUND(sp.futureconnectedcalls06,0) AS INT)
--                   ,FutureMissedCalls06 = CAST(ROUND(sp.futuremissedcalls06,0) AS INT)
--                   ,FutureConnectedCalls07 = CAST(ROUND(sp.futureconnectedcalls07,0) AS INT)
--                   ,FutureMissedCalls07 = CAST(ROUND(sp.futuremissedcalls07,0) AS INT)
--                   ,FutureConnectedCalls08 = CAST(ROUND(sp.futureconnectedcalls08,0) AS INT)
--                   ,FutureMissedCalls08 = CAST(ROUND(sp.futuremissedcalls08,0) AS INT)
--                   ,FutureConnectedCalls09 = CAST(ROUND(sp.futureconnectedcalls09,0) AS INT)
--                   ,FutureMissedCalls09 = CAST(ROUND(sp.futuremissedcalls09,0) AS INT)
--                   ,FutureConnectedCalls10 = CAST(ROUND(sp.futureconnectedcalls10,0) AS INT)
--                   ,FutureMissedCalls10 = CAST(ROUND(sp.futuremissedcalls10,0) AS INT)
--                   ,AGEmailLeads = CAST(ROUND(sp.agemailleads,0) AS INT)
--                   ,MetroEmailLeads = CAST(ROUND(sp.maetroemailleads,0) AS INT)
--                   ,NeighborhoodEmailLeads = CAST(ROUND(sp.neighborhoodemailleads,0) AS INT)
--                   ,AIMCOEmailLeads = CAST(ROUND(sp.aimcoemailleads,0) AS INT)
--                   ,RentalsEmailLeads = CAST(ROUND(sp.rentalsemailleads,0) AS INT)
--                   ,RentarEmailLeads = CAST(ROUND(sp.rentaremailleads,0) AS INT)
--                   ,RentalHousesEmailLeads = CAST(ROUND(sp.rentalhousesemailleads,0) AS INT)
--                   ,iPhoneEmailLeads = CAST(ROUND(sp.iphoneemailleads,0) AS INT)
--                   ,OodleEmailLeads = CAST(ROUND(sp.oodleemailleads,0) AS INT)
--                   ,AndroidEmailLeads = CAST(ROUND(sp.androidemailleads,0) AS INT)
--                   ,HotpadsEmailLeads = CAST(ROUND(sp.hotpadsemailleads,0) AS INT)
--                   ,LuxuryEmailLeads = CAST(ROUND(sp.luxuryemailleads,0) AS INT)
--                   ,CondoEmailLeads = CAST(ROUND(sp.condoemailleads,0) AS INT)
--                   ,iPadEmailLeads = CAST(ROUND(sp.ipademailleads,0) AS INT)
--                   ,TruliaEmailLeads = CAST(ROUND(sp.truliaemailleads,0) AS INT)
--                   ,ZillowEmailLeads = CAST(ROUND(sp.zillowemailleads,0) AS INT)
--                   ,VerticalbrandsEmailLeads = CAST(ROUND(sp.verticalbrandsemailleads,0) AS INT)
--                   ,RDTFeedLeads = CAST(ROUND(sp.rdtfeedleads,0) AS INT)
--                   ,PropSolutionsFeedLeads = CAST(ROUND(sp.propsolutionsfeedleads,0) AS INT)
--                   ,YieldFeedLeads = CAST(ROUND(sp.yieldfeedleads,0) AS INT)
--                   ,AGMobileEmailLeads = CAST(ROUND(sp.agmobileemailleads,0) AS INT)
--                   ,RentalsMobileEmailLeads = CAST(ROUND(sp.rentalsmobileemailleads,0) AS INT)
--                   ,RentalsAndroidEmailLeads = CAST(ROUND(sp.rentalsandroidemailleads,0) AS INT)
--                   ,RentalsiPhoneEmailLeads = CAST(ROUND(sp.rentalsiphoneemailleads,0) AS INT)
--                   ,VastEmailLeads = CAST(ROUND(sp.vastemailleads,0) AS INT)
--                   ,CampusHomesOnlineEmailLeads = CAST(ROUND(sp.campushomesonlineemailleads,0) AS INT)
--                   ,AGTabletEmailLeads = CAST(ROUND(sp.agtabletemailleads,0) AS INT)
--                   ,AGKindleEmailLeads = CAST(ROUND(sp.agkindleemailleads,0) AS INT)
--                   ,Future1EmailLeads = CAST(ROUND(sp.future1emailleads,0) AS INT)
--                   ,Future2EmailLeads = CAST(ROUND(sp.future2emailleads,0) AS INT)
--                   ,Future3EmailLeads = CAST(ROUND(sp.future3emailleads,0) AS INT)
--                   ,Future4EmailLeads = CAST(ROUND(sp.future4emailleads,0) AS INT)
--                   ,Future5EmailLeads = CAST(ROUND(sp.future5emailleads,0) AS INT)
--                   ,Future6EmailLeads = CAST(ROUND(sp.future6emailleads,0) AS INT)
--                   ,Future7EmailLeads = CAST(ROUND(sp.future7emailleads,0) AS INT)
--                   ,Future8EmailLeads = CAST(ROUND(sp.future8emailleads,0) AS INT)
--                   ,Future9EmailLeads = CAST(ROUND(sp.future9emailleads,0) AS INT)
--                   ,Future0EmailLeads = CAST(ROUND(sp.future0emailleads,0) AS INT)
--                   ,PlacementTier = CAST(ROUND(sp.placementtier,0) AS INT)
--                   ,PrintProductPoints = CAST(ROUND(sp.printproductpoints,0) AS INT)
--                   ,InternetProductPoints = CAST(ROUND(sp.internetproductpoints,0) AS INT)
--                   ,LegacyLoyaltyPoints = CAST(ROUND(sp.legacyloyaltypoints,0) AS INT)
--                   ,ContractLoyaltyPoints = CAST(ROUND(sp.contractloyaltypoints,0) AS INT)
--                   ,LastUpdateYMDID = CAST(ROUND(sp.lastupdateymdid,0) AS INT)
--                   ,UpsellListBold = CAST(ROUND(sp.upselllistbold,0) AS INT)
--                   ,UpsellListFrontCover = CAST(ROUND(sp.upselllistfrontcover,0) AS INT)
--                   ,UpsellPropPhotoFeature = CAST(ROUND(sp.upsellpropphotofeature,0) AS INT)
--                   ,UpsellMgmtManagementCoLogo = CAST(ROUND(sp.upsellmgmtmanagementcologo,0) AS INT)
--                   ,UpsellPropPropertyLogo = CAST(ROUND(sp.upsellproppropertylogo,0) AS INT)
--                   ,UpsellPropPremiumPackage = CAST(ROUND(sp.upsellproppremiumpackage,0) AS INT)
--                   ,UpsellListFloorPlanPkg = CAST(ROUND(sp.upselllistfloorplanpkg,0) AS INT)
--                   ,LinkedFloorPlan = CAST(ROUND(sp.linkedfloorplan,0) AS INT)
--                   ,InternetPhoneLeads = CAST(ROUND(sp.internetphoneleads,0) AS INT)
--                   ,InternetPhoneLeads_NoMobile = CAST(ROUND(sp.internetphoneleads_nomobile,0) AS INT)
--                   ,DigitalPhoneLeads = CAST(ROUND(sp.digitalphoneleads,0) AS INT)
--                   ,EmailLeads = CAST(ROUND(sp.emailleads,0) AS INT)
--                   ,InternetEmailLeads_NoMobile = CAST(ROUND(sp.internetemailleads_nomobile,0) AS INT)
--                   ,DigitalEmailLeads = CAST(ROUND(sp.digitalemailleads,0) AS INT)
--                   ,AGCMissedCalls = CAST(ROUND(sp.agcmissedcalls,0) AS INT)
--                   ,ASGMissedCalls = CAST(ROUND(sp.asgmissedcalls,0) AS INT)
--                   ,AGCAllLeads = CAST(ROUND(sp.agcallleads,0) AS INT)
--                   ,ASGAllLeads = CAST(ROUND(sp.asgallleads,0) AS INT)
--                   ,AllMissedCalls = CAST(ROUND(sp.allmissedcalls,0) AS INT)
--                   ,AllConnectedCalls = CAST(ROUND(sp.allconnectedcalls,0) AS INT)
--                   ,AllLeads = CAST(ROUND(sp.allleads,0) AS INT)
--                   ,AllInternetLeads_NoMobile = CAST(ROUND(sp.allinternetleads_nomobile,0) AS INT)
--                   ,AllDigitalLeads = CAST(ROUND(sp.alldigitalleads,0) AS INT)
--                   ,ThirdPartyFeedLeads = CAST(ROUND(sp.thirdpartyfeedleads,0) AS INT)
--                   ,WebsiteCalls = CAST(ROUND(sp.websitecalls,0) AS INT)
--                   ,WebsiteEmails = CAST(ROUND(sp.websiteemails,0) AS INT)
--                   ,WebsiteLeads_Rentals = CAST(ROUND(sp.websiteleads_rentals,0) AS INT)
--                   ,MobileEmails = CAST(ROUND(sp.mobileemails,0) AS INT)
--                   ,MobileCalls = CAST(ROUND(sp.mobilecalls,0) AS INT)
--                   ,MobileLeads_AG = CAST(ROUND(sp.mobileleads_ag,0) AS INT)
--                   ,MobileLeads_Rentals = CAST(ROUND(sp.mobileleads_rentals,0) AS INT)
--                   ,MobileAllLeads = CAST(ROUND(sp.mobileallleads,0) AS INT)
--                   ,MRSyndicationEmailLeads = CAST(ROUND(sp.mrsyndicationemailleads,0) AS INT)
--                   ,MRAGEmailLeads = CAST(ROUND(sp.mragemailleads,0) AS INT)
--                   ,MRAGWebPhoneLeads = CAST(ROUND(sp.mragwebphoneleads,0) AS INT)
--                   ,MRAppsEmailLeads = CAST(ROUND(sp.mrappsemailleads,0) AS INT)
--                   ,MRPhonecalls = CAST(ROUND(sp.mrphonecalls,0) AS INT)
--                   ,RPLRank = CAST(ROUND(sp.rplrank,0) AS INT)
--                   ,PropertyName = sp.property_nm
--                   ,MarketName = sp.market_nm
--                   ,CityName = sp.city_nm
--                   ,State = sp.state_cd
--                   ,SearchRank = CAST(ROUND(sp.search_rank,0) AS INT)
--                   ,PageInSearch = CAST(ROUND(sp.page_in_search,0) AS INT)
--                   ,UpgradeType = sp.upgrade_tp
--                   ,UpgradeMonthlyCost = CAST(sp.upgrade_monthly_cost AS NUMERIC(10,2))
--                   ,UpgradeStartDate = sp.upgrade_start_date
--                   ,UpgradeEndDate = sp.upgrade_end_date
--                   ,NaturalImpressions = CAST(ROUND(sp.natural_impressions,0) AS INT)
--                   ,FeaturedImpressions = CAST(ROUND(sp.featured_impressions,0) AS INT)
--                   ,NaturalViewings = CAST(ROUND(sp.natural_viewings,0) AS INT)
--                   ,FeaturedViewings = CAST(ROUND(sp.featured_viewings,0) AS INT)
--                   ,NaturalHotLeads = CAST(ROUND(sp.natural_hotleads,0) AS INT)
--                   ,FeaturedHotLeads = CAST(ROUND(sp.featured_hotleads,0) AS INT)
--                   ,TotalPhoneCall = CAST(ROUND(sp.total_phonecall,0) AS INT)
--                   ,NaturalPhoneCalls = CAST(ROUND(sp.NATURAL_PHONECALLS,0) AS INT)
--                   ,FeaturedPhoneCalls = CAST(ROUND(sp.featured_phonecalls,0) AS INT)
--                   ,TotalHotlead = CAST(ROUND(sp.total_hotlead,0) AS INT)
--                   ,NaturalNRL = CAST(ROUND(sp.natural_nrl,0) AS INT)
--                   ,FeaturedNRL = CAST(ROUND(sp.featured_nrl,0) AS INT)
--                   ,TotalLeases = CAST(ROUND(sp.total_leases,0) AS INT)
--                   ,MarketNumber = CAST(ROUND(sp.market_nb,0) AS INT)
--                   ,PaidLeases = CAST(ROUND(sp.paid_leases,0) AS INT)
--                   ,AvgCallDuration = sp.avg_call_duration
--                   ,CompanyName = sp.company_nm
--                   ,CompanyID = CAST(ROUND(sp.company_id,0) AS INT)
--                   ,SuccessFee = CAST(sp.success_fee AS NUMERIC(10,2))
--                   ,VIPImpressions = CAST(ROUND(sp.vip_impressions,0) AS INT)
--                   ,VIPViewings = CAST(ROUND(sp.vip_viewings,0) AS INT)
--                   ,VIPHotLeads = CAST(ROUND(sp.vip_hotleads,0) AS INT)
--                   ,VIPPhoneCalls = CAST(ROUND(sp.vip_phonecalls,0) AS INT)
--                   ,VIPNRL = CAST(ROUND(sp.vip_nrl,0) AS INT)
--                   ,PTEImpressions = CAST(ROUND(sp.pte_impressions,0) AS INT)
--                   ,PTEViewings = CAST(ROUND(sp.pte_viewings,0) AS INT)
--                   ,PTEHotLeads = CAST(ROUND(sp.pte_hotleads,0) AS INT)
--                   ,PTEPhonecalls = CAST(ROUND(sp.pte_phonecalls,0) AS INT)
--                   ,PTENRL = CAST(ROUND(sp.pte_nrl,0) AS INT)
--                   ,PropertyStatus = sp.property_status
--                   ,Phone = sp.phone_cd
--                   ,PropertyAddress = sp.property_address
--                   ,Fax = sp.fax_cd
--                   ,Email = sp.email_nm
--                   ,HotLeadEmailID = sp.hotleademail_id
--                   ,HotLeadFaxID = sp.hotleadfax_id
--                   ,UniqueHotLeads = CAST(ROUND(sp.unique_hotleads,0) AS INT)
--                   ,UniqueViewings = CAST(ROUND(sp.unique_viewings,0) AS INT)
--                   ,UniquePDPOverviews = CAST(ROUND(sp.unique_pdp_overviews,0) AS INT)
--                   ,BillingAddress = sp.billing_address
--                   ,BillingCity = sp.billing_city
--                   ,BillingState = sp.billing_state
--                   ,BillingZip = sp.billing_zip
--                   ,BillingEmail = sp.billing_email
--                   ,BillingPhone = sp.billing_phone
--                   ,BillingFax = sp.billing_fax
--                   ,LeaseFaxed = sp.lease_faxed
--                   ,LeaseEmailed = sp.lease_emailed
--                   ,SubmarketNumber = CAST(ROUND(sp.submarket_nb,0) AS INT)
--                   ,SubmarketName = sp.submarket_nm
--                   ,AreaName = sp.area_nm
--                   ,ImageIncluded = sp.image_included
--                   ,Specials = sp.specials
--                   ,MainImageAvailable = sp.main_image_available
--                   ,FloorPlanAvailable = sp.floorplan_available
--                   ,LogoAvailable = sp.logo_available
--                   ,LastVirtualUpload = sp.last_virtual_upload
--                   ,Searchable = sp.searchable
--                   ,UniqueHotLeaders = CAST(ROUND(sp.unique_hotleaders,0) AS INT)
--                   ,NaturalSearchers = CAST(ROUND(sp.natural_searchers,0) AS INT)
--                   ,FeaturedSearchers = CAST(ROUND(sp.featured_searchers,0) AS INT)
--                   ,NaturalViewers = CAST(ROUND(sp.natural_viewers,0) AS INT)
--                   ,FeaturedViewers = CAST(ROUND(sp.featured_viewers,0) AS INT)
--                   ,NaturalHotLeaders = CAST(ROUND(sp.natural_hotleaders,0) AS INT)
--                   ,FeaturedHotLeaders = CAST(ROUND(sp.featured_hotleaders,0) AS INT)
--                   ,TotalHotLeaders = CAST(ROUND(sp.total_hotleaders,0) AS INT)
--                   ,TotalPhoneCallers = CAST(ROUND(sp.total_phonecallers,0) AS INT)
--                   ,FeaturedPhoneCallers = CAST(ROUND(sp.featured_phonecallers,0) AS INT)
--                   ,NaturalPhoneCallers = CAST(ROUND(sp.natural_phonecallers,0) AS INT)
--                   ,BusinessModelType = sp.businessmodel_tp
--                   ,ActivateDate = DATEADD(hour,@TimeZoneOffset,sp.activate_dm)
--                   ,ConnectedCalls = CAST(sp.ConnectedCalls AS FLOAT)
--                   ,MissedCalls = CAST(ROUND(sp.MissedCalls,0) AS INT)
--                   ,OneWebConnectedCalls = CAST(ROUND(sp.OneWebConnectedCalls,0) AS INT)
--                   ,OneWebMissedCalls = CAST(ROUND(sp.OneWebMissedCalls,0) AS INT)
--                   ,AltRegConnectedCalls = CAST(ROUND(sp.AltRegConnectedCalls,0) AS INT)
--                   ,AltRegMissedCalls = CAST(ROUND(sp.AltRegMissedCalls,0) AS INT)
--                   ,MobileConnectedCalls = CAST(ROUND(sp.MobileConnectedCalls,0) AS INT)
--                   ,MobileMissedCalls = CAST(ROUND(sp.MobileMissedCalls,0) AS INT)

--    WHEN NOT MATCHED 
--        THEN
        
--        INSERT (
--                YMDID
--               ,RecordCreateDate
--               ,PropertyCreateDate
--               ,PropertyUpdateDate
--               ,PropertyTerminateDate
--               ,PropertyID
--               ,UniversalID
--               ,ExternalID
--               ,Type
--               ,TotalUnits
--               ,ActiveUnitsAmount
--               ,UpsellListSeniorListing
--               ,TotalAmenities
--               ,ActiveAmenities
--               ,TotalPhotos
--               ,ActivePhotos
--               ,TotalFloorPlans
--               ,ActiveFloorPlans
--               ,UpsellPropRentalsFeatured
--               ,UpsellListFloorPlanUpgrade
--               ,UpsellListPayPerLead
--               ,ISRentalPropToBeDeleted
--               ,ListingStatusID
--               ,UpsellListHighlighted
--               ,UpsellListCoupon
--               ,UpsellPropEmerical
--               ,UpsellPropFeatureCommPlatinum
--               ,UpsellPropFeatureCommGold
--               ,UpsellPropFeatureCommSilver
--               ,UpsellPropVirtualBrochure
--               ,UpsellListCorporateListing
--               ,UpsellListCollegeListing
--               ,UpsellListMilitaryListing
--               ,UpsellListApartmentListing
--               ,UpsellPropPhotoUpgrade
--               ,UpsellMgmtCoLogoDisplay
--               ,UpsellPropLogoDisplay
--               ,UpsellPropPremiumUpgrade
--               ,UpsellPropVideoSpokesModel
--               ,UpsellPropFrontPage
--               ,UpsellPropSpanish
--               ,UpsellPropCallRecording
--               ,UpsellPropFromToPhone
--               ,UpsellPropRentalsPremier
--               ,UpsellPropRentalsListing
--               ,UpsellListRentalsSpotlighted
--               ,UpsellListSpotlight
--               ,UpsellListPayPerLease
--               ,UpsellListDiamondCity
--               ,UpsellListDiamondMax
--               ,UpsellListRentalsStandard
--               ,UpsellListCommunityCarousel
--               ,UpsellList30SecondVideo
--               ,UpsellList60SecondVideo
--               ,UpsellListRentalsCarousel
--               ,UpsellListRentalsStandardPlus
--               ,UpsellListMobileSpotlight
--               ,UpsellPropMobileDeal
--               ,UpsellPropDynamicLeadForm
--               ,UpsellListIncomeRestricted
--               ,UpsellListPetFriendly
--               ,UpsellListLuxuryCommunity
--               ,UpsellPropRepmon
--               ,UpsellPropSocialMediaMan
--               ,FutureUpsell03
--               ,FutureUpsell04
--               ,FutureUpsell05
--               ,FutureUpsell06
--               ,FutureUpsell07
--               ,FutureUpsell08
--               ,LowPrice
--               ,Highprice
--               ,ISSem
--               ,ISOverThreshold
--               ,CallTrackingInBook
--               ,CouponActiveOnSite
--               ,VerizonFios
--               ,ATTUverse
--               ,DirectTV
--               ,BrightHouse
--               ,Charter
--               ,Xfinitysp
--               ,Xfinitydp
--               ,Xfinitytp
--               ,TimeWarner
--               ,NumericRank
--               ,UniqueVisits_FL
--               ,UniqueVisits_PTE
--               ,UniqueVisits_None
--               ,UniqueVisits_Mobile
--               ,UniqueVisits_VIP
--               ,UniqueVisits_ForFutureUse2
--               ,UniqueVisits_ForFutureUse3
--               ,UniqueVisits_ForFutureUse4
--               ,UniqueVisits_ForFutureUse5
--               ,ViewsListingPage
--               ,ViewsListingPage_Mobile
--               ,ViewsListingPage_ForFutureUse1
--               ,ViewsListingPage_ForFutureUse2
--               ,ViewsListingPage_ForFutureUse3
--               ,ViewsListingPage_ForFutureUse4
--               ,ViewsListingPage_ForFutureUse5
--               ,ViewsEmercial
--               ,ViewsVirtualBrochure
--               ,ClicksSpotlightListing
--               ,ClicksSpotlightCommunityVideo
--               ,ClicksListingWebLink
--               ,ClicksMgtcoWebLink
--               ,ClicksOnlineAppt
--               ,ClicksOnlineApptSubmit
--               ,ClicksOnlineAppl
--               ,ClicksOnlineApplSubmit
--               ,ClicksOnlineApptCR
--               ,ClicksOnlineApplCR
--               ,ClicksSpotlightLeadSubmission
--               ,ClicksWeCanCallYou
--               ,ClicksLeadSubmission
--               ,ClicksPhoneSubmission
--               ,ClicksCommunityVideo
--               ,ClicksListingMap
--               ,ClicksMapDirections
--               ,ClicksPrintableGuide
--               ,ClicksPhotos
--               ,ClicksSpotlightPhotos
--               ,ClicksSpotlightPhotoPopup
--               ,ClicksFloorPlan
--               ,ClicksCheckYourCredit
--               ,ClicksWebBuilderLink
--               ,ClicksFeaturedMgtCo
--               ,ClicksFrontPagePropLead
--               ,ClicksLuxurySlideShow
--               ,ImprSearchResults
--               ,TotalImpressions
--               ,ImpreFrontCover
--               ,ImprVisitCount
--               ,ViewingFromEmail
--               ,TotalViewings
--               ,TextMsgWeb
--               ,TextMsgMobile
--               ,CheckListingAvail
--               ,ChecksSpotLightListingAvail
--               ,ChecksVirtualtourListingAvail
--               ,AgcPrintConnectedCalls
--               ,AgcPrintMissedCalls
--               ,AsgPrintConnectedCalls
--               ,AsgPrintMissedCalls
--               ,WebConnectedCalls
--               ,WebMissedCalls
--               ,RentalsConnectedCalls
--               ,RentalsMissedCalls
--               ,CTCConnectedCalls
--               ,CTCMissedCalls
--               ,PaidSPConnectedCalls
--               ,PaidSPMissedCalls
--               ,CombinedFeedsConnectedCalls
--               ,CombinedFeedsMissedCalls
--               ,GoogleConnectedCalls
--               ,GoogleMissedCalls
--               ,PPCConnectedCalls
--               ,PPCMissedCalls
--               ,LuxuryConnectedCalls
--               ,LuxuryMissedCalls
--               ,MarchexConnectedCalls
--               ,MarchexMissedCalls
--               ,CraigsListConnectedCalls
--               ,CraigsListMissedCalls
--               ,WebLocalTrackingNumberConnectedCalls
--               ,WebLocalTrackingNumberMissedCalls
--               ,RentalsLocalConnectedCalls
--               ,RentalsLocalMissedCalls
--               ,VideoConnectedCalls
--               ,VideoMissedCalls
--               ,SEMConnectedCalls
--               ,SEMMissedCalls
--               ,TruliaConnectedCalls
--               ,TruliaMissedCalls
--               ,FutureConnectedCalls01
--               ,FutureMissedCalls01
--               ,FutureConnectedCalls02
--               ,FutureMissedCalls02
--               ,FutureConnectedCalls03
--               ,FutureMissedCalls03
--               ,FutureConnectedCalls04
--               ,FutureMissedCalls04
--               ,FutureConnectedCalls05
--               ,FutureMissedCalls05
--               ,FutureConnectedCalls06
--               ,FutureMissedCalls06
--               ,FutureConnectedCalls07
--               ,FutureMissedCalls07
--               ,FutureConnectedCalls08
--               ,FutureMissedCalls08
--               ,FutureConnectedCalls09
--               ,FutureMissedCalls09
--               ,FutureConnectedCalls10
--               ,FutureMissedCalls10
--               ,AGEmailLeads
--               ,MetroEmailLeads
--               ,NeighborhoodEmailLeads
--               ,AIMCOEmailLeads
--               ,RentalsEmailLeads
--               ,RentarEmailLeads
--               ,RentalHousesEmailLeads
--               ,iPhoneEmailLeads
--               ,OodleEmailLeads
--               ,AndroidEmailLeads
--               ,HotpadsEmailLeads
--               ,LuxuryEmailLeads
--               ,CondoEmailLeads
--               ,iPadEmailLeads
--               ,TruliaEmailLeads
--               ,ZillowEmailLeads
--               ,VerticalbrandsEmailLeads
--               ,RDTFeedLeads
--               ,PropSolutionsFeedLeads
--               ,YieldFeedLeads
--               ,AGMobileEmailLeads
--               ,RentalsMobileEmailLeads
--               ,RentalsAndroidEmailLeads
--               ,RentalsiPhoneEmailLeads
--               ,VastEmailLeads
--               ,CampusHomesOnlineEmailLeads
--               ,AGTabletEmailLeads
--               ,AGKindleEmailLeads
--               ,Future1EmailLeads
--               ,Future2EmailLeads
--               ,Future3EmailLeads
--               ,Future4EmailLeads
--               ,Future5EmailLeads
--               ,Future6EmailLeads
--               ,Future7EmailLeads
--               ,Future8EmailLeads
--               ,Future9EmailLeads
--               ,Future0EmailLeads
--               ,PlacementTier
--               ,PrintProductPoints
--               ,InternetProductPoints
--               ,LegacyLoyaltyPoints
--               ,ContractLoyaltyPoints
--               ,LastUpdateYMDID
--               ,UpsellListBold
--               ,UpsellListFrontCover
--               ,UpsellPropPhotoFeature
--               ,UpsellMgmtManagementCoLogo
--               ,UpsellPropPropertyLogo
--               ,UpsellPropPremiumPackage
--               ,UpsellListFloorPlanPkg
--               ,LinkedFloorPlan
--               ,InternetPhoneLeads
--               ,InternetPhoneLeads_NoMobile
--               ,DigitalPhoneLeads
--               ,EmailLeads
--               ,InternetEmailLeads_NoMobile
--               ,DigitalEmailLeads
--               ,AGCMissedCalls
--               ,ASGMissedCalls
--               ,AGCAllLeads
--               ,ASGAllLeads
--               ,AllMissedCalls
--               ,AllConnectedCalls
--               ,AllLeads
--               ,AllInternetLeads_NoMobile
--               ,AllDigitalLeads
--               ,ThirdPartyFeedLeads
--               ,WebsiteCalls
--               ,WebsiteEmails
--               ,WebsiteLeads_Rentals
--               ,MobileEmails
--               ,MobileCalls
--               ,MobileLeads_AG
--               ,MobileLeads_Rentals
--               ,MobileAllLeads
--               ,MRSyndicationEmailLeads
--               ,MRAGEmailLeads
--               ,MRAGWebPhoneLeads
--               ,MRAppsEmailLeads
--               ,MRPhonecalls
--               ,RPLRank
--               ,PropertyName
--               ,MarketName
--               ,CityName
--               ,State
--               ,SearchRank
--               ,PageInSearch
--               ,UpgradeType
--               ,UpgradeMonthlyCost
--               ,UpgradeStartDate
--               ,UpgradeEndDate
--               ,NaturalImpressions
--               ,FeaturedImpressions
--               ,NaturalViewings
--               ,FeaturedViewings
--               ,NaturalHotLeads
--               ,FeaturedHotLeads
--               ,TotalPhoneCall
--               ,NaturalPhoneCalls
--               ,FeaturedPhoneCalls
--               ,TotalHotlead
--               ,NaturalNRL
--               ,FeaturedNRL
--               ,TotalLeases
--               ,MarketNumber
--               ,PaidLeases
--               ,AvgCallDuration
--               ,CompanyName
--               ,CompanyID
--               ,SuccessFee
--               ,VIPImpressions
--               ,VIPViewings
--               ,VIPHotLeads
--               ,VIPPhoneCalls
--               ,VIPNRL
--               ,PTEImpressions
--               ,PTEViewings
--               ,PTEHotLeads
--               ,PTEPhonecalls
--               ,PTENRL
--               ,PropertyStatus
--               ,Phone
--               ,PropertyAddress
--               ,Fax
--               ,Email
--               ,HotLeadEmailID
--               ,HotLeadFaxID
--               ,UniqueHotLeads
--               ,UniqueViewings
--               ,UniquePDPOverviews
--               ,BillingAddress
--               ,BillingCity
--               ,BillingState
--               ,BillingZip
--               ,BillingEmail
--               ,BillingPhone
--               ,BillingFax
--               ,LeaseFaxed
--               ,LeaseEmailed
--               ,SubmarketNumber
--               ,SubmarketName
--               ,AreaName
--               ,ImageIncluded
--               ,Specials
--               ,MainImageAvailable
--               ,FloorPlanAvailable
--               ,LogoAvailable
--               ,LastVirtualUpload
--               ,Searchable
--               ,UniqueHotLeaders
--               ,NaturalSearchers
--               ,FeaturedSearchers
--               ,NaturalViewers
--               ,FeaturedViewers
--               ,NaturalHotLeaders
--               ,FeaturedHotLeaders
--               ,TotalHotLeaders
--               ,TotalPhoneCallers
--               ,FeaturedPhoneCallers
--               ,NaturalPhoneCallers
--               ,BusinessModelType
--               ,ActivateDate
--               ,ConnectedCalls
--               ,MissedCalls
--               ,OneWebConnectedCalls
--               ,OneWebMissedCalls
--               ,AltRegConnectedCalls
--               ,AltRegMissedCalls
--               ,MobileConnectedCalls
--               ,MobileMissedCalls)
--          VALUES
--                (YMDID 
--                ,DATEADD(hour,@TimeZoneOffset,record_create_dm)
--                ,DATEADD(hour,@TimeZoneOffset,property_create_dm)
--                ,DATEADD(hour,@TimeZoneOffset,property_update_dm)
--                ,DATEADD(hour,@TimeZoneOffset,property_terminate_dm)
--                ,CAST (property_id AS INT)
--                ,universal_id
--                ,external_id
--                ,type_nm
--                ,CAST(ROUND(totalunits_nb,0) AS INT)
--                ,CAST(ROUND(active_units_at,0) AS INT)
--                ,CAST(ROUND(upselllistseniorlisting,0) AS INT)
--                ,CAST(ROUND(total_amenities,0) AS INT)
--                ,CAST(ROUND(active_amenities,0) AS INT)
--                ,CAST(ROUND(total_photos,0) AS INT)
--                ,CAST(ROUND(active_photos,0) AS INT)
--                ,CAST(ROUND(total_floor_plans,0) AS INT)
--                ,CAST(ROUND(active_floor_plans,0) AS INT)
--                ,CAST(ROUND(upsellproprentalsfeatured,0) AS INT)
--                ,CAST(ROUND(upselllistfloorplanupgrade,0) AS INT)
--                ,CAST(ROUND(upselllistpayperlead,0) AS INT)
--                ,CAST(ROUND(isrentalproptobedeleted,0) AS INT)
--                ,listingstatusid
--                ,CAST(ROUND(upselllisthighlighted,0) AS INT)
--                ,CAST(ROUND(upselllistcoupon,0) AS INT)
--                ,CAST(ROUND(upsellpropemerical,0) AS INT)
--                ,CAST(ROUND(upsellpropfeaturecommplatinum,0) AS INT)
--                ,CAST(ROUND(upsellpropfeaturecommgold,0) AS INT)
--                ,CAST(ROUND(upsellpropfeaturecommsilver,0) AS INT)
--                ,CAST(ROUND(upsellpropvirtualbrochure,0) AS INT)
--                ,CAST(ROUND(upselllistcorporatelisting,0) AS INT)
--                ,CAST(ROUND(upselllistcollegelisting,0) AS INT)
--                ,CAST(ROUND(upselllistmilitarylisting,0) AS INT)
--                ,CAST(ROUND(upselllistapartmentlisting,0) AS INT)
--                ,CAST(ROUND(upsellpropphotoupgrade,0) AS INT)
--                ,CAST(ROUND(upsellmgmtcologodisplay,0) AS INT)
--                ,CAST(ROUND(upsellproplogodisplay,0) AS INT)
--                ,CAST(ROUND(upsellproppremiumupgrade,0) AS INT)
--                ,CAST(ROUND(upsellpropvideospokesmodel,0) AS INT)
--                ,CAST(ROUND(upsellpropfrontpage,0) AS INT)
--                ,CAST(ROUND(upsellpropspanish,0) AS INT)
--                ,CAST(ROUND(upsellpropcallrecording,0) AS INT)
--                ,CAST(ROUND(upsellpropfromtophone,0) AS INT)
--                ,CAST(ROUND(upsellproprentalspremier,0) AS INT)
--                ,CAST(ROUND(upsellproprentalslisting,0) AS INT)
--                ,CAST(ROUND(upselllistrentalsspotlighted,0) AS INT)
--                ,CAST(ROUND(upselllistspotlight,0) AS INT)
--                ,CAST(ROUND(upselllistpayperlease,0) AS INT)
--                ,CAST(ROUND(upselllistdiamondcity,0) AS INT)
--                ,CAST(ROUND(upselllistdiamondmax,0) AS INT)
--                ,CAST(ROUND(upselllistrentalsstandard,0) AS INT)
--                ,CAST(ROUND(upselllistcommunitycarousel,0) AS INT)
--                ,CAST(ROUND(upselllist30secondvideo,0) AS INT)
--                ,CAST(ROUND(upselllist60secondvideo,0) AS INT)
--                ,CAST(ROUND(upselllistrentalscarousel,0) AS INT)
--                ,CAST(ROUND(upselllistrentalsstandardplus,0) AS INT)
--                ,CAST(ROUND(upselllistmobilespotlight,0) AS INT)
--                ,CAST(ROUND(upsellpropmobiledeal,0) AS INT)
--                ,CAST(ROUND(upsellpropdynamicleadform,0) AS INT)
--                ,CAST(ROUND(upselllistincomerestricted,0) AS INT)
--                ,CAST(ROUND(upselllistpetfriendly,0) AS INT)
--                ,CAST(ROUND(upselllistluxurycommunity,0) AS INT)
--                ,CAST(ROUND(upsellproprepmon,0) AS INT)
--                ,CAST(ROUND(upsellpropsocialmediaman,0) AS INT)
--                ,CAST(ROUND(futureupsell03,0) AS INT)
--                ,CAST(ROUND(futureupsell04,0) AS INT)
--                ,CAST(ROUND(futureupsell05,0) AS INT)
--                ,CAST(ROUND(futureupsell06,0) AS INT)
--                ,CAST(ROUND(futureupsell07,0) AS INT)
--                ,CAST(ROUND(futureupsell08,0) AS INT)
--                ,CAST(lowprice AS NUMERIC(15,2))
--                ,CAST(highprice AS NUMERIC(15,2))
--                ,CAST(ROUND(issem,0) AS INT)
--                ,CAST(ROUND(isoverthreshold,0) AS INT)
--                ,CAST(ROUND(calltrackinginbook,0) AS INT)
--                ,CAST(ROUND(couponactiveonsite,0) AS INT)
--                ,CAST(ROUND(verizonfios,0) AS INT)
--                ,CAST(ROUND(attuverse,0) AS INT)
--                ,CAST(ROUND(directtv,0) AS INT)
--                ,CAST(ROUND(brighthouse,0) AS INT)
--                ,CAST(ROUND(charter,0) AS INT)
--                ,CAST(ROUND(xfinitysp,0) AS INT)
--                ,CAST(ROUND(xfinitydp,0) AS INT)
--                ,CAST(ROUND(xfinitytp,0) AS INT)
--                ,CAST(ROUND(timewarner,0) AS INT)
--                ,CAST(ROUND(numericrank,0) AS INT)
--                ,CAST(ROUND(uniquevisits_fl,0) AS INT)
--                ,CAST(ROUND(uniquevisits_pte,0) AS INT)
--                ,CAST(ROUND(uniquevisits_none,0) AS INT)
--                ,CAST(ROUND(uniquevisits_mobile,0) AS INT)
--                ,CAST(ROUND(uniquevisits_VIP,0) AS INT)
--                ,CAST(ROUND(uniquevisits_forfutureuse2,0) AS INT)
--                ,CAST(ROUND(uniquevisits_forfutureuse3,0) AS INT)
--                ,CAST(ROUND(uniquevisits_forfutureuse4,0) AS INT)
--                ,CAST(ROUND(uniquevisits_forfutureuse5,0) AS INT)
--                ,CAST(ROUND(viewslistingpage,0) AS INT)
--                ,CAST(ROUND(viewslistingpage_mobile,0) AS INT)
--                ,CAST(ROUND(viewslistingpage_forfutureuse1,0) AS INT)
--                ,CAST(ROUND(viewslistingpage_forfutureuse2,0) AS INT)
--                ,CAST(ROUND(viewslistingpage_forfutureuse3,0) AS INT)
--                ,CAST(ROUND(viewslistingpage_forfutureuse4,0) AS INT)
--                ,CAST(ROUND(viewslistingpage_forfutureuse5,0) AS INT)
--                ,CAST(ROUND(viewsemercial,0) AS INT)
--                ,CAST(ROUND(viewsvirtualbrochure,0) AS INT)
--                ,CAST(ROUND(clicksspotlightlisting,0) AS INT)
--                ,CAST(ROUND(clicksspotlightcommunityvideo,0) AS INT)
--                ,CAST(ROUND(clickslistingweblink,0) AS INT)
--                ,CAST(ROUND(clicksmgtcoweblink,0) AS INT)
--                ,CAST(ROUND(clicksonlineappt,0) AS INT)
--                ,CAST(ROUND(clicksonlineapptsubmit,0) AS INT)
--                ,CAST(ROUND(clicksonlineappl,0) AS INT)
--                ,CAST(ROUND(clicksonlineapplsubmit,0) AS INT)
--                ,CAST(ROUND(clicksonlineapptcr,0) AS INT)
--                ,CAST(ROUND(clicksonlineapplcr,0) AS INT)
--                ,CAST(ROUND(clicksspotlightleadsubmission,0) AS INT)
--                ,CAST(ROUND(clickswecancallyou,0) AS INT)
--                ,CAST(ROUND(clicksleadsubmission,0) AS INT)
--                ,CAST(ROUND(clicksphonesubmission,0) AS INT)
--                ,CAST(ROUND(clickscommunityvideo,0) AS INT)
--                ,CAST(ROUND(clickslistingmap,0) AS INT)
--                ,CAST(ROUND(clicksmapdirections,0) AS INT)
--                ,CAST(ROUND(clicksprintableguide,0) AS INT)
--                ,CAST(ROUND(clicksphotos,0) AS INT)
--                ,CAST(ROUND(clicksspotlightphotos,0) AS INT)
--                ,CAST(ROUND(clicksspotlightphotopopup,0) AS INT)
--                ,CAST(ROUND(clicksfloorplan,0) AS INT)
--                ,CAST(ROUND(clickscheckyourcredit,0) AS INT)
--                ,CAST(ROUND(clickswebbuilderlink,0) AS INT)
--                ,CAST(ROUND(clicksfeaturedmgtco,0) AS INT)
--                ,CAST(ROUND(clicksfrontpageproplead,0) AS INT)
--                ,CAST(ROUND(clicksluxuryslideshow,0) AS INT)
--                ,CAST(ROUND(imprsearchresults,0) AS INT)
--                ,CAST(ROUND(total_impressions,0) AS INT)
--                ,CAST(ROUND(imprefrontcover,0) AS INT)
--                ,CAST(ROUND(imprvisitcount,0) AS INT)
--                ,CAST(ROUND(viewing_from_email,0) AS INT)
--                ,CAST(ROUND(total_viewings,0) AS INT)
--                ,CAST(ROUND(textmsgweb,0) AS INT)
--                ,CAST(ROUND(textmsgmobile,0) AS INT)
--                ,CAST(ROUND(checklistingavail,0) AS INT)
--                ,CAST(ROUND(checksspotlightlistingavail,0) AS INT)
--                ,CAST(ROUND(checksvirtualtourlistingavail,0) AS INT)
--                ,CAST(ROUND(agcprintconnectedcalls,0) AS INT)
--                ,CAST(ROUND(agcprintmissedcalls,0) AS INT)
--                ,CAST(ROUND(asgprintconnectedcalls,0) AS INT)
--                ,CAST(ROUND(asgprintmissedcalls,0) AS INT)
--                ,CAST(ROUND(webconnectedcalls,0) AS INT)
--                ,CAST(ROUND(webmissedcalls,0) AS INT)
--                ,CAST(ROUND(rentalsconnectedcalls,0) AS INT)
--                ,CAST(ROUND(rentalsmissedcalls,0) AS INT)
--                ,CAST(ROUND(ctconnectedcalls,0) AS INT)
--                ,CAST(ROUND(ctcmissedcalls,0) AS INT)
--                ,CAST(ROUND(paidspconnectedcalls,0) AS INT)
--                ,CAST(ROUND(paidspmissedcalls,0) AS INT)
--                ,CAST(ROUND(combinedfeedsconnectedcalls,0) AS INT)
--                ,CAST(ROUND(combinedfeedsmissedcalls,0) AS INT)
--                ,CAST(ROUND(googleconnectedcalls,0) AS INT)
--                ,CAST(ROUND(googlemissedcalls,0) AS INT)
--                ,CAST(ROUND(ppcconnectedcalls,0) AS INT)
--                ,CAST(ROUND(ppcmissedcalls,0) AS INT)
--                ,CAST(ROUND(luxuryconnectedcalls,0) AS INT)
--                ,CAST(ROUND(luxurymissedcalls,0) AS INT)
--                ,CAST(ROUND(marchexconnectedcalls,0) AS INT)
--                ,CAST(ROUND(marchexmissedcalls,0) AS INT)
--                ,CAST(ROUND(craigslistconnectedcalls,0) AS INT)
--                ,CAST(ROUND(craigslistmissedcalls,0) AS INT)
--                ,CAST(ROUND(weblocaltracknumconnectcalls,0) AS INT)
--                ,CAST(ROUND(weblocaltracknummissedcalls,0) AS INT)
--                ,CAST(ROUND(rentalslocalconnectedcalls,0) AS INT)
--                ,CAST(ROUND(rentalslocalmissedcalls,0) AS INT)
--                ,CAST(ROUND(videoconnectedcalls,0) AS INT)
--                ,CAST(ROUND(videomissedcalls,0) AS INT)
--                ,CAST(ROUND(semconnectedcalls,0) AS INT)
--                ,CAST(ROUND(semmissedcalls,0) AS INT)
--                ,CAST(ROUND(truliaconnectedcalls,0) AS INT)
--                ,CAST(ROUND(truliamissedcalls,0) AS INT)
--                ,CAST(ROUND(futureconnectedcalls01,0) AS INT)
--                ,CAST(ROUND(futuremissedcalls01,0) AS INT)
--                ,CAST(ROUND(futureconnectedcalls02,0) AS INT)
--                ,CAST(ROUND(futuremissedcalls02,0) AS INT)
--                ,CAST(ROUND(futureconnectedcalls03,0) AS INT)
--                ,CAST(ROUND(futuremissedcalls03,0) AS INT)
--                ,CAST(ROUND(futureconnectedcalls04,0) AS INT)
--                ,CAST(ROUND(futuremissedcalls04,0) AS INT)
--                ,CAST(ROUND(futureconnectedcalls05,0) AS INT)
--                ,CAST(ROUND(futuremissedcalls05,0) AS INT)
--                ,CAST(ROUND(futureconnectedcalls06,0) AS INT)
--                ,CAST(ROUND(futuremissedcalls06,0) AS INT)
--                ,CAST(ROUND(futureconnectedcalls07,0) AS INT)
--                ,CAST(ROUND(futuremissedcalls07,0) AS INT)
--                ,CAST(ROUND(futureconnectedcalls08,0) AS INT)
--                ,CAST(ROUND(futuremissedcalls08,0) AS INT)
--                ,CAST(ROUND(futureconnectedcalls09,0) AS INT)
--                ,CAST(ROUND(futuremissedcalls09,0) AS INT)
--                ,CAST(ROUND(futureconnectedcalls10,0) AS INT)
--                ,CAST(ROUND(futuremissedcalls10,0) AS INT)
--                ,CAST(ROUND(agemailleads,0) AS INT)
--                ,CAST(ROUND(maetroemailleads,0) AS INT)
--                ,CAST(ROUND(neighborhoodemailleads,0) AS INT)
--                ,CAST(ROUND(aimcoemailleads,0) AS INT)
--                ,CAST(ROUND(rentalsemailleads,0) AS INT)
--                ,CAST(ROUND(rentaremailleads,0) AS INT)
--                ,CAST(ROUND(rentalhousesemailleads,0) AS INT)
--                ,CAST(ROUND(iphoneemailleads,0) AS INT)
--                ,CAST(ROUND(oodleemailleads,0) AS INT)
--                ,CAST(ROUND(androidemailleads,0) AS INT)
--                ,CAST(ROUND(hotpadsemailleads,0) AS INT)
--                ,CAST(ROUND(luxuryemailleads,0) AS INT)
--                ,CAST(ROUND(condoemailleads,0) AS INT)
--                ,CAST(ROUND(ipademailleads,0) AS INT)
--                ,CAST(ROUND(truliaemailleads,0) AS INT)
--                ,CAST(ROUND(zillowemailleads,0) AS INT)
--                ,CAST(ROUND(verticalbrandsemailleads,0) AS INT)
--                ,CAST(ROUND(rdtfeedleads,0) AS INT)
--                ,CAST(ROUND(propsolutionsfeedleads,0) AS INT)
--                ,CAST(ROUND(yieldfeedleads,0) AS INT)
--                ,CAST(ROUND(agmobileemailleads,0) AS INT)
--                ,CAST(ROUND(rentalsmobileemailleads,0) AS INT)
--                ,CAST(ROUND(rentalsandroidemailleads,0) AS INT)
--                ,CAST(ROUND(rentalsiphoneemailleads,0) AS INT)
--                ,CAST(ROUND(vastemailleads,0) AS INT)
--                ,CAST(ROUND(campushomesonlineemailleads,0) AS INT)
--                ,CAST(ROUND(agtabletemailleads,0) AS INT)
--                ,CAST(ROUND(agkindleemailleads,0) AS INT)
--                ,CAST(ROUND(future1emailleads,0) AS INT)
--                ,CAST(ROUND(future2emailleads,0) AS INT)
--                ,CAST(ROUND(future3emailleads,0) AS INT)
--                ,CAST(ROUND(future4emailleads,0) AS INT)
--                ,CAST(ROUND(future5emailleads,0) AS INT)
--                ,CAST(ROUND(future6emailleads,0) AS INT)
--                ,CAST(ROUND(future7emailleads,0) AS INT)
--                ,CAST(ROUND(future8emailleads,0) AS INT)
--                ,CAST(ROUND(future9emailleads,0) AS INT)
--                ,CAST(ROUND(future0emailleads,0) AS INT)
--                ,CAST(ROUND(placementtier,0) AS INT)
--                ,CAST(ROUND(printproductpoints,0) AS INT)
--                ,CAST(ROUND(internetproductpoints,0) AS INT)
--                ,CAST(ROUND(legacyloyaltypoints,0) AS INT)
--                ,CAST(ROUND(contractloyaltypoints,0) AS INT)
--                ,CAST(ROUND(lastupdateymdid,0) AS INT)
--                ,CAST(ROUND(upselllistbold,0) AS INT)
--                ,CAST(ROUND(upselllistfrontcover,0) AS INT)
--                ,CAST(ROUND(upsellpropphotofeature,0) AS INT)
--                ,CAST(ROUND(upsellmgmtmanagementcologo,0) AS INT)
--                ,CAST(ROUND(upsellproppropertylogo,0) AS INT)
--                ,CAST(ROUND(upsellproppremiumpackage,0) AS INT)
--                ,CAST(ROUND(upselllistfloorplanpkg,0) AS INT)
--                ,CAST(ROUND(linkedfloorplan,0) AS INT)
--                ,CAST(ROUND(internetphoneleads,0) AS INT)
--                ,CAST(ROUND(internetphoneleads_nomobile,0) AS INT)
--                ,CAST(ROUND(digitalphoneleads,0) AS INT)
--                ,CAST(ROUND(emailleads,0) AS INT)
--                ,CAST(ROUND(internetemailleads_nomobile,0) AS INT)
--                ,CAST(ROUND(digitalemailleads,0) AS INT)
--                ,CAST(ROUND(agcmissedcalls,0) AS INT)
--                ,CAST(ROUND(asgmissedcalls,0) AS INT)
--                ,CAST(ROUND(agcallleads,0) AS INT)
--                ,CAST(ROUND(asgallleads,0) AS INT)
--                ,CAST(ROUND(allmissedcalls,0) AS INT)
--                ,CAST(ROUND(allconnectedcalls,0) AS INT)
--                ,CAST(ROUND(allleads,0) AS INT)
--                ,CAST(ROUND(allinternetleads_nomobile,0) AS INT)
--                ,CAST(ROUND(alldigitalleads,0) AS INT)
--                ,CAST(ROUND(thirdpartyfeedleads,0) AS INT)
--                ,CAST(ROUND(websitecalls,0) AS INT)
--                ,CAST(ROUND(websiteemails,0) AS INT)
--                ,CAST(ROUND(websiteleads_rentals,0) AS INT)
--                ,CAST(ROUND(mobileemails,0) AS INT)
--                ,CAST(ROUND(mobilecalls,0) AS INT)
--                ,CAST(ROUND(mobileleads_ag,0) AS INT)
--                ,CAST(ROUND(mobileleads_rentals,0) AS INT)
--                ,CAST(ROUND(mobileallleads,0) AS INT)
--                ,CAST(ROUND(mrsyndicationemailleads,0) AS INT)
--                ,CAST(ROUND(mragemailleads,0) AS INT)
--                ,CAST(ROUND(mragwebphoneleads,0) AS INT)
--                ,CAST(ROUND(mrappsemailleads,0) AS INT)
--                ,CAST(ROUND(mrphonecalls,0) AS INT)
--                ,CAST(ROUND(rplrank,0) AS INT)
--                ,property_nm
--                ,market_nm
--                ,city_nm
--                ,state_cd
--                ,CAST(ROUND(search_rank,0) AS INT)
--                ,CAST(ROUND(page_in_search,0) AS INT)
--                ,upgrade_tp
--                ,CAST(upgrade_monthly_cost AS NUMERIC(10,2))
--                ,upgrade_start_date
--                ,upgrade_end_date
--                ,CAST(ROUND(sp.natural_impressions,0) AS INT)
--                ,CAST(ROUND(sp.featured_impressions,0) AS INT)
--                ,CAST(ROUND(sp.natural_viewings,0) AS INT)
--                ,CAST(ROUND(sp.featured_viewings,0) AS INT)
--                ,CAST(ROUND(sp.natural_hotleads,0) AS INT)
--                ,CAST(ROUND(sp.featured_hotleads,0) AS INT)
--                ,CAST(ROUND(sp.total_phonecall,0) AS INT)
--                ,CAST(ROUND(sp.NATURAL_PHONECALLS,0) AS INT)
--                ,CAST(ROUND(sp.featured_phonecalls,0) AS INT)
--                ,CAST(ROUND(sp.total_hotlead,0) AS INT)
--                ,CAST(ROUND(sp.natural_nrl,0) AS INT)
--                ,CAST(ROUND(sp.featured_nrl,0) AS INT)
--                ,CAST(ROUND(sp.total_leases,0) AS INT)
--                ,CAST(ROUND(sp.market_nb,0) AS INT)
--                ,CAST(ROUND(sp.paid_leases,0) AS INT)
--                ,CAST(sp.avg_call_duration AS NUMERIC (10,2))
--                ,sp.company_nm
--                ,CAST(ROUND(sp.company_id,0) AS INT)
--                ,CAST(ROUND(sp.success_fee,0) AS INT)
--                ,CAST(ROUND(vip_impressions,0) AS INT)
--                ,CAST(ROUND(vip_viewings,0) AS INT)
--                ,CAST(ROUND(vip_hotleads,0) AS INT)
--                ,CAST(ROUND(vip_phonecalls,0) AS INT)
--                ,CAST(ROUND(vip_nrl,0) AS INT)
--                ,CAST(ROUND(pte_impressions,0) AS INT)
--                ,CAST(ROUND(pte_viewings,0) AS INT)
--                ,CAST(ROUND(pte_hotleads,0) AS INT)
--                ,CAST(ROUND(pte_phonecalls,0) AS INT)
--                ,CAST(ROUND(pte_nrl,0) AS INT)
--                ,property_status
--                ,phone_cd
--                ,property_address
--                ,fax_cd
--                ,email_nm
--                ,hotleademail_id
--                ,hotleadfax_id
--                ,CAST(ROUND(unique_hotleads,0) AS INT)
--                ,CAST(ROUND(unique_viewings,0) AS INT)
--                ,CAST(ROUND(unique_pdp_overviews,0) AS INT)
--                ,billing_address
--                ,billing_city
--                ,billing_state
--                ,billing_zip
--                ,billing_email
--                ,billing_phone
--                ,billing_fax
--                ,lease_faxed
--                ,lease_emailed
--                ,CAST(ROUND(submarket_nb,0) AS INT)
--                ,submarket_nm
--                ,area_nm
--                ,image_included
--                ,specials
--                ,main_image_available
--                ,floorplan_available
--                ,logo_available
--                ,last_virtual_upload
--                ,searchable
--                ,CAST(ROUND(unique_hotleaders,0) AS INT)
--                ,CAST(ROUND(natural_searchers,0) AS INT)
--                ,CAST(ROUND(featured_searchers,0) AS INT)
--                ,CAST(ROUND(sp.natural_viewers,0) AS INT)
--                ,CAST(ROUND(sp.featured_viewers,0) AS INT)
--                ,CAST(ROUND(sp.natural_hotleaders,0) AS INT)
--                ,CAST(ROUND(sp.featured_hotleaders,0) AS INT)
--                ,CAST(ROUND(sp.total_hotleaders,0) AS INT)
--                ,CAST(ROUND(total_phonecallers,0) AS INT)
--                ,CAST(ROUND(featured_phonecallers,0) AS INT)
--                ,CAST(ROUND(natural_phonecallers,0) AS INT)
--                ,businessmodel_tp
--                ,DATEADD(hour,@TimeZoneOffset,activate_dm)
--                ,CAST(ROUND(sp.ConnectedCalls,0) AS INT)
--                ,CAST(ROUND(sp.MissedCalls,0) AS INT)
--                ,CAST(ROUND(sp.OneWebConnectedCalls,0) AS INT)
--                ,CAST(ROUND(sp.OneWebMissedCalls,0) AS INT)
--                ,CAST(ROUND(sp.AltRegConnectedCalls,0) AS INT)
--                ,CAST(ROUND(sp.AltRegMissedCalls,0) AS INT)
--                ,CAST(ROUND(sp.MobileConnectedCalls,0) AS INT)
--                ,CAST(ROUND(sp.MobileMissedCalls,0) AS INT));
            
              
--EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
--    @DatabaseName
--   ,'APTG Staging.pr_tbl_mdim_property'
--   ,'End Mart.MDimProperty Table Load'
--   ,@SecondsStr
--   ,0
--   ,'End'
        

GO
/****** Object:  StoredProcedure [Mart].[pr_UpdateRentcomEmails]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Mart].[pr_UpdateRentcomEmails]
	(
	@YMDID INT = NULL
	)
/*************************************************************************************************
*
* Name:	Mart.pr_UpdateRentcomEmails
*
* Desc:	This updates Rentcom Email lead types in Mart listings from the Fact table
*
* Test:	EXEC Mart.pr_UpdateRentcomEmails
*
* Note: The purpose of this is to make sure that Mart.Listings has up-to-date information. Since
*		we are still pulling Email leads from RPTPROD through APTG Oracle, we are not always getting
*		the leads on time.
*
* Hist:	01	05/05/2014		Sarah Mims			Initial Version. Ticket #15457.
*		02	11/11/2014		Sarah Mims			Ticket # 17396. This proc negated Don's work in Mart
*												Listings regarding ticket 17251 so I implemented the
*												logic of Status = 1 here as well.
*		03	12/16/2014		Sarah Mims			Ticket # 17598 - added UpdateYMDID >= to 7 to WHERE clause in Oracle pull
*												to make sure we are getting all changes to leads
*		04	04/17/2015		Sarah Mims			Ticket # 19002 - updated YMDID and UpdateYMDID to >=12
*		05	05/21/2015		Sarah Mims			Ticket # 19441 - updated Rent Email pull
**************************************************************************************************/
AS

SET NOCOUNT ON

-------------------------------------------------
--Set YMDID default to 12 days ago
-------------------------------------------------
IF @YMDID IS NULL
BEGIN
	SET @YMDID = 20140322
	--CAST(CONVERT(VARCHAR(10),GETDATE()-12,112) AS INT)
END

-------------------------------------------------
--Update Rentcom Email Lead types for the past 12 days
-------------------------------------------------

UPDATE ml
SET RentEmailLeads = ISNULL(rl.RentEmailLeads,0)
	,TruliaEmailLeads = ISNULL(rl.TruliaEmailLeads,0)
	,AndroidEmailLeads = ISNULL(rl.AndroidEmailLeads,0)
	,iPadEmailLeads = ISNULL(rl.iPadEmailLeads,0)
	,iPhoneEmailLeads = ISNULL(rl.iPhoneEmailLeads,0)
FROM Rentcom.mart.Listings AS ml
JOIN
	(
    SELECT  ListingID
           ,YMDID
           ,RentEmailLeads = SUM(CASE WHEN source IN ('hotlead','RENT')
                                           AND Status = 1 THEN 1
                                      ELSE 0
                                 END)
           ,TruliaEmailLeads = SUM(CASE WHEN source = 'trulia_hl'
                                             AND Status = 1 THEN 1
                                        ELSE 0
                                   END)
           ,AndroidEmailLeads = SUM(CASE WHEN Source = 'ANDROIDRENT'
                                              AND Status = 1 THEN 1
                                         ELSE 0
                                    END)
           ,iPadEmailLeads = SUM(CASE WHEN Source = 'IPADRENT'
                                           AND Status = 1 THEN 1
                                      ELSE 0
                                 END)
           ,iPhoneEmailLeads = SUM(CASE WHEN Source = 'IPHONERENT'
                                             AND Status = 1 THEN 1
                                        ELSE 0
                                   END)
    FROM    Rentcom.Fact.EmailsRentCom
    WHERE   (YMDID >= @YMDID
             OR UPDATEYMDID >= @YMDID)
    GROUP BY ListingID
           ,YMDID
	) AS rl
ON ml.ListingID = rl.ListingID
	AND ml.YMDID = rl.YMDID
WHERE ml.YMDID >= @YMDID


SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [Reports].[DropDown_PropOrCBSA]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Reports].[DropDown_PropOrCBSA]
    (
      @StartData DATE ,
      @EndDate DATE ,
      @ParameterType VARCHAR(20)
    )

/******************************************************************************************
*
* Name:	Reports.
*
* Desc:	Base on date range to show PTE Property
*
* Test:	
exec [Reports].[DropDown_PropOrCBSA] '06/01/2015','06/30/2015','CBSA'

exec [Reports].[DropDown_PropOrCBSA] '06/01/2015','06/30/2015','listing'

*

* Hist:	01	07/23/2015	Richard Chen		Initial Version
*
******************************************************************************************/
AS 
    SET NOCOUNT ON
    BEGIN
        DECLARE @StartYMDID AS INT ,
            @EndYMDID AS INT ,
            @vWhichDropDown AS VARCHAR(20)

	
        SET @StartYMDID = CAST(CONVERT(VARCHAR(8), @StartData, 112) AS INT)
        SET @EndYMDID = CAST(CONVERT(VARCHAR(8), @EndDate, 112) AS INT)
		SET @vWhichDropDown = @ParameterType
        PRINT @startymdid
        PRINT @EndYMDID



        IF @vWhichDropDown = 'LISTINGS' 
            SELECT  ParameterValue = Listingid ,
                    ParameterLabel = PropertyLabel
            FROM    ( SELECT    Listingid = '-1' ,
                                propertyID = '-1' ,
                                rentPropertyid = '-1' ,
                                PropertyLabel = '*All Properties*' ,
                                SortOrder = 1
                      UNION ALL
                      SELECT 	DISTINCT
                                pte.listingid ,
                                pte.propertyID ,
                                dl.rentPropertyid ,
                                PropertyLabel = dl.propertyName + ' '
                                + CAST(dl.ListingID AS VARCHAR(100)) ,
                                SortOrder = 2
                      FROM      fact.ExactTarget_PTE pte
                                JOIN dimension.Listings dl ON pte.listingid = dl.listingid
                      WHERE     pte.pte = 1
                                AND pte.ymdid BETWEEN @startymdid AND @endYmdid
                    ) v
            ORDER BY SortOrder ,
                    PropertyLabel

        IF @vWhichDropDown = 'CBSA' 
            SELECT  ParameterValue = CBSACode ,
                    ParameterLabel = CBSAName
            FROM    ( SELECT    '-1' AS CBSACODE ,
                                '*All CBSA*' AS CBSANAME ,
                                Sortorder = 1
                      UNION ALL
                      SELECT DISTINCT
                                CBSACODE ,
                                CBSANAME ,
                                sortder = 2
                      FROM      dbautility.Dimension.CityMappingCBSA
                      WHERE     CBSACODE IS NOT NULL
                                AND CBSANAME IS NOT NULL
                    ) v
            ORDER BY sortOrder ,
                    CBSACODE


    END


GO
/****** Object:  StoredProcedure [Reports].[DropDown_PTE_Property]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Reports].[DropDown_PTE_Property] (
@WeekValue AS VARCHAR(20)
)

/******************************************************************************************
*
* Name:	Reports.
*
* Desc:	Base on date range to show PTE Property
*
* Test:	exec Reports.dropdown_PTE_Property '20150712|20150718'
*

* Hist:	01	07/23/2015	Richard Chen		Initial Version
*
******************************************************************************************/

AS 
SET NOCOUNT ON
BEGIN
	DECLARE @StartYMDID AS INT
    ,@EndYMDID AS INT

    SELECT  @StartYmdid = CAST([1] AS INT)
            ,@EndYMDID = CAST([10] AS INT)
    FROM    ( SELECT    *
              FROM      dbautility.dbo.fn_split(@WeekValue, '|')
            ) s PIVOT
	( MAX(measure) FOR startposition IN ( [1], [10] ) ) AS P
	
	
	PRINT @startymdid
	PRINT @EndYMDID

	SELECT Listingid, propertyID,rentPropertyid,PropertyLabel
	from
    (SELECT Listingid=0, propertyID=0,rentPropertyid=0,PropertyLabel='All',SortOrder=1
	UNION all	
	SELECT 	DISTINCT pte.listingid,pte.propertyID, dl.rentPropertyid
	  ,PropertyLabel=dl.propertyName+ ' '+CAST(dl.ListingID AS VARCHAR(100)),SortOrder=2
	FROM fact.ExactTarget_PTE pte
	join dimension.Listings dl ON pte.listingid=dl.listingid
	WHERE pte.pte=1
	AND pte.ymdid BETWEEN @startymdid AND @endYmdid
	) v
	ORDER BY SortOrder,PropertyLabel

END


GO
/****** Object:  StoredProcedure [Reports].[rpt_CallsLeadsByHourWeeklyDailyConversionOneDotFive]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




/***********************************************************************************************************************
* Name:    rpt_CallsLeadsByHourWeeklyDailyConversionOneDotFive
* -----------------------------------------------------------------------------------------------------------------------
* Desc:    Compares Calls and leads for Today by the hour to last 5 weeks same day calls and leads by the hour
* -----------------------------------------------------------------------------------------------------------------------
* Test:
*    EXEC Reports.rpt_CallsLeadsByHourWeeklyDailyConversionOneDotFive '1','1','06/20/2015'
*          EXEC Reports.rpt_CallsLeadsByHourWeeklyDailyConversionOneDotFive '1','1'
*          EXEC Reports.rpt_CallsLeadsByHourWeeklyDailyConversionOneDotFive '1','1','2015/05/17'  --2','10/11/2011,10/18/2011,10/25/2011','11/01/2011'
*          EXEC Reports.rpt_CallsLeadsByHourWeeklyDailyConversionOneDotFive '2','07/05/2011,07/06/2011,07/08/2011'
*          EXEC Reports.rpt_CallsLeadsByHourWeeklyDailyConversionOneDotFive '2','05/12/2015','05/13/2015'
* -----------------------------------------------------------------------------------------------------------------------
* Note: Uses Date Of passed in as Date Of Conversion and then the past x # of weeks or x # of days, depending on ReportType
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 01   09/18/2013   Brian Trembley    Blane request, proc based on rpt_CallsLeadsByHourWeeklyDailyConversion2 
		but uses tbl_fct_leadmessage instead of tbl_fct_lead 
* Hist: 02	05/13/2015	  Blane's SWAT Team (CW,BL,DW)	Per Blane's request, recode to include Tealium data for the 1.5 release.
*		03	05/14/2015	  Sarah Mims		Per Blane - modify Email leads to pull from APTG (both new and old lead tables)
*		04	05/28/2015    Shetal Gandhi		Ticket 19575 - Modified to look at the update date for the last 7 dates to be from the @YMD instead of Sysdate for records with older dates
*		05	06/01/2015	  Sarah Mims		No ticket - email from Blane that report wasn't working. This was due to holiday logic that I commented out until we decide how to handle.
*		06	08/05/2015	  Shetal Gandhi		Ticket 19925 - Modified to remove unnecessary dynamic sql, made the code dynamic subqueries instead for easier understanding of the stored proc
* Hist: 07	10/29/2016	  Bob Langley		Ticket 24212 - Changed to add MissedCalls to leads (where does connectedcalls)
***********************************************************************************************************************/
CREATE PROCEDURE [Reports].[rpt_CallsLeadsByHourWeeklyDailyConversionOneDotFive]
    (
      @ReportType INT = NULL , --> 1 (weekly) or 2 (daily)
      @ReportValue VARCHAR(MAX) = NULL , -->Can be multi-valued for multiple dates selected
      @YMD DATETIME = NULL
    )
AS --DECLARE @ReportType INT = 1 ,@ReportValue VARCHAR(MAX) = '3', @YMD DATETIME = NULL -- For testing

   BEGIN
---------------------------------------------------------------------
-- Drop Temp Tables
---------------------------------------------------------------------
        IF OBJECT_ID('tempdb..#tmpCalls') IS NOT NULL 
            DROP TABLE #tmpCalls
        IF OBJECT_ID('tempdb..#tmpLeads') IS NOT NULL 
            DROP TABLE #tmpLeads
        IF OBJECT_ID('tempdb..#Weeks') IS NOT NULL 
            DROP TABLE #Weeks


  ---------------------------------------------------------------------
  -- Declare & Set variables 
  ---------------------------------------------------------------------
        DECLARE @curYMDID INT ,
            @firstYMD DATETIME ,
            @curVisits INT ,
            @divisor INT ,
            @multiSelect INT ,
            @today DATE ,
            @OracleStr NVARCHAR(4000) ,
            @SQLStr NVARCHAR(4000)

      ---------------------------------------------------------------------
      -- Set Defaults
      ---------------------------------------------------------------------
     
        IF @ReportType IS NULL  -- If @ReportType IS NULL Set it to 1 for Weekly
            SET @ReportType = 1

      
        IF @ReportType = 1  AND @ReportValue IS NULL  --If @ReportType is Weekly (1) and there's no @ReportValue set it to 5 for 5 Week Avg
            SET @ReportValue = '5'

        IF @ReportType = 2  AND @ReportValue IS NULL  --If @ReportType is Daily (2) and there's no @ReportValue Set it to yesterday
            SET @ReportValue = CONVERT(VARCHAR, GETDATE() - 1, 110)

        IF @YMD IS NULL --If There is no @YMD entered set it to today
            SET @YMD = CONVERT(DATE, GETDATE())

        SET @curYMDID = CONVERT(VARCHAR, @YMD, 112)
        SET @multiSelect = '0'
        SET @today = CONVERT(DATE, GETDATE())

          ---------------------------------------------------------------------
          -- Create table to be used to store the dates for the report
          ---------------------------------------------------------------------
        CREATE TABLE #Weeks
            (
              YMDID INT ,
              CurrentDayFlag INT
            )

          ---------------------------------------------------------------------
          -- For *Weekly* reports (@ReportType = 1) Do these steps:
          ---------------------------------------------------------------------
        IF @ReportType = '1' -->Weekly
            BEGIN 
                ---------------------------------------------------------------------
                -- The @ReportValue field can be multi-valued on the report end.
                -- However, multi-Valued @ReportValues are only valid for ReportType = 2 (Daily)
                -- If a multi-value is selected for Weekly reports, choose just the min
                -- week (For example, if they select (1 Week,2 Week, 3 Week) the report
                -- will just use "1 week" for the comparision.
                ---------------------------------------------------------------------
                SELECT  @ReportValue = MIN(multiWeeks.Weeks)
                FROM    ( SELECT    Measure Weeks
                          FROM      dbautility..fn_split(@ReportValue, ',')
                        ) multiWeeks

                --For weekly reports, get the #of weeks times(x) 7 to get the correct # of days back
                SET @firstYMD = DATEADD(dd, ( ( @ReportValue * 7 ) * -1 ),
                                        @YMD)

                ---------------------------------------------------------------------
                -- Get the weekly dates for the # of weeks specified
                ---------------------------------------------------------------------
                INSERT  INTO #Weeks
                        SELECT  dimDates.YMDID ,
                                CASE WHEN dimDates.YMDDate = @YMD THEN 1
                                     ELSE 0
                                END CurrentDayFlag
                        FROM    dbautility.dimension.dates dimDates
                        WHERE   dimDates.DayOfWeekNum = DATEPART(dw, @YMD)
                                AND dimDates.YMDDate BETWEEN @firstYMD AND @YMD

                --Divisor is # of Weeks for ReportType = 1 (weekly report)
                SET @divisor = ( SELECT COUNT(1)
                                 FROM   #weeks
                                 WHERE  currentdayflag = 0
                               )

            END
		
          ---------------------------------------------------------------------
          -- For *Daily* reports (@ReportType = 2) Do these steps:
          ---------------------------------------------------------------------
        IF @ReportType = '2' -->Daily
            BEGIN 
                ---------------------------------------------------------------------
                --Split out dates for Daily comparison
                ---------------------------------------------------------------------
                --Note: Do *not* do a UNION ALL here because we don't want to get dup days 
                --if they select the same day in the drop-down as they do in the @YMD field
                ---------------------------------------------------------------------
                INSERT  INTO #Weeks
                        SELECT  CONVERT(VARCHAR, CONVERT(DATE, Measure), 112) YMDID ,
                                CASE WHEN @YMD = CONVERT(DATE, Measure) THEN 1
                                     ELSE 0
                                END CurrentDayFlag
                        FROM    dbautility..fn_split(@ReportValue, ',')
                ----------
                        UNION 
                ----------
                        SELECT  CONVERT(VARCHAR, @YMD, 112) ,
                                '1' CurrentDayFlag

                --Divisor is the # of Days for ReportType = 2 (Daily report)
                SELECT  @divisor = COUNT(DISTINCT YMDID)
                FROM    #Weeks
                WHERE   CurrentDayFlag = '0' -->Don't count the @YMD day
            END

          --Set @multiSelect variable. Only used in the final select to create a report field
        IF CHARINDEX(',', @ReportValue) > 0 
            SET @multiSelect = '1'

            ---------------------------------------------------------------------
            -- Create table for leads by hours of the day
            ---------------------------------------------------------------------
        CREATE TABLE #tmpLeads
            (
              LeadHour INT ,
              DateOfLeads INT DEFAULT 0 ,
              PreviousWeeklyLeads INT DEFAULT 0
            )

            --Insert the hours of the day
        INSERT  INTO #tmpLeads
                ( LeadHour
                )
                SELECT  *
                FROM    DBAUtility.dbo.fn_splitint('0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23')

                ---------------------------------------------------------------------
                -- Update the *CURRENT DAY* to get the lead by hour
                ---------------------------------------------------------------------
     
	
 
   SET @SQLStr = N'UPDATE tempLeads
							SET  DateOfLeads = ISNULL(dayOf.Leads,0)
							FROM    #tmpLeads tempLeads
							LEFT OUTER JOIN  (  
									SELECT * 
									FROM   OPENQUERY([ORACLECENTROID], '' 
												SELECT   to_number(to_char(TO_date( substr(created_at, 1, 19) ,''''YYYY-MM-DD HH24:MI:SS'''' ) + substr(TZ_OFFSET(''''US/Eastern''''),1,3)/24,''''YYYYMMDD'''') ) as YMDID,
														 to_char(TO_date( substr(created_at, 1, 19) ,''''YYYY-MM-DD HH24:MI:SS'''' ) + substr(TZ_OFFSET(''''US/Eastern''''),1,3)/24,''''hh24'''') as LeadHour,count(1) as Leads
												FROM COMMON.MQ_ALLLEADS
												--where updated_at >= trunc(sysdate-7)
												where updated_at between to_char(TO_date( substr('''''+ CAST(CAST(@YMD AS DATE) AS VARCHAR) +''''', 1, 19) ,''''YYYY-MM-DD'''' ))
													and to_char(TO_date( substr('''''+ CAST(DATEADD(day , 1, CAST(@YMD AS DATE)) AS VARCHAR)+''''', 1, 19) ,''''YYYY-MM-DD'''' ))
														and  to_char(TO_date( substr(created_at, 1, 19) ,''''YYYY-MM-DD HH24:MI:SS'''' ) + substr(TZ_OFFSET(''''US/Eastern''''),1,3)/24,''''YYYYMMDD'''') = ' + CAST(@curYMDID AS VARCHAR) + '
													and copystatus=1
													and website=''''rent''''
												group by to_char(TO_date( substr(created_at, 1, 19) ,''''YYYY-MM-DD HH24:MI:SS'''' ) + substr(TZ_OFFSET(''''US/Eastern''''),1,3)/24,''''hh24'''')
														,to_number(to_char(TO_date( substr(created_at, 1, 19) ,''''YYYY-MM-DD HH24:MI:SS'''' ) + substr(TZ_OFFSET(''''US/Eastern''''),1,3)/24,''''YYYYMMDD'''') )  
																		'')
												) dayOf
							 ON dayOf.LeadHour = tempLeads.LeadHour';


                EXEC sp_executesql @statement = @SQLStr;
			
			
              --  SET @OracleStr = '';

                SELECT  @OracleStr = CAST(YMDID AS NVARCHAR) + ','
                FROM    #Weeks
                WHERE   CurrentDayFlag = 0;
  
 SET @SQLStr = N'UPDATE tempLeads
				 SET  PreviousWeeklyLeads = ISNULL(dayOf.Leads,0)
				 FROM    #tmpLeads tempLeads
				 LEFT OUTER JOIN  (  SELECT * 
									 FROM   OPENQUERY([ORACLECENTROID], ''
												SELECT   to_number(to_char(TO_date( substr(created_at, 1, 19) ,''''YYYY-MM-DD HH24:MI:SS'''' ) + substr(TZ_OFFSET(''''US/Eastern''''),1,3)/24,''''YYYYMMDD'''') ) as YMDID
														,to_char(TO_date( substr(created_at, 1, 19) ,''''YYYY-MM-DD HH24:MI:SS'''' ) + substr(TZ_OFFSET(''''US/Eastern''''),1,3)/24,''''hh24'''') as LeadHour
														,count(1) as Leads
												FROM COMMON.MQ_ALLLEADS
												where Updated_at between to_char(TO_date( substr('''''+ CAST(DATEADD(day , -7, CAST(@YMD AS DATE)) AS VARCHAR)+''''', 1, 19) ,''''YYYY-MM-DD'''' ))
												  and to_char(TO_date(substr('''''+ CAST(DATEADD(day , -6, CAST(@YMD AS DATE)) AS VARCHAR)+''''', 1, 19) ,''''YYYY-MM-DD'''' ))
														and to_char(TO_date(substr(created_at, 1, 19) ,''''YYYY-MM-DD HH24:MI:SS'''' ) + substr(TZ_OFFSET(''''US/Eastern''''),1,3)/24,''''YYYYMMDD'''') = '+  CONVERT(VARCHAR, dateadd(dd,-7,@YMD), 112) +'
												  and copystatus=1
												  and website=''''rent''''
												group by to_char(TO_date( substr(created_at, 1, 19) ,''''YYYY-MM-DD HH24:MI:SS'''' ) + substr(TZ_OFFSET(''''US/Eastern''''),1,3)/24,''''hh24'''')
														,to_number(to_char(TO_date( substr(created_at, 1, 19) ,''''YYYY-MM-DD HH24:MI:SS'''' ) + substr(TZ_OFFSET(''''US/Eastern''''),1,3)/24,''''YYYYMMDD'''') )
												'')
								) dayOf
				ON dayOf.LeadHour = tempLeads.LeadHour';


 

                EXEC sp_executesql @statement = @SQLStr;
 
 
     
		

                    ---------------------------------------------------------------------
                    -- Create table for combined call dataset
                    ---------------------------------------------------------------------
        CREATE TABLE #tmpCalls
            (
              YMDID INT ,
              CallHour INT ,
              DateOfVisits INT DEFAULT 0 ,
              PreviousWeeksAvgVisits INT DEFAULT 0 ,
              DateOfTotalWeb INT DEFAULT 0 ,	--phone leads
              PreviousWeeksAvgTotalWeb INT DEFAULT 0 ,  --phone leads
              DateOfWeb INT DEFAULT 0 ,
              PreviousWeeksAvgWeb INT DEFAULT 0 ,
              DateOfCTC INT DEFAULT 0 ,
              PreviousWeeksAvgCTC INT DEFAULT 0 ,
              DateOfASG INT DEFAULT 0 ,
              PreviousWeeksAvgASG INT DEFAULT 0 ,
              DateOfAGC INT DEFAULT 0 ,
              PreviousWeeksAvgAGC INT DEFAULT 0 ,
              DateOfRentals INT DEFAULT 0 ,
              PreviousWeeksAvgRentals INT DEFAULT 0 ,
              DateOfSEM INT DEFAULT 0 ,
              PreviousWeeksAvgSEM INT DEFAULT 0 ,
              DateOfTotalMissedWeb INT DEFAULT 0 ,
              PreviousWeeksAvgTotalMissedWeb INT DEFAULT 0 ,
              DateOfMissedWeb INT DEFAULT 0 ,
              PreviousWeeksAvgMissedWeb INT DEFAULT 0 ,
              DateOfMissedCTC INT DEFAULT 0 ,
              PreviousWeeksAvgMissedCTC INT DEFAULT 0 ,
              DateOfMissedASG INT DEFAULT 0 ,
              PreviousWeeksAvgMissedASG INT DEFAULT 0 ,
              DateOfMissedAGC INT DEFAULT 0 ,
              PreviousWeeksAvgMissedAGC INT DEFAULT 0 ,
              DateOfMissedRentals INT DEFAULT 0 ,
              PreviousWeeksAvgMissedRentals INT DEFAULT 0 ,
              DateOfMissedSEM INT DEFAULT 0 ,
              PreviousWeeksAvgMissedSEM INT DEFAULT 0
            )

                        ---------------------------------------------------------------------
                        -- Populate the call table with the hours of the day
                        ---------------------------------------------------------------------


        INSERT  INTO #tmpCalls
                ( YMDID ,
                  CallHour
                )
                SELECT  @curYMDID ,
                        Leadhour
                FROM    #tmpLeads

                        ---------------------------------------------------------------------
                        -- Update combined table with call info for current YMDID
                        ---------------------------------------------------------------------
        IF @curYMDID = CAST(CONVERT(VARCHAR(8), GETDATE(), 112) AS INT) 
            BEGIN

	-- current day visits and calls
                UPDATE  tempCalls
                SET     DateOfVisits = vbh.visits ,  --yes
                        DateOfTotalWeb = ISNULL(dayOf.PhoneLeads, 0) ,  --phone leads, now data
                        DateOfWeb = 0 ,
                        DateOfCTC = 0 ,
                        DateOfASG = 0 ,
                        DateOfAGC = 0 ,
                        DateOfRentals = 0 ,
                        DateOfTotalMissedWeb = 0 ,
                        DateOfMissedWeb = 0 ,
                        DateOfMissedCTC = 0 ,
                        DateOfMissedASG = 0 ,
                        DateOfMissedAGC = 0 ,
                        DateOfMissedRentals = 0
                FROM    #tmpCalls tempCalls
                        INNER JOIN (SELECT  ymdid
                                          ,hourint24
                                          ,SUM(Visits) AS Visits
                                     FROM    Corporate.Fact.AllProfilesVisitsByHourWithBotTraffic WITH (NOLOCK)
                                    WHERE   profilekey IN (53,86)
                                     AND ymdid > CAST(CONVERT(VARCHAR(8),@firstYMD,112) AS INT)
                                   GROUP BY ymdid,hourint24
                                   ) vbh ON tempCalls.ymdid = vbh.ymdid
                                            AND tempCalls.CallHour = vbh.hourint24
                        --Ticket 24212  added missed calls to connected (Oracle pull)
						LEFT OUTER JOIN ( SELECT    *
                                          FROM      OPENQUERY(ORACLEAPTG, --; reader; reader,
                                                              'select	  CallLoadYMDID as ymdid
																		, CallloadHour
																		, count(*) as PhoneLeads 
																from common.callsrc_rentcom 
																where status IN (1,2,3)
																	and callloadymdid = to_char (sysdate, ''YYYYMMDD'' )
																	and ymdid > to_char (sysdate-1, ''YYYYMMDD'' )
																	and call_date > sysdate-1
																group by CallLoadYMDID,CallloadHour')
                                        ) dayOf ON dayOf.CallloadHour = tempCalls.callHour;
            END
        ELSE 
            BEGIN
  
	-- use @curYMDID or tempCalls.ymdid, comparing to date in past
                UPDATE  tempCalls
                SET     DateOfVisits = vbh.visits ,  --yes
                        DateOfTotalWeb = 0 ,  --phone leads, now data
                        DateOfWeb = 0 ,
                        DateOfCTC = 0 ,
                        DateOfASG = 0 ,
                        DateOfAGC = 0 ,
                        DateOfRentals = 0 ,
                        DateOfTotalMissedWeb = 0 ,
                        DateOfMissedWeb = 0 ,
                        DateOfMissedCTC = 0 ,
                        DateOfMissedASG = 0 ,
                        DateOfMissedAGC = 0 ,
                        DateOfMissedRentals = 0
                FROM    #tmpCalls tempCalls
                        INNER JOIN 
						
						 (SELECT  ymdid
                                          ,hourint24
                                          ,SUM(Visits) AS Visits
                                     FROM    Corporate.Fact.AllProfilesVisitsByHourWithBotTraffic WITH (NOLOCK)
                                    WHERE   profilekey IN (53,86)
                                     AND ymdid > CAST(CONVERT(VARCHAR(8),@firstYMD,112) AS INT)
                                   GROUP BY ymdid,hourint24
                                   ) vbh ON tempCalls.ymdid = vbh.ymdid
                                            AND tempCalls.CallHour = vbh.hourint24

	
--Ticket 24212 added missed calls to connected
SET @SQLStr = N'UPDATE tempCalls
					SET  DateOfTotalWeb = ISNULL(dayOf.PhoneLeads,0)
				FROM    #tmpCalls tempCalls
				LEFT OUTER JOIN  (  SELECT * 
									FROM   OPENQUERY(ORACLEAPTG, '' 
													select CallloadHour, count(*) as PhoneLeads 
													from common.callsrc_rentcom 
													where status IN (1,2,3) and ymdid =  ' + CAST(@curYMDID AS VARCHAR) + '
													and call_date between to_date(''''' + CAST(@curYMDID AS VARCHAR) + ''''', ''''YYYYMMDD'''') and (to_date(''''' + CAST(@curYMDID AS VARCHAR) + ''''', ''''YYYYMMDD'''') + 1)
													group by CallloadHour  
																'')
								) dayOf
						ON dayOf.CallloadHour = tempCalls.callhour';
 

	
                EXEC sp_executesql @statement = @SQLStr;


            END  

                        ---------------------------------------------------------------------
                        -- Update combined table with call info for same day for previous weeks
                        ---------------------------------------------------------------------

	   -- SET @OracleStr = '';

        SELECT  @OracleStr = CAST(YMDID AS NVARCHAR) + ','
        FROM    #Weeks
        WHERE   CurrentDayFlag = 0;
  
 
		--Ticket 24212 added missed to connected calls
        SELECT  @SQLStr = N'UPDATE tempCalls
							SET PreviousWeeksAvgTotalWeb = dayOf.PhoneLeads
							FROM    #tmpCalls tempCalls
							LEFT OUTER JOIN  (  SELECT * 
												FROM   OPENQUERY(ORACLEAPTG, '' 
															select CallloadHour, count(*) as PhoneLeads 
															from common.callsrc_rentcom 
															where status IN (1,2,3) and ymdid in  (' + LEFT(@OracleStr, LEN(@OracleStr) - 1) + ' )
																and call_date between to_date(''''' + CAST(@curYMDID AS VARCHAR) + ''''', ''''YYYYMMDD'''') -7 
																	and (to_date(''''' + CAST(@curYMDID AS VARCHAR) + ''''', ''''YYYYMMDD'''') -6)
															group by CallLoadYMDID,CallloadHour  
																			'')
											) dayOf
								ON dayOf.CallloadHour = tempCalls.callhour';
 
	
        EXEC sp_executesql @statement = @SQLStr;

	-- previous weeks visits
        UPDATE  tempCalls
        SET     PreviousWeeksAvgVisits = SubTotal.AvgVisits
        FROM    #tmpCalls tempCalls
                JOIN ( SELECT   vbh.hourint24 ,
                                SUM(vbh.Visits) AS AvgVisits
                       FROM     #Weeks weeks
                                INNER JOIN Corporate.Fact.AllProfilesVisitsByHourWithBotTraffic vbh 
									ON weeks.ymdid = vbh.ymdid
                                    AND vbh.profilekey in ( 53, 86)
                       WHERE    weeks.CurrentDayFlag = 0
                       GROUP BY vbh.hourint24
                     ) SubTotal ON tempCalls.CallHour = SubTotal.hourint24;




                    ---------------------------------------------------------------------
                    -- Set the @curVisits value to be used in the final select out
                    ---------------------------------------------------------------------
        SELECT  @curVisits = DateOfVisits
        FROM    #tmpCalls
        WHERE   callhour = DATEPART(hour, DATEADD(hh, -1, GETDATE()))

                        ---------------------------------------------------------------------
                        -- Select out final result set
                        ---------------------------------------------------------------------
        SELECT  @YMD DateOf ,
                               --BEGIN Fields for report headers only ----------------
                CASE WHEN @YMD = @today THEN 'Today'
                     ELSE CONVERT(VARCHAR, @YMD, 110)
                END CompareTo ,
                CASE WHEN @ReportType = '1' THEN DATENAME(dw, @YMD)
                     ELSE ''
                END WeeklyCompareDay ,
                               ----------
                @ReportValue ReportValue ,
                ABS(@Divisor) DaysOrWeeksValue ,
                               ----------
                CASE WHEN @ReportType = '1' THEN 'Weekly'
                     WHEN @ReportType = '2' AND @multiSelect = '0' THEN 'Daily'
                     WHEN @ReportType = '2' AND @multiSelect = '1' THEN 'Multi-Day'
                     ELSE 'Other'
                END ReportType ,
                               --END Fields for report headers only -----------------
                LeadHour ,
                @curVisits CurrentVisits ,
                DATEPART(hour, DATEADD(hour, -1, GETDATE())) lastHour ,
                               ------------------------
                CASE WHEN LeadHour = DATEPART(hour, GETDATE()) AND @YMD = CONVERT(VARCHAR(10), GETDATE(), 112) THEN 0
                     WHEN leadhour = DATEPART(hour, DATEADD(hour, -1, GETDATE())) AND @curVisits = 0 THEN 0
                     ELSE DateOfVisits
                END DateOfVisits ,
                               ------------------------
                PreviousWeeksAvgVisits ,
                DateOfLeads ,
                               ------------------------
                CASE WHEN LeadHour = DATEPART(hour, GETDATE())
                          AND @YMD = CONVERT(VARCHAR(10), GETDATE(), 112)
                          AND DateOfVisits > 0 THEN 0
                     WHEN leadhour = DATEPART(hour,
                                              DATEADD(hour, -1, GETDATE()))
                          AND @curVisits = 0
                          AND @YMD = CONVERT(VARCHAR(10), GETDATE(), 112)
                     THEN 0
                     WHEN ( dateofLeads > 0
                            AND DateOfVisits > 0
                          )
                     THEN CAST(DateOfLeads
                          / CAST(DateOfVisits AS NUMERIC(15, 4)) AS DECIMAL(6,
                                                              3))
                     ELSE 0 --NULL 
                END DateOfLeadConversion ,
							   ------------------------
                PreviousWeeklyLeads ,
							   ------------------------
                CASE WHEN PreviousWeeksAvgVisits > 0
                          AND PreviousWeeklyLeads > 0
                     THEN CAST(PreviousWeeklyLeads
                          / CAST(PreviousWeeksAvgVisits AS NUMERIC(15, 4)) AS DECIMAL(6,
                                                              3))
                     ELSE 0
                END PreviousWeeksAvgLeadConversion ,
							  ------------------------
                CASE WHEN PreviousWeeksAvgVisits > 0
                          AND ( PreviousWeeklyLeads > 0
                                OR PreviousWeeksAvgTotalWeb > 0
                              )
                     THEN CAST(( PreviousWeeklyLeads
                                 + PreviousWeeksAvgTotalWeb )
                          / CAST(PreviousWeeksAvgVisits AS NUMERIC(15, 4)) AS DECIMAL(6,
                                                              3))
                     ELSE 0
                END PreviousWeeksAvgTotalConversion ,
                              ------------------------
                CASE WHEN LeadHour = DATEPART(hour, GETDATE())
                          AND @YMD = CONVERT(VARCHAR(10), GETDATE(), 112)
                     THEN 0
                     WHEN leadhour = DATEPART(hour,
                                              DATEADD(hour, -1, GETDATE()))
                          AND @curVisits = 0
                          AND @YMD = CONVERT(VARCHAR(10), GETDATE(), 112)
                     THEN 0
                     WHEN ( dateofTotalWeb > 0
                            AND DateOfVisits > 0
                          )
                     THEN CAST(DateOfTotalWeb
                          / CAST(DateOfVisits AS NUMERIC(15, 4)) AS DECIMAL(6,
                                                              3))
                     ELSE 0 --NULL
                END DateofTotalWebConversion ,
                              ------------------------
                CASE WHEN LeadHour = DATEPART(hour, GETDATE())
                          AND @YMD = CONVERT(VARCHAR(10), GETDATE(), 112)
                     THEN 0
                     WHEN leadhour = DATEPART(hour,
                                              DATEADD(hour, -1, GETDATE()))
                          AND @curVisits = 0
                          AND @YMD = CONVERT(VARCHAR(10), GETDATE(), 112)
                     THEN 0
                     WHEN ( DateOfTotalWeb + DateofLeads > 0
                            AND DateOfVisits > 0
                          )
                     THEN CAST(( DateOfTotalWeb + DateofLeads )
                          / CAST(DateOfVisits AS NUMERIC(15, 4)) AS DECIMAL(6,
                                                              3))
                     ELSE 0 --NULL
                END DateofTotalConversion ,
                              ------------------------
                CASE WHEN PreviousWeeksAvgVisits > 0
                          AND PreviousWeeksAvgTotalWeb > 0
                     THEN CAST(PreviousWeeksAvgTotalWeb
                          / CAST(PreviousWeeksAvgVisits AS NUMERIC(15, 4)) AS DECIMAL(6,
                                                              3))
                     ELSE 0
                END PreviousWeeksAvgTotalWebConversion ,
                              ------------------------
                DateofTotalWeb + DateofLeads DateOfTotal ,
                PreviousWeeksAvgTotalWeb + PreviousWeeklyLeads PreviousWeeksAvgTotal ,
                PreviousWeeksAvgTotalWeb ,
                DateOfTotalWeb , --> total web phone leads
                DateOfWeb ,
                DateOfCTC ,
                DateOfASG ,
                DateOfAGC ,
                DateOfRentals ,
                0 AS MaxEmailLeadsByHour ,
                0 AS MaxEmailLeadsByDay ,
                0 AS MaxPhoneCallsByHour ,
                0 AS MaxPhoneCallsByDay ,
                0 AS MaxEmailConvByHour ,
                0 AS MaxEmailConvByDay ,
                0 AS MaxPhoneConvByHour ,
                0 AS MaxPhoneConvByDay ,
                0 AS MaxTotalConvByHour ,
                0 AS MaxTotalConvByDay--recHigh.MaxTotalConvByDay
        FROM    #tmpCalls tc
                INNER JOIN #tmpLeads tl 
				ON tc.callhour = tl.leadhour


        SET NOCOUNT OFF
    END


   




GO
/****** Object:  StoredProcedure [Reports].[rpt_DailyMetric_Lease]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Reports].[rpt_DailyMetric_Lease] (
      @PickDate date = NULL)
AS 
/***********************************************************************************************************************
* Name:   reports.[rpt_DailyMetric_Lease]
* -----------------------------------------------------------------------------------------------------------------------
* Desc:   
* -----------------------------------------------------------------------------------------------------------------------
* Test:   EXEC Reports.[rpt_DailyMetric_Lease] 
*         EXEC Reports.[rpt_DailyMetric_Lease] '04/20/2014'
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 
* 01   04/23/2014   Richard Chen    
*
***********************************************************************************************************************/
SET NOCOUNT ON;

    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
       ,@errmsg VARCHAR(MAX)
                
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcsNoTemp 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = 'Reports.rpt_DailyMetric_Lease'
       , -- varchar(128)
        @StepName = 'Execute Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Execute Procedure' -- varchar(500)

--------------------------------------------
--- declare & set variables
--------------------------------------------
declare 
  @PickYMDID int
  ,@compareYMDID int

--------------------------------------------
--- set default dates
--------------------------------------------
set @PickYMDID=cast(convert(varchar(8),@PickDate ,112) as int)
set @CompareYMDID=cast(convert(varchar(8),dateadd(d, -7,@PickDate) ,112) as int)

print @pickymdid
print @compareYmdid

		select ymdid, 
		  NRL=count(distinct LeaseID) 
		  ,NRLFromSite=count(distinct Case when SessionEmailID is null then LeaseID end)
		  ,NRLFromEmail=count(distinct Case when SessionEmailID is not null then LeaseID end)
		from  dimension.lease
		where ymdid in (@compareYMDID,@PickYMDID)
		group by ymdid
		order by ymdid



SET NOCOUNT OFF;

/*
select sessionEmailID from dimension.lease where ymdid=20140413
*/

GO
/****** Object:  StoredProcedure [Reports].[rpt_disputedLeaseDropDown]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Reports].[rpt_disputedLeaseDropDown] 
AS 
/***********************************************************************************************************************
* Name:   reports.rpt_disputedLeaseDropDown
* -----------------------------------------------------------------------------------------------------------------------
* Desc:   Disputed Lease Drop down
* -----------------------------------------------------------------------------------------------------------------------
* Test:   
*         exec rentcom.[Reports].rpt_disputedLeaseDropDown 
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 
* 01   03/17/2014   Richard Chen    Initial Version
*
***********************************************************************************************************************/
SET NOCOUNT ON;
    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
       ,@errmsg VARCHAR(MAX)
                
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcsNoTemp 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = 'rpt_disputedLeaseDropDown'
       , -- varchar(128)
        @StepName = 'Execute Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Execute Procedure' -- varchar(500)


--------------------------------------------
--- declare & set variables
--------------------------------------------
select Lable=cast(l.ymdid as varchar(30)) +' - '+cast(l.leaseid as varchar(30)),l.leaseid,l.RenterID, l.propertyid, l.ymdid
  from rentcom.dimension.lease l
       join rentcom.fact.Lease_drs drs on l.leaseid =drs.leaseid
        and l.status not in ('Incomplete','Invalid - Duplicate')
  where l.terminatedate is null
    and  l.createDate >= getdate() -181
   order by l.leaseid desc,l.ymdid desc



SET NOCOUNT OFF;


--select * from dimension.lease where leaseid=151088272


GO
/****** Object:  StoredProcedure [Reports].[rpt_disputedLeaseRentRoll]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Reports].[rpt_disputedLeaseRentRoll] (@ymdid int)
AS 
/***********************************************************************************************************************
* Name:   reports.rpt_disputedLeaseDropDown
* -----------------------------------------------------------------------------------------------------------------------
* Desc:   Disputed Lease Drop down
* -----------------------------------------------------------------------------------------------------------------------
* Test:   
*         exec rentcom.[Reports].[rpt_disputedLeaseRentRoll]  20140301
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 
* 01   03/17/2014   Richard Chen    Initial Version
*
***********************************************************************************************************************/
SET NOCOUNT ON;
    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
       ,@errmsg VARCHAR(MAX)
                
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcsNoTemp 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = 'rpt_disputedLeaseRentRoll'
       , -- varchar(128)
        @StepName = 'Execute Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Execute Procedure' -- varchar(500)

declare
@StartYmdid int,
@endYmdid int

select @StartYmdid=monthStartYmdid
      ,@EndYmdid= monthendymdid 
  from DBAUtility.dimension.dates
where ymdid=@ymdid

begin try
   drop table sandbox.dbo.assoc
end try
begin catch
end catch

select distinct px1.personid, AssocPersonID=px2.personid
  into sandbox.dbo.assoc
  from  [Mart].[PersonExpansion] px1 
   join [Mart].[PersonExpansion] px2 
	on px1.visitorkey=px2.visitorkey
order by px1.personid

delete from sandbox.dbo.assoc
where personid in
(select personid
from   sandbox.dbo.assoc
group by personid
having  count(1) > 5)

delete from sandbox.dbo.assoc where personid=assocPersonid

select *
  into staging.LeaseToMatch
from 
(
select l.leaseid
       ,MgmtCompany=dl.MgtConame
	   ,l.PropertyID
       ,PropertyName=dl.PropertyName
       ,PropertyStreetAddress=l.[UniteAddressName]
	   ,PropertyState=l.[UnitStateCode]
	   ,Unit=isnull(l.[UnitNumber],'')
	   ,LeaseStartDate=l.MoveInDate
	   ,l.CreateDate
	   ,ResidentLastName=L.RenterLastName
	   ,ResidentFirstName=l.RenterFirstName
	   ,ResidentEmail=p0.EmailName
	   ,ResidentPhone1=isnull(replace(replace(replace(replace(p0.PhoneCode,' ',''),'-',''),')',''),'(',''),'')
	   --,ResidentPhone2=''
	   --,ResidentPHone3=''
	   --,ResidentReferralSource=''
	   --,RoomaateFullName=''
	   --,RoomaateFirstName=''
	   --,RoomaateLastName=''
	   --,RoomaateEmail=''
	   --,RoommatePhone1=''
  from rentcom.dimension.lease l
       join rentcom.fact.Lease_drs drs on l.leaseid =drs.leaseid
        and l.status not in ('Incomplete','Invalid - Duplicate')
	   join dimension.listings dl 
	   on l.PropertyID=dl.RentPropertyID
	   join  dimension.person p0 on l.renterid=p0.personid
  where l.terminatedate is null
    and  l.createDate >= getdate() -181
--      AND CAST(CONVERT(VARCHAR(8),l.createDate,112) AS INT) BETWEEN @StartYmdid AND @endYmdid
 union
 select l.leaseid
       ,MgmtCompany=dl.MgtConame
	   ,l.PropertyID
       ,PropertyName=dl.PropertyName
       ,PropertyStreetAddress=l.[UniteAddressName]
	   ,PropertyState=l.[UnitStateCode]
	   ,Unit=isnull(l.[UnitNumber],'')
	   ,LeaseStartDate=l.MoveInDate
	   ,l.CreateDate
	   ,ResidentLastName=L.RenterLastName
	   ,ResidentFirstName=l.RenterFirstName
	   ,ResidentEmail=p0.EmailName
	   ,ResidentPhone1=isnull(replace(replace(replace(replace(p0.PhoneCode,' ',''),'-',''),')',''),'(',''),'')
	   --,ResidentPhone2=''
	   --,ResidentPHone3=''
	   --,ResidentReferralSource=''
	   --,RoomaateFullName=''
	   --,RoomaateFirstName=''
	   --,RoomaateLastName=''
	   --,RoomaateEmail=''
	   --,RoommatePhone1=''
  from rentcom.dimension.lease l
       join rentcom.fact.Lease_drs drs on l.leaseid =drs.leaseid
        and l.status not in ('Incomplete','Invalid - Duplicate')
	   join dimension.listings dl 
	   on l.PropertyID=dl.RentPropertyID
	   join sandbox.dbo.assoc assoc on l.renterid=assoc.personid
	   join  dimension.person p0 on assoc.ASSOCpersonid=p0.personid
  where l.terminatedate is null
    and  l.createDate >= getdate() -181
--	AND CAST(CONVERT(VARCHAR(8),l.createDate,112) AS INT) BETWEEN @StartYmdid AND @endYmdid
) v
order by leaseid


SET NOCOUNT OFF;

GO
/****** Object:  StoredProcedure [Reports].[rpt_DropDownDayWeek]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
*
* Name:	rpt_DropDownDayWeek
*
* Desc:	used in reports Visits Convert Leads and APTG Calls Leads Conversion
*
* Test:	exec Reports.rpt_DropDownDayWeek '2'
exec Reports.rpt_DropDownDayWeek '2'
*
* Note: default is no values so it uses '5' to return nothing
*
* Hist:	01	07/22/2011	Clinton Woody		Used in 2 reports now numera ticket 5721
*
******************************************************************************************/
CREATE PROCEDURE [Reports].[rpt_DropDownDayWeek]
(@ReportType as Varchar(2) = Null)
AS
BEGIN
	SET NOCOUNT ON;
	-- set it so no results are returned by default
	set @ReportType=isnull(@ReportType,'5')
	
--------------------------------------
-- Get dates for ReportType = '2'
--------------------------------------
SELECT CONVERT(varchar,YMDDate,110) Value,
       CONVERT(varchar,YMDDate,110)+' ('+UPPER(DayShortName)+')' Descrip,
       CONVERT(int,CONVERT(varchar,YMDDate,112))  SortOrder
FROM   dbautility.dimension.dates
WHERE  ymdDate between getdate()-75 and getdate()-1
AND    @ReportType = '2'

--------------------------------------
-- Get Week ints for ReportType = '1'
--------------------------------------

------------
UNION ALL
------------
SELECT '1' Value,
       '1 Week' Descrip,
        10 SortOrder
WHERE  @ReportType = '1'
------------
UNION ALL
------------
SELECT '2' Value,
       '2 Weeks' Descrip,
        9 SortOrder
WHERE  @ReportType = '1'
------------
UNION ALL
SELECT '3' Value,
       '3 Weeks' Descrip,
        8 SortOrder
WHERE  @ReportType = '1'
------------
UNION ALL
------------
SELECT '4' Value,
       '4 Weeks' Descrip,
        7 SortOrder 
WHERE  @ReportType = '1'
------------
UNION ALL
------------
SELECT '5' Value,
       '5 Weeks' Descrip,
        6 SortOrder 
WHERE  @ReportType = '1'
------------
UNION ALL
------------
SELECT '6' Value,
       '6 Weeks' Descrip,
        5 SortOrder 
WHERE  @ReportType = '1'
------------
UNION ALL
------------
SELECT '7' Value,
       '7 Weeks' Descrip,
        4 SortOrder 
WHERE  @ReportType = '1'
------------
UNION ALL
------------
SELECT '8' Value,
       '8 Weeks' Descrip,
        3 SortOrder 
WHERE  @ReportType = '1'
------------
UNION ALL
------------
SELECT '9' Value,
       '9 Weeks' Descrip,
        2 SortOrder 
WHERE  @ReportType = '1'
------------
UNION ALL
------------
SELECT '10' Value,
       '10 Weeks' Descrip,
        1 SortOrder 
WHERE  @ReportType = '1'

ORDER BY SortOrder DESC
END

GO
/****** Object:  StoredProcedure [Reports].[rpt_LeaseHotLeadMatch]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Reports].[rpt_LeaseHotLeadMatch]
(@LeaseID int)
AS 
/***********************************************************************************************************************
* Name:   reports.rpt_LeaseHotLeadMatch
* -----------------------------------------------------------------------------------------------------------------------
* Desc:   Disputed Lease Drop down
* -----------------------------------------------------------------------------------------------------------------------
* Test:   
*         exec rentcom.[Reports].rpt_LeaseHotLeadMatch 151161152
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 
* 01   03/17/2014   Richard Chen    Initial Version
*
***********************************************************************************************************************/
SET NOCOUNT ON;

    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
       ,@errmsg VARCHAR(MAX)
                
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcsNoTemp 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = 'rpt_LeaseHotLeadMatch'
       , -- varchar(128)
        @StepName = 'Execute Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Execute Procedure' -- varchar(500)


--------------------------------------------
--- declare & set variables
--------------------------------------------
--select lm.* 
--from rentcom.[Fact].[LeadMessage] lm with (nolock)
-- join rentcom.dimension.lease  dl with (nolock) on dl.RenterID=lm.personid
--  and lm.PropertyID=dl.propertyid
--  and lm.sourcetype='hotlead'
--  and dl.leaseid=@Leaseid

--select lm.* 
--from rentcom.dimension.lease  dl with (nolock) 
-- join mart.personexpansion x1 on dl.renterid=x1.personid
-- join mart.personexpansion x2 on x1.visitorkey=x2.visitorkey
-- join rentcom.[Fact].[LeadMessage] lm with (nolock)
--   on x2.personid=lm.personid
--  and lm.PropertyID=dl.propertyid
--  and lm.sourcetype='hotlead'
--  and dl.leaseid=@Leaseid
--  and dl.ymdid >= cast ( convert(varchar(8),lm.ContactDate,112) as int)

select lm.* 
from rentcom.dimension.lease  dl with (nolock) 
 join rentcom.[Fact].[LeadMessage] lm with (nolock)
   on lm.PropertyID=dl.propertyid
  and lm.personid=dl.renterid
  and lm.sourcetype='hotlead'
  and dl.leaseid=@Leaseid
  and dl.ymdid >= lm.ymdid --cast ( convert(varchar(8),lm.ContactDate,112) as int)
union
select lm.* 
  from rentcom.dimension.lease  dl with (nolock) 
  join mart.personexpansion x1 with (nolock) on dl.renterid=x1.personid
  join mart.personexpansion x2 with (nolock) on x1.visitorkey=x2.visitorkey
  join rentcom.[Fact].[LeadMessage] lm with (nolock)
   on x2.personid=lm.personid and lm.personid <> dl.renterid
  and lm.PropertyID=dl.propertyid
  and lm.sourcetype='hotlead'
  and dl.leaseid=@Leaseid
  and dl.ymdid >= lm.ymdid


SET NOCOUNT OFF;



GO
/****** Object:  StoredProcedure [Reports].[rpt_LeasePhoneLeadMatch]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Reports].[rpt_LeasePhoneLeadMatch]
(@LeaseID int)
AS 
/***********************************************************************************************************************
* Name:   reports.rpt_LeasePhoneLeadMatch
* -----------------------------------------------------------------------------------------------------------------------
* Desc:   Disputed Lease Drop down
* -----------------------------------------------------------------------------------------------------------------------
* Test:   
*         exec rentcom.[Reports].rpt_LeasePhoneLeadMatch 151161152
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 
* 01   03/17/2014   Richard Chen    Initial Version, match only on propertyid and phone regardless of person
*
***********************************************************************************************************************/
SET NOCOUNT ON;

--------------------------------------------
--- declare & set variables
--------------------------------------------
--select c.*
--from 
-- rentcom.[Fact].[CallsRentCom] c 
--join rentcom.dimension.person p
--on c.CallerPhoneNumber=replace(replace(replace(replace(p.phoneCode,' ',''),'-',''),')',''),'(','')
--join rentcom.dimension.lease l on l.leaseid=@leaseid--151060686
--where c.rentpropertyid=l.PropertyID--452385 
--and p.PersonID=l.RenterID---38263950
    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
       ,@errmsg VARCHAR(MAX)
                
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcsNoTemp 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = 'Reports.rpt_LeasePhoneLeadMatch'
       , -- varchar(128)
        @StepName = 'Execute Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Execute Procedure' -- varchar(500)

select c.*
  from rentcom.[Fact].[CallsRentCom] c with (nolock) 
  join rentcom.dimension.lease l with (nolock) on right(c.callerPhoneNumber,10)=l.renterphonenumber
   and l.leaseid=@leaseid--151060686
   and c.rentpropertyid=l.PropertyID
   and l.ymdid >= c.ymdid




SET NOCOUNT OFF;



GO
/****** Object:  StoredProcedure [Reports].[rpt_MonitorAlertAllTimeFileLoad]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
*
* Name:	rpt_MonitorAlertAllTimeFileLoad
*
* Desc:	used to alert if the alltime load has stopped loading data
*
* Test:	exec Reports.rpt_MonitorAlertAllTimeFileLoad
*
* Note:
*
* Hist:	01	11/14/2012	Clinton Woody		Initial Version
*		02	01/07/2013	Chadwick Smith		Backfilling a different table now, changed script accordingly
*	    03	11/14/2013	Clinton Woody		Removed job_id reference # 13582
******************************************************************************************/
CREATE PROCEDURE [Reports].[rpt_MonitorAlertAllTimeFileLoad]
AS 
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY
        DROP TABLE #tmplastCheck;
    END TRY
    BEGIN CATCH
    END CATCH
    
    DECLARE @MessageTxt VARCHAR(4000);
    DECLARE @SubjectTxt VARCHAR(4000);
    DECLARE @RecipientsTxt VARCHAR(200);
    DECLARE @TableName AS VARCHAR(50)
       ,@LastRowCount AS BIGINT;
    DECLARE @JobRunning BIT;
    DECLARE @JobID VARCHAR(64);
    DECLARE @JobName VARCHAR(255);

    SET @JobName = 'T - RentCom_Import_backfill';
    SET @JobID = (
                  SELECT    job_id
                  FROM      msdb.dbo.sysjobs
                  WHERE     name = @JobName
                 );

    EXEC dbautility.dbo.pr_checkjobrunning 
        @Job_ID = @JobID
       ,@isRunning = @Jobrunning OUTPUT
--	exec dbautility.dbo.pr_checkjobrunning @Job_ID='DBB5BCBC-D7C0-4176-8A57-B5E2272A6DEB' ,@isRunning = @Jobrunning  OutPUt
--print @JobRunning

    IF @JobRunning = 0
        OR (
            SELECT  DATEDIFF(MINUTE,(
                                     SELECT MAX(datelastchecked)
                                     FROM   tmpMonitorAllTimeLoads
                                    ),GETDATE())
           ) < 30 
        BEGIN
            PRINT 'Job Not Running or Not Running Long Enough'
            GOTO JobNotRunning  -- don't worry about checking the job isn't running
        END
	
    SET @SubjectTxt = 'RentCom Backfill Job Is No Longer Processing Records';
    SET @MessageTxt = @SubjectTxt + CHAR(13) + CHAR(13);
    
    CREATE TABLE #tmplastCheck (
        TableName VARCHAR(50)
       ,LastROWCOUNT BIGINT);

    INSERT  INTO #tmplastCheck
            (tablename
            ,LastROWCOUNT)
            SELECT  so.name
                   ,MAX(si.rowcnt) AS rowcnt
            FROM    sysindexes si
            JOIN    sysobjects so
                    ON si.id = so.id
            WHERE   so.xtype = 'u'
                    AND so.name IN ('tbl_sum_property_status_backfill')--('tbl_dim_lease_alltime','tbl_fct_leadmessage_alltime','tbl_fct_leads_alltime')
            GROUP BY so.name;

    IF NOT EXISTS ( SELECT  t1.tablename
                    FROM    tmpMonitorAllTimeLoads t1
                    JOIN    #tmplastCheck tlc
                            ON t1.tablename = tlc.TableName
                    WHERE   t1.LastRowCnt <> tlc.LastROWCOUNT
                            AND t1.tablename IN ('tbl_sum_property_status_backfill') --('tbl_fct_leadmessage_alltime') ) 
					) 
        BEGIN
       
            PRINT 'BackFile Tables Not Being Updated Since ';
            BEGIN TRY
                EXEC msdb.dbo.sp_stop_job 
                    @job_id = @JobID--'DBB5BCBC-D7C0-4176-8A57-B5E2272A6DEB';
                SET @MessageTxt = @MessageTxt + 'Stopping Job' + CHAR(13) + CHAR(13);
            END TRY
            BEGIN CATCH
                SET @MessageTxt = @MessageTxt + 'Unable To Stop Job' + CHAR(13) + CHAR(13)
            END CATCH
            
            WAITFOR DELAY '00:00:05'  -- wait 15 seconds
            
            BEGIN TRY
                EXEC msdb.dbo.sp_start_job 
                    @job_id = @JobID--'DBB5BCBC-D7C0-4176-8A57-B5E2272A6DEB';
                SET @MessageTxt = @MessageTxt + 'Starting Job' + CHAR(13) + CHAR(13);
            END TRY
            BEGIN CATCH
                SET @MessageTxt = @MessageTxt + 'Unable To Start Job' + CHAR(13) + CHAR(13)
            END CATCH
            
            DECLARE jobcursor CURSOR
            FOR
            SELECT  t1.tablename
                   ,t1.lastrowcnt
            FROM    tmpMonitorAllTimeLoads t1
            JOIN    #tmplastCheck tlc
                    ON t1.tablename = tlc.TableName
            WHERE   t1.LastRowCnt = tlc.LastROWCOUNT 
            OPEN jobcursor
            FETCH NEXT FROM jobcursor INTO @Tablename,@LastRowCount;
            WHILE @@Fetch_status = 0 
                BEGIN
                    SET @MessageTxt = @MessageTxt + 'Table Not Updated: ' + @TableName + ', Last Row Count: ' + CAST(@LastRowCount AS VARCHAR(20)) + CHAR(13) + CHAR(13);
                    FETCH NEXT FROM jobcursor INTO @Tablename,@LastRowCount;
                END
            CLOSE jobcursor
            DEALLOCATE jobcursor
            SET @RecipientsTxt = 'cwoody@primedia.com;csmith@primedia.com;jbrennan@Primedia.com,jevans@primedia.com'   
            SET @MessageTxt = @MessageTxt + 'This report generated by sp in RentCom [Reports].[rpt_MonitorAlertAllTimeFileLoad]'
			
            EXEC msdb.dbo.sp_send_dbmail 
                @recipients = @RecipientsTxt
               ,@subject = @Subjecttxt
               ,@body = @Messagetxt
               ,@importance = 'High'
               ,@body_format = 'TEXT'        
        END

    UPDATE  tmpMonitorAllTimeLoads
    SET     lastrowcnt = tlc.lastrowcount
           ,datelastchecked = GETDATE()
    FROM    tmpMonitorAllTimeLoads t1
    JOIN    #tmplastCheck tlc
            ON t1.tablename = tlc.TableName;
               
               
    jobnotrunning:

END

GO
/****** Object:  StoredProcedure [Reports].[rpt_PropertyLeaseInfo]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select (20 * 15)/60.0
/******************************************************************************************
*
* Name:	Reports.[rpt_PropertyLeaseInfo]
*
* Desc:	
*
* Test:	exec Reports.[rpt_PropertyLeaseInfo] 443703
exec Reports.[rpt_PropertyLeaseInfo] 426335
* Hist:	01	06/17/2014	Richard Chen		Initial Version
******************************************************************************************/
CREATE  PROCEDURE [Reports].[rpt_PropertyLeaseInfo] (
    @RentPropertyID int)
AS 
BEGIN

    SET NOCOUNT ON;
	declare
	  @sql varchar(8000)

	  set @sql='select *
 from openquery(renterDB,''select l.leaseid,rwi.propertyid
                              ,r.RENTERFIRSTNAME
                              ,r.RENTERLASTNAME
                              ,rwi.COSIGNERNAME
                              ,l.LEASESTATUSREASONID
                              ,ls.leaseStatusDesc
                              ,lr.leaseReasonDesc
                              ,coalesce(l.adjustedmoveindate,rwi.MOVEINDATE) moveindate
                              ,l.CREATEDATE
                              ,invoice.invoiceid
                              ,invoice.invoiceStatus
                              ,invoice.invoiceDate
                      from renter.lease l
                        join RENTER.REWARDCARDINQUIRY rwi  on l.REWARDCARDINQUIRYID = rwi.REWARDCARDINQUIRYID
                        join renter.renter r on rwi.renterid=r.renterid
                        join renter.LEASESTATUSREASON lsr  on l.LEASESTATUSREASONID=lsr.LEASESTATUSREASONID
                        join renter.LEASEREASON lr on lsr.LEASEREASONID=lr.leasereasonid
                        join renter.LEASESTATUS ls on lsr.LEASESTATUSID=ls.LEASESTATUSID
                       LEFT JOIN renter.LeaseUsage LeaseUsage
                              ON l.LeaseID = LeaseUsage.LeaseID
                       LEFT JOIN renter.Invoice invoice
                              ON leaseUsage.InvoiceID = invoice.InvoiceID
where rwi.propertyid='+cast(@RentPropertyID as varchar(50))+'
order by l.CreateDate desc'')'
 print @sql

CREATE TABLE #PropLease(
	[LEASEID] int,
	[PROPERTYID] int,
	[RENTERFIRSTNAME] [nvarchar](80) ,
	[RENTERLASTNAME] [nvarchar](80),
	[COSIGNERNAME] [nvarchar](200),
	[LEASESTATUSREASONID] int,
	[LEASESTATUSDESC] [nvarchar](80) NOT NULL,
	[LEASEREASONDESC] [nvarchar](80) NOT NULL,
	[MOVEINDATE] [datetime2](7) NULL,
	[CREATEDATE] [datetime2](7) NOT NULL,
	[INVOICEID] [nvarchar](15) NULL,
	[INVOICESTATUS] [nvarchar](2000) NULL,
	[INVOICEDATE] [datetime2](7) NULL
) ON [PRIMARY]



   insert into #PropLease
    exec (@sql)

 select * from #PropLease

END




GO
/****** Object:  StoredProcedure [Reports].[rpt_PTE_Report_test]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Reports].[rpt_PTE_Report_test]
    (
      @StartDate AS DATETIME ,
      @EndDate AS DATETIME ,
      @ParameterType AS VARCHAR(20) ,
      @CBSA_Or_ListingID AS VARCHAR(20)
    )

/******************************************************************************************
*
* Name:	Reports.[rpt_Weekly_PTE]
*
* Desc:	this generates a report of exact target data combined with marted data
*
* Test:	
  exec Reports.[rpt_PTE_Report_test] '06/07/2015','06/13/2015','Listing','-1'
  exec Reports.[rpt_PTE_Report_test] '06/07/2015','06/13/2015','Listing','37'
  exec Reports.[rpt_PTE_Report_test] '06/01/2015','06/30/2015','CBSA','-1'
  exec Reports.[rpt_PTE_Report_test] '06/01/2015','06/30/2015','CBSA','0000'
   
select weekstartingDate, WeekEndingDate from dbautility.dimension.dates where ymdid=20150608
* Hist:	01	07/23/2015	Richard Chen		Initial Version, ticket 19523
*
******************************************************************************************/
AS 
    SET NOCOUNT ON
    BEGIN
	/*test
	DECLARE @StartDate DATETIME
	,@EndDate DATETIME
    ,@CBSACode VARCHAR(20)

	SELECT @StartDate = '04/01/2014', @EndDate = '04/30/2014',@CBSACode = '12060'
	*/

        DECLARE @StartYMDID AS INT ,
            @EndYMDID AS INT ,
            @vWhichDropDown AS VARCHAR(20)

        SET @vWhichDropDown = @ParameterType

        SELECT  @StartYMDID = YMDID
        FROM    DBAUtility.Dimension.Dates
        WHERE   Date = @StartDate

        SELECT  @EndYMDID = YMDID
        FROM    DBAUtility.Dimension.Dates
        WHERE   Date = @EndDate


        IF OBJECT_ID('tempdb..#exactTarget') IS NOT NULL 
            DROP TABLE   #exactTarget


        SELECT  cbsacode=ISNULL(zc.cbsacode,'0000') ,
                cbsaname=ISNULL(zc.cbsaname,'none'),
                p.listingid ,
                propertyID ,
                p.EmailName ,
                c.CampaignKey ,
                p.CampaignBusinessKey ,
                p.ymdid ,
                sendcount = SUM(p.sendcount) ,
                deliveredCount = SUM(p.deliveredCount) ,
                clicks = SUM(p.clicks) ,
                Opens = SUM(p.opens) ,
                clickrate = SUM(CAST(clicks AS DECIMAL(6, 2))) / SUM(sendcount)
				INTO #ExactTarget
        FROM    fact.ExactTarget_PTE p
                JOIN rentpathcube.conformed.Campaign c ON p.CampaignBusinessKey = c.CampaignBusinesskey
                LEFT JOIN ( SELECT  listingid ,
                                    propertyZipCode
                            FROM    rentpath.dimension.listings
                            UNION
                            SELECT  listingid ,
                                    zipcode
                            FROM    rentpath.Dimension.SmallPropertyListings
                          ) dl ON p.ListingID = dl.listingid
                LEFT JOIN dbautility.dbo.zipcbsa zc ON dl.PropertyZipCode = zc.zipcode
        WHERE   p.pte = 1
                AND ( ( @vWhichDropDown = 'Listing'
                        AND ( CAST(p.listingid AS VARCHAR(20)) = @CBSA_Or_ListingID
                              OR '-1' = @CBSA_Or_ListingID
                            )
                      )
                      OR ( @vWhichDropDown = 'CBSA'
                           AND ( zc.cbsacode = @CBSA_Or_ListingID
                                 OR '-1' = @CBSA_Or_ListingID
                               )
                         )
                    )
                AND ymdid BETWEEN @StartYMDID AND @EndYMDID
        GROUP BY zc.cbsacode ,
                zc.cbsaname ,
                p.listingid ,
                p.PropertyID ,
                p.EmailName ,
                c.CampaignKey ,
                p.CampaignBusinessKey ,
                p.ymdid


        SELECT  c.campaignkey ,
                c.CampaignBusinessKey ,
                c.RentPropertyID ,
                adl.listingid ,
                c.DateKey ,
                VisitCount = SUM(VisitCount) ,
                LeadTagCount = SUM(LeadTagCount) ,
                PhoneTagCount = SUM(PhoneTagCount)
        INTO    #CampaignListingTagCount
        FROM    mart.CampaignListingDaily c
                JOIN ( SELECT   listingid ,
                                RentpropertyID
                       FROM     apartmentguide.[Dimension].[AGRentCombinedDimensionListings]
                       UNION
                       SELECT   listingid ,
                                RentPropertyID = PropertyidRent
                       FROM     rentpath.dimension.smallpropertyListings
                       UNION
                       ( SELECT adl.listingid ,
                                pm.rentpropertyid
                         FROM   apartmentguide.[Dimension].[AGRentCombinedDimensionListings] adl
                                JOIN Rentcom.Dimension.PropertyMap pm ON adl.agpropertyid = pm.AGPropertyID
                       )
                     ) adl ON c.rentpropertyid = adl.rentPropertyID
        WHERE   c.datekey BETWEEN @StartYMDID AND @EndYMDID
        GROUP BY c.campaignkey ,
                c.CampaignBusinessKey ,
                c.RentPropertyID ,
                adl.listingid ,
                c.DateKey


        SELECT  listingid ,
                PropertyIDRent ,
                propertyname ,
                mgtconameRent ,
                PropertyState
        INTO    #tmpListings
        FROM    ( SELECT    listingid ,
                            PropertyIDRent ,
                            propertyname ,
                            mgtconameRent ,
                            PropertyState ,
                            rownum = ROW_NUMBER() OVER ( PARTITION BY listingid ORDER BY sorting )
                  FROM      ( SELECT    listingid ,
                                        PropertyIDRent ,
                                        propertyname ,
                                        mgtconameRent ,
                                        PropertyState ,
                                        sorting = 1
                              FROM      rentpath.dimension.listings
                              UNION
                              SELECT    listingid ,
                                        PropertyIDRent ,
                                        PropertyName ,
                                        MgtCoName ,
                                        PropertyState ,
                                        sorting = 2
                              FROM      rentpath.Dimension.SmallPropertyListings
                            ) v
                ) v1
        WHERE   rownum = 1


        SELECT  lm.CBSACode,
		        lm.emailname ,
                dl.PropertyName ,
                dl.MgtCoNameRent ,
                dl.PropertyState ,
                lm.YMDID ,
                lm.sendcount ,
                lm.deliveredCount ,
                lm.Clicks ,
                lm.clickrate ,
                lm.listingid ,
                lm.propertyID ,
                dl.PropertyIDRent ,
                WebLogListingID = c.RentpropertyID ,
                lm.CampaignKey ,
                c.PhoneTagCount ,
                c.LeadTagCount ,
                c.VisitCount ,
                lm.CBSAName
        FROM    #ExactTarget lm
                LEFT JOIN #tmpListings dl ON lm.listingid = dl.listingid
                LEFT JOIN #CampaignListingTagCount c ON lm.listingid = CAST(c.listingID AS INT)
		--ON CAST(lm.propertyid AS VARCHAR(20))=c.RentPropertyID
                                                        AND lm.CampaignBusinessKey = c.CampaignBusinessKey
                                                        AND lm.ymdid = c.DateKey
		--AND lm.ymdid=c.Datekey
--	JOIN ApartmentGuide.mart.Listings ml
--		ON dl.listingid = ml.listingid
--	JOIN ApartmentGuide.Dimension.ListingMarket dlm
--		ON ml.ListingID = dlm.ListingID
	--WHERE ml.YMDID = CAST(CONVERT(VARCHAR,lm.senddate,112) AS INT)
	--AND ISNUMERIC(lm.listingid) = 1
	--AND (@CBSACode = -1 OR zc.CBSACode = @CBSACode)
        ORDER BY lm.listingid ,
                lm.ymdid




    END


GO
/****** Object:  StoredProcedure [Reports].[rpt_Rent_AdStore_Daily]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Reports].[rpt_Rent_AdStore_Daily] (
    @StartDate AS DATE
   ,@EndDate AS DATE)

/******************************************************************************************
*
* Name:	Reports.rpt_Rent_AdStore_Daily
*
* Desc:	Daily Revenue Report for the Rent Small Properties ad store
*
* Test:	EXEC Reports.rpt_Rent_AdStore_Daily '05-Mar-2015' ,'09-MAR-2015'
*
*
* Hist:	01	10/23/2013	Shetal Gandhi		Ticket 13549 - Initial Version
* 
******************************************************************************************/
AS 
SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
                
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcsNoTemp 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = 'Reports.rpt_Rent_AdStore_Daily'
       , -- varchar(128)
        @StepName = 'Execute Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Execute Procedure, RPTProd Linked Server Tables, ar_invioces,mdimprop,dimprop,company'; -- varchar(500)

DECLARE @StartCharYMDID AS VARCHAR(8)
   ,@EndCharYMDID AS VARCHAR(8)
   ,@SQL VARCHAR(8000)


		
SELECT  @StartCharYMDID = CAST(CAST(CONVERT(VARCHAR(8),@StartDate,112) AS INT) AS VARCHAR)
       ,@EndCharYMDID = CAST(CAST(CONVERT(VARCHAR(8),@EndDate,112) AS INT) AS VARCHAR) 


BEGIN TRY
    DROP TABLE #TempA
END TRY
BEGIN CATCH 
END CATCH



CREATE TABLE #TempA (
    RecordCreateDM INT
   ,PropertyID INT
   ,PropertyName VARCHAR(100)
   ,PropertyCity VARCHAR(50)
   ,PropertyState VARCHAR(50)
   ,MarketName VARCHAR(50)
   ,PropertyStatus VARCHAR(50))

SET @SQL = N'
insert into #TempA
select	RecordCreateDM,PropertyID, PropertyName, PropertyCity, PropertyState, MarketName,PropertyStatus
FROM   OPENQUERY([RPTPROD],''

		select  CAST(to_char(mp.record_create_dm,''''yyyymmdd'''') AS INTEGER) as RecordCreateDM,
							   mp.Property_ID AS PropertyID,
							   mp.property_nm as PropertyName,
							   mp.city_nm as PropertyCity,
							   mp.state_cd as PropertyState,
							   mp.market_nm as MarketName,
							   mp.property_status as PropertyStatus
						from reports.tbl_mdim_property  MP
						JOIN reports.tbl_dim_property DP
							 on mp.Property_ID = dp.Property_ID
						where (CAST(to_char(mp.record_create_dm,''''yyyymmdd'''') AS INTEGER)  >= ' + @StartCharYMDID + '
						and CAST(to_char(mp.record_create_dm,''''yyyymmdd'''') AS INTEGER)  <= ' + @EndCharYMDID + ')
		--and mp.property_status = ''''Active''''
						and dp.Businessmodel_Tp = ''''plt''''

				
'')'

EXEC(@SQL)

CREATE INDEX idx_Temp_PropID ON #TempA(PropertyID)

SET @SQL = N'
select distinct mp.PropertyID, 
				mp.PropertyName, 
				mp.PropertyCity, 
				mp.PropertyState, 
				mp.MarketName,
				mp.PropertyStatus,
				p.InvoiceID,
				p.InvoiceAmount
from #TempA as mp
JOIN OPENQUERY(RPTPROD,''
			select NVL(TransDate, CAST(to_char(ai.Invoice_DM,''''yyyymmdd'''') AS INTEGER)) as TransDate, 
								   dc.company_id AS AccountNumber,
								   dc.company_nm AS AccountName, 
								   dc.address_nm AS AccountAddress, 
								   dc.zip_cd AS AccountZipCode, 
								   dc.phone_cd AS AccountPhone1, 
								   dc.city_nm AS AccountCity,
								   dc.state_cd AS AccountStateCode,
								   dc.billing_tp as BillingMethod,
								   ai.Invoice_ID as InvoiceID,
								   ai.invoice_at as InvoiceAmount,
								   ai.Property_ID as PropertyID
			FROM reports.tbl_fct_ar_invoices  AI
			JOIN reports.tbl_dim_company DC
				on DC.Company_Id = ai.Company_ID
			LEFT JOIN (select Invoice_ID, CAST(to_char(t.Create_DM,''''yyyymmdd'''') AS INTEGER) AS TransDate 
					   FROM reports.tbl_fct_cctransactionpayment tp
					   JOIN reports.tbl_fct_cctransaction t
							on t.cctransaction_id = tp.cctransaction_id    
					   ) tp
						 on tp.Invoice_ID = AI.Invoice_ID     
			JOIN reports.tbl_dim_company DC
				on DC.Company_Id = ai.Company_ID
			where (NVL(TransDate, CAST(to_char(ai.Invoice_DM,''''yyyymmdd'''') AS INTEGER))  >= ' + @StartCharYMDID + '
									and NVL(TransDate, CAST(to_char(ai.Invoice_DM,''''yyyymmdd'''') AS INTEGER))  <= ' + @EndCharYMDID + ')
			 '') p
			on p.PropertyID = mp.PropertyID
			' 

EXEC(@SQL)

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [Reports].[rpt_Rent_PageContent_Dashboard_HEADER]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Reports].[rpt_Rent_PageContent_Dashboard_HEADER]
      @StartDate date = NULL
AS
/******************************************************************************************
* Name: Reports.rpt_Rent_PageContent_Dashboard_HEADER
* -----------------------------------------------------------------------------------------
* -----------------------------------------------------------------------------------------
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* NOTE: IF YOU CHANGE THIS REPORT YOU HAVE TO CHANGE THE DATA IN THE MAIN PROC!!! 
*       Reports.rpt_Rent_PageContent_Dashboard
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* -----------------------------------------------------------------------------------------
* -----------------------------------------------------------------------------------------
* Desc: This stored procedure dynamcially pivots out selected data for Rent visits. Because
*       the columns are dynamically created, there isn't a header row associated with the actual 
*       column values. This can be done within this proc, but it requires the numeric values be 
*       casted as varchar, and that wasn't an option for this report. So, this proc is used in
*       conjunction with Reports.rpt_Rent_PageContent_Dashboard. This report is only the dynamic
*       column headings,  Reports.rpt_Rent_PageContent_Dashboard returns the data. Just run
*       them with the same date param.
* -----------------------------------------------------------------------------------------
* Test: EXEC Reports.rpt_Rent_PageContent_Dashboard_HEADER '01/18/2014'
* -----------------------------------------------------------------------------------------
* Hist:    
* 01    06/27/2013    Mary Pollard    Initial Version
******************************************************************************************/
SET NOCOUNT ON

------------------------------------------------------------------------
--- drop temp tables
------------------------------------------------------------------------
IF OBJECT_ID('tempdb..#Output') IS NOT NULL 
   DROP TABLE #Output
IF OBJECT_ID('tempdb..#outputHeader') IS NOT NULL 
   DROP TABLE #outputHeader


IF @StartDate IS NULL SET @StartDate = DATEADD(dd,-1,getdate())

------------------------------------------------------------------------
-- declare & set variables
------------------------------------------------------------------------
DECLARE @SQL varchar(4000),
        @startYMDID int,
        @sevenWeeksBack date,
        @sevenWeeksBackYMDID int,
        @pivotWeeks varchar(3000),
        @pivotWeeks_v varchar(3000),
        @pivotWeeks_rr varchar(3000),
        @pivotWeeks_vp varchar(3000),
        @pivotWeeks_l varchar(3000),
        @pivotWeeks_nrl varchar(3000)

SET @startYMDID = CONVERT(varchar,@StartDate,112)
---Set the beginning of the week, six weeks back
SET @sevenWeeksBack = CONVERT(date,DATEADD(DD, 1 - DATEPART(DW, DATEADD(wk,-7,@StartDate)), DATEADD(wk,-7,@StartDate)))
SET @sevenWeeksBackYMDID = CONVERT(varchar,@sevenWeeksBack,112)


/**********************************************************************************************************
----                               * O * U * T * P * U * T *
**********************************************************************************************************/

        ------------------------------------------------------------------------
        --- build the string of first days of the week for the time period.
        --- This will be used in the dynamic pivot statment later on.
        ------------------------------------------------------------------------
        SELECT @pivotWeeks =
        (SELECT YMDID = 
        Stuff((SELECT '],[' + YMDID AS [text()] 
                FROM   
                (SELECT DISTINCT
                        YMDID YMDID2,
                        CONVERT(varchar,CONVERT(date,CONVERT(varchar,YMDID)),101) YMDID
                 FROM   dbautility.dimension.dates
                 WHERE  YMDID between @sevenWeeksBackYMDID and @startYMDID
                 AND    DayOfWeekNum = 1
                    ) x
                 ORDER  BY YMDID2
                For XML PATH ('')),1,1,'') )

        SELECT @pivotWeeks = SUBSTRING(@pivotWeeks,2,1000)+']'

        ------------------------------------------------------------------------
        -- Build the columns for each of the three pivot sections 
        ---    Visits (v), Registered Renter (rr), Visitor Prospect (vp)
        ------------------------------------------------------------------------
        SET @pivotWeeks_v  = REPLACE(@pivotWeeks,']','_v]')
        SET @pivotWeeks_rr = REPLACE(@pivotWeeks,']','_rr]')
        SET @pivotWeeks_vp = REPLACE(@pivotWeeks,']','_vp]')
        SET @pivotWeeks_l = REPLACE(@pivotWeeks,']','_l]')
        SET @pivotWeeks_nrl = REPLACE(@pivotWeeks,']','_nrl]')


        /*
        select @pivotWeeks_v
        select @pivotWeeks_rr
        select @pivotWeeks_vp
        */


        ------------------------------------------------------------------------
        --- create temp table for 6 weeks back with all the columns that will be
        ---- returned from the three pivots
        ------------------------------------------------------------------------
        --CREATE TABLE #output (
        --       ContentGroupName varchar(2000),
        --       Week06_V float,
        --       Week05_V float,
        --       Week04_V float,
        --       Week03_V float,
        --       Week02_V float,
        --       Week01_V float,
        --       WeekCur_V float,
        --       ContentGroupName2 varchar(2000),
        --       Week06_RR float,
        --       Week05_RR float,
        --       Week04_RR float,
        --       Week03_RR float,
        --       Week02_RR float,
        --       Week01_RR float,
        --       WeekCur_RR float,
        --       ContentGroupName3 varchar(2000),
        --       Week06_VP float,
        --       Week05_VP float,
        --       Week04_VP float,
        --       Week03_VP float,
        --       Week02_VP float,
        --       Week01_VP float,
        --       WeekCur_VP float,
        --       ContentGroupName4 varchar(2000),
        --       Week06_l float,
        --       Week05_l float,
        --       Week04_l float,
        --       Week03_l float,
        --       Week02_l float,
        --       Week01_l float,
        --       WeekCur_l float)

        CREATE TABLE #outputheader (
               ContentGroupParent varchar(2000),
               ContentGroupParentOrder varchar(65),
               ContentGroupName varchar(2000),
               Week07_V varchar(65),
               Week06_V varchar(65),
               Week05_V varchar(65),
               Week04_V varchar(65),
               Week03_V varchar(65),
               Week02_V varchar(65),
               Week01_V varchar(65),
               WeekCur_V varchar(65),
               ContentGroupParent2 varchar(2000),
               ContentGroupParentOrder2 varchar(65),
               ContentGroupName2 varchar(2000),
               Week07_RR varchar(65),
               Week06_RR varchar(65),
               Week05_RR varchar(65),
               Week04_RR varchar(65),
               Week03_RR varchar(65),
               Week02_RR varchar(65),
               Week01_RR varchar(65),
               WeekCur_RR varchar(65),
               ContentGroupParent3 varchar(2000),
               ContentGroupParentOrder3 varchar(65),
               ContentGroupName3 varchar(2000),
               Week07_VP varchar(65),
               Week06_VP varchar(65),
               Week05_VP varchar(65),
               Week04_VP varchar(65),
               Week03_VP varchar(65),
               Week02_VP varchar(65),
               Week01_VP varchar(65),
               WeekCur_VP varchar(65),
               ContentGroupParent4 varchar(2000),
               ContentGroupParentOrder4 varchar(65),
               ContentGroupName4 varchar(2000),
               Week07_l varchar(65),
               Week06_l varchar(65),
               Week05_l varchar(65),
               Week04_l varchar(65),
               Week03_l varchar(65),
               Week02_l varchar(65),
               Week01_l varchar(65),
               WeekCur_l varchar(65),
               ContentGroupParent5 varchar(2000),
               ContentGroupParentOrder5 varchar(65),
               ContentGroupName5 varchar(2000),
               Week07_nrl varchar(65),
               Week06_nrl varchar(65),
               Week05_nrl varchar(65),
               Week04_nrl varchar(65),
               Week03_nrl varchar(65),
               Week02_nrl varchar(65),
               Week01_nrl varchar(65),
               WeekCur_nrl varchar(65))



        ---Build and insert the header row
        SET @sql = 'INSERT INTO #outputHeader VALUES(''GroupName'',''GroupNumber'',''ContentGroup'','+REPLACE(REPLACE(@pivotWeeks,'[','''Week of ['),']',']''')
                                                  +','''','''',''CG2'','+REPLACE(REPLACE(@pivotWeeks_rr,'[','''['),']',']''')
                                                  +','''','''',''CG3'','+REPLACE(REPLACE( @pivotWeeks_vp,'[','''['),']',']''')
                                                  +','''','''',''CG4'','+REPLACE(REPLACE( @pivotWeeks_l,'[','''['),']',']''')
                                                  +','''','''',''CG5'','+REPLACE(REPLACE( @pivotWeeks_nrl,'[','''['),']',']''')  +')'


        EXEC(@sql)

        ---Build and insert the 2nd header row
        INSERT INTO #outputHeader VALUES('','','','Visits','Visits','Visits','Visits','Visits','Visits','Visits','Visits'
                                        ,'','','CG2','RR','RR','RR','RR','RR','RR','RR','RR'
                                        ,'','','CG3','VP','VP','VP','VP','VP','VP','VP','VP'
                                        ,'','','CG4','Hot Leads','Hot Leads','Hot Leads','Hot Leads','Hot Leads','Hot Leads','Hot Leads','Hot Leads'
                                        ,'','','CG5','NRL','NRL','NRL','NRL','NRL','NRL','NRL','NRL')


    SELECT 0 SortOrder,
           @sevenWeeksBackYMDID BeginYMDID,
           @startYMDID EndYMDID,
           @sevenWeeksBack StartDate,
           @StartDate EndDate,
           ContentGroupParentOrder,
           ContentGroupParent,
           ContentGroupName ContentGroup,
           ---7 weeks back
           Week07_NRL,
           'RR/NRL'  [Week07_RR/NRL],
           Week07_L,
           Week07_V,
           Week07_RR,
           Week07_VP,
           'VP/RR'  [Week07_VP/RR],
           '%Chg Visits' Week07_Change_V,
           '%Chg RR' Week07_Change_RR,
           '%Chg Leads' Week07_Change_L,
           ---6 weeks back
           Week06_NRL,
           'RR/NRL'  [Week06_RR/NRL],
           Week06_L,
           Week06_V,
           Week06_RR,
           Week06_VP,
           'VP/RR'  [Week06_VP/RR],
           '%Chg Visits' Week06_Change_V,
           '%Chg RR' Week06_Change_RR,
           '%Chg Leads' Week06_Change_L,
           ---5 weeks back
           Week05_NRL,
           'RR/NRL'  [Week05_RR/NRL],
           Week05_L,
           Week05_V,
           Week05_RR,
           Week05_VP,
           'VP/RR'  [Week05_VP/RR],
           '%Chg Visits' Week05_Change_V,
           '%Chg RR' Week05_Change_RR,
           '%Chg Leads' Week05_Change_L,
           ---4 weeks back
           Week04_NRL,
           'RR/NRL'  [Week04_RR/NRL],
           Week04_L,
           Week04_V,
           Week04_RR,
           Week04_VP,
           'VP/RR'  [Week04_VP/RR],
           '%Chg Visits' Week04_Change_V,
           '%Chg RR' Week04_Change_RR,
           '%Chg Leads' Week04_Change_L,
           ---3 weeks back
           Week03_NRL,
           'RR/NRL'  [Week03_RR/NRL],
           Week03_L,
           Week03_V,
           Week03_RR,
           Week03_VP,
           'VP/RR'  [Week03_VP/RR],
           '%Chg Visits' Week03_Change_V,
           '%Chg RR' Week03_Change_RR,
           '%Chg Leads' Week03_Change_L,
           ---2 weeks back
           Week02_NRL,
           'RR/NRL'  [Week02_RR/NRL],
           Week02_L,
           Week02_V,
           Week02_RR,
           Week02_VP,
           'VP/RR'  [Week02_VP/RR],
           '%Chg Visits' Week02_Change_V,
           '%Chg RR' Week02_Change_RR,
           '%Chg Leads' Week02_Change_L,
           ---1 weeks back
           Week01_NRL,
           'RR/NRL'  [Week01_RR/NRL],
           Week01_L,
           Week01_V,
           Week01_RR,
           Week01_VP,
           'VP/RR'  [Week01_VP/RR],
           '%Chg Visits' Week01_Change_V,
           '%Chg RR' Week01_Change_RR,
           '%Chg Leads' Week01_Change_L,
           ---Current week
           WeekCur_NRL,
           'RR/NRL'  [WeekCur_RR/NRL],
           WeekCur_L,
           WeekCur_V,
           WeekCur_RR,
           WeekCur_VP,
           'VP/RR' [WeekCur_VP/RR],
           '%Chg Visits' WeekCur_Change_V,
           '%Chg RR' WeekCur_Change_RR,
           '%Chg Leads' WeekCur_Change_L
    FROM   #outputheader
    ORDER  BY SortOrder


SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [Reports].[rpt_RentCom_Leads_ByMonth]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Reports].[rpt_RentCom_Leads_ByMonth] (
      @beginDate date = NULL,
      @endDate date = NULL)
AS 
/***********************************************************************************************************************
* Name:   reports.rpt_RentCom_Leads_ByMonth
* -----------------------------------------------------------------------------------------------------------------------
* Desc:   Grab Rent.com leads by month. This proc counts leads like AG counts leads... each lead-to-property communication
*         counts as 1 lead for each instance as opposed to Rent.com's definition of a lead that is one lead-to-property
*         communication is 1 lead even if there are multiple contacts.
* -----------------------------------------------------------------------------------------------------------------------
* Test:   EXEC Reports.rpt_RentCom_Leads_ByMonth 
*         EXEC Reports.rpt_RentCom_Leads_ByMonth '11/05/2013','11/11/2013'
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 
* 01   06/05/2013   Mary Pollard    Ticket #12566. Initial Version created from code in ticket #12364. 
*                                      Proc created on the Warehouse side becaue I anticipate this proc being added 
*                                      to, to join to AG lead info.
*
***********************************************************************************************************************/
SET NOCOUNT ON;

--------------------------------------------
--- declare & set variables
--------------------------------------------
DECLARE @SQL varchar(4000)

--------------------------------------------
--- set default dates
--------------------------------------------
IF @beginDate IS NULL
BEGIN
    SELECT @beginDate = CONVERT(date,LastMonthStartDate),
           @endDate = CONVERT(date,LastMonthEndDate)
    FROM   DBAUtility.dimension.dates
    WHERE  YMDID = CONVERT(varchar,getdate(),112)
END

--------------------------------------------
--- create output table
--------------------------------------------
CREATE TABLE #output (
       BeginDate varchar(25),
       EndDate varchar(25),
       LeadMonth varchar(25),
       LeadMonthDate varchar(25),
       Month_DM varchar(25),
       TotalPhone int,
       TotalHotLeads int)


--------------------------------------------
--- get rent.com leads
--------------------------------------------
SELECT @SQL = 
'SELECT '''+CONVERT(varchar,@beginDate,101)+''' BeginDate,
       '''+CONVERT(varchar,@endDate,101)+''' EndDate,
       MonthName LeadMonth,
       MonthDate LeadMonthDate,
       Month_DM,
       PhoneCallsTotalAT TotalPhone,
       HLTotalAT TotalHotLeads
FROM   OPENQUERY(RPTPROD,
''SELECT COALESCE(TO_CHAR(ld.Month_DM,''''MON-YYYY''''),TO_CHAR(lp.Month_DM,''''MON-YYYY'''')) AS MonthName,
         COALESCE(ld.Month_DM,lp.Month_DM) AS MonthDate,
         COALESCE(ld.Month_DM,lp.Month_DM) AS Month_DM,
         NVL(ld.TotalPhoneCalls,0) + NVL(lp.LocalPhoneCalls,0) AS PhoneCallsTotalAT,
         NVL(ld.HLTotalAT,0) AS HLTotalAT
FROM (
          SELECT TRUNC(d.Day,''''MM'''') AS Month_DM,
                 SUM(d.HLTotalAT) AS HLTotalAT,
                 SUM(d.PhoneCallsTotalAT) AS TotalPhoneCalls
          FROM (
                    SELECT TRUNC(lm.Create_DM) AS Day,
                           lm.Property_ID,
                           COUNT(CASE WHEN lm.Source_TP = ''''hotlead''''
                                      THEN 1
                                      END)  AS HLTotalAT,
                           COUNT(CASE WHEN lm.Source_TP = ''''phone''''
                                      THEN 1
                                      END) AS PhoneCallsTotalAT
                    FROM   Reports.TBL_FCT_LEADMESSAGE lm
                           INNER JOIN Reports.TBL_DIM_PROPERTY dp
                              ON lm.Property_ID = dp.Property_ID
                    WHERE   lm.Create_DM >= TO_DATE('''''+CONVERT(varchar,@beginDate,101)+''''',''''MM/DD/YYYY'''')
                    AND     lm.Create_DM < TO_DATE('''''+CONVERT(varchar,@endDate,101)+''''',''''MM/DD/YYYY'''')
                    AND     lm.Recipient_TP = ''''property'''' 
                    GROUP   BY TRUNC(lm.Create_DM)
                            ,lm.Property_ID
                    ) d
          GROUP BY TRUNC(d.Day,''''MM'''') 
          ) ld
    FULL OUTER JOIN (
             SELECT TRUNC(TRUNC(cd.Date_Call_Started),''''MM'''') AS Month_DM
                   ,COUNT(CD.CALL_DETAIL_RECORD_ID)  AS LocalPhoneCalls
             FROM   Reports.FCT_call_detail_records_t cd
                    INNER JOIN Reports.TBL_DIM_PROPERTY dp
                      ON cd.Property_ID = dp.Property_ID
             WHERE  cd.Date_Call_Started >= TO_DATE('''''+CONVERT(varchar,@beginDate,101)+''''',''''MM/DD/YYYY'''')
             AND    cd.Date_Call_Started < TO_DATE('''''+CONVERT(varchar,@endDate,101)+''''',''''MM/DD/YYYY'''')
             GROUP  BY TRUNC(TRUNC(cd.Date_Call_Started),''''MM'''')
          ) lp
      ON ld.Month_DM = lp.Month_DM ''
) RentLeads
ORDER  BY Month_DM'


--------------------------------------------
--- execute the sql and insert into output table
--------------------------------------------
INSERT INTO #output
EXEC(@SQL)


--------------------------------------------
--- select out resultset
--------------------------------------------
SELECT BeginDate,
       EndDate,
       LeadMonth,
       LeadMonthDate,
       Month_DM,
       TotalPhone,
       TotalHotLeads
FROM   #output
ORDER  BY Month_DM




SET NOCOUNT OFF;



GO
/****** Object:  StoredProcedure [Reports].[rpt_RentPathWebSiteDetail_alt]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/******************************************************************************************
*
* Name:	Reports.rpt_RentPathWebSiteDetail_alt
*
* Desc:	This provides the Website Matix information in the RentPath DailyFeedData Report
*			the report is under reports.primedia.com Rent consumer marketing and is DailyFeedData_RentCom
*
* Test:	exec reports.rpt_RentPathWebSiteDetail_alt '2016/08/21','2016/09/12' -- 110 in 14 seconds
*   exec reports.[rpt_RentPathWebSiteDetail_altCWLink20160826] '2016/08/21','2016/08/25' -- 110 19 seconds
* Note:
*
* Hist:	01	08/24/2015	Clinton Woody		Initial Version, ticket # 19977
* Hist:	02	09/15/2015	Clinton Woody		ticket # 19977 split Non Campaign to Non and No Campaign
*								first section that is the Website Data
*
* Hist:	03	03/14/2016	Clinton Woody		ticket # added email status =1
* 04	8/29/2016	  Clinton Woody		use aps linked server #23874 
* 05	10/28/2016	  Bob Langley			Ticket 24212 - Changed to add MissedCalls to leads (where does connectedcalls)
found we can use aps link model to get rent leads visits based upon visits and sessionid
******************************************************************************************/
CREATE PROCEDURE [Reports].[rpt_RentPathWebSiteDetail_alt]
    (
      @StartDate AS DATETIME = NULL ,
      @EndDate AS DATETIME = NULL
    )
WITH RECOMPILE AS
    BEGIN
        SET NOCOUNT ON;
        SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;


--DECLARE @StartDate AS DATETIME, @EndDate AS DATETIME
--SELECT @StartDate = '08/21/2016', @EndDate = '08/21/2016'


        DECLARE @StartYMDID AS INT ,
            @EndYMDID AS INT;
	      

        SET @StartDate = ISNULL(@StartDate,
                                ( SELECT    MonthStartDate
                                  FROM      DBAUtility.Dimension.Dates
                                  WHERE     CONVERT(VARCHAR(6), GETDATE(), 112)
                                            + '01' = YMDID
                                ));

        SET @EndDate = ISNULL(@EndDate, GETDATE());
        SET @StartYMDID = CAST(CONVERT(VARCHAR(8), @StartDate, 112) AS INT);
        SET @EndYMDID = CAST(CONVERT(VARCHAR(8), @EndDate, 112) AS INT);

        BEGIN TRY
            DROP TABLE #tmpvisits;
        END TRY
        BEGIN CATCH
        END CATCH;

		CREATE TABLE #tmpvisits (
		datekey INT
		,screentypekey INT
		,visit varchar(255)
		)

		INSERT INTO #tmpVisits
		EXEC('SELECT  datekey ,
                ve.screentypekey ,
                v.visit COLLATE SQL_Latin1_General_CP1_CI_AS AS visit
        FROM    dimensionalmodelweb.fact.visitevent ve
                JOIN DimensionalModelWeb.Conformed.tVisit v ON ve.VisitKey = v.visitkey
        WHERE   ve.datekey BETWEEN ' + @StartYMDID + ' AND ' + @EndYMDID + '
                AND profilekey = 3
				and emailleadtagcount>0') at APS_Link

        SELECT  DateOf ,
                'WEBSITE' AS Metrix ,
                'Phone' AS LeadType ,
                Campaign ,
                Device ,
                PropSize ,
                'Rent' AS LeadSource ,
                COUNT(Call) AS CountOf ,
                2 AS OriginalOrder
        FROM    ( SELECT    CAST(CONVERT(DATE, d.YMDDate, 101) AS CHAR(10))
                            + ' ' + d.DayShortName AS DateOf ,
                            CASE WHEN ISNULL(dl.ListingID, 0) = 0 THEN 'Small'
                                 ELSE 'large'
                            END AS PropSize ,
                            CASE WHEN crc.CallType IN ( 'MOBILESEM', 'SEM' )
                                 THEN 'Campaign'
                                 ELSE 'Non Campaign'
                            END AS Campaign ,
                            CASE WHEN crc.CallType IN ( 'oneweb', 'sem' )
                                 THEN 'Desktop'
                                 ELSE 'Mobile'
                            END AS Device ,
                            1 AS Call
                  FROM      RentCom.Fact.CallsRentcom crc WITH ( NOLOCK )
                            JOIN DBAUtility.Dimension.Dates d ON d.YMDID = crc.YMDID
                            LEFT OUTER JOIN RentCom.Dimension.Listings dl WITH ( NOLOCK ) ON crc.ListingID = dl.ListingID
                  WHERE     crc.YMDID BETWEEN @StartYMDID AND @EndYMDID
                            AND crc.CallStatus IN (1,2,3)		--Ticket 24212 added missed calls to connected
                ) a
        GROUP BY DateOf ,
                PropSize ,
                Campaign ,
                Device ,
                DateOf
        UNION
        SELECT  CAST(CONVERT(DATE, d.YMDDate, 101) AS CHAR(10)) + ' '
                + d.DayShortName AS DateOf ,
                'WEBSITE' AS Metrix ,
                'Email' AS LeadType ,
                CASE WHEN ISNULL(dc.IsPaid, 9) = 1 THEN 'Campaign'
                     WHEN ISNULL(dc.IsPaid, 9) = 9 THEN 'No Campaign'
                     ELSE 'Non Campaign'
                END AS Campaign ,
                CASE WHEN ISNULL(ScreenTypeKey, 1) = 1 THEN 'Desktop'
                     ELSE 'Mobile'
                END AS Device -- 5 = kilo
                ,
                CASE WHEN ListingLeadType IN ( 'AG Rent Syndication Emails',
                                               'Rentcom Email' ) THEN 'Large'
                     ELSE 'Small'
                END AS PropSize ,
                CASE WHEN ListingLeadType = 'AG Rent Syndication Emails'
                     THEN 'AG'
                     WHEN ListingLeadType = 'Lovely Rent Syndication Emails'
                     THEN 'Lovely'
                     WHEN ListingLeadType = 'Rentals Rent Syndication Emails'
                     THEN 'Rentals'
                     WHEN ListingLeadType = 'RentalHouses Rent Syndication Emails'
                     THEN 'RentalHouses'
                     WHEN ListingLeadType IN ( 'Rentcom Email',
                                               'Rentals Rent Syndication Emails' )
                     THEN 'Rent'
                     ELSE 'Unknown'
                END AS LeadSource ,
                COUNT(1) AS CountOf ,
                1 AS OriginalOrder
        FROM    RentCom.Fact.vw_RentEmailLeads_alt el WITH ( NOLOCK )
                JOIN DBAUtility.Dimension.Dates d ON d.YMDID = el.YMDID
                LEFT OUTER JOIN ApartmentGuide.Dimension.Campaign dc WITH ( NOLOCK ) ON dc.CampaignID = el.CampaignID
                LEFT OUTER JOIN #tmpVisits ve ON ve.Visit =el.SessionID
                                                              AND ve.DateKey = el.YMDID
        WHERE   el.YMDID BETWEEN @StartYMDID AND @EndYMDID
                AND el.Source = 'Rent'
                AND el.Status = 1
        GROUP BY d.YMDDate ,
                CASE WHEN el.ListingLeadType IN ( 'AG Rent Syndication Emails',
                                                  'Rentcom Email' )
                     THEN 'Large'
                     ELSE 'Small'
                END ,
                CASE WHEN el.ListingLeadType = 'AG Rent Syndication Emails'
                     THEN 'AG'
                     WHEN el.ListingLeadType = 'Lovely Rent Syndication Emails'
                     THEN 'Lovely'
                     WHEN el.ListingLeadType = 'Rentals Rent Syndication Emails'
                     THEN 'Rentals'
                     WHEN el.ListingLeadType = 'RentalHouses Rent Syndication Emails'
                     THEN 'RentalHouses'
                     WHEN el.ListingLeadType IN ( 'Rentcom Email',
                                                  'Rentals Rent Syndication Emails' )
                     THEN 'Rent'
                     ELSE 'Unknown'
                END ,
                ISNULL(dc.IsPaid, 9)          
                ,
                CASE WHEN ISNULL(ve.ScreenTypeKey, 1) = 1 THEN 'Desktop'
                     ELSE 'Mobile'
                END ,
                d.DayShortName
        ORDER BY 1 ,
                3 ,
                4 ,
                5 ,
                6 ,
                7;

    END;



GO
/****** Object:  StoredProcedure [Reports].[rpt_RevAndLeadsByCityState]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Reports].[rpt_RevAndLeadsByCityState]
/******************************************************************************************
*
* Name: Reports.rpt_RevAndLeadsByCityState
*
* Desc:	Reports.rpt_RevAndLeadsByCityState
*
* Test:	EXEC Reports.rpt_RevAndLeadsByCityState
*
* Hist:	01	05/06/2014	Don Wert		Initial Version, ticket 15379
******************************************************************************************/
AS
SET NOCOUNT ON

BEGIN

		SELECT COALESCE(rev.City,lds.City) AS City
			   ,COALESCE(rev.STATE,lds.State) AS State
			   ,ISNULL(rev.InvoiceAmount,0) AS InvoiceAmount_0to60Days
			   ,ISNULL(rev.InvoiceAdjustments,0) AS InvoiceAdjustments_0to60Days
			   ,ISNULL(rev.NetInvoiceAmount,0) AS NetInvoicedAmount_0to60Days
			   ,ISNULL(rew.RewardCardAmount,0) AS RewardCardAmount_0to60Days
			   ,ISNULL(rev.NetInvoiceAmount,0)-ISNULL(rew.RewardCardAmount,0) AS Revenue_0to60Days
			   ,ISNULL(rev.InvoicePayments,0) AS InvoicePayments_0to60Days
			   ,lds.AllLeads AS AllLeads_30to90Days
		FROM (
			--revenue by month by city
			SELECT ISNULL(PropertyCity,'Unknown') AS City
			,ISNULL(PropertyState,'Unknown') AS STATE
			,SUM(InvoiceAmount) AS InvoiceAmount
			,SUM(Adjustments) AS InvoiceAdjustments
			,SUM(InvoiceAmount)-SUM(Adjustments) AS NetInvoiceAmount
			,SUM(Payments) AS InvoicePayments
			FROM (
				SELECT CAST(LEFT(di.DocDateYMDID,6) AS INT) AS YearMonth
				,dl.PropertyCity
				,dl.PropertyState
				,di.InvoiceAmount
				,di.Adjustments
				,di.Payments
				FROM RentCom.Dimension.Invoices di
				LEFT JOIN ApartmentGuide.Dimension.AGRentCombinedDimensionListings dl
					ON di.PropertyID = dl.RentPropertyID
					AND dl.Website = 'rent'
				WHERE DocDateYMDID >= CAST(CONVERT(VARCHAR,DATEADD(dd,-60,GETDATE()),112) AS INT)
			) inv
			GROUP BY ISNULL(PropertyCity,'Unknown')
			,ISNULL(PropertyState,'Unknown')
		) rev
		LEFT JOIN (--breaking out reward cards here catches reward cards issued on properties that have no revenue in the reporting months
			SELECT dl.PropertyCity
				,dl.PropertyState
				,SUM(rc.Amount) AS RewardCardAmount
			FROM rentcom.Mart.RewardCards rc
			JOIN ApartmentGuide.Dimension.AGRentCombinedDimensionListings dl
				ON rc.PropertyID = dl.RentPropertyID
			WHERE rc.YMDID >= CAST(CONVERT(VARCHAR,DATEADD(dd,-60,GETDATE()),112) AS INT)
			GROUP BY dl.PropertyCity
				,dl.PropertyState
		) rew
			ON rev.City = rew.PropertyCity
			AND rev.STATE = rew.PropertyState
		FULL OUTER JOIN (
			--leads
			SELECT ISNULL(dl.PropertyCity,'Unknown') AS City
			,ISNULL(dl.PropertyState,'Unknown') AS State
			,SUM(AllLeads) AS AllLeads
			FROM ApartmentGuide.mart.AGRentCombinedMartListings ml
			JOIN ApartmentGuide.Dimension.AGRentCombinedDimensionListings dl
				ON ml.RentPropertyID = dl.RentPropertyID
				AND ml.Website = dl.Website
			WHERE ml.Website = 'rent'
			AND ml.YMDID BETWEEN CAST(CONVERT(VARCHAR,DATEADD(dd,-90,GETDATE()),112) AS INT) AND CAST(CONVERT(VARCHAR,DATEADD(dd,-30,GETDATE()),112) AS INT)
			GROUP BY ISNULL(dl.PropertyCity,'Unknown')
			,ISNULL(dl.PropertyState,'Unknown')
		) lds
			ON rev.City = lds.City
			AND rev.STATE = lds.State
		ORDER BY COALESCE(rev.City,lds.City)
			   ,COALESCE(rev.STATE,lds.State)

END




GO
/****** Object:  StoredProcedure [Staging].[fct_call_detail_records_t_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[fct_call_detail_records_t_merge]
AS 
BEGIN

	MERGE INTO Fact.Call_Detail_Records AS tgt
		USING Staging.fct_call_detail_records_t AS src
		ON tgt.CallDetailRecordID = src.CALL_DETAIL_RECORD_ID
		WHEN MATCHED 
			THEN
	UPDATE	   SET
			tgt.YMDID = CAST(CONVERT(VARCHAR,src.DATE_CALL_STARTED,112) AS INT)
		   ,tgt.PropertyID = src.PROPERTY_ID
		   ,tgt.CallDetailRecordID = src.CALL_DETAIL_RECORD_ID
		   ,tgt.SourceType = src.SOURCE_TYPE
		   ,tgt.CallerPhoneNumber = src.CALLER_PHONE_NUMBER
		   ,tgt.CalledPhoneNumber = src.CALLED_PHONE_NUMBER
		   ,tgt.FinalDestPhoneNumber = src.FINAL_DEST_PHONE_NUMBER
		   ,tgt.DateCallStarted = src.DATE_CALL_STARTED
		   ,tgt.DateCallEnded = src.DATE_CALL_ENDED
		   ,tgt.CallDuration = src.CALL_DURATION
		   ,tgt.CallStatusID = src.CALL_STATUS_ID
		   ,tgt.TelephonyVendorNameID = src.TELEPHONY_VENDOR_NAME_ID
		   ,tgt.RecordingURL = src.RECORDING_URL
		   ,tgt.RecordingDuration = src.RECORDING_DURATION
		   ,tgt.CallerRecordingURL = src.CALLER_RECORDING_URL
		   ,tgt.CalledRecordingURL = src.CALLED_RECORDING_URL
		   ,tgt.TrimmedURL = src.TRIMMED_URL
		   ,tgt.TrimmedDuration = src.TRIMMED_DURATION
		   ,tgt.DateVendorCreated = src.DATE_VENDOR_CREATED
		   ,tgt.DateCreated = src.DATE_CREATED
		   ,tgt.DateUpdated = src.DATE_UPDATED
		WHEN NOT MATCHED 
			THEN
	INSERT (
			YMDID
		   ,PropertyID
		   ,CallDetailRecordID
		   ,SourceType
		   ,CallerPhoneNumber
		   ,CalledPhoneNumber
		   ,FinalDestPhoneNumber
		   ,DateCallStarted
		   ,DateCallEnded
		   ,CallDuration
		   ,CallStatusID
		   ,TelephonyVendorNameID
		   ,RecordingURL
		   ,RecordingDuration
		   ,CallerRecordingURL
		   ,CalledRecordingURL
		   ,TrimmedURL
		   ,TrimmedDuration
		   ,DateVendorCreated
		   ,DateCreated
		   ,DateUpdated)
			   VALUES
			(CAST(CONVERT(VARCHAR,DATE_CALL_STARTED,112) AS INT)
			,PROPERTY_ID
			,CALL_DETAIL_RECORD_ID
			,SOURCE_TYPE
			,CALLER_PHONE_NUMBER
			,CALLED_PHONE_NUMBER
			,FINAL_DEST_PHONE_NUMBER
			,DATE_CALL_STARTED
			,DATE_CALL_ENDED
			,CALL_DURATION
			,CALL_STATUS_ID
			,TELEPHONY_VENDOR_NAME_ID
			,RECORDING_URL
			,RECORDING_DURATION
			,CALLER_RECORDING_URL
			,CALLED_RECORDING_URL
			,TRIMMED_URL
			,TRIMMED_DURATION
			,DATE_VENDOR_CREATED
			,DATE_CREATED
			,DATE_UPDATED);

END

GO
/****** Object:  StoredProcedure [Staging].[pr_MDIM_NotInEndeca]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[pr_MDIM_NotInEndeca]
	(
	@RecordDate DATETIME = NULL
	)
/*************************************************************************************************
*
* Name:	Staging.pr_MDIM_NotInEndeca
*
* Desc:	This pulls in the relevant Rent data for those Rent properties that aren not in Endeca from RPTPROD. 
*
* Test:	EXEC Staging.pr_MDIM_NotInEndeca '01/01/2014'
*
* Note: I created a separate procedure from the one that pulls all info from MDIM_PROPERTY because
*		this takes significantly less time to pull and I need to be able to grab this data
*		quickly.
*
* Hist:	01	03/19/2014		Sarah Mims			Initial Version. Ticket #14084
*		02	04/22/2014		Sarah Mims			Ticket # 15259 Added Total_Impressions
*		03	05/20/2014		Sarah Mims			No ticket - noticed we weren't getting the info
*												in time so I changed it to look back 2 days instead
*												of one.
*		04	09/19/2014		Sarah Mims			Ticket # 16672 - need these metrics for the
*												AG Syndication Score
**************************************************************************************************/
AS

SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
                
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcsNoTemp 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = 'Staging.pr_MDIM_NotInEndeca'
       , -- varchar(128)
        @StepName = 'Execute Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Execute Procedure, RPTProd Tables'; -- varchar(500)

--------------------------------------------------------------------------------------------------
--Declare and set variables
--------------------------------------------------------------------------------------------------
DECLARE @MonthSTR VARCHAR(10)
		,@SQL VARCHAR (4000)

IF @RecordDate IS NULL
	BEGIN
		SET @RecordDate = GETDATE()-2
	END

SET  @MonthSTR = LEFT(CONVERT(VARCHAR(30),@RecordDate,101),10)

-------------------------------------------------------------------------------------------------
--Using Dynamic SQL because we are pulling from Oracle
-------------------------------------------------------------------------------------------------
SET @SQL = N'
SELECT CAST(CONVERT(VARCHAR(8), RECORD_CREATE_DM, 112) as INT) AS YMDID
,RECORD_CREATE_DM 
,PROPERTY_CREATE_DM 
,ACTIVATE_DM
,PROPERTY_UPDATE_DM
,PROPERTY_TERMINATE_DM
,LISTINGSTATUSID
,PROPERTY_STATUS 
,COMPANY_ID
,PROPERTY_ID
,BUSINESSMODEL_TP 
,EXTERNAL_ID 
,EXTERNAL_TP 
,TOTAL_PHOTOS 
,ACTIVE_PHOTOS 
,TOTAL_FLOOR_PLANS
,ACTIVE_FLOOR_PLANS 
,TOTAL_AMENITIES 
,ACTIVE_AMENITIES 
,LOWPRICE 
,HIGHPRICE 
,UPGRADE_TP 
,LINKEDFLOORPLAN 
,UNIQUEVISITS_FL 
,UNIQUEVISITS_PTE 
,UNIQUEVISITS_NONE 
,UNIQUEVISITS_MOBILE 
,UNIQUEVISITS_VIP 
,CLICKSLISTINGMAP 
,CLICKSMAPDIRECTIONS 
,CONNECTEDCALLS 
,MISSEDCALLS 
,ONEWEBCONNECTEDCALLS  
,ONEWEBMISSEDCALLS 
,ALTREGCONNECTEDCALLS 
,ALTREGMISSEDCALLS 
,MOBILECONNECTEDCALLS 
,MOBILEMISSEDCALLS
,TOTAL_HOTLEAD 
,INVOICED_LEASES
,TRULIAEMAILLEADS
,TOTAL_IMPRESSIONS
 FROM OPENQUERY(RPTPROD,
				 ''SELECT RECORD_CREATE_DM 
				   ,PROPERTY_CREATE_DM 
				   ,ACTIVATE_DM
				   ,PROPERTY_UPDATE_DM
				   ,PROPERTY_TERMINATE_DM
				   ,LISTINGSTATUSID
				   ,PROPERTY_STATUS 
				   ,COMPANY_ID
				   ,PROPERTY_ID
				   ,BUSINESSMODEL_TP 
				   ,EXTERNAL_ID 
				   ,EXTERNAL_TP 
				   ,TOTAL_PHOTOS 
				   ,ACTIVE_PHOTOS 
				   ,TOTAL_FLOOR_PLANS
				   ,ACTIVE_FLOOR_PLANS 
				   ,TOTAL_AMENITIES 
				   ,ACTIVE_AMENITIES 
				   ,LOWPRICE 
				   ,HIGHPRICE 
				   ,UPGRADE_TP 
				   ,LINKEDFLOORPLAN 
				   ,UNIQUEVISITS_FL 
				   ,UNIQUEVISITS_PTE 
				   ,UNIQUEVISITS_NONE 
				   ,UNIQUEVISITS_MOBILE 
				   ,UNIQUEVISITS_VIP 
				   ,CLICKSLISTINGMAP 
				   ,CLICKSMAPDIRECTIONS 
				   ,CONNECTEDCALLS 
				   ,MISSEDCALLS 
				   ,ONEWEBCONNECTEDCALLS  
				   ,ONEWEBMISSEDCALLS 
				   ,ALTREGCONNECTEDCALLS 
				   ,ALTREGMISSEDCALLS 
				   ,MOBILECONNECTEDCALLS 
				   ,MOBILEMISSEDCALLS
				   ,TOTAL_HOTLEAD 
				   ,INVOICED_LEASES
				   ,TRULIAEMAILLEADS
				   ,TOTAL_IMPRESSIONS
				   FROM REPORTS.TBL_MDIM_PROPERTY
				   WHERE TRUNC(RECORD_CREATE_DM) >= TO_DATE('''''+@MonthSTR+''''',''''mm/dd/yyyy'''') 
				   AND BUSINESSMODEL_TP NOT IN (''''cpa'''',''''nrc'''')
				   ''
				) AS o'

--PRINT @SQL
INSERT INTO Rentcom.Staging.MDIM_NotInEndeca
EXEC (@SQL)

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [Staging].[pr_MDIM_Reporting]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[pr_MDIM_Reporting]
	(
	@RecordDate DATETIME = NULL
	)
/*************************************************************************************************
*
* Name:	Staging.pr_MDIM_Reporting
*
* Desc:	This pulls in the relevant Rent data for MyAG/MyRent reporting from RPTPROD. 
*
* Test:	EXEC Staging.pr_MDIM_Reporting '01/31/2014'
*
* Note: I created a separate procedure from the one that pulls all info from MDIM_PROPERTY because
*		this takes significantly less time to pull and I need to be able to grab this data
*		quickly.
*
* Hist:	01	03/19/2014		Sarah Mims			Initial Version. Ticket #14084
*		02	04/22/2014		Sarah Mims			Ticket # 15259 Added Total_Impressions
*		03	05/20/2014		Sarah Mims			No ticket - noticed we weren't getting the info
*												in time so I changed it to look back 2 days instead
*												of one.
**************************************************************************************************/
AS

SET NOCOUNT ON
	SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED;
    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
                
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcsNoTemp 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = 'Staging.pr_MDIM_Reporting'
       , -- varchar(128)
        @StepName = 'Execute Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Execute Procedure, RPTProd Linked Server'; -- varchar(500)

--------------------------------------------------------------------------------------------------
--Declare and set variables
--------------------------------------------------------------------------------------------------
DECLARE @MonthSTR VARCHAR(10)
		,@SQL VARCHAR (4000)

IF @RecordDate IS NULL
	BEGIN
		SET @RecordDate = GETDATE()-2
	END

SET  @MonthSTR = LEFT(CONVERT(VARCHAR(30),@RecordDate,101),10)

-------------------------------------------------------------------------------------------------
--Using Dynamic SQL because we are pulling from Oracle
-------------------------------------------------------------------------------------------------
SET @SQL = N'
SELECT CAST(CONVERT(VARCHAR(8), RECORD_CREATE_DM, 112) as INT) AS YMDID
,RECORD_CREATE_DM 
,PROPERTY_CREATE_DM 
,PROPERTY_UPDATE_DM
,PROPERTY_TERMINATE_DM
,LISTINGSTATUSID
,PROPERTY_STATUS 
,COMPANY_ID
,PROPERTY_ID
,BUSINESSMODEL_TP 
,EXTERNAL_ID 
,EXTERNAL_TP 
,TOTAL_PHOTOS 
,ACTIVE_PHOTOS 
,TOTAL_FLOOR_PLANS
,ACTIVE_FLOOR_PLANS 
,TOTAL_AMENITIES 
,ACTIVE_AMENITIES 
,LOWPRICE 
,HIGHPRICE 
,UPGRADE_TP 
,LINKEDFLOORPLAN 
,UNIQUEVISITS_FL 
,UNIQUEVISITS_PTE 
,UNIQUEVISITS_NONE 
,UNIQUEVISITS_MOBILE 
,UNIQUEVISITS_VIP 
,CLICKSLISTINGMAP 
,CLICKSMAPDIRECTIONS 
,CONNECTEDCALLS 
,MISSEDCALLS 
,ONEWEBCONNECTEDCALLS  
,ONEWEBMISSEDCALLS 
,ALTREGCONNECTEDCALLS 
,ALTREGMISSEDCALLS 
,MOBILECONNECTEDCALLS 
,MOBILEMISSEDCALLS
,TOTAL_HOTLEAD 
,INVOICED_LEASES
,TRULIAEMAILLEADS
,TOTAL_IMPRESSIONS
 FROM OPENQUERY(RPTPROD,
				 ''SELECT RECORD_CREATE_DM 
				   ,PROPERTY_CREATE_DM 
				   ,PROPERTY_UPDATE_DM
				   ,PROPERTY_TERMINATE_DM
				   ,LISTINGSTATUSID
				   ,PROPERTY_STATUS 
				   ,COMPANY_ID
				   ,PROPERTY_ID
				   ,BUSINESSMODEL_TP 
				   ,EXTERNAL_ID 
				   ,EXTERNAL_TP 
				   ,TOTAL_PHOTOS 
				   ,ACTIVE_PHOTOS 
				   ,TOTAL_FLOOR_PLANS
				   ,ACTIVE_FLOOR_PLANS 
				   ,TOTAL_AMENITIES 
				   ,ACTIVE_AMENITIES 
				   ,LOWPRICE 
				   ,HIGHPRICE 
				   ,UPGRADE_TP 
				   ,LINKEDFLOORPLAN 
				   ,UNIQUEVISITS_FL 
				   ,UNIQUEVISITS_PTE 
				   ,UNIQUEVISITS_NONE 
				   ,UNIQUEVISITS_MOBILE 
				   ,UNIQUEVISITS_VIP 
				   ,CLICKSLISTINGMAP 
				   ,CLICKSMAPDIRECTIONS 
				   ,CONNECTEDCALLS 
				   ,MISSEDCALLS 
				   ,ONEWEBCONNECTEDCALLS  
				   ,ONEWEBMISSEDCALLS 
				   ,ALTREGCONNECTEDCALLS 
				   ,ALTREGMISSEDCALLS 
				   ,MOBILECONNECTEDCALLS 
				   ,MOBILEMISSEDCALLS
				   ,TOTAL_HOTLEAD 
				   ,INVOICED_LEASES
				   ,TRULIAEMAILLEADS
				   ,TOTAL_IMPRESSIONS
				   FROM REPORTS.TBL_MDIM_PROPERTY
				   WHERE TRUNC(RECORD_CREATE_DM) = TO_DATE('''''+@MonthSTR+''''',''''mm/dd/yyyy'''') 
				   AND BUSINESSMODEL_TP IN (''''cpa'''',''''nrc'''')
				   ''
				) AS o'

--PRINT @SQL
INSERT INTO Rentcom.Staging.MDIM_Reporting
EXEC (@SQL)

SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [Staging].[pr_ProcessCallsRentComFromOracle]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Staging].[pr_ProcessCallsRentComFromOracle]
/*************************************************************************************************
*
* Name:	Staging.pr_ProcessCallsRentComFromOracle
*
* Desc:	This processes the RentCom calls from APTG since we store them there
*
* Test:	EXEC Staging.pr_ProcessCallsRentComFromOracle
*
* Note: This procedure first dumps data from APTG into CallLoaderRentCom and then moves that data
*		into CallsRentCom.
*
* Hist:	01	12/16/2013		Sarah Mims			Initial Version for Rent Migration. Ticket #14084.
* Hist: 02	12/18/2013		Sarah Mims			Added ListingID. AND CHANGED TO PULL FROM QA FOR NOW.
* Hist: 03	12/19/2013		Sarah Mims			Changed schema from dbo to Staging
* Hist: 04	01/31/2014		Sarah Mims			Changed to pull from PRODUCTION. Need to update this
*												when Rent Migration is productionized.
* Hist: 05	03/19/2014		Sarah Mims			Ticket #14084 changed var2 in the INSERT to exclude
*												the prepended "RENT" word.
* Hist: 06	03/22/2014		Sarah Mims			Moved pull from QA to PROD. Woohoo!!!
* Hist: 07	06/02/2014		Sarah Mims			Ticket # 15770 added logic to delete records from
*												the staging table that already exist in the Fact
*												table
* Hist:	08	04/20/2015		Sarah Mims			Ticket # 18562 - added BusinessModel AND the following logic
*												1) Before PLT production implementation - this does increase processing time due to the pull from RPTPROD
*												2) After PLT production implementation
* Hist: 09	06/15/2015		Sarah Mims			Ticket # 19783 - changed logic for PLT properties to use APTG instead of RPTPROD 
* Hist: 10	07/08/2015		Sarah Mims			Ticket # 19975 - made ListingID = RentPropertyID for PLT properties
* Hist: 11	02/25/2016		Don Wert			Ticket 22236 - cast incoming Rent property id, property id and listing id to INT to prevent conversion
*												to scientific notation.  Note that this will fail if what comes from Oracle is true character data.
**************************************************************************************************/
AS

SET NOCOUNT ON

--------------------------------------------------------------------------------------------------
--Declare and set variables
--------------------------------------------------------------------------------------------------

DECLARE	@STRSQL VARCHAR(4000);
DECLARE	@LastYMDStr VARCHAR(8);

SET @LastYMDStr = CONVERT(VARCHAR(8),DATEADD(DAY,-2,GETDATE()),112)

--------------------------------------------------------------------------------------------------
--Truncate Call Load Table for RentCom
--------------------------------------------------------------------------------------------------
TRUNCATE TABLE Rentcom.Staging.CallLoaderRentCom;

--------------------------------------------------------------------------------------------------
--Set dynamic SQL for RentCom calls and insert into Call Load Table
--------------------------------------------------------------------------------------------------

    SET @STRSQL = 'INSERT INTO Rentcom.Staging.CallLoaderRentCom
				SELECT  Call_ID
				,cast(RentPropertyID as int) as RentPropertyID
				,cast(PropertyID as int) as PropertyID
				,cast(ListingID as int) as ListingID
				,BusinessModel
				,YMDID
				,Call_Date
				,Duration_In_Sec
				,Toll_Free_NBR
				,Prop_NBR
				,Client_NBR
				,CallerName
				,CallerLocation
				,CallerAddress
				,CallerCity
				,CallerState
				,CallerZip
				,replace(var2,''_'','''')	
				,LinkName
				,LinkID			
				,ListenURL
				,AudioURL
				,CallerURL
				,ReceiverURL
				,MP3URL
				,CallLoadHour
				,CallLoadYMDID
				,Source
				,Status
				,Audio_Duration
				,Caller_Trim_Beginning
				,Caller_Trim_All
				,CallerURL_TrimSilence
				,Population					
				,AvgTravelTimeToWork
				,MedianHouseholdIncome
				,PerCapitaIncome
				,MedianEarnings
				,MedianContractRent
				,MedianRentAsked
				,MedianGrossRent
				,MedianPriceAsked
				,MedianRealEstateTaxes
				,Households
				,OwnerHouseholds
				,RenterHouseholds															
				FROM OPENROWSET (''oraoledb.oracle'', ''APTG''; ''reader''; ''reader'',
								''select rc.Call_ID
								,rc.ListingID AS RentPropertyID
								,pl.PropertyID
								,CASE WHEN p.RentPropertyID IS NULL THEN rc.ListingID ELSE pl.ListingID END AS ListingID
								,CASE WHEN p.PropertyID IS NOT NULL AND p.RewardCard = 1 THEN ''''cpa'''' 
									  WHEN p.PropertyID IS NOT NULL AND p.RewardCard <> 1 THEN ''''nrc'''' 
									  WHEN mp.ListingID IS NOT NULL THEN ''''ppl'''' 
									  WHEN p.RentPropertyID IS NULL THEN ''''plt'''' 
									  ELSE NULL
									  END						AS BusinessModel 
								,rc.YMDID
								,rc.Call_Date
								,rc.Duration_In_Sec
								,rc.Toll_Free_NBR
								,rc.Prop_NBR
								,rc.Client_NBR
								,rc.CallerName
								,rc.CallerLocation
								,rc.CallerAddress
								,rc.CallerCity
								,rc.CallerState
								,rc.CallerZip
								,rc.var2
								,rc.LinkName
								,rc.LinkID
								,rc.ListenURL
								,rc.AudioURL
								,rc.CallerURL
								,rc.ReceiverURL
								,rc.MP3URL
								,rc.CallLoadHour
								,rc.CallLoadYMDID
								,rc.Source
								,rc.Status
								,rc.Audio_Duration
								,rc.Caller_Trim_Beginning
								,rc.Caller_Trim_All
								,rc.CallerURL_TrimSilence
								,rc.Population					
								,rc.AvgTravelTimeToWork
								,rc.MedianHouseholdIncome
								,rc.PerCapitaIncome
								,rc.MedianEarnings
								,rc.MedianContractRent
								,rc.MedianRentAsked
								,rc.MedianGrossRent
								,rc.MedianPriceAsked
								,rc.MedianRealEstateTaxes
								,rc.Households
								,rc.OwnerHouseholds
								,rc.RenterHouseholds	
								from common.callsrc_rentcom rc
								LEFT OUTER JOIN Properties.Properties p
									ON rc.ListingID = p.RentPropertyID
								LEFT OUTER JOIN Properties.PropListings pl
									ON p.PropertyID = pl.PropertyID
									AND pl.ListingTypeID <> 10
								LEFT OUTER JOIN Properties.ag_rent_syndication_map mp
									ON pl.ListingID = mp.ListingID
								WHERE rc.ymdid >' + @LastYMDStr + '
									''
								)';
--PRINT @STRSQL
	EXEC (@STRSQL);
---------------------------------------------------------------------------------
--Delete any records from the Staging table where they already exist in Calls Rentcom
---------------------------------------------------------------------------------
DELETE FROM Rentcom.Staging.CallLoaderRentCom
WHERE CallID IN (SELECT DISTINCT CallID
				   FROM Rentcom.Fact.CallsRentCom
					)
---------------------------------------------------------------------------------
--Insert the data from CallLoaderRentCom into CallsRentCom
---------------------------------------------------------------------------------

INSERT INTO Rentcom.Fact.CallsRentCom
(YMDID
,CallID
,RentPropertyID
,PropertyID
,ListingID
,BusinessModel
,CallStartDateTime
,CallEndDateTime
,DurationInSeconds
,CallStatus
,CallSource
,CallType
,CallerPhoneNumber
,PublishedPhoneNumber
,TargetPhoneNumber
,CallerName
,CallerAddress
,CallerCity
,CallerState
,CallerZip
,CallerLocation
,LinkName
,LinkID
,AudioURL
,CallerURL
,ReceiverURL
,MP3URL
,CallerTrimSilenceURL
,CallLoadHour
,CallLoadYMDID
,CallEndHour
,DateAddedYMDID
,ActualCallDuration
,CallerTrimBeginning
,TotalCallerTrimTalkTime
,IsAbandoned
,Population
,AvgTravelTimeToWork
,MedianHouseholdIncome
,PerCapitaIncome
,MedianEarnings
,MedianContractRent
,MedianRentAsked
,MedianGrossRent
,MedianPriceAsked
,MedianRealEstateTaxes
,Households
,OwnerHouseholds
,RenterHouseholds
)

SELECT DISTINCT
        sm.YMDID
       ,sm.CallID																AS CallID
       ,sm.RentPropertyID
	   ,sm.PropertyID
	   ,sm.ListingID
	   ,BusinessModel = COALESCE(sm.BusinessModel,CASE WHEN dl.IsRentSmallProp = 1 THEN 'plt' ELSE 'Unknown' END)
       ,sm.TimeInitiated													AS CallStartDateTime
       ,DATEADD(SECOND,DurationInSeconds,TimeInitiated)						AS CallEndDateTime
       ,sm.DurationInSeconds
       ,CASE WHEN callstatus = 1
                  OR (callstatus IN (4,5)
                      AND DurationInSeconds > 0
                      AND DurationInSeconds > 0) THEN 1
             ELSE callstatus
        END																	AS CallStatus
       ,CallSource															AS CallSource
       ,REPLACE(var2,'"','')												AS CallType
       ,CASE WHEN ISNUMERIC(UserTelephoneNumber) = 0 THEN 'blocked'
             ELSE RIGHT(usertelephonenumber,10)
        END																	AS CallerPhoneNumber
       ,RIGHT(TollFreeNumber,10)											AS PublishedPhoneNumber
       ,RIGHT(PropertyNumber,10)											AS TargetPhoneNumber
       ,ISNULL(callername,'')												AS CallerName
       ,[CallerAddress]
       ,[CallerCity]
       ,[CallerState]
       ,[CallerZip]
       ,[CallerLocation]
       ,[LinkName]
       ,[LinkID]
       ,REPLACE(AudioURL,'"','')											AS AudioURL
       ,CallerURL
       ,ReceiverURL
       ,MP3URL
       ,CallerURLTrimSilence												AS CallerTrimSilenceURL
       ,CallLoadHour														AS CallLoadHour
       ,CallLoadYMDID														AS CallLoadYMDID
       ,DATEPART(HOUR,DATEADD(SECOND,DurationInSeconds,TimeInitiated))		AS CallEndHour
       ,CONVERT([int],CONVERT([varchar](8),GETDATE(),(112)),0)				AS DateAddedYMDID
       ,AudioDuration														AS ActualCallDuration
       ,CallerTrimBeginning
       ,CallerTrimAll														AS TotalCallerTrimTalkTime
       ,0																	AS IsAbandoned
       ,[Population]
       ,[AvgTravelTimeToWork]
       ,[MedianHouseholdIncome]
       ,[PerCapitaIncome]
       ,[MedianEarnings]
       ,[MedianContractRent]
       ,[MedianRentAsked]
       ,[MedianGrossRent]
       ,[MedianPriceAsked]
       ,[MedianRealEstateTaxes]
       ,[Households]
       ,[OwnerHouseholds]
       ,[RenterHouseholds]                     
FROM    RentCom.Staging.CallLoaderRentCom AS sm
LEFT OUTER JOIN Rentpath.Dimension.SmallPropertyListings AS dl
	ON sm.ListingID = dl.ListingID
	AND dl.IsRentSmallProp = 1


SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [Staging].[pr_pullOracleLeads]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Staging].[pr_pullOracleLeads] (@ymdid int)
AS 
/***********************************************************************************************************************
* Name:   reports.rpt_disputedLeaseDropDown
* -----------------------------------------------------------------------------------------------------------------------
* Desc:   Disputed Lease Drop down
* -----------------------------------------------------------------------------------------------------------------------
* Test:   
*         exec staging.pr_pullOracleLeads  20140301
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 
* 01   03/17/2014   Richard Chen    Initial Version
*
***********************************************************************************************************************/
SET NOCOUNT ON;
    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
       ,@errmsg VARCHAR(MAX)
                
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = 'staging.pr_pullOracleLeads'
       , -- varchar(128)
        @StepName = 'Execute Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Execute Procedure' -- varchar(500)


delete from rentcom.staging.oracleLeadsToMatch where cast(convert(varchar(8),when_entered,112) as int)=20130301


insert into rentcom.[Staging].[OracleLeadsToMatch]
([LEADID],[MGTCOID],[MGTCONAME],[LISTINGID],[PROPERTYID],	[CLIENTID],	[PROPERTYNAME],	[PROPERTYCITY],
[PROPERTYSTATE],[FIRSTNAME],[LASTNAME],[FULLNAME],[ISCOMPANY],[CONTACTMETHOD],[LEADSOURCE],	[CONTACTDATE],
[ESTCONTACTDATE],[EMAIL],[PHONE],[ISPAYPERLEASE],[REVERSELOOKUPSOURCE],[WHEN_ENTERED],[LEADADDRESS1],
[LEADADDRESS2],[LEADCITY],[LEADSTATE],[LEADZIP],[LEADMOVEMONTH],[STATUS])
select --lm.*, p.*
cast(lm.LeadMessageID as varchar(100)),dl.RentMgtCoID,dl.[MgtCoName],lm.propertyid, lm.propertyid,clientid='', dl.PropertyName, dl.PropertyCity
,dl.propertyState,p.[FirstName],p.LastName,p.firstName+' '+p.LastName,'',lm.SourceType,lm.sourceName,lm.contactDate
,'',p.emailName,p.phonenumber,'','',lm.ContactDate,''
,'','','','','',''
from rentcom.fact.leadmessage lm
join rentcom.dimension.Person p on lm.personid=p.personid
left outer join rentcom.dimension.listings dl on lm.PropertyID=dl.rentPropertyID
where lm.ymdid =@ymdid
union
select c.callid, dl.RentMgtCoID,dl.[MgtCoName],c.RentPropertyid,c.RentPropertyid,clientid='', dl.PropertyName, dl.PropertyCity
,dl.propertyState,p.[FirstName],p.LastName,p.firstName+' '+p.LastName,'',c.callsource,c.callsource,c.callStartDateTime
,'',p.emailName,p.phonenumber,'','',c.callstartdateTime,c.callerAddress
,'',c.callercity,c.callerState,c.callerzip,'',cast(c.callstatus as varchar(8))
  from [Fact].[CallsRentCom] c
  join dimension.listings dl on c.rentpropertyid=dl.rentpropertyid
  left outer join dimension.person p on c.callerPHoneNumber=p.phoneNumber
where c.ymdid=@ymdid



SET NOCOUNT OFF;

GO
/****** Object:  StoredProcedure [Staging].[tbl_dim_emailclass_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC Staging.tbl_dim_emailclass_merge;

CREATE PROCEDURE [Staging].[tbl_dim_emailclass_merge]
AS 
BEGIN

	MERGE INTO Dimension.EmailCampaign AS tgt
		USING Staging.tbl_dim_emailclass AS src
		ON	tgt.EmailClassID = src.EMAILCLASS_ID
		WHEN MATCHED 
			THEN
	UPDATE	   SET
			tgt.CreateDate = src.CREATE_DM
		   ,tgt.UpdateDate = src.UPDATE_DM
		   ,tgt.MarketNumber = src.MARKET_NB
		   ,tgt.IssueNumber = src.ISSUE_NB
		   ,tgt.Name = src.NAME_NM
		   ,tgt.IssueID = src.ISSUE_NB
		   ,tgt.IssueName = src.ISSUE_NM
		   ,tgt.RegistrationOffsetNumber = src.REGISTRATIONOFFSET_NB
		   ,tgt.MoveInOffsetNumber = src.MOVEINOFFSET_NB
		   ,tgt.PeriodNumber = src.PERIOD_NB
		   ,tgt.RankNumber = src.RANK_NB
		   ,tgt.UnsubscribeType = src.UNSUBSCRIBE_TP
		   ,tgt.TerminateDate = src.TERMINATE_DM
		   ,tgt.SourceID = src.SOURCE_ID
		WHEN NOT MATCHED 
			THEN
	INSERT (
			EmailClassID
		   ,CreateDate
		   ,UpdateDate
		   ,MarketNumber
		   ,IssueNumber
		   ,Name
		   ,IssueID
		   ,IssueName
		   ,RegistrationOffsetNumber
		   ,MoveInOffsetNumber
		   ,PeriodNumber
		   ,RankNumber
		   ,UnsubscribeType
		   ,TerminateDate
		   ,SourceID)
			   VALUES
			(EMAILCLASS_ID
			,CREATE_DM
			,UPDATE_DM
			,MARKET_NB
			,ISSUE_NB
			,NAME_NM
			,ISSUE_ID
			,ISSUE_NM
			,REGISTRATIONOFFSET_NB
			,MOVEINOFFSET_NB
			,PERIOD_NB
			,RANK_NB
			,UNSUBSCRIBE_TP
			,TERMINATE_DM
			,SOURCE_ID);

END

GO
/****** Object:  StoredProcedure [Staging].[tbl_dim_lease_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC Staging.tbl_dim_lease_merge;

CREATE PROCEDURE [Staging].[tbl_dim_lease_merge]
AS 
/*************************************************************************************
Proc Name:  [Staging].[tbl_dim_lease_merge]
Desc:       Merge in new/changed lease data
--------------------------------------------------------------------------------------
History:
01  Chadwick Smith  20121207     Initial Version
02  Mary Pollard    20130404     Added ValidDate field to accomodate daily EF_ID feed file
*************************************************************************************/
BEGIN


	MERGE INTO Dimension.Lease AS tgt
		USING Staging.tbl_dim_lease AS src
		ON	tgt.LeaseID = src.LEASE_ID
		WHEN MATCHED 
			THEN
	UPDATE	   SET
			tgt.YMDID = CAST(CONVERT(VARCHAR,src.CREATE_DM,112) AS INT)
		   ,tgt.CreateDate = src.CREATE_DM
		   ,tgt.PropertyID = src.PROPERTY_ID
		   ,tgt.RenterID = src.RENTER_ID
		   ,tgt.RequestID = src.REQUEST_ID
		   ,tgt.BountyID = src.BOUNTY_ID
		   ,tgt.LessorFirstName = src.LESSOR_FIRST_NM
		   ,tgt.LessorLastName = src.LESSOR_LAST_NM
		   ,tgt.RenterFirstName = src.RENTER_FIRST_NM
		   ,tgt.RenterLastName = src.RENTER_LAST_NM
		   ,tgt.LessorDate = src.LESSOR_DM
		   ,tgt.RenterDate = src.RENTER_DM
		   ,tgt.MoveInDate = src.MOVEIN_DM
		   ,tgt.MonthlyRentAmount = src.MONTHLY_RENT_AT
		   ,tgt.LeaseTermName = src.LEASE_TERM_NM
		   ,tgt.LeaseTermNumber = src.LEASE_TERM_NB
		   ,tgt.UniteAddressName = src.UNIT_ADDRESS_NM
		   ,tgt.UnitNumber = src.UNIT_NB
		   ,tgt.UnitCityName = src.UNIT_CITY_NM
		   ,tgt.UnitStateCode = src.UNIT_STATE_CD
		   ,tgt.UnitZipCode = src.UNIT_ZIP_CD
		   ,tgt.BillingCompanyName = src.BILLING_COMPANY_NM
		   ,tgt.BillingAddressName = src.BILLING_ADDRESS_NM
		   ,tgt.BillingCityName = src.BILLING_CITY_NM
		   ,tgt.BillingStateCode = src.BILLING_STATE_CD
		   ,tgt.BillingZipCode = src.BILLING_ZIP_CD
		   ,tgt.LessorPhoneCode = src.LESSOR_PHONE_CD
		   ,tgt.RenterPhoneCode = src.RENTER_PHONE_CD
		   ,tgt.GuestCardID = src.GUESTCARD_ID
		   ,tgt.BillingPhoneCode = src.BILLING_PHONE_CD
		   ,tgt.BillingFaxCode = src.BILLING_FAX_CD
		   ,tgt.BillingEmailName = src.BILLING_EMAIL_NM
		   ,tgt.FirstRenterEventDate = src.FIRST_RENTER_EVENT_DM
		   ,tgt.FirstRenterEventID = src.FIRST_RENTER_EVENT_ID
		   ,tgt.LastRenterEventDate = src.LAST_RENTER_EVENT_DM
		   ,tgt.LastRenterEventID = src.LAST_RENTER_EVENT_ID
		   ,tgt.CosignersName = src.COSIGNERS_NM
		   ,tgt.DiscountAmount = src.DISCOUNT_AT
		   ,tgt.FlatFeeAmount = src.FLATFEE_AT
		   ,tgt.BountySentDate = src.BOUNTYSENT_DM
		   ,tgt.GuestCardRequestedDate = src.GUESTCARDREQUESTED_DM
		   ,tgt.GuestCardReceivedDate = src.GUESTCARDRECEIVED_DM
		   ,tgt.[Status] = src.STATUS_XT
		   ,tgt.ForceBountyPaymentFlag = src.FORCEBOUNTYPAYMENT_FG
		   ,tgt.ClassifiedFlag = src.CLASSIFIED_FG
		   ,tgt.TerminateDate = src.TERMINATE_DM
		   ,tgt.BillingCompanyID = src.BILLING_COMPANY_ID
		   ,tgt.StickerSentDate = src.STICKERSENT_DM
		   ,tgt.NotifiedOnGuestCardFlag = src.NOTIFIEDONGUESTCARD_FG
		   ,tgt.NotifiedOnLeaseApplicationFlag = src.NOTIFIEDONLEASEAPPLICATION_FG
		   ,tgt.NotifiedViaPhoneFlag = src.NOTIFIEDVIAPHONE_FG
		   ,tgt.NotifiedInPersonFlag = src.NOTIFIEDINPERSON_FG
		   ,tgt.NotifiedGavePrintoutFlag = src.NOTIFIEDGAVEPRINTOUT_FG
		   ,tgt.NotifiedForgotFlag = src.NOTIFIEDFORGOT_FG
		   ,tgt.NotifiedOther = src.NOTIFIEDOTHER_XT
		   ,tgt.AffiliateStatus = src.AFFILIATESTATUS_XT
		   ,tgt.ValidForAffiliateDate = src.VALIDFORAFFILIATE_DM
		   ,tgt.AutoValidationFlag = src.AUTOVALIDATION_FG
		   ,tgt.UpdateDate = src.UPDATE_DM
		   ,tgt.SmallPropertyFlag = src.SMALLPROPERTY_FG
		   ,tgt.PropertyConfirmationSentDate = src.PROPERTYCONFIRMATIONSENT_DM
		   ,tgt.RewardCardRequestDate = src.REWARDCARDREQUEST_DM
		   ,tgt.SessionEmailID = src.SESSION_EMAIL_ID
		   ,tgt.FundsOnAccountPayableFlag = src.FUNDSONACCOUNTPAYABLE_FG
		   ,tgt.BillingType = src.BILLING_TP
		   ,tgt.VerifyFoundOnRentDotComFlag = src.VERIFYFOUNDONRENTDOTCOM_FG
		   ,tgt.VerifyToldPropertyFlag = src.VERIFYTOLDPROPERTY_FG
		   ,tgt.VerifySignedLeaseFlag = src.VERIFYSIGNEDLEASE_FG
		   ,tgt.VerifyHonestlyAnsweredFlag = src.VERIFYHONESTLYANSWERED_FG
		   ,tgt.VerifyReminderSentNumber = src.VERIFYREMINDERSENT_NB
		   ,tgt.LeaseType = src.LEASE_TP
		   ,tgt.LeaseName = src.LEASE_NM
		   ,tgt.PropertyType = src.PROPERTY_TP
		   ,tgt.PropertyName = src.PROPERTY_NM
		   ,tgt.RequestType = src.REQUEST_TP
		   ,tgt.UnitID = src.UNIT_ID
		   ,tgt.UnitType = src.UNIT_TP
		   ,tgt.OfferID = src.OFFER_ID
		   ,tgt.OfferType = src.OFFER_TP
		   ,tgt.RenterType = src.RENTER_TP
		   ,tgt._RenterFirstName = src.RENTERFIRST_NM
		   ,tgt._RenterLastName = src.RENTERLAST_NM
		   ,tgt.LessorID = src.LESSOR_ID
		   ,tgt.LessorType = src.LESSOR_TP
		   ,tgt._LessorFirstName = src.LESSORFIRST_NM
		   ,tgt._LessorLastName = src.LESSORLAST_NM
		   ,tgt.StatusCode = src.STATUS_CD
		   ,tgt.StatusDate = src.STATUS_DM
		   ,tgt.MonthlyRentConfirmedFlag = src.MONTHLYRENTCONFIRMED_FG
		   ,tgt.MoveInConfirmedFlag = src.MOVEINCONFIRMED_FG
		   ,tgt.ActivationCodeNumber = src.ACTIVATIONCODE_NB
		   ,tgt._RenterPhoneCode = src.RENTERPHONE_CD
		   ,tgt.HasUnitNumbersFlag = src.HASUNITNUMBERS_FG
		   ,tgt.PreviousTenantFlag = src.PREVIOUSTENANT_FG
		   ,tgt.LastStatusEmailed = src.LASTSTATUSEMAILED_XT
		   ,tgt.BrowserName = src.BROWSER_NM
		   ,tgt.ClientIPName = src.CLIENTIP_NM
		   ,tgt.RewardCardAddressName = src.REWARDCARDADDRESS_NM
		   ,tgt.RewardCardCityName = src.REWARDCARDCITY_NM
		   ,tgt.RewardCardStateCode = src.REWARDCARDSTATE_CD
		   ,tgt.RewardCardZipCode = src.REWARDCARDZIP_CD
		   ,tgt.TranAccountNumber = src.TRANACCOUNT_NB
		   ,tgt.BusinessModelType = src.BUSINESSMODEL_TP
		   ,tgt.PasswordSource = src.PASSWORD_SOURCE
		   ,tgt.RegDate = src.REG_DM
		   ,tgt.SourceID = src.SOURCE_ID
		   ,tgt.PaidFlag = src.PAID_FG
		   ,tgt.InvoiceCreatedDate = src.INVOICE_CREATED_DM
		   ,tgt.ActivationCodeName = src.ACTIVATIONCODE_NM
		   ,tgt.SourceNameDate = src.SOURCE_NM_DM
		   ,tgt.SourceName = src.SOURCE_NM
		WHEN NOT MATCHED 
			THEN
	INSERT (
			YMDID
		   ,LeaseID
		   ,CreateDate
		   ,PropertyID
		   ,RenterID
		   ,RequestID
		   ,BountyID
		   ,LessorFirstName
		   ,LessorLastName
		   ,RenterFirstName
		   ,RenterLastName
		   ,LessorDate
		   ,RenterDate
		   ,MoveInDate
		   ,MonthlyRentAmount
		   ,LeaseTermName
		   ,LeaseTermNumber
		   ,UniteAddressName
		   ,UnitNumber
		   ,UnitCityName
		   ,UnitStateCode
		   ,UnitZipCode
		   ,BillingCompanyName
		   ,BillingAddressName
		   ,BillingCityName
		   ,BillingStateCode
		   ,BillingZipCode
		   ,LessorPhoneCode
		   ,RenterPhoneCode
		   ,GuestCardID
		   ,BillingPhoneCode
		   ,BillingFaxCode
		   ,BillingEmailName
		   ,FirstRenterEventDate
		   ,FirstRenterEventID
		   ,LastRenterEventDate
		   ,LastRenterEventID
		   ,CosignersName
		   ,DiscountAmount
		   ,FlatFeeAmount
		   ,BountySentDate
		   ,GuestCardRequestedDate
		   ,GuestCardReceivedDate
		   ,[Status]
		   ,ForceBountyPaymentFlag
		   ,ClassifiedFlag
		   ,TerminateDate
		   ,BillingCompanyID
		   ,StickerSentDate
		   ,NotifiedOnGuestCardFlag
		   ,NotifiedOnLeaseApplicationFlag
		   ,NotifiedViaPhoneFlag
		   ,NotifiedInPersonFlag
		   ,NotifiedGavePrintoutFlag
		   ,NotifiedForgotFlag
		   ,NotifiedOther
		   ,AffiliateStatus
		   ,ValidForAffiliateDate
		   ,AutoValidationFlag
		   ,UpdateDate
		   ,SmallPropertyFlag
		   ,PropertyConfirmationSentDate
		   ,RewardCardRequestDate
		   ,SessionEmailID
		   ,FundsOnAccountPayableFlag
		   ,BillingType
		   ,VerifyFoundOnRentDotComFlag
		   ,VerifyToldPropertyFlag
		   ,VerifySignedLeaseFlag
		   ,VerifyHonestlyAnsweredFlag
		   ,VerifyReminderSentNumber
		   ,LeaseType
		   ,LeaseName
		   ,PropertyType
		   ,PropertyName
		   ,RequestType
		   ,UnitID
		   ,UnitType
		   ,OfferID
		   ,OfferType
		   ,RenterType
		   ,_RenterFirstName
		   ,_RenterLastName
		   ,LessorID
		   ,LessorType
		   ,_LessorFirstName
		   ,_LessorLastName
		   ,StatusCode
		   ,StatusDate
		   ,MonthlyRentConfirmedFlag
		   ,MoveInConfirmedFlag
		   ,ActivationCodeNumber
		   ,_RenterPhoneCode
		   ,HasUnitNumbersFlag
		   ,PreviousTenantFlag
		   ,LastStatusEmailed
		   ,BrowserName
		   ,ClientIPName
		   ,RewardCardAddressName
		   ,RewardCardCityName
		   ,RewardCardStateCode
		   ,RewardCardZipCode
		   ,TranAccountNumber
		   ,BusinessModelType
		   ,PasswordSource
		   ,RegDate
		   ,SourceID
		   ,PaidFlag
		   ,InvoiceCreatedDate
		   ,ActivationCodeName
		   ,SourceNameDate
		   ,SourceName)
			   VALUES
			(CAST(CONVERT(VARCHAR,CREATE_DM,112) AS INT)
			,LEASE_ID
			,CREATE_DM
			,PROPERTY_ID
			,RENTER_ID
			,REQUEST_ID
			,BOUNTY_ID
			,LESSOR_FIRST_NM
			,LESSOR_LAST_NM
			,RENTER_FIRST_NM
			,RENTER_LAST_NM
			,LESSOR_DM
			,RENTER_DM
			,MOVEIN_DM
			,MONTHLY_RENT_AT
			,LEASE_TERM_NM
			,LEASE_TERM_NB
			,UNIT_ADDRESS_NM
			,UNIT_NB
			,UNIT_CITY_NM
			,UNIT_STATE_CD
			,UNIT_ZIP_CD
			,BILLING_COMPANY_NM
			,BILLING_ADDRESS_NM
			,BILLING_CITY_NM
			,BILLING_STATE_CD
			,BILLING_ZIP_CD
			,LESSOR_PHONE_CD
			,RENTER_PHONE_CD
			,GUESTCARD_ID
			,BILLING_PHONE_CD
			,BILLING_FAX_CD
			,BILLING_EMAIL_NM
			,FIRST_RENTER_EVENT_DM
			,FIRST_RENTER_EVENT_ID
			,LAST_RENTER_EVENT_DM
			,LAST_RENTER_EVENT_ID
			,COSIGNERS_NM
			,DISCOUNT_AT
			,FLATFEE_AT
			,BOUNTYSENT_DM
			,GUESTCARDREQUESTED_DM
			,GUESTCARDRECEIVED_DM
			,STATUS_XT
			,FORCEBOUNTYPAYMENT_FG
			,CLASSIFIED_FG
			,TERMINATE_DM
			,BILLING_COMPANY_ID
			,STICKERSENT_DM
			,NOTIFIEDONGUESTCARD_FG
			,NOTIFIEDONLEASEAPPLICATION_FG
			,NOTIFIEDVIAPHONE_FG
			,NOTIFIEDINPERSON_FG
			,NOTIFIEDGAVEPRINTOUT_FG
			,NOTIFIEDFORGOT_FG
			,NOTIFIEDOTHER_XT
			,AFFILIATESTATUS_XT
			,VALIDFORAFFILIATE_DM
			,AUTOVALIDATION_FG
			,UPDATE_DM
			,SMALLPROPERTY_FG
			,PROPERTYCONFIRMATIONSENT_DM
			,REWARDCARDREQUEST_DM
			,SESSION_EMAIL_ID
			,FUNDSONACCOUNTPAYABLE_FG
			,BILLING_TP
			,VERIFYFOUNDONRENTDOTCOM_FG
			,VERIFYTOLDPROPERTY_FG
			,VERIFYSIGNEDLEASE_FG
			,VERIFYHONESTLYANSWERED_FG
			,VERIFYREMINDERSENT_NB
			,LEASE_TP
			,LEASE_NM
			,PROPERTY_TP
			,PROPERTY_NM
			,REQUEST_TP
			,UNIT_ID
			,UNIT_TP
			,OFFER_ID
			,OFFER_TP
			,RENTER_TP
			,RENTERFIRST_NM
			,RENTERLAST_NM
			,LESSOR_ID
			,LESSOR_TP
			,LESSORFIRST_NM
			,LESSORLAST_NM
			,STATUS_CD
			,STATUS_DM
			,MONTHLYRENTCONFIRMED_FG
			,MOVEINCONFIRMED_FG
			,ACTIVATIONCODE_NB
			,RENTERPHONE_CD
			,HASUNITNUMBERS_FG
			,PREVIOUSTENANT_FG
			,LASTSTATUSEMAILED_XT
			,BROWSER_NM
			,CLIENTIP_NM
			,REWARDCARDADDRESS_NM
			,REWARDCARDCITY_NM
			,REWARDCARDSTATE_CD
			,REWARDCARDZIP_CD
			,TRANACCOUNT_NB
			,BUSINESSMODEL_TP
			,PASSWORD_SOURCE
			,REG_DM
			,SOURCE_ID
			,PAID_FG
			,INVOICE_CREATED_DM
			,ACTIVATIONCODE_NM
			,SOURCE_NM_DM
			,SOURCE_NM);

END

GO
/****** Object:  StoredProcedure [Staging].[tbl_dim_person_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[tbl_dim_person_merge]
AS 
/*************************************************************************************
Proc Name:  Staging.tbl_dim_person_merge
Desc:       Merge in new/changed person data
Test:		EXEC Staging.tbl_dim_person_merge
--------------------------------------------------------------------------------------
History:
01  Chadwick Smith  20130628     Initial Version
*************************************************************************************/
BEGIN

	MERGE INTO Dimension.Person AS tgt
		USING Staging.tbl_dim_person AS src
		ON	tgt.PersonID = src.PERSON_ID
		WHEN MATCHED 
			THEN
	UPDATE	   SET
			 tgt.PersonType = src.PERSON_TP
			,tgt.FirstName = src.FIRST_NM
			,tgt.LastName = src.LAST_NM
			,tgt.PersonName = src.PERSON_NM
			,tgt.PersonCode = src.PERSON_CD
			,tgt.CreateDate = src.CREATE_DM
			,tgt.UpdateDate = src.UPDATE_DM
			,tgt.TerminateDate = src.TERMINATE_DM
			,tgt.UserName = src.USER_NM
			,tgt.SourceID = src.SOURCE_ID
			,tgt.VerifyCode = src.VERIFY_CD
			,tgt.LessorID = src.LESSOR_ID
			,tgt.RenterID = src.RENTER_ID
			,tgt.AffiliateID = src.AFFILIATE_ID
			,tgt.PromoName = src.PROMO_NM
			,tgt.ReferrerName = src.REFERRER_NM
			,tgt.OptinID = src.OPTIN_ID
			,tgt.MoveinDate = src.MOVEIN_DM
			,tgt.EmailName = src.EMAIL_NM
			,tgt.AddressName = src.ADDRESS_NM
			,tgt.CityName = src.CITY_NM
			,tgt.StateCode = src.STATE_CD
			,tgt.ZipCode = src.ZIP_CD
			,tgt.PhoneCode = src.PHONE_CD
			,tgt.FaxCode = src.FAX_CD
			,tgt.PrecisionCode = src.PRECISION_CD
			,tgt.LatitudeCode = src.LATITUDE_CD
			,tgt.LongitudeCode = src.LONGITUDE_CD
			,tgt.LastEventID = src.LAST_EVENT_ID
			,tgt.HuntDate = src.HUNT_DM
			,tgt.UnsubscribeDate = src.UNSUBSCRIBE_DM
			,tgt.UndeliverableDate = src.UNDELIVERABLE_DM
			,tgt.Undeliverable = src.UNDELIVERABLE_XT
			,tgt.RptExtraBitmask = src.RPT_EXTRA_BT
			,tgt.UnconfirmedFlag = src.UNCONFIRMED_FG
			,tgt.CollectionsRepID = src.COLLECTIONSREP_ID
			,tgt.UnwantedDate = src.UNWANTED_DM
			,tgt.UnwantedEmailID = src.UNWANTEDEMAIL_ID
			,tgt.UnwantedEmailClassID = src.UNWANTEDEMAILCLASS_ID
			,tgt.ConfirmationNeededFlag = src.CONFIRMATIONNEEDED_FG
			,tgt.ConfirmationSentDate = src.CONFIRMATIONSENT_DM
			,tgt.ConfirmationOkDate = src.CONFIRMATIONOK_DM
			,tgt.UnsubscribeEmailID = src.UNSUBSCRIBEEMAIL_ID
			,tgt.UnsubscribeEmailClassID = src.UNSUBSCRIBEEMAILCLASS_ID
			,tgt.RenterDate = src.RENTER_DM
			,tgt.RoommateDate = src.ROOMMATE_DM
			,tgt.PromoID = src.PROMO_ID
			,tgt.LastLoginDate = src.LASTLOGIN_DM
			,tgt.NickName = src.NICK_NM
			,tgt.RegistrationUrlName = src.REGISTRATIONURL_NM
			,tgt.CallDate = src.CALL_DM
			,tgt.CallDispositionName = src.CALLDISPOSITION_NM
			,tgt.SapCustomerID = src.SAP_CUSTOMER_ID
			,tgt.HyperRREmailSentDate = src.HYPER_RR_EMAIL_SENT_DM
			,tgt.AblCheckpointDate = src.ABLCHECKPOINT_DM
			,tgt.PasswordSource = src.PASSWORD_SOURCE
			,tgt.InsiderID = src.INSIDER_ID
			,tgt.RequestACallDate = src.REQUESTACALL_DM
			,tgt.PhoneFromCallerIDFlag = src.PHONEFROMCALLERID_FG
			,tgt.RegisterDate = src.REGISTER_DM
			,tgt.VisitorID = src.VISITOR_ID
			,tgt.PasswordHash = src.PASSWORD_HASH
			,tgt.BrowserName = src.BROWSER_NM
			,tgt.ClientIPName = src.CLIENTIP_NM
			,tgt.SalesRepID = src.SALESREP_ID
			,tgt.Terminate = src.TERMINATE_XT
			,tgt.ProcessedBitmask = src.PROCESSED_BT
			,tgt.AgentID = src.AGENT_ID
			,tgt.SeenRewardInterstitialDate = src.SEENREWARDINTERSTITIAL_DM
			,tgt.ClickID = src.CLICK_ID
			,tgt.UniversalID = src.UNIVERSAL_ID
		WHEN NOT MATCHED 
			THEN
	INSERT (
			PersonID
			,PersonType
			,FirstName
			,LastName
			,PersonName
			,PersonCode
			,CreateDate
			,UpdateDate
			,TerminateDate
			,UserName
			,SourceID
			,VerifyCode
			,LessorID
			,RenterID
			,AffiliateID
			,PromoName
			,ReferrerName
			,OptinID
			,MoveinDate
			,EmailName
			,AddressName
			,CityName
			,StateCode
			,ZipCode
			,PhoneCode
			,FaxCode
			,PrecisionCode
			,LatitudeCode
			,LongitudeCode
			,LastEventID
			,HuntDate
			,UnsubscribeDate
			,UndeliverableDate
			,Undeliverable
			,RptExtraBitmask
			,UnconfirmedFlag
			,CollectionsRepID
			,UnwantedDate
			,UnwantedEmailID
			,UnwantedEmailClassID
			,ConfirmationNeededFlag
			,ConfirmationSentDate
			,ConfirmationOkDate
			,UnsubscribeEmailID
			,UnsubscribeEmailClassID
			,RenterDate
			,RoommateDate
			,PromoID
			,LastLoginDate
			,NickName
			,RegistrationUrlName
			,CallDate
			,CallDispositionName
			,SapCustomerID
			,HyperRREmailSentDate
			,AblCheckpointDate
			,PasswordSource
			,InsiderID
			,RequestACallDate
			,PhoneFromCallerIDFlag
			,RegisterDate
			,VisitorID
			,PasswordHash
			,BrowserName
			,ClientIPName
			,SalesRepID
			,Terminate
			,ProcessedBitmask
			,AgentID
			,SeenRewardInterstitialDate
			,ClickID
			,UniversalID)
			   VALUES
			(PERSON_ID
			,PERSON_TP
			,FIRST_NM
			,LAST_NM
			,PERSON_NM
			,PERSON_CD
			,CREATE_DM
			,UPDATE_DM
			,TERMINATE_DM
			,USER_NM
			,SOURCE_ID
			,VERIFY_CD
			,LESSOR_ID
			,RENTER_ID
			,AFFILIATE_ID
			,PROMO_NM
			,REFERRER_NM
			,OPTIN_ID
			,MOVEIN_DM
			,EMAIL_NM
			,ADDRESS_NM
			,CITY_NM
			,STATE_CD
			,ZIP_CD
			,PHONE_CD
			,FAX_CD
			,PRECISION_CD
			,LATITUDE_CD
			,LONGITUDE_CD
			,LAST_EVENT_ID
			,HUNT_DM
			,UNSUBSCRIBE_DM
			,UNDELIVERABLE_DM
			,UNDELIVERABLE_XT
			,RPT_EXTRA_BT
			,UNCONFIRMED_FG
			,COLLECTIONSREP_ID
			,UNWANTED_DM
			,UNWANTEDEMAIL_ID
			,UNWANTEDEMAILCLASS_ID
			,CONFIRMATIONNEEDED_FG
			,CONFIRMATIONSENT_DM
			,CONFIRMATIONOK_DM
			,UNSUBSCRIBEEMAIL_ID
			,UNSUBSCRIBEEMAILCLASS_ID
			,RENTER_DM
			,ROOMMATE_DM
			,PROMO_ID
			,LASTLOGIN_DM
			,NICK_NM
			,REGISTRATIONURL_NM
			,CALL_DM
			,CALLDISPOSITION_NM
			,SAP_CUSTOMER_ID
			,HYPER_RR_EMAIL_SENT_DM
			,ABLCHECKPOINT_DM
			,PASSWORD_SOURCE
			,INSIDER_ID
			,REQUESTACALL_DM
			,PHONEFROMCALLERID_FG
			,REGISTER_DM
			,VISITOR_ID
			,PASSWORD_HASH
			,BROWSER_NM
			,CLIENTIP_NM
			,SALESREP_ID
			,TERMINATE_XT
			,PROCESSED_BT
			,AGENT_ID
			,SEENREWARDINTERSTITIAL_DM
			,CLICK_ID
			,UNIVERSAL_ID);

END


GO
/****** Object:  StoredProcedure [Staging].[tbl_fct_leadmessage_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/***********************************************************************************************************************
* Name:    [Staging].[tbl_fct_leadmessage_merge]
* -----------------------------------------------------------------------------------------------------------------------
* Desc:    
* -----------------------------------------------------------------------------------------------------------------------
* Test:
*    EXEC Staging.tbl_fct_leadmessage_merge;
* -----------------------------------------------------------------------------------------------------------------------
* Note: 
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 01   ?			  ?					?
* Hist: 02   05/23/2013   Brian Trembley    ticket 12353, current day reporting, align time zones
* Hist: 03	 12/18/2013	  Sarah Mims		Ticket #14084 Added DupeLeadFlag
***********************************************************************************************************************/

CREATE PROCEDURE [Staging].[tbl_fct_leadmessage_merge]
AS 
BEGIN

	-- Rent is 3 hours behind us so add 3 hours to their datetimes
	DECLARE @TimeZoneOffset INT = 3

	MERGE INTO Fact.LeadMessage AS tgt
		USING Staging.tbl_fct_leadmessage AS src
		ON tgt.LeadMessageID = src.LEADMESSAGE_ID
		WHEN MATCHED 
			THEN
 UPDATE		   SET
		tgt.CreateDate =  DATEADD(hour,@TimeZoneOffset,src.CREATE_DM)
	   ,tgt.UpdateDate = DATEADD(hour,@TimeZoneOffset,src.UPDATE_DM)
	   ,tgt.TerminateDate = DATEADD(hour,@TimeZoneOffset,src.TERMINATE_DM)
	   ,tgt.LeadID = src.LEAD_ID
	   ,tgt.SourceType = src.SOURCE_TP
	   ,tgt.RecipientType = src.RECIPIENT_TP
	   ,tgt.SenderTrackEmailID = src.SENDERTRACKEMAIL_ID
	   ,tgt.EmailSubjectText = src.EMAILSUBJECT_TX
	   ,tgt.TrackEmailID = src.TRACKEMAIL_ID
	   ,tgt.FaxID = src.FAX_ID
	   ,tgt.TrackPhoneCallID = src.TRACKPHONECALL_ID
	   ,tgt.UndeliverableDate = DATEADD(hour,@TimeZoneOffset,src.UNDELIVERABLE_DM)
	   ,tgt.ReadDate = DATEADD(hour,@TimeZoneOffset,src.READ_DM)
	   ,tgt.PersonID = src.PERSON_ID
	   ,tgt.PropertyID = src.PROPERTY_ID
	   ,tgt.SmallPropertyFlag = src.SMALLPROPERTY_FG
	   ,tgt.RenterDate = DATEADD(hour,@TimeZoneOffset,src.RENTER_DM)
	   ,tgt.SourceID = src.SOURCE_ID
	   ,tgt.StateCode = src.STATE_CD
	   ,tgt.LeadGroupID = src.LEADGROUP_ID
	   ,tgt.LeadGroupStatusID = src.LEADGROUPSTATUS_ID
	   ,tgt.BusinessModelType = src.BUSINESSMODEL_TP
	   ,tgt.SourceName = src.SOURCE_NM
	   ,tgt.SourceNameDate = DATEADD(hour,@TimeZoneOffset,src.SOURCE_NM_DM)
	   ,tgt.MessageText = src.MESSAGE_TX
	   ,tgt.ContactDate = DATEADD(hour,@TimeZoneOffset,src.CONTACT_DM)
	   ,tgt.DurationNumber = src.DURATION_NB
	   ,tgt.ContactStatus = src.CONTACTSTATUS_XT
	   ,tgt.LoftFlag = src.LOFT_FG
	   ,tgt.StudioFlag = src.STUDIO_FG
	   ,tgt.Bedroom1Flag = src.BEDROOM1_FG
	   ,tgt.Bedroom2Flag = src.BEDROOM2_FG
	   ,tgt.Bedroom3Flag = src.BEDROOM3_FG
	   ,tgt.Bedroom4Flag = src.BEDROOM4_FG
	   ,tgt.PasswordSource = src.PASSWORD_SOURCE
	   ,tgt.EmailID = src.EMAIL_ID
	   ,tgt.PhoneFromCallerIDFlag = src.PHONEFROMCALLERID_FG
	   ,tgt.SuppliedPhoneNumber = src.SUPPLIEDPHONE_NB
	   ,tgt.DupeLeadFlag	= src.DUP_LEAD_FLAG
		WHEN NOT MATCHED 
			THEN
 INSERT (
		LeadMessageID
	   ,CreateDate
	   ,UpdateDate
	   ,TerminateDate
	   ,LeadID
	   ,SourceType
	   ,RecipientType
	   ,SenderTrackEmailID
	   ,EmailSubjectText
	   ,TrackEmailID
	   ,FaxID
	   ,TrackPhoneCallID
	   ,UndeliverableDate
	   ,ReadDate
	   ,PersonID
	   ,PropertyID
	   ,SmallPropertyFlag
	   ,RenterDate
	   ,SourceID
	   ,StateCode
	   ,LeadGroupID
	   ,LeadGroupStatusID
	   ,BusinessModelType
	   ,SourceName
	   ,SourceNameDate
	   ,MessageText
	   ,ContactDate
	   ,DurationNumber
	   ,ContactStatus
	   ,LoftFlag
	   ,StudioFlag
	   ,Bedroom1Flag
	   ,Bedroom2Flag
	   ,Bedroom3Flag
	   ,Bedroom4Flag
	   ,PasswordSource
	   ,EmailID
	   ,PhoneFromCallerIDFlag
	   ,SuppliedPhoneNumber
	   ,DupeLeadFlag)
			   VALUES
		(LEADMESSAGE_ID
		,DATEADD(hour,@TimeZoneOffset,CREATE_DM )
		,DATEADD(hour,@TimeZoneOffset,UPDATE_DM)
		,DATEADD(hour,@TimeZoneOffset,TERMINATE_DM)
		,LEAD_ID
		,SOURCE_TP
		,RECIPIENT_TP
		,SENDERTRACKEMAIL_ID
		,EMAILSUBJECT_TX
		,TRACKEMAIL_ID
		,FAX_ID
		,TRACKPHONECALL_ID
		,DATEADD(hour,@TimeZoneOffset,UNDELIVERABLE_DM)
		,DATEADD(hour,@TimeZoneOffset,READ_DM)
		,PERSON_ID
		,PROPERTY_ID
		,SMALLPROPERTY_FG
		,DATEADD(hour,@TimeZoneOffset,RENTER_DM)
		,SOURCE_ID
		,STATE_CD
		,LEADGROUP_ID
		,LEADGROUPSTATUS_ID
		,BUSINESSMODEL_TP
		,SOURCE_NM
		,DATEADD(hour,@TimeZoneOffset,SOURCE_NM_DM)
		,MESSAGE_TX
		,DATEADD(hour,@TimeZoneOffset,CONTACT_DM)
		,DURATION_NB
		,CONTACTSTATUS_XT
		,LOFT_FG
		,STUDIO_FG
		,BEDROOM1_FG
		,BEDROOM2_FG
		,BEDROOM3_FG
		,BEDROOM4_FG
		,PASSWORD_SOURCE
		,EMAIL_ID
		,PHONEFROMCALLERID_FG
		,SUPPLIEDPHONE_NB
		,DUP_LEAD_FLAG);

END

GO
/****** Object:  StoredProcedure [Staging].[tbl_fct_leads_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/***********************************************************************************************************************
* Name:    [Staging].[tbl_fct_leads_merge]
* -----------------------------------------------------------------------------------------------------------------------
* Desc:    
* -----------------------------------------------------------------------------------------------------------------------
* Test:
*    EXEC Staging.tbl_fct_leads_merge;
* -----------------------------------------------------------------------------------------------------------------------
* Note: 
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 01   ?			  ?					?
* Hist: 02   05/23/2013   Brian Trembley    ticket 12353, current day reporting, align time zones

***********************************************************************************************************************/

CREATE PROCEDURE [Staging].[tbl_fct_leads_merge]
AS 
BEGIN
	-- Rent is 3 hours behind us so add 3 hours to their datetimes
	DECLARE @TimeZoneOffset INT = 3

	MERGE INTO Fact.Leads AS tgt
		USING Staging.tbl_fct_leads AS src
		ON	tgt.LeadID = src.LEAD_ID
		WHEN MATCHED 
			THEN
	UPDATE	   SET
			tgt.CreateDate = DATEADD(hour,@TimeZoneOffset,src.CREATE_DM)
		   ,tgt.UpdateDate = DATEADD(hour,@TimeZoneOffset,src.UPDATE_DM)
		   ,tgt.TerminateDate = DATEADD(hour,@TimeZoneOffset,src.TERMINATE_DM)
		   ,tgt.PersonID = src.PERSON_ID
		   ,tgt.PersonTrackPhoneCode = src.PERSONTRACKPHONE_CD
		   ,tgt.PersonTrackExtensionCode = src.PERSONTRACKEXTENSION_CD
		   ,tgt.PersonTrackEmailID = src.PERSONTRACKEMAIL_ID
		   ,tgt.PropertyID = src.PROPERTY_ID
		   ,tgt.LoftFlag = src.LOFT_FG
		   ,tgt.StudioFlag = src.STUDIO_FG
		   ,tgt.Bedroom1Flag = src.BEDROOM1_FG
		   ,tgt.Bedroom2Flag = src.BEDROOM2_FG
		   ,tgt.Bedroom3Flag = src.BEDROOM3_FG
		   ,tgt.Bedroom4Flag = src.BEDROOM4_FG
		   ,tgt.[Status] = src.STATUS_XT
		   ,tgt.SessionEmailID = src.SESSION_EMAIL_ID
		   ,tgt.RespondedFlag = src.RESPONDED_FG
		   ,tgt.PurgeDate = DATEADD(hour,@TimeZoneOffset,src.PURGE_DM)
		WHEN NOT MATCHED 
			THEN
	INSERT (
			LeadID
		   ,CreateDate
		   ,UpdateDate
		   ,TerminateDate
		   ,PersonID
		   ,PersonTrackPhoneCode
		   ,PersonTrackExtensionCode
		   ,PersonTrackEmailID
		   ,PropertyID
		   ,LoftFlag
		   ,StudioFlag
		   ,Bedroom1Flag
		   ,Bedroom2Flag
		   ,Bedroom3Flag
		   ,Bedroom4Flag
		   ,[Status]
		   ,SessionEmailID
		   ,RespondedFlag
		   ,PurgeDate)
			   VALUES 
			(LEAD_ID
			,DATEADD(hour,@TimeZoneOffset,CREATE_DM)
			,DATEADD(hour,@TimeZoneOffset,UPDATE_DM)
			,DATEADD(hour,@TimeZoneOffset,TERMINATE_DM)
			,PERSON_ID
			,PERSONTRACKPHONE_CD
			,PERSONTRACKEXTENSION_CD
			,PERSONTRACKEMAIL_ID
			,PROPERTY_ID
			,LOFT_FG
			,STUDIO_FG
			,BEDROOM1_FG
			,BEDROOM2_FG
			,BEDROOM3_FG
			,BEDROOM4_FG
			,STATUS_XT
			,SESSION_EMAIL_ID
			,RESPONDED_FG
			,DATEADD(hour,@TimeZoneOffset,PURGE_DM));

END

GO
/****** Object:  StoredProcedure [Staging].[tbl_fct_lease_drs_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC Staging.tbl_fct_lease_drs_merge;

CREATE PROCEDURE [Staging].[tbl_fct_lease_drs_merge]
AS 
BEGIN

	MERGE INTO Fact.Lease_DRS AS tgt
		USING Staging.tbl_fct_lease_drs AS src
		ON tgt.DRSID = src.DRS_ID
		WHEN MATCHED 
			THEN
 UPDATE		   SET
		tgt.YMDID = CAST(CONVERT(VARCHAR,src.CREATE_DM,112) AS INT)
	   ,tgt.CreateDate = src.CREATE_DM
	   ,tgt.UpdateDate = src.UPDATE_DM
	   ,tgt.TerminateDate = src.TERMINATE_DM
	   ,tgt.DRSVersionNumber = src.DRS_VERSION_NM
	   ,tgt.LeaseID = src.LEASE_ID
	   ,tgt.DRSDate = src.DRS_DM
	   ,tgt.DRSStatus = src.DRS_STATUS_XT
	   ,tgt.DRS = src.DRS_XT
		WHEN NOT MATCHED 
			THEN
 INSERT (
		YMDID
	   ,CreateDate
	   ,UpdateDate
	   ,TerminateDate
	   ,DRSID
	   ,DRSVersionNumber
	   ,LeaseID
	   ,DRSDate
	   ,DRSStatus
	   ,DRS)   VALUES
		(CAST(CONVERT(VARCHAR,CREATE_DM,112) AS INT)
		,CREATE_DM
		,UPDATE_DM
		,TERMINATE_DM
		,DRS_ID
		,DRS_VERSION_NM
		,LEASE_ID
		,DRS_DM
		,DRS_STATUS_XT
		,DRS_XT);

END

GO
/****** Object:  StoredProcedure [Staging].[tbl_rpt_lease_collection_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC Staging.tbl_rpt_lease_collection_merge;

CREATE PROCEDURE [Staging].[tbl_rpt_lease_collection_merge]
AS 
BEGIN

	MERGE INTO Fact.Lease_Collection AS tgt
		USING Staging.tbl_rpt_lease_collection AS src
		ON tgt.LeaseID = src.LEASE_ID
		WHEN MATCHED 
			THEN
 UPDATE		   SET
		tgt.YMDID = CAST(CONVERT(VARCHAR,src.COLLECTION_DM,112) AS INT)
	   ,tgt.CollectionDate = src.COLLECTION_DM
	   ,tgt.RenterID = src.RENTER_ID
	   ,tgt.SessionEmailID = src.SESSION_EMAIL_ID
	   ,tgt.PropertyID = src.PROPERTY_ID
	   ,tgt.PasswordSource = src.PASSWORD_SOURCE
	   ,tgt.SourceID = src.SOURCE_ID
	   ,tgt.RegDate = src.REG_DM
		WHEN NOT MATCHED 
			THEN
 INSERT (
		YMDID
	   ,LeaseID
	   ,CollectionDate
	   ,RenterID
	   ,SessionEmailID
	   ,PropertyID
	   ,PasswordSource
	   ,SourceID
	   ,RegDate)
			   VALUES
		(CAST(CONVERT(VARCHAR,COLLECTION_DM,112) AS INT)
		,LEASE_ID
		,COLLECTION_DM
		,RENTER_ID
		,SESSION_EMAIL_ID
		,PROPERTY_ID
		,PASSWORD_SOURCE
		,SOURCE_ID
		,REG_DM);

END

GO
/****** Object:  StoredProcedure [Staging].[tbl_rpt_lease_drs_perl_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC Staging.tbl_rpt_lease_drs_perl_merge;

CREATE PROCEDURE [Staging].[tbl_rpt_lease_drs_perl_merge]
AS 
BEGIN

	MERGE INTO Fact.Lease_DRS_Perl AS tgt
		USING Staging.tbl_rpt_lease_drs_perl AS src
		ON tgt.DRSID = src.DRS_ID
		WHEN MATCHED 
			THEN
 UPDATE		   SET
		tgt.YMDID = CAST(CONVERT(VARCHAR,src.CREATE_DM,112) AS INT)
	   ,tgt.CreateDate = src.CREATE_DM
	   ,tgt.UpdateDate = src.UPDATE_DM
	   ,tgt.SubmitterID = src.SUBMITTER_ID
	   ,tgt.DisputeReason = src.DISPUTE_REASON
	   ,tgt.DisputeDate = src.DISPUTE_DATE
	   ,tgt.ResponseType = src.RESPONSE_TYPE
	   ,tgt.RefSource = src.REF_SOURCE
	   ,tgt.RefSourceRent = src.REF_SOURCE_RENT
	   ,tgt.RefLocator = src.REF_LOCATOR
	   ,tgt.RefReferral = src.REF_REFERRAL
	   ,tgt.RefEmployee = src.REF_EMPLOYEE
	   ,tgt.RefCreditOther = src.REF_CREDIT_OTHER
	   ,tgt.RefDocument = src.REF_DOCUMENT
	   ,tgt.RefDocumentOther = src.REF_DOCUMENT_OTHER
	   ,tgt.SourcesListed = src.SOURCES_LISTED
	   ,tgt.RentOption = src.RENT_OPTION
	   ,tgt.SourceOption = src.SOURCE_OPTION
	   ,tgt.IsBogus = src.IS_BOGUS
	   ,tgt.IsCosigner = src.IS_COSIGNER
	   ,tgt.InContact = src.IN_CONTACT
	   ,tgt.StillMoving = src.STILL_MOVING
	   ,tgt.HaveTimeframe = src.HAVE_TIMEFRAME
	   ,tgt.MoveInDate = src.MOVE_IN_DATE
	   ,tgt.MovedIn = src.MOVED_IN
	   ,tgt.MovedInDiffDay = src.MOVED_IN_DIFF_DAY
	   ,tgt.MoveOutDate = src.MOVE_OUT_DATE
	   ,tgt.AcceptLate = src.ACCEPT_LATE
	   ,tgt.OrigRenterName = src.ORIG_RENTER_NAME
	   ,tgt.OrigRenterMoveInDate = src.ORIG_RENTER_MOVE_IN_DATE
	   ,tgt.OrigRenterIsCosigner = src.ORIG_RENTER_IS_COSIGNER
	   ,tgt.InvoiceExists = src.INVOICE_EXISTS
	   ,tgt.InvoicePaid = src.INVOICE_PAID
	   ,tgt.OrigMoveInDate = src.ORIG_MOVE_IN_DATE
	   ,tgt.PropertyResponse = src.PROPERTY_RESPONSE
	   ,tgt.CallerName = src.CALLER_NAME
	   ,tgt.SplitReferral = src.SPLIT_REFERRAL
	   ,tgt.ShowedMercy = src.SHOWED_MERCY
	   ,tgt.SentImpressionData = src.SENT_IMPRESSION_DATA
	   ,tgt.LeaseStatus = src.LEASE_STATUS
	   ,tgt.PreviousLeaseStatus = src.PREVIOUS_LEASE_STATUS
	   ,tgt.Community = src.COMMUNITY
		WHEN NOT MATCHED 
			THEN
 INSERT (
		YMDID
	   ,CreateDate
	   ,UpdateDate
	   ,DRSID
	   ,SubmitterID
	   ,DisputeReason
	   ,DisputeDate
	   ,ResponseType
	   ,RefSource
	   ,RefSourceRent
	   ,RefLocator
	   ,RefReferral
	   ,RefEmployee
	   ,RefCreditOther
	   ,RefDocument
	   ,RefDocumentOther
	   ,SourcesListed
	   ,RentOption
	   ,SourceOption
	   ,IsBogus
	   ,IsCosigner
	   ,InContact
	   ,StillMoving
	   ,HaveTimeframe
	   ,MoveInDate
	   ,MovedIn
	   ,MovedInDiffDay
	   ,MoveOutDate
	   ,AcceptLate
	   ,OrigRenterName
	   ,OrigRenterMoveInDate
	   ,OrigRenterIsCosigner
	   ,InvoiceExists
	   ,InvoicePaid
	   ,OrigMoveInDate
	   ,PropertyResponse
	   ,CallerName
	   ,SplitReferral
	   ,ShowedMercy
	   ,SentImpressionData
	   ,LeaseStatus
	   ,PreviousLeaseStatus
	   ,Community)
			   VALUES
		(CAST(CONVERT(VARCHAR,CREATE_DM,112) AS INT)
		,CREATE_DM
		,UPDATE_DM
		,DRS_ID
		,SUBMITTER_ID
		,DISPUTE_REASON
		,DISPUTE_DATE
		,RESPONSE_TYPE
		,REF_SOURCE
		,REF_SOURCE_RENT
		,REF_LOCATOR
		,REF_REFERRAL
		,REF_EMPLOYEE
		,REF_CREDIT_OTHER
		,REF_DOCUMENT
		,REF_DOCUMENT_OTHER
		,SOURCES_LISTED
		,RENT_OPTION
		,SOURCE_OPTION
		,IS_BOGUS
		,IS_COSIGNER
		,IN_CONTACT
		,STILL_MOVING
		,HAVE_TIMEFRAME
		,MOVE_IN_DATE
		,MOVED_IN
		,MOVED_IN_DIFF_DAY
		,MOVE_OUT_DATE
		,ACCEPT_LATE
		,ORIG_RENTER_NAME
		,ORIG_RENTER_MOVE_IN_DATE
		,ORIG_RENTER_IS_COSIGNER
		,INVOICE_EXISTS
		,INVOICE_PAID
		,ORIG_MOVE_IN_DATE
		,PROPERTY_RESPONSE
		,CALLER_NAME
		,SPLIT_REFERRAL
		,SHOWED_MERCY
		,SENT_IMPRESSION_DATA
		,LEASE_STATUS
		,PREVIOUS_LEASE_STATUS
		,COMMUNITY);

END

GO
/****** Object:  StoredProcedure [Staging].[tbl_sum_property_status_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--EXEC Staging.tbl_sum_property_status_merge;

CREATE PROCEDURE [Staging].[tbl_sum_property_status_merge]
/***********************************************************************************************************************
* Name:   staging.tbl_sum_property_status_merge
* -----------------------------------------------------------------------------------------------------------------------
* Desc:   Merge staged data into the fact table
* -----------------------------------------------------------------------------------------------------------------------
* Test:   
*         exec staging.tbl_sum_property_status_merge
* -----------------------------------------------------------------------------------------------------------------------
* Hist: 
* 01	unknown			unknown			Initial Version
* 02	10/14/2014		Don Wert		Ticket 17097, duplicates causing job failure.  Changed the USING portion of the MERGE
*										statement to apply ROW_NUMBER to the staging records, ordering by all the secondary
*										columns.  The query then pulls only those records with a sequence number of 1.  this eliminates
*										any rows that are absolute duplicates but will allow the MERGE statement to fail in the event of
*										duplicate property_id and date records with different values in the other columns.
*
***********************************************************************************************************************/


AS 
BEGIN

	MERGE INTO Fact.Sum_Property_Status AS tgt
		USING ( SELECT * 
				FROM (SELECT  PROPERTY_ID
						   ,DATE_DM
						   ,BUSINESSMODEL_TP
						   ,STATUS_XT
						   ,COMPANY_ID
						   ,COMPANY_NM
						   ,CHECKAVAILABILITYURL_NM
						   ,COMPANY_STATUS
						   ,BACKFILLED
						   ,FIRST_ACTIVATE_DM
						   ,ROW_NUMBER() OVER (PARTITION BY PROPERTY_ID,DATE_DM ORDER BY BUSINESSMODEL_TP
																					   , STATUS_XT
																					   , COMPANY_ID
																					   , COMPANY_NM
																					   , CHECKAVAILABILITYURL_NM
																					   , COMPANY_STATUS
																					   , BACKFILLED
																					   , FIRST_ACTIVATE_DM
							) AS seq
						FROM    Staging.tbl_sum_property_status ) AS a
				WHERE a.seq = 1
		) AS src
		ON tgt.[Date] = src.DATE_DM
			AND tgt.PropertyID = src.PROPERTY_ID
		WHEN MATCHED 
			THEN
 UPDATE		   SET
		tgt.YMDID = CAST(CONVERT(VARCHAR,src.DATE_DM,112) AS INT)
	   ,tgt.BusinessModelType = src.BUSINESSMODEL_TP
	   ,tgt.[Status] = src.STATUS_XT
	   ,tgt.CompanyID = src.COMPANY_ID
	   ,tgt.CompanyName = src.COMPANY_NM
	   ,tgt.CheckAvailabilityURLName = src.CHECKAVAILABILITYURL_NM
	   ,tgt.CompanyStatus = src.COMPANY_STATUS
	   ,tgt.Backfilled = src.BACKFILLED
	   ,tgt.FirstActivateDate = src.FIRST_ACTIVATE_DM
		WHEN NOT MATCHED 
			THEN
 INSERT (
		YMDID
	   ,PropertyID
	   ,[Date]
	   ,BusinessModelType
	   ,[Status]
	   ,CompanyID
	   ,CompanyName
	   ,CheckAvailabilityURLName
	   ,CompanyStatus
	   ,Backfilled
	   ,FirstActivateDate)
			   VALUES
		(CAST(CONVERT(VARCHAR,DATE_DM,112) AS INT)
		,PROPERTY_ID
		,DATE_DM
		,BUSINESSMODEL_TP
		,STATUS_XT
		,COMPANY_ID
		,COMPANY_NM
		,CHECKAVAILABILITYURL_NM
		,COMPANY_STATUS
		,BACKFILLED
		,FIRST_ACTIVATE_DM);

		--If there are duplicates, send an email to Rent.com alerting them so they can fix the problem.
		IF EXISTS(SELECT * 
					FROM (SELECT  PROPERTY_ID
							   ,DATE_DM
							   ,BUSINESSMODEL_TP
							   ,STATUS_XT
							   ,COMPANY_ID
							   ,COMPANY_NM
							   ,CHECKAVAILABILITYURL_NM
							   ,COMPANY_STATUS
							   ,BACKFILLED
							   ,FIRST_ACTIVATE_DM
							   ,ROW_NUMBER() OVER (PARTITION BY PROPERTY_ID,DATE_DM ORDER BY BUSINESSMODEL_TP
																						   , STATUS_XT
																						   , COMPANY_ID
																						   , COMPANY_NM
																						   , CHECKAVAILABILITYURL_NM
																						   , COMPANY_STATUS
																						   , BACKFILLED
																						   , FIRST_ACTIVATE_DM
								) AS seq
							FROM    Staging.tbl_sum_property_status ) AS a
					WHERE a.seq > 1)
			BEGIN
                DECLARE @SubjectTxt VARCHAR(50)
                   ,@RecipientsTxt VARCHAR(500)
                   ,@MessageTxt VARCHAR(2000)
				   ,@FirstDate DATE
				   ,@ServerName VARCHAR(128);

				   SELECT @ServerName = @@SERVERNAME

					SELECT @FirstDate = CAST(MIN(a.DATE_DM) AS DATE)
					FROM (SELECT  PROPERTY_ID
							   ,DATE_DM
							   ,BUSINESSMODEL_TP
							   ,STATUS_XT
							   ,COMPANY_ID
							   ,COMPANY_NM
							   ,CHECKAVAILABILITYURL_NM
							   ,COMPANY_STATUS
							   ,BACKFILLED
							   ,FIRST_ACTIVATE_DM
							   ,ROW_NUMBER() OVER (PARTITION BY PROPERTY_ID,DATE_DM ORDER BY BUSINESSMODEL_TP
																						   , STATUS_XT
																						   , COMPANY_ID
																						   , COMPANY_NM
																						   , CHECKAVAILABILITYURL_NM
																						   , COMPANY_STATUS
																						   , BACKFILLED
																						   , FIRST_ACTIVATE_DM
								) AS seq
							FROM    Staging.tbl_sum_property_status ) AS a
					WHERE a.seq > 1

					SET @SubjectTxt = 'Rent.com table reports.tbl_sum_property_status'
					SET @MessageTxt= CONCAT('Rent.com table reports.tbl_sum_property_status has duplicates.  The duplicates were introduced ',@FirstDate,'.  This Email Generated from SP [Rentcom.Staging.tbl_sum_property_status_merge] from Server ',@ServerName,'.')

					SET @RecipientsTxt = (SELECT EmailRecipients FROM DBAUtility.dbo.EMailRoles WHERE RoleObjectName = 'biteam')

					--SET @RecipientsTxt = (
					--						SELECT    'mgrimm@rent.com;' + emailrecipients
					--						FROM      [DBAUtility].[dbo].[EmailRoles]
					--						WHERE     RoleObjectName = 'BITeam'
					--						)
					IF LEN(@RecipientsTxt) > 3 
						BEGIN
							EXEC msdb.dbo.sp_send_dbmail 
								@recipients = @RecipientsTxt
								,@subject = @SubjectTxt

								,@body = @MessageTxt
								,@importance = 'Normal'
								,@body_format = 'TEXT'
						END
			END


END










GO
/****** Object:  StoredProcedure [Staging].[vw_SUM_SITE_merge]    Script Date: 9/5/2017 7:19:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[vw_SUM_SITE_merge]
AS 
BEGIN

	MERGE INTO Dimension.Campaign AS tgt
		USING Staging.vw_SUM_SITE AS src
		ON	tgt.SourceID = src.SOURCE_ID
		WHEN MATCHED 
			THEN
	UPDATE	   SET
			tgt.SourceName = src.SOURCE_NM
		   ,tgt.SourceType = src.SOURCE_TYPE
		   ,tgt.CampaignID = src.CAMPAIGN_ID
		   ,tgt.CampaignName = src.CAMPAIGN_NM
		   ,tgt.SiteID = src.SITE_ID
		   ,tgt.SiteName = src.SITE_NM
		   ,tgt.SiteType = src.SITE_TP
		   ,tgt.UpdateDate = src.UPDATE_DM
		WHEN NOT MATCHED 
			THEN
	INSERT (
			SourceID
		   ,SourceName
		   ,SourceType
		   ,CampaignID
		   ,CampaignName
		   ,SiteID
		   ,SiteName
		   ,SiteType
		   ,UpdateDate)
			   VALUES
			(SOURCE_ID
			,SOURCE_NM
			,SOURCE_TYPE
			,CAMPAIGN_ID
			,CAMPAIGN_NM
			,SITE_ID
			,SITE_NM
			,SITE_TP
			,UPDATE_DM);

END

GO
EXEC [RentCom].sys.sp_addextendedproperty @name=N'SQLSourceControl Scripts Location', @value=N'<?xml version="1.0" encoding="utf-16" standalone="yes"?>
<ISOCCompareLocation version="1" type="SvnLocation">
  <RepositoryUrl>http://svn.atl.primedia.com/repos/dev-project/trunk/BusinessIntelligence/Warehouse01/Databases/RentCom/</RepositoryUrl>
</ISOCCompareLocation>' 
GO
EXEC [RentCom].sys.sp_addextendedproperty @name=N'SQLSourceControl Database Revision', @value=74516 
GO
USE [master]
GO
ALTER DATABASE [RentCom] SET  READ_WRITE 
GO
USE [RentCom]
GO
SET ARITHABORT ON
SET CONCAT_NULL_YIELDS_NULL ON
SET QUOTED_IDENTIFIER ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
SET NUMERIC_ROUNDABORT OFF

GO
/****** Object:  Index [SpatialIndex-20150316-101339]    Script Date: 9/5/2017 7:19:04 AM ******/
CREATE SPATIAL INDEX [SpatialIndex-20150316-101339] ON [Dimension].[CourtesyListings]
(
	[GeogPoint]
)USING  GEOGRAPHY_GRID 
WITH (GRIDS =(LEVEL_1 = MEDIUM,LEVEL_2 = MEDIUM,LEVEL_3 = MEDIUM,LEVEL_4 = MEDIUM), 
CELLS_PER_OBJECT = 16, PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
