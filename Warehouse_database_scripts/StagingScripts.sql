USE [master]
GO
/****** Object:  Database [Staging]    Script Date: 9/5/2017 7:21:05 AM ******/
CREATE DATABASE [Staging]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Staging', FILENAME = N'F:\\Data\Staging.Mdf' , SIZE = 1048576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1048576KB ), 
 FILEGROUP [P5TableSpace] 
( NAME = N'P5TableSpace', FILENAME = N'F:\Data\StagingPTableSpace.ndf' , SIZE = 1048576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5120KB ), 
 FILEGROUP [P6IndexSpace] 
( NAME = N'P6IndexSpace', FILENAME = N'F:\Data\StagingP6IndexSpace.ndf' , SIZE = 1048576KB , MAXSIZE = UNLIMITED, FILEGROWTH = 5120KB )
 LOG ON 
( NAME = N'Staging_log', FILENAME = N'F:\Log\Staging_log.ldf' , SIZE = 1048576KB , MAXSIZE = 2048GB , FILEGROWTH = 1048576KB )
GO
ALTER DATABASE [Staging] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Staging].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Staging] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Staging] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Staging] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Staging] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Staging] SET ARITHABORT OFF 
GO
ALTER DATABASE [Staging] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Staging] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Staging] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Staging] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Staging] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Staging] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Staging] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Staging] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Staging] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Staging] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Staging] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Staging] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Staging] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Staging] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Staging] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Staging] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Staging] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Staging] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Staging] SET  MULTI_USER 
GO
ALTER DATABASE [Staging] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Staging] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Staging] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Staging] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Staging] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Staging', N'ON'
GO
ALTER DATABASE [Staging] SET QUERY_STORE = OFF
GO
USE [Staging]
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
USE [Staging]
GO
/****** Object:  Schema [Fact]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE SCHEMA [Fact]
GO
/****** Object:  Schema [Mart]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE SCHEMA [Mart]
GO
/****** Object:  Schema [RentalHouses]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE SCHEMA [RentalHouses]
GO
/****** Object:  Schema [reports]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE SCHEMA [reports]
GO
/****** Object:  Schema [Staging]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE SCHEMA [Staging]
GO
/****** Object:  Table [dbo].[AccountTemp]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountTemp](
	[AccountId] [varchar](15) NULL,
	[ModId] [varchar](30) NULL,
	[AnnualRevenues] [varchar](99) NULL,
	[AccountConcatField] [varchar](300) NULL,
	[CreatedDate] [varchar](99) NULL,
	[CurrencyCode] [varchar](15) NULL,
	[Description] [varchar](1999) NULL,
	[ExternalSystemId] [varchar](30) NULL,
	[WebSite] [varchar](100) NULL,
	[IntegrationId] [varchar](30) NULL,
	[Location] [varchar](50) NULL,
	[MainFax] [varchar](99) NULL,
	[MainPhone] [varchar](99) NULL,
	[ModifiedBy] [varchar](99) NULL,
	[ModifiedById] [varchar](99) NULL,
	[ModifiedDate] [varchar](99) NULL,
	[AccountName] [varchar](100) NULL,
	[NumberEmployees] [varchar](99) NULL,
	[Ranking] [varchar](99) NULL,
	[Owner] [varchar](50) NULL,
	[OwnerFullName] [varchar](99) NULL,
	[ParentAccountId] [varchar](99) NULL,
	[ParentAccountIntegrationId] [varchar](30) NULL,
	[ParentAccountLocation] [varchar](50) NULL,
	[ParentAccount] [varchar](100) NULL,
	[PartnerFlag] [varchar](99) NULL,
	[PrimaryBillToAddressId] [varchar](99) NULL,
	[PrimaryIndustryId] [varchar](99) NULL,
	[PrimaryShipToAddressId] [varchar](99) NULL,
	[Priority] [varchar](30) NULL,
	[PublicCompany] [varchar](99) NULL,
	[ReferenceSince] [varchar](99) NULL,
	[Reference] [varchar](99) NULL,
	[Region] [varchar](25) NULL,
	[AccountType] [varchar](30) NULL,
	[bManagement_Company_Change] [varchar](99) NULL,
	[bUnused_Checkbox_1] [varchar](99) NULL,
	[bDO_NOT_CALL] [varchar](99) NULL,
	[bAgent] [varchar](99) NULL,
	[bIs_selfagent] [varchar](99) NULL,
	[bIs_selfowner] [varchar](99) NULL,
	[bNational_Agent] [varchar](99) NULL,
	[bOwner] [varchar](99) NULL,
	[bProperty] [varchar](99) NULL,
	[bSend_data_to_Max] [varchar](99) NULL,
	[cAvg_RentSQF] [varchar](99) NULL,
	[cAverage_Rent] [varchar](99) NULL,
	[dMgmt_Co_Change_Date] [varchar](99) NULL,
	[dDrop_Notice_Received_Date] [varchar](99) NULL,
	[iNumber_of_communities_on_datafeed] [varchar](99) NULL,
	[iTotal_number_of_communities] [varchar](99) NULL,
	[iLast_Months_Leads] [varchar](99) NULL,
	[iVacancy_Loss] [varchar](99) NULL,
	[iTotal_Project_Units_Planned] [varchar](99) NULL,
	[iProject_Units_Release] [varchar](99) NULL,
	[iProject_Units_Not_Released] [varchar](99) NULL,
	[iProject_Units_Sold] [varchar](99) NULL,
	[iReleased_but_Unsold_Units_Left] [varchar](99) NULL,
	[iTotal_Units_Left_not_released_included] [varchar](99) NULL,
	[iBudgeted_Occupancy] [varchar](99) NULL,
	[iYTD_Leads] [varchar](99) NULL,
	[nNumber_of_Units] [varchar](99) NULL,
	[nNumber_of_Properties] [varchar](99) NULL,
	[nNumber_of_Communites_Advertising] [varchar](99) NULL,
	[pcCurrent_Occupancy] [varchar](99) NULL,
	[pcTurnover] [varchar](99) NULL,
	[pcPreleased_Occupancy] [varchar](99) NULL,
	[nNumber_of_Prospective_Communities] [varchar](99) NULL,
	[nAnnualized_Current_Vacancy_Loss] [varchar](99) NULL,
	[phSecondary_Phone] [varchar](40) NULL,
	[phSecondary_Fax] [varchar](40) NULL,
	[phTarget_Number_Internet] [varchar](40) NULL,
	[phTarget_Number_Other] [varchar](40) NULL,
	[phTarget_Number_Print] [varchar](40) NULL,
	[plUnused_Picklist_1] [varchar](30) NULL,
	[plAccount_Objective] [varchar](30) NULL,
	[plFiscal_Year_End] [varchar](30) NULL,
	[plHousing_Description] [varchar](30) NULL,
	[plSubaccount_Type] [varchar](30) NULL,
	[plAdvertiser_Type] [varchar](30) NULL,
	[plDivision_Selection] [varchar](30) NULL,
	[plRegion_Selection] [varchar](30) NULL,
	[plMarket_Selection] [varchar](30) NULL,
	[plPublication_Name] [varchar](30) NULL,
	[plSubsection] [varchar](30) NULL,
	[plBill_To] [varchar](30) NULL,
	[plProperty_Type] [varchar](30) NULL,
	[plManagement_Company_Type] [varchar](30) NULL,
	[plMarket] [varchar](30) NULL,
	[plSection] [varchar](30) NULL,
	[plOriginal_Data_Source] [varchar](30) NULL,
	[plDatafield] [varchar](30) NULL,
	[plComplete] [varchar](30) NULL,
	[plDivision] [varchar](30) NULL,
	[ltComps] [varchar](255) NULL,
	[ltMain_Contact] [varchar](255) NULL,
	[ltFormer_Property_Name] [varchar](255) NULL,
	[ltLead_Email_Address] [varchar](255) NULL,
	[stYear_Built] [varchar](40) NULL,
	[stALN_ID] [varchar](40) NULL,
	[stClient_ID] [varchar](40) NULL,
	[stProperty_Email_Address] [varchar](40) NULL,
	[stMAX_Client_ID] [varchar](40) NULL,
	[stFormer_Management_Company_Name] [varchar](40) NULL,
	[Industry] [varchar](50) NULL,
	[CI_AccountName] [varchar](99) NULL,
	[CI_Location] [varchar](99) NULL,
	[FuriganaName] [varchar](50) NULL,
	[CreatedById] [varchar](15) NULL,
	[ReassignOwnerFlag] [varchar](1) NULL,
	[SourceCampaignExternalId] [varchar](15) NULL,
	[SourceCampaignId] [varchar](15) NULL,
	[SourceCampaignName] [varchar](100) NULL,
	[CreatedBy] [varchar](99) NULL,
	[ParentAccountExternalSystemId] [varchar](30) NULL,
	[NumberOfPhysicians] [varchar](99) NULL,
	[CallFrequency] [varchar](30) NULL,
	[ClosedRevenue] [varchar](99) NULL,
	[HIN] [varchar](99) NULL,
	[OwnerEmailAddress] [varchar](100) NULL,
	[Stage] [varchar](30) NULL,
	[InfluenceType] [varchar](30) NULL,
	[LastCallDate] [varchar](99) NULL,
	[MarketPotential] [varchar](30) NULL,
	[MarketSegment] [varchar](30) NULL,
	[MarketShare] [varchar](99) NULL,
	[Route] [varchar](30) NULL,
	[Status] [varchar](30) NULL,
	[TerritoryExternalId] [varchar](30) NULL,
	[TerritoryId] [varchar](15) NULL,
	[PrimaryContactFullName] [varchar](99) NULL,
	[PrimaryContactId] [varchar](15) NULL,
	[PrimaryContactIntegrationId] [varchar](30) NULL,
	[PrimaryContactExternalSystemId] [varchar](30) NULL,
	[PrimaryBillToAddressIntegrationId] [varchar](30) NULL,
	[PrimaryShipToAddressIntegrationId] [varchar](30) NULL,
	[PrimaryBillToAddressExternalSystemId] [varchar](30) NULL,
	[PrimaryShipToAddressExternalSystemId] [varchar](30) NULL,
	[IndexedBoolean0] [varchar](99) NULL,
	[IndexedCurrency0] [varchar](99) NULL,
	[IndexedDate0] [varchar](99) NULL,
	[IndexedLongText0] [varchar](255) NULL,
	[IndexedNumber0] [varchar](99) NULL,
	[IndexedPick0] [varchar](30) NULL,
	[IndexedPick1] [varchar](30) NULL,
	[IndexedPick2] [varchar](30) NULL,
	[IndexedPick3] [varchar](30) NULL,
	[IndexedPick4] [varchar](30) NULL,
	[IndexedPick5] [varchar](30) NULL,
	[IndexedShortText0] [varchar](40) NULL,
	[IndexedShortText1] [varchar](40) NULL,
	[PrimaryBillToCity] [varchar](50) NULL,
	[PrimaryBillToCountry] [varchar](30) NULL,
	[PrimaryBillToCounty] [varchar](50) NULL,
	[PrimaryBillToPostalCode] [varchar](30) NULL,
	[PrimaryBillToProvince] [varchar](50) NULL,
	[PrimaryBillToStreetAddress] [varchar](200) NULL,
	[PrimaryBillToStreetAddress2] [varchar](100) NULL,
	[PrimaryBillToStreetAddress3] [varchar](100) NULL,
	[PrimaryBillToState] [varchar](10) NULL,
	[PrimaryShipToCity] [varchar](50) NULL,
	[PrimaryShipToCountry] [varchar](30) NULL,
	[PrimaryShipToCounty] [varchar](50) NULL,
	[PrimaryShipToPostalCode] [varchar](30) NULL,
	[PrimaryShipToProvince] [varchar](50) NULL,
	[PrimaryShipToState] [varchar](10) NULL,
	[PrimaryShipToStreetAddress] [varchar](200) NULL,
	[PrimaryShipToStreetAddress2] [varchar](100) NULL,
	[PrimaryShipToStreetAddress3] [varchar](100) NULL,
	[PrimaryGroup] [varchar](50) NULL,
	[OwnerId] [varchar](99) NULL,
	[Territory] [varchar](50) NULL,
	[ModifiedbyEmailAddress] [varchar](100) NULL,
	[LastUpdated] [varchar](99) NULL,
	[CustomObject3Name] [varchar](255) NULL,
	[CustomObject3Id] [varchar](15) NULL,
	[CustomObject3ExternalSystemId] [varchar](30) NULL,
	[CustomObject2Name] [varchar](255) NULL,
	[CustomObject2ExternalSystemId] [varchar](30) NULL,
	[CustomObject2Id] [varchar](15) NULL,
	[CustomObject1Name] [varchar](255) NULL,
	[CustomObject1Id] [varchar](15) NULL,
	[CustomObject1ExternalSystemId] [varchar](30) NULL,
	[CreatedbyEmailAddress] [varchar](100) NULL,
	[AssignmentStatus] [varchar](99) NULL,
	[LastAssignmentCompletionDate] [varchar](99) NULL,
	[LastAssignmentSubmissionDate] [varchar](99) NULL,
	[PartnerOrgStatus] [varchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AGMostRecentSearchEnginesOrganic]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AGMostRecentSearchEnginesOrganic](
	[mostRecentSearchEngine] [varchar](500) NULL,
	[MostRecentSearchPhrase] [varchar](500) NULL,
	[Visits] [int] NULL,
	[PageViews] [int] NULL,
	[PercentOfAllVisits] [numeric](10, 0) NULL,
	[AverageVisitDurationMinutes] [numeric](10, 0) NULL,
	[Hits] [int] NULL,
	[Revenue] [int] NULL,
	[AverageRevenuePerOrder] [numeric](10, 0) NULL,
	[Units] [int] NULL,
	[AverageUnitsPerOrder] [numeric](10, 0) NULL,
	[Orders] [int] NULL,
	[TimePeriod] [varchar](100) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[APTGRealPagePropertyManagementLookup]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[APTGRealPagePropertyManagementLookup](
	[ManageMentName] [varchar](50) NOT NULL,
	[CompanyID] [varchar](50) NOT NULL,
	[GuestCardActive] [bit] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CallLoaderApartmentGuideTrends]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CallLoaderApartmentGuideTrends](
	[CallID] [nvarchar](255) NULL,
	[TimeInitiated] [nvarchar](255) NULL,
	[Duration] [nvarchar](255) NULL,
	[InboundTelephoneNumber] [nvarchar](255) NULL,
	[TelephoneNumber] [nvarchar](255) NULL,
	[UserTelephoneNumber] [nvarchar](255) NULL,
	[callername] [nvarchar](255) NULL,
	[callerlocation] [nvarchar](255) NULL,
	[var1] [nvarchar](255) NULL,
	[var2] [nvarchar](255) NULL,
	[var3] [nvarchar](255) NULL,
	[var4] [nvarchar](255) NULL,
	[var5] [nvarchar](255) NULL,
	[var6] [nvarchar](255) NULL,
	[var7] [nvarchar](255) NULL,
	[var8] [nvarchar](255) NULL,
	[var9] [nvarchar](255) NULL,
	[var10] [nvarchar](255) NULL,
	[calleraddress] [nvarchar](255) NULL,
	[callercity] [nvarchar](255) NULL,
	[callerstate] [nvarchar](255) NULL,
	[callerzip] [nvarchar](255) NULL,
	[LinkName] [nvarchar](255) NULL,
	[LinkID] [nvarchar](255) NULL,
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
	[RenterHouseholds] [nvarchar](255) NULL,
	[ListenURL] [nvarchar](255) NULL,
	[AudioURL] [nvarchar](255) NULL,
	[MissedAndShortCallTrackingCalls_Id] [nvarchar](255) NULL,
	[YMDID] [int] NULL,
	[callloadhour] [int] NULL,
	[callloadymdid] [int] NULL,
	[CallStatus] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CallLoaderNewHomeGuideTrends]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CallLoaderNewHomeGuideTrends](
	[CallID] [nvarchar](255) NULL,
	[TimeInitiated] [nvarchar](255) NULL,
	[Duration] [nvarchar](255) NULL,
	[InboundTelephoneNumber] [nvarchar](255) NULL,
	[TelephoneNumber] [nvarchar](255) NULL,
	[UserTelephoneNumber] [nvarchar](255) NULL,
	[callername] [nvarchar](255) NULL,
	[callerlocation] [nvarchar](255) NULL,
	[var1] [nvarchar](255) NULL,
	[var2] [nvarchar](255) NULL,
	[var3] [nvarchar](255) NULL,
	[var4] [nvarchar](255) NULL,
	[var5] [nvarchar](255) NULL,
	[var6] [nvarchar](255) NULL,
	[var7] [nvarchar](255) NULL,
	[var8] [nvarchar](255) NULL,
	[var9] [nvarchar](255) NULL,
	[var10] [nvarchar](255) NULL,
	[calleraddress] [nvarchar](255) NULL,
	[callercity] [nvarchar](255) NULL,
	[callerstate] [nvarchar](255) NULL,
	[callerzip] [nvarchar](255) NULL,
	[LinkName] [nvarchar](255) NULL,
	[LinkID] [nvarchar](255) NULL,
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
	[RenterHouseholds] [nvarchar](255) NULL,
	[MissedAndShortCallTrackingCalls_Id] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CallLoaderRentalsTrends]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CallLoaderRentalsTrends](
	[CallID] [nvarchar](255) NULL,
	[TimeInitiated] [nvarchar](255) NULL,
	[Duration] [nvarchar](255) NULL,
	[InboundTelephoneNumber] [numeric](20, 0) NULL,
	[TelephoneNumber] [numeric](20, 0) NULL,
	[UserTelephoneNumber] [nvarchar](255) NULL,
	[callername] [nvarchar](255) NULL,
	[callerlocation] [nvarchar](255) NULL,
	[var1] [nvarchar](255) NULL,
	[var2] [nvarchar](255) NULL,
	[var3] [nvarchar](255) NULL,
	[var4] [nvarchar](255) NULL,
	[var5] [nvarchar](255) NULL,
	[var6] [nvarchar](255) NULL,
	[var7] [nvarchar](255) NULL,
	[var8] [nvarchar](255) NULL,
	[var9] [nvarchar](255) NULL,
	[var10] [nvarchar](255) NULL,
	[calleraddress] [nvarchar](255) NULL,
	[callercity] [nvarchar](255) NULL,
	[callerstate] [nvarchar](255) NULL,
	[callerzip] [nvarchar](255) NULL,
	[LinkName] [nvarchar](255) NULL,
	[LinkID] [bigint] NULL,
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
	[RenterHouseholds] [nvarchar](255) NULL,
	[ListenURL] [nvarchar](255) NULL,
	[AudioURL] [nvarchar](255) NULL,
	[dateconnected] [nvarchar](255) NULL,
	[dateinitiated] [nvarchar](255) NULL,
	[MissedAndShortCallTrackingCalls_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClickToCallLoaderTrends]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClickToCallLoaderTrends](
	[CallID] [nvarchar](255) NULL,
	[TimeInitiated] [nvarchar](255) NULL,
	[Duration] [nvarchar](255) NULL,
	[InboundTelephoneNumber] [nvarchar](255) NULL,
	[TelephoneNumber] [nvarchar](255) NULL,
	[UserTelephoneNumber] [nvarchar](255) NULL,
	[callername] [nvarchar](255) NULL,
	[callerlocation] [nvarchar](255) NULL,
	[CallerIP] [nvarchar](255) NULL,
	[var1] [nvarchar](255) NULL,
	[var2] [nvarchar](255) NULL,
	[var3] [nvarchar](255) NULL,
	[var4] [nvarchar](255) NULL,
	[var5] [nvarchar](255) NULL,
	[var6] [nvarchar](255) NULL,
	[var7] [nvarchar](255) NULL,
	[var8] [nvarchar](255) NULL,
	[var9] [nvarchar](255) NULL,
	[var10] [nvarchar](255) NULL,
	[Referrer] [nvarchar](1000) NULL,
	[calleraddress] [nvarchar](255) NULL,
	[callercity] [nvarchar](255) NULL,
	[callerstate] [nvarchar](255) NULL,
	[callerzip] [nvarchar](255) NULL,
	[LinkName] [nvarchar](255) NULL,
	[LinkID] [nvarchar](255) NULL,
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
	[RenterHouseholds] [nvarchar](255) NULL,
	[MissedAndShortCallBackCalls_Id] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[david_commercial]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[david_commercial](
	[Network] [varchar](255) NULL,
	[AirDateTime] [datetime] NULL,
	[Program Name] [varchar](255) NULL,
	[LengthInSeconds] [int] NULL,
	[Media Type] [varchar](255) NULL,
	[ymdid] [int] NULL,
	[ymdid2] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimensionAllProfiles]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimensionAllProfiles](
	[ProfileID] [int] NOT NULL,
	[ProfileName] [varchar](50) NOT NULL,
	[DCSID] [varchar](50) NOT NULL,
	[Comment] [varchar](50) NULL,
	[SubProfileID] [smallint] NOT NULL,
 CONSTRAINT [PK_DimensionAllProfiles] PRIMARY KEY CLUSTERED 
(
	[DCSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimensionMeasureTypes]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimensionMeasureTypes](
	[MeasureTypeID] [int] IDENTITY(1,1) NOT NULL,
	[MeasureType] [varchar](50) NOT NULL,
	[MeasureTypeName] [varchar](50) NOT NULL,
	[MeasureTypeProfiles] [varchar](500) NULL,
	[IsExcluded] [tinyint] NOT NULL,
	[MeasureTypeDescription] [varchar](150) NULL,
	[MeasureTypeExample] [varchar](7000) NULL,
	[TimesFiredIn2Weeks] [bigint] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[IsPageView] [bit] NULL,
	[IsMultiTrack] [bit] NULL,
	[LastTimeFired] [datetime] NULL,
	[IsMarted] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DimensionProfiles]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DimensionProfiles](
	[ProfileID] [int] NOT NULL,
	[ProfileName] [varchar](50) NOT NULL,
	[DCSID] [varchar](50) NOT NULL,
	[YMDIDToMart] [int] NULL,
	[DestinationDatabase] [varchar](50) NOT NULL,
	[SiteProfile] [varchar](50) NULL,
	[SubProfileID] [smallint] NOT NULL,
 CONSTRAINT [PK_DimensionProfiles] PRIMARY KEY CLUSTERED 
(
	[DCSID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 100) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Dimphonelookup_last2]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dimphonelookup_last2](
	[PhoneNumber] [varchar](20) NULL,
	[PhoneType] [varchar](10) NULL,
	[DID] [varchar](10) NULL,
	[RecordType] [varchar](10) NULL,
	[FirstDate] [datetime2](3) NULL,
	[LastDate] [datetime2](3) NULL,
	[TELCOName] [varchar](50) NULL,
	[BusinessName] [varchar](100) NULL,
	[FirstName] [varchar](100) NULL,
	[MiddleInitial] [varchar](1) NULL,
	[LastName] [varchar](100) NULL,
	[PrimaryStreetNumber] [varchar](20) NULL,
	[PrimaryPredirAbbrev] [varchar](10) NULL,
	[PrimaryStreetName] [varchar](100) NULL,
	[PrimaryStreetSuffix] [varchar](10) NULL,
	[PrimaryPostdirAbbrev] [varchar](10) NULL,
	[SecondaryUnitType] [varchar](20) NULL,
	[SecondaryUnitNBR] [varchar](10) NULL,
	[City] [varchar](50) NULL,
	[StateCode] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[ZipExt] [varchar](10) NULL,
	[DeliveryPointCode] [varchar](10) NULL,
	[CarrierRoute] [varchar](10) NULL,
	[CountyCode] [varchar](10) NULL,
	[Zip4Type] [varchar](10) NULL,
	[DeliveryPointValidation] [varchar](10) NULL,
	[MailableFlag] [varchar](10) NULL,
	[AddressValidationDate] [datetime2](3) NULL,
	[Country] [varchar](10) NULL,
	[MCD] [varchar](10) NULL,
	[DirectoryAssistance] [varchar](10) NULL,
	[TelephoneConfidenceScore] [varchar](10) NULL,
	[LastUpdateDate] [datetime2](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvalidDimensionMeasureTypes]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvalidDimensionMeasureTypes](
	[MeasureTypeID] [int] NOT NULL,
	[MeasureType] [varchar](50) NOT NULL,
	[MeasureTypeName] [varchar](50) NOT NULL,
	[MeasureTypeProfiles] [varchar](500) NULL,
	[IsExcluded] [tinyint] NOT NULL,
	[MeasureTypeDescription] [varchar](150) NULL,
	[MeasureTypeExample] [varchar](7000) NULL,
	[TimesFiredIn2Weeks] [bigint] NOT NULL,
	[DateAdded] [datetime] NOT NULL,
	[IsPageView] [bit] NULL,
	[IsMultiTrack] [bit] NULL,
	[LastTimeFired] [datetime] NULL,
	[IsMarted] [tinyint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KMSRPData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KMSRPData](
	[ProfileName] [varchar](25) NOT NULL,
	[SubProfileName] [varchar](50) NOT NULL,
	[YMDID] [int] NOT NULL,
	[ListingID] [varchar](4000) NULL,
	[ScreenType] [varchar](20) NOT NULL,
	[Browser] [varchar](15) NOT NULL,
	[OperatingSystem] [varchar](30) NOT NULL,
	[TrafficSourceName] [varchar](20) NOT NULL,
	[CustLocation] [varchar](64) NOT NULL,
	[SearchLocation] [varchar](64) NOT NULL,
	[SRPImpCount] [int] NULL,
	[SRPVisitorCount] [int] NULL,
	[SRPVisitCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KMSRPData_ID]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KMSRPData_ID](
	[ID] [bigint] NULL,
	[ProfileName] [varchar](25) NOT NULL,
	[SubProfileName] [varchar](50) NOT NULL,
	[YMDID] [int] NOT NULL,
	[ListingID] [varchar](4000) NULL,
	[ScreenType] [varchar](20) NOT NULL,
	[Browser] [varchar](15) NOT NULL,
	[OperatingSystem] [varchar](30) NOT NULL,
	[TrafficSourceName] [varchar](20) NOT NULL,
	[CustLocation] [varchar](64) NOT NULL,
	[SearchLocation] [varchar](64) NOT NULL,
	[SRPImpCount] [int] NULL,
	[SRPVisitorCount] [int] NULL,
	[SRPVisitCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KMTest_Two]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KMTest_Two](
	[ProfileName] [varchar](25) NOT NULL,
	[SubProfileName] [varchar](50) NOT NULL,
	[YMDID] [int] NOT NULL,
	[ListingID] [varchar](4000) NULL,
	[ScreenType] [varchar](20) NOT NULL,
	[Browser] [varchar](15) NOT NULL,
	[OperatingSystem] [varchar](30) NOT NULL,
	[TrafficSourceName] [varchar](20) NOT NULL,
	[CustLocation] [varchar](64) NOT NULL,
	[SearchLocation] [varchar](64) NOT NULL,
	[SRPImpCount] [int] NULL,
	[SRPVisitorCount] [int] NULL,
	[SRPVisitCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ListFromOracle]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListFromOracle](
	[CallLoadYMDID] [numeric](38, 0) NULL,
	[CallloadHour] [numeric](38, 0) NULL,
	[callstatus] [nvarchar](384) NULL,
	[Call_ID] [nvarchar](36) NOT NULL,
	[var2] [nvarchar](20) NULL,
	[Call_Date] [datetime2](7) NULL,
	[Duration_In_Sec] [nvarchar](384) NULL,
	[YMDID] [numeric](38, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ListFromOracle2]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListFromOracle2](
	[CallLoadYMDID] [numeric](38, 0) NULL,
	[CallloadHour] [numeric](38, 0) NULL,
	[callstatus] [nvarchar](384) NULL,
	[Call_ID] [nvarchar](36) NOT NULL,
	[var2] [nvarchar](20) NULL,
	[Call_Date] [datetime2](7) NULL,
	[Duration_In_Sec] [nvarchar](384) NULL,
	[YMDID] [numeric](38, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[non_sem_visit]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[non_sem_visit](
	[measure] [varchar](7000) NOT NULL,
	[parseid] [int] NULL,
	[ref] [varchar](7000) NULL,
	[qry] [varchar](7000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParsedData]    Script Date: 9/5/2017 7:21:06 AM ******/
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
) ON [P5TableSpace]

GO
/****** Object:  Table [dbo].[ParsedDataByHour]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParsedDataByHour](
	[ParseID] [bigint] NULL,
	[ProfileID] [int] NOT NULL,
	[YMDID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[MeasureType] [varchar](50) NOT NULL,
	[Measure] [varchar](7000) NOT NULL,
	[SubProfileID] [smallint] NULL
) ON [P5TableSpace]

GO
/****** Object:  Table [dbo].[ParsedDataByHour_20160726_NoDups]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParsedDataByHour_20160726_NoDups](
	[ParseID] [bigint] NULL,
	[ProfileID] [int] NOT NULL,
	[YMDID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[MeasureType] [varchar](50) NULL,
	[Measure] [varchar](7000) NULL,
	[SubProfileID] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParsedDataByHourNew]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParsedDataByHourNew](
	[ProfileKey] [int] NULL,
	[ParseID] [bigint] NULL,
	[YMDID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[MeasureType] [varchar](50) NOT NULL,
	[Measure] [varchar](7000) NOT NULL
) ON [P5TableSpace]

GO
/****** Object:  Table [dbo].[ParsedDataNewHourly]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParsedDataNewHourly](
	[ParseID] [bigint] NOT NULL,
	[ProfileID] [int] NOT NULL,
	[YMDID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[MeasureType] [varchar](100) NOT NULL,
	[Measure] [varchar](7000) NOT NULL,
	[SubProfileID] [smallint] NULL
) ON [P5TableSpace]

GO
/****** Object:  Table [dbo].[parseddataNoprofile]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[parseddataNoprofile](
	[ParseID] [bigint] NULL,
	[ProfileID] [int] NOT NULL,
	[YMDID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[MeasureType] [varchar](50) NOT NULL,
	[Measure] [varchar](7000) NOT NULL,
	[SubProfileID] [smallint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ParseFlatFile]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParseFlatFile](
	[text1] [varchar](8000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PhoneLookupLoader]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PhoneLookupLoader](
	[PhoneNumber] [varchar](20) NOT NULL,
	[PhoneType] [varchar](10) NULL,
	[DID] [varchar](10) NULL,
	[RecordType] [varchar](10) NULL,
	[FirstDate] [datetime] NULL,
	[LastDate] [datetime] NULL,
	[TELCOName] [varchar](50) NULL,
	[BusinessName] [varchar](100) NULL,
	[FirstName] [varchar](100) NULL,
	[MiddleInitial] [varchar](1) NULL,
	[LastName] [varchar](100) NULL,
	[PrimaryStreetNumber] [varchar](20) NULL,
	[PrimaryPredirAbbrev] [varchar](10) NULL,
	[PrimaryStreetName] [varchar](100) NULL,
	[PrimaryStreetSuffix] [varchar](10) NULL,
	[PrimaryPostdirAbbrev] [varchar](10) NULL,
	[SecondaryUnitType] [varchar](20) NULL,
	[SecondaryUunitNBR] [varchar](10) NULL,
	[City] [varchar](50) NULL,
	[StateCode] [varchar](2) NULL,
	[Zip] [varchar](10) NULL,
	[ZipExt] [varchar](10) NULL,
	[DeliveryPointCode] [varchar](10) NULL,
	[CarrierRoute] [varchar](10) NULL,
	[CountyCode] [varchar](10) NULL,
	[Zip4Type] [varchar](10) NULL,
	[DeliveryPointValidation] [varchar](10) NULL,
	[MailableFlag] [varchar](10) NULL,
	[AddressValidationDate] [datetime] NULL,
	[Country] [varchar](10) NULL,
	[MCD] [varchar](10) NULL,
	[DirectoryAssistance] [varchar](10) NULL,
	[TelephoneConfidenceScore] [varchar](10) NULL,
	[LastUpdateDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RentalsNewShoppersAndrew]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentalsNewShoppersAndrew](
	[VisitEventKey] [int] NOT NULL,
	[EventDateKey] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[RentcomCommercialData_20150706]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RentcomCommercialData_20150706](
	[Network] [varchar](255) NULL,
	[AirDateTime] [datetime] NULL,
	[Program Name] [varchar](255) NULL,
	[LengthInSeconds] [int] NULL,
	[Media Type] [varchar](255) NULL,
	[ymdid] [int] NULL,
	[ymdid2] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ReportServerConversion]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportServerConversion](
	[ConvertID] [int] IDENTITY(1,1) NOT NULL,
	[ReportServer] [varchar](25) NOT NULL,
	[ConvertInd] [tinyint] NOT NULL,
	[ConvertNote] [varchar](65) NULL,
	[ReportPath] [varchar](255) NOT NULL,
	[ReportName] [varchar](255) NOT NULL,
	[NumOfExecutions] [int] NULL,
	[ItemID] [varchar](255) NOT NULL,
	[LastRunDate] [datetime] NULL,
	[ReportModifyDate] [datetime] NULL,
	[AvgTimeDataRetrieval] [int] NULL,
	[AvgTimeProcessing] [int] NULL,
	[AvgTimeRendering] [int] NULL,
	[AvgTotalTime] [int] NULL,
	[DataDate] [datetime] NOT NULL,
	[Converted] [tinyint] NOT NULL,
	[ConvertPath] [varchar](255) NULL,
	[CheckedOutBy] [varchar](65) NULL,
	[CheckedOutDate] [datetime] NULL,
	[ModifiedUser] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ServiceChecklistTemp]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceChecklistTemp](
	[LastUpdated] [varchar](255) NULL,
	[ServiceRequestId] [varchar](30) NULL,
	[ModId] [varchar](30) NULL,
	[SUBJECT] [varchar](250) NULL,
	[AccountName] [varchar](100) NULL,
	[AccountID] [varchar](30) NULL,
	[AccountLocation] [varchar](50) NULL,
	[Area] [varchar](30) NULL,
	[AssetId] [varchar](99) NULL,
	[ClosedTime] [varchar](99) NULL,
	[WorkPhone] [varchar](25) NULL,
	[ContactEmail] [varchar](100) NULL,
	[ContactFirstName] [varchar](50) NULL,
	[ContactFullName] [varchar](99) NULL,
	[ContactId] [varchar](99) NULL,
	[ContactLastName] [varchar](50) NULL,
	[CreatedByName] [varchar](50) NULL,
	[Description] [varchar](2000) NULL,
	[ExternalSystemId] [varchar](30) NULL,
	[IntegrationId] [varchar](30) NULL,
	[ModifiedBy] [varchar](99) NULL,
	[ModifiedByFullName] [varchar](99) NULL,
	[ModifiedById] [varchar](99) NULL,
	[ModifiedDate] [varchar](99) NULL,
	[OpenedTime] [varchar](99) NULL,
	[OwnerId] [varchar](99) NULL,
	[Owner] [varchar](50) NULL,
	[SRNumber] [varchar](64) NULL,
	[Type] [varchar](30) NULL,
	[AssetName] [varchar](100) NULL,
	[Source] [varchar](30) NULL,
	[STATUS] [varchar](30) NULL,
	[iNumber_of_Units] [varchar](99) NULL,
	[iAverage_Rent] [varchar](99) NULL,
	[iTraffic_2_Months_Prior_AG] [varchar](99) NULL,
	[iLeases_Current_Month] [varchar](99) NULL,
	[iLeases_Last_Month] [varchar](99) NULL,
	[iLeases_2_Months_Prior] [varchar](99) NULL,
	[iTraffic_Current_Month] [varchar](99) NULL,
	[iTraffic_Last_Month] [varchar](99) NULL,
	[iTraffic_2_Months_Prior] [varchar](99) NULL,
	[iLeases_Current_Month_1] [varchar](99) NULL,
	[iLeases_Current_Month_2] [varchar](99) NULL,
	[iLeases_Current_Month_3] [varchar](99) NULL,
	[iCurrent_Occupancy] [varchar](99) NULL,
	[iBudgeted_Occupancy] [varchar](99) NULL,
	[iPreleased_Occupancy] [varchar](99) NULL,
	[iLeases_Current_Month_AG] [varchar](99) NULL,
	[iLeases_Last_Month_AG] [varchar](99) NULL,
	[iLeases_2_Months_Prior_AG] [varchar](99) NULL,
	[iTraffic_Current_Month_AG] [varchar](99) NULL,
	[iTraffic_Last_Month_AG] [varchar](99) NULL,
	[nAnnualized_Current_Vacancy_Loss] [varchar](99) NULL,
	[nTraffic_Last_Month_3] [varchar](99) NULL,
	[nTraffic_Last_Month_4] [varchar](99) NULL,
	[nTraffic_2_Months_Prior_1] [varchar](99) NULL,
	[nTraffic_2_Months_Prior_2] [varchar](99) NULL,
	[nTraffic_2_Months_Prior_3] [varchar](99) NULL,
	[nTraffic_2_Months_Prior_4] [varchar](99) NULL,
	[plProperty_Type] [varchar](30) NULL,
	[plContract_Expiration_1] [varchar](30) NULL,
	[plContract_Expiration_2] [varchar](30) NULL,
	[plContract_Expiration_3] [varchar](30) NULL,
	[plContract_Expiration_4] [varchar](30) NULL,
	[plPublication_Selection] [varchar](30) NULL,
	[ltMeeting_With_name] [varchar](255) NULL,
	[ltOther_Name_1] [varchar](255) NULL,
	[ltOther_Name_2] [varchar](255) NULL,
	[ltOther_Name_3] [varchar](255) NULL,
	[stChecklist_Name] [varchar](40) NULL,
	[stEmployee_Number] [varchar](40) NULL,
	[CreatedById] [varchar](30) NULL,
	[CreatedBy] [varchar](99) NULL,
	[iLeases_Current_Month_4] [varchar](99) NULL,
	[iLeases_Last_Month_1] [varchar](99) NULL,
	[iLeases_Last_Month_2] [varchar](99) NULL,
	[iLeases_Last_Month_3] [varchar](99) NULL,
	[iLeases_Last_Month_4] [varchar](99) NULL,
	[iLeases_2_Months_Prior_1] [varchar](99) NULL,
	[iLeases_2_Months_Prior_2] [varchar](99) NULL,
	[iLeases_2_Months_Prior_3] [varchar](99) NULL,
	[iLeases_2_Months_Prior_4] [varchar](99) NULL,
	[iTraffic_Current_Month_1] [varchar](99) NULL,
	[iTraffic_Current_Month_2] [varchar](99) NULL,
	[iTraffic_Current_Month_3] [varchar](99) NULL,
	[iTraffic_Current_Month_4] [varchar](99) NULL,
	[iTraffic_Last_Month_1] [varchar](99) NULL,
	[iTraffic_Last_Month_2] [varchar](99) NULL,
	[AccountExternalSystemId] [varchar](30) NULL,
	[ContactExternalSystemId] [varchar](30) NULL,
	[CreatedbyEmailAddress] [varchar](100) NULL,
	[OwnerExternalSystemId] [varchar](30) NULL,
	[ModifiedbyEmailAddress] [varchar](99) NULL,
	[CustomObject1Id] [varchar](15) NULL,
	[CustomObject1Name] [varchar](255) NULL,
	[CustomObject2Id] [varchar](15) NULL,
	[CustomObject2Name] [varchar](255) NULL,
	[CustomObject3Id] [varchar](15) NULL,
	[CustomObject3Name] [varchar](255) NULL,
	[CustomObject1ExternalSystemId] [varchar](30) NULL,
	[CustomObject2ExternalSystemId] [varchar](30) NULL,
	[CustomObject3ExternalSystemId] [varchar](30) NULL,
	[IndexedBoolean0] [varchar](99) NULL,
	[IndexedDate0] [varchar](99) NULL,
	[IndexedPick0] [varchar](30) NULL,
	[IndexedPick1] [varchar](30) NULL,
	[IndexedPick2] [varchar](30) NULL,
	[IndexedPick3] [varchar](30) NULL,
	[IndexedPick4] [varchar](30) NULL,
	[IndexedPick5] [varchar](30) NULL,
	[CreatedDate] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SFDCImportDataLog]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SFDCImportDataLog](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[actiontext] [varchar](2000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stage_ThirdPartyPhotos]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stage_ThirdPartyPhotos](
	[YMDID] [int] NULL,
	[Token] [varchar](255) NULL,
	[EndecaID] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageAPTGPropertySolutionsLead]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageAPTGPropertySolutionsLead](
	[LeadID] [bigint] NULL,
	[CustomerID] [nvarchar](255) NULL,
	[UnitNumber] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[LeadAddress] [nvarchar](255) NULL,
	[LeadStatus] [nvarchar](255) NULL,
	[LeadEmail] [nvarchar](255) NULL,
	[LeadPhone] [nvarchar](255) NULL,
	[ScreeningResponse] [nvarchar](255) NULL,
	[LeadDateTime] [nvarchar](255) NULL,
	[EstimatedMoveDate] [nvarchar](255) NULL,
	[LeadMessage] [nvarchar](255) NULL,
	[VisitedProperty] [nvarchar](255) NULL,
	[LeadData_Id] [numeric](20, 0) NULL,
	[IsGuestCard_Lead] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageAPTGPropertySolutionsLeadData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageAPTGPropertySolutionsLeadData](
	[PropertyID] [int] NULL,
	[LeadData_ID] [int] NULL,
	[Unscreened] [int] NULL,
	[Screened] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageAPTGPropertySolutionsManagement]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageAPTGPropertySolutionsManagement](
	[YMDID] [int] NULL,
	[ManagementID] [int] NULL,
	[VendorManagementID] [int] NULL,
	[VendorName] [nvarchar](255) NULL,
	[PropertyCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageAPTGPropertySolutionsProperty]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageAPTGPropertySolutionsProperty](
	[PropertyID] [int] NULL,
	[VendorPropertyID] [varchar](20) NULL,
	[PropertyName] [nvarchar](255) NULL,
	[UniqueSessions] [int] NULL,
	[PageViews] [int] NULL,
	[ManagementID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageAPTGPropSolutionsDate]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageAPTGPropSolutionsDate](
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageAPTGVenterraPropertyXMLReport]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageAPTGVenterraPropertyXMLReport](
	[Property_KeyID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[YMD] [datetime] NOT NULL,
	[YMDID] [int] NOT NULL,
	[AGGCToDate] [int] NOT NULL,
	[AGGCThisYear] [int] NOT NULL,
	[AGGCMonth] [int] NOT NULL,
	[ATRToDate] [int] NOT NULL,
	[ATRThisYear] [int] NOT NULL,
	[ATRMonth] [int] NOT NULL,
	[ATGRToDate] [int] NOT NULL,
	[ATGRThisYear] [int] NOT NULL,
	[ATGRMonth] [int] NOT NULL,
	[ALOToDate] [int] NOT NULL,
	[ALOThisYear] [int] NOT NULL,
	[ALOMonth] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageAPTGVenterraPropertyXMLReport_Errors]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors](
	[Property_KeyID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[YMD] [datetime] NOT NULL,
	[YMDID] [int] NOT NULL,
	[AGGCToDate] [int] NOT NULL,
	[AGGCThisYear] [int] NOT NULL,
	[AGGCMonth] [int] NOT NULL,
	[ATRToDate] [int] NOT NULL,
	[ATRThisYear] [int] NOT NULL,
	[ATRMonth] [int] NOT NULL,
	[ATGRToDate] [int] NOT NULL,
	[ATGRThisYear] [int] NOT NULL,
	[ATGRMonth] [int] NOT NULL,
	[ALOToDate] [int] NOT NULL,
	[ALOThisYear] [int] NOT NULL,
	[ALOMonth] [int] NOT NULL,
	[YMDIDFileLoaded] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageBKVImportDaily]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageBKVImportDaily](
	[DateOf] [datetime] NULL,
	[MediaSource] [nvarchar](255) NULL,
	[Gross Cost] [numeric](17, 2) NULL,
	[Impressions] [bigint] NULL,
	[Visits] [bigint] NULL,
	[CostPerVisit] [numeric](17, 2) NULL,
	[VendorClicks] [int] NULL,
	[Webleads] [int] NULL,
	[TotalPaidLeadsAfterRatio] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageCampaignLeadsShort]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageCampaignLeadsShort](
	[YMDDate] [datetime] NULL,
	[MediaSource] [ntext] NULL,
	[Visits] [int] NULL,
	[PageViews] [int] NULL,
	[Clickthroughs] [int] NULL,
	[NumberOfLeads] [int] NULL,
	[Partner] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageEFDaily]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageEFDaily](
	[Portfolio] [varchar](255) NULL,
	[Search Engine] [varchar](255) NULL,
	[Account] [varchar](255) NULL,
	[Campaign] [varchar](255) NULL,
	[MediaSource] [varchar](50) NULL,
	[Impressions] [int] NULL,
	[Clicks] [int] NULL,
	[CTR] [float] NULL,
	[CostwEFFees] [float] NULL,
	[CPC] [float] NULL,
	[CPCwEFFees] [float] NULL,
	[AvgPosition] [float] NULL,
	[Lead] [int] NULL,
	[CPL] [float] NULL,
	[CPLwEFFees] [float] NULL,
	[Start Date] [datetime] NULL,
	[Sul_lead] [int] NULL,
	[Mul_lead] [int] NULL,
	[YMDID] [int] NULL,
	[RenewedListing] [numeric](17, 2) NULL,
	[RenewedAdvertiserRev] [numeric](17, 2) NULL,
	[NewListing] [numeric](17, 2) NULL,
	[NewAdvertiserRevenue] [numeric](17, 2) NULL,
	[FacebookCostwEFFees] [numeric](17, 2) NULL,
	[DisplayCostwEffees] [numeric](17, 2) NULL,
	[Division] [varchar](50) NULL,
	[MediaDetail] [varchar](50) NULL,
	[EFPortfolioOriginal] [varchar](255) NULL,
	[Device] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageEFDaily_RentCom]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageEFDaily_RentCom](
	[Start Date] [datetime] NULL,
	[Search Engine] [varchar](50) NULL,
	[Campaign] [varchar](100) NULL,
	[Portfolio] [varchar](70) NULL,
	[Impressions] [bigint] NULL,
	[Clicks] [bigint] NULL,
	[Avg Position] [float] NULL,
	[Cost w  Fees(ClickThru + ViewThru)] [float] NULL,
	[CostwFees(CT)] [float] NULL,
	[sp_Hotleads(CT)] [int] NULL,
	[NEW Lease Revenue  (ClickThru + ViewThru)] [money] NULL,
	[Device] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageEFDailyImport]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageEFDailyImport](
	[Impressions] [float] NULL,
	[Portfolio] [nvarchar](255) NULL,
	[MediaSource] [varchar](50) NULL,
	[Clicks] [float] NULL,
	[CTR] [float] NULL,
	[CostwEFFees] [float] NULL,
	[CPC] [float] NULL,
	[CPCwEF Fees] [float] NULL,
	[Avg Position] [float] NULL,
	[Lead] [float] NULL,
	[CPL] [float] NULL,
	[CPLwEFFees] [float] NULL,
	[StartDate] [datetime] NULL,
	[SearchEngine] [nvarchar](255) NULL,
	[Account] [nvarchar](255) NULL,
	[Campaign] [nvarchar](255) NULL,
	[Mul_lead] [float] NULL,
	[Sul_lead] [float] NULL,
	[Renewed Listing] [float] NULL,
	[Renewed Advertiser Rev] [float] NULL,
	[New Listing] [float] NULL,
	[New Advertiser Revenue] [float] NULL,
	[YMDID] [nvarchar](8) NULL,
	[DatetoUse] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageMarchexCallDetail]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageMarchexCallDetail](
	[DateOf] [datetime] NULL,
	[YMDID] [int] NULL,
	[id] [varchar](50) NULL,
	[start_time] [datetime] NULL,
	[billable] [varchar](50) NULL,
	[fraud_rule] [varchar](50) NULL,
	[external_id] [varchar](50) NULL,
	[listing_city] [varchar](50) NULL,
	[listing_state] [varchar](50) NULL,
	[listing_zip] [varchar](50) NULL,
	[market_code] [varchar](50) NULL,
	[tracking_phone] [varchar](50) NULL,
	[destination_phone] [varchar](50) NULL,
	[publisher_name] [varchar](50) NULL,
	[CallDuration] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageParseDataAll]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageParseDataAll](
	[ParsedID] [int] NOT NULL,
	[ProfileID] [int] NOT NULL,
	[MeasureType] [varchar](50) NOT NULL,
	[Measure] [varchar](4000) NULL,
	[YMDID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[stagepropertiessolutionnewleads]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[stagepropertiessolutionnewleads](
	[LeadID] [bigint] NULL,
	[CustomerID] [nvarchar](255) NULL,
	[UnitNumber] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Status] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[ScreeningResponse] [nvarchar](255) NULL,
	[DateTime] [nvarchar](255) NULL,
	[EstimatedMoveDate] [nvarchar](255) NULL,
	[Message] [nvarchar](255) NULL,
	[VisitedProperty] [nvarchar](255) NULL,
	[LeadData_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRDTDate]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRDTDate](
	[DateOfData] [datetime] NULL,
	[RDTID] [varchar](8) NULL,
	[YMDID] [varchar](18) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRDTLead]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRDTLead](
	[LeadID] [bigint] NULL,
	[CustomerID] [nvarchar](255) NULL,
	[UnitNumber] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[AddressAll] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[ScreeningResponse] [nvarchar](255) NULL,
	[DateTime] [datetime] NULL,
	[EstimatedMoveDate] [datetime] NULL,
	[Message] [nvarchar](1000) NULL,
	[VisitedProperty] [bit] NULL,
	[LeadData_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRDTLeadData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRDTLeadData](
	[LeadData_Id] [numeric](20, 0) NULL,
	[Screened] [tinyint] NULL,
	[Unscreened] [tinyint] NULL,
	[PropertyLoadId] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRDTManagement]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRDTManagement](
	[Management_Id] [numeric](20, 0) NULL,
	[Name] [nvarchar](255) NULL,
	[PropertyCount] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRDTProperty]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRDTProperty](
	[PropertyLoadId] [numeric](20, 0) NULL,
	[ExternalId] [varchar](20) NULL,
	[PropertyId] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[UniqueSessions] [int] NULL,
	[PageViews] [int] NULL,
	[Management_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRentalsLeadSubTypebyCampaignID]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRentalsLeadSubTypebyCampaignID](
	[SameVisitCampaignID] [ntext] NULL,
	[SiteApartments] [ntext] NULL,
	[LeadSubType] [ntext] NULL,
	[Visits] [int] NULL,
	[NumberOfLeads] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRentcomRDTDate]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRentcomRDTDate](
	[RDTID] [varchar](8) NULL,
	[YMDID] [int] NULL,
	[DateOfData] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRentcomRDTLead]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRentcomRDTLead](
	[LeadID] [bigint] NULL,
	[CustomerID] [nvarchar](255) NULL,
	[UnitNumber] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[AddressAll] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[Address2] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[ScreeningResponse] [nvarchar](255) NULL,
	[DateTime] [datetime] NULL,
	[EstimatedMoveDate] [datetime] NULL,
	[Message] [nvarchar](1000) NULL,
	[VisitedProperty] [bit] NULL,
	[LeadData_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRentcomRDTLeadData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRentcomRDTLeadData](
	[LeadData_Id] [numeric](20, 0) NULL,
	[Screened] [tinyint] NULL,
	[Unscreened] [tinyint] NULL,
	[PropertyLoadId] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRentcomRDTManagement]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRentcomRDTManagement](
	[Management_Id] [numeric](20, 0) NULL,
	[Name] [nvarchar](255) NULL,
	[PropertyCount] [tinyint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageRentcomRDTProperty]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageRentcomRDTProperty](
	[PropertyLoadId] [numeric](20, 0) NULL,
	[ExternalId] [varchar](20) NULL,
	[PropertyId] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[UniqueSessions] [int] NULL,
	[PageViews] [int] NULL,
	[Management_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageSuperPages]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageSuperPages](
	[Date] [datetime] NULL,
	[CampaignID] [varchar](50) NULL,
	[AdName] [varchar](50) NULL,
	[Headline] [varchar](50) NULL,
	[AllImp] [varchar](50) NULL,
	[Clicks] [varchar](50) NULL,
	[CTR] [varchar](50) NULL,
	[Avg MaxPrice] [varchar](50) NULL,
	[AvgCPC] [varchar](50) NULL,
	[Cost] [varchar](50) NULL,
	[AvgImpPos] [varchar](50) NULL,
	[DisplayURL] [varchar](500) NULL,
	[DestinationURL] [varchar](500) NULL,
	[Description] [varchar](100) NULL,
	[Status] [varchar](50) NULL,
	[YMDID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageYieldEmail]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageYieldEmail](
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[ContactEmail] [nvarchar](255) NULL,
	[ContactPhone] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[EmailDate] [datetime] NULL,
	[Subject] [nvarchar](255) NULL,
	[Comments] [nvarchar](2000) NULL,
	[EmailLeads_Id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageYieldEmailLeads]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageYieldEmailLeads](
	[EmailLeads_Id] [int] NULL,
	[Leads_Id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageYieldIdentification]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageYieldIdentification](
	[Identification_Id] [int] NULL,
	[ExternalID] [int] NULL,
	[MarketingName] [nvarchar](255) NULL,
	[YieldInternalProperty_Id] [int] NULL,
	[PropertyID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageYieldLeads]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageYieldLeads](
	[Leads_Id] [int] NULL,
	[YieldInternalProperty_Id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageYieldManagement]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageYieldManagement](
	[YieldManagement_Id] [int] NULL,
	[Management_ID] [tinyint] NULL,
	[ManagementName] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageYieldManagementAddress]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageYieldManagementAddress](
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[Management_Id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageYieldPhysicalProperty]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageYieldPhysicalProperty](
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[Zip] [nvarchar](255) NULL,
	[Country] [nvarchar](255) NULL,
	[identification_id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StageYieldProperty]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StageYieldProperty](
	[YieldProperty_Id] [int] NULL,
	[YieldManagementID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StagingEFFactDailyCW]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StagingEFFactDailyCW](
	[Start Date] [varchar](50) NULL,
	[Search Engine] [varchar](50) NULL,
	[Campaign] [varchar](255) NULL,
	[Portfolio] [varchar](255) NULL,
	[Impressions] [varchar](50) NULL,
	[Clicks] [varchar](50) NULL,
	[Cost w  EF Fees(ClickThru)] [varchar](50) NULL,
	[FB Cost w  EF Fees(ClickThru)] [varchar](50) NULL,
	[Display Cost w  EF Fees(ClickThru)] [varchar](50) NULL,
	[Avg Position] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StagingEFFactDailyCWNew]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StagingEFFactDailyCWNew](
	[Start Date] [varchar](50) NULL,
	[Search Engine] [varchar](50) NULL,
	[Campaign] [varchar](255) NULL,
	[Portfolio] [varchar](255) NULL,
	[Impressions] [varchar](50) NULL,
	[Clicks] [varchar](50) NULL,
	[Avg Position] [varchar](50) NULL,
	[Cost w  EF Fees(CT)] [varchar](50) NULL,
	[FB Cost w  EF Fees(CT)] [varchar](50) NULL,
	[Display Cost w  EF Fees(CT)] [varchar](50) NULL,
	[Device] [varchar](50) NULL,
	[Cost w  EF Fees(ClickThru)] [varchar](50) NULL,
	[Display Cost w  EF Fees(ClickThru)] [varchar](50) NULL,
	[FB Cost w  EF Fees(ClickThru)] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tmpMaxData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tmpMaxData](
	[RegionDescription] [varchar](50) NULL,
	[MarketDescription] [varchar](60) NOT NULL,
	[cInvoiceID] [varchar](10) NOT NULL,
	[ItemId] [varchar](10) NULL,
	[Quantity] [int] NULL,
	[InvTotal] [money] NULL,
	[RevPerUnit] [money] NULL,
	[FinancialMonth] [varchar](7) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WebLogServers]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WebLogServers](
	[ServerName] [varchar](50) NOT NULL,
	[ServerPath] [varchar](255) NOT NULL,
	[ServerEnabled] [int] NOT NULL,
	[ServerOffsetValue] [int] NOT NULL,
	[LastDateProcessed] [datetime] NULL,
	[LastDateTested] [datetime] NULL,
	[Comments] [varchar](125) NULL,
	[TestResults] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WH_HW_load]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WH_HW_load](
	[Device Name] [nvarchar](255) NULL,
	[hardware device type] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WT_MSAWithMakeAndModel]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WT_MSAWithMakeAndModel](
	[MSA] [nvarchar](256) NULL,
	[Make] [nvarchar](256) NULL,
	[Model] [nvarchar](256) NULL,
	[Visits] [int] NULL,
	[PageViews] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[WT_NewVsReturningVisitors]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WT_NewVsReturningVisitors](
	[NewVsReturningVisitors] [nvarchar](256) NULL,
	[Visits] [int] NULL,
	[PageViews] [int] NULL,
	[AverageVisitDurationMinutes] [int] NULL,
	[DailyVisitors] [int] NULL,
	[PercentOfAllVisits] [float] NULL,
	[AverageVisitPageViews] [int] NULL,
	[Hits] [int] NULL,
	[Revenue] [nvarchar](256) NULL,
	[AverageRevenuePerOrder] [nvarchar](256) NULL,
	[Units] [float] NULL,
	[Orders] [int] NULL,
	[WeeklyVisitors] [int] NULL,
	[MonthlyVisitors] [int] NULL,
	[QuarterlyVisitors] [int] NULL,
	[YearlyVisitors] [int] NULL,
	[DynamicVisitorsDaily] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_AllReceived_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_AllReceived_20130829](
	[TriggeredSendName] [varchar](2000) NULL,
	[CustomerKey] [varchar](2000) NULL,
	[SubscriberID] [varchar](2000) NULL,
	[EmailAddress] [varchar](2000) NULL,
	[SubscriberKey] [varchar](2000) NULL,
	[Domain] [varchar](2000) NULL,
	[JobID] [varchar](2000) NULL,
	[ListID] [varchar](2000) NULL,
	[BatchID] [varchar](2000) NULL,
	[CreatedDate] [datetime] NULL,
	[RequestID] [varchar](2000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_Bounces_Suppression_02_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_Bounces_Suppression_02_20130829](
	[SubscriberKey] [varchar](2000) NULL,
	[EmailAddress] [varchar](2000) NULL,
	[EventDate] [datetime] NULL,
	[AccountID] [varchar](2000) NULL,
	[JobID] [varchar](2000) NULL,
	[BounceCategory] [varchar](2000) NULL,
	[BounceSubcategory] [varchar](2000) NULL,
	[Status] [varchar](2000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_Bounces_Suppression_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_Bounces_Suppression_20130829](
	[SubscriberKey] [varchar](2000) NULL,
	[EmailAddress] [varchar](2000) NULL,
	[EventDate] [datetime] NULL,
	[AccountID] [varchar](2000) NULL,
	[JobID] [varchar](2000) NULL,
	[BounceCategory] [varchar](2000) NULL,
	[BounceSubcategory] [varchar](2000) NULL,
	[Status] [varchar](2000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_NotSendSinceMidnight_WithData_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_NotSendSinceMidnight_WithData_20130829](
	[TriggeredSendName] [varchar](4000) NULL,
	[CustomerKey] [varchar](4000) NULL,
	[EmailAddress] [varchar](4000) NULL,
	[SubscriberKey] [varchar](4000) NULL,
	[SubscriberID] [varchar](4000) NULL,
	[JobID] [varchar](4000) NULL,
	[ListID] [varchar](4000) NULL,
	[BatchID] [varchar](4000) NULL,
	[RequestID] [varchar](4000) NULL,
	[CreatedDate] [datetime] NULL,
	[SendStatus] [varchar](4000) NULL,
	[SendStatusDescription] [varchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_NotSent_WithReasonAndData_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_NotSent_WithReasonAndData_20130829](
	[TriggeredSendName] [varchar](4000) NULL,
	[CustomerKey] [varchar](4000) NULL,
	[EmailAddress] [varchar](4000) NULL,
	[SubscriberKey] [varchar](4000) NULL,
	[SubscriberID] [varchar](4000) NULL,
	[JobID] [varchar](4000) NULL,
	[ListID] [varchar](4000) NULL,
	[BatchID] [varchar](4000) NULL,
	[RequestID] [varchar](4000) NULL,
	[CreatedDate] [datetime] NULL,
	[SendStatus] [varchar](max) NULL,
	[SendStatusDescription] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_RequestsNotSent_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_RequestsNotSent_20130829](
	[TriggeredSendName] [varchar](2000) NULL,
	[CustomerKey] [varchar](2000) NULL,
	[SubscriberID] [varchar](2000) NULL,
	[EmailAddress] [varchar](2000) NULL,
	[SubscriberKey] [varchar](2000) NULL,
	[Domain] [varchar](2000) NULL,
	[JobID] [varchar](2000) NULL,
	[ListID] [varchar](2000) NULL,
	[BatchID] [varchar](2000) NULL,
	[CreatedDate] [datetime] NULL,
	[RequestID] [varchar](2000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_RequestsSent_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_RequestsSent_20130829](
	[TriggeredSendName] [varchar](2000) NULL,
	[CustomerKey] [varchar](2000) NULL,
	[SubscriberID] [varchar](2000) NULL,
	[EmailAddress] [varchar](2000) NULL,
	[SubscriberKey] [varchar](2000) NULL,
	[Domain] [varchar](2000) NULL,
	[JobID] [varchar](2000) NULL,
	[ListID] [varchar](2000) NULL,
	[BatchID] [varchar](2000) NULL,
	[CreatedDate] [datetime] NULL,
	[RequestID] [varchar](2000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_SentSinceMidnight_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_SentSinceMidnight_20130829](
	[TriggeredSendName] [varchar](4000) NULL,
	[CustomerKey] [varchar](4000) NULL,
	[EmailAddress] [varchar](4000) NULL,
	[SubscriberKey] [varchar](4000) NULL,
	[SubscriberID] [varchar](4000) NULL,
	[JobID] [varchar](4000) NULL,
	[ListID] [varchar](4000) NULL,
	[BatchID] [varchar](4000) NULL,
	[RequestID] [varchar](4000) NULL,
	[CreatedDate] [datetime] NULL,
	[SendStatus] [varchar](4000) NULL,
	[SendStatusDescription] [varchar](4000) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_zAllReceived_CountsByDomain_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_zAllReceived_CountsByDomain_20130829](
	[Domain] [varchar](2000) NULL,
	[NumRequestsReceived] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_zRequestsNotSent_CountsByDomain_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_zRequestsNotSent_CountsByDomain_20130829](
	[Domain] [varchar](2000) NULL,
	[NumRequestsReceived] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[zzzET_zRequestsSent_CountsByDomain_20130829]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[zzzET_zRequestsSent_CountsByDomain_20130829](
	[Domain] [varchar](2000) NULL,
	[NumRequestsReceived] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Fact].[emailleads_last50]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[emailleads_last50](
	[Website] [varchar](4) NULL,
	[FeedLead] [int] NOT NULL,
	[RentPropertyID] [int] NULL,
	[ListingID] [int] NOT NULL,
	[YMDID] [int] NOT NULL,
	[WhenEntered] [datetime2](3) NOT NULL,
	[LeadID] [decimal](20, 0) NULL,
	[LeadTypeID] [decimal](1, 0) NOT NULL,
	[Status] [decimal](1, 0) NOT NULL,
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
	[Comments] [varchar](1000) NULL,
	[LeaseTerms] [varchar](15) NULL,
	[LeadScore] [decimal](5, 2) NULL,
	[Source] [varchar](25) NULL,
	[PersonalizationID] [varchar](255) NULL,
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
	[UnitLayout_ID] [int] NULL,
	[UZID] [varchar](255) NULL,
	[SortOrder] [varchar](255) NULL,
	[Refinements] [varchar](1000) NULL,
	[TVisit] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Fact].[emailleads_last7]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[emailleads_last7](
	[Website] [varchar](4) NULL,
	[FeedLead] [int] NULL,
	[RentPropertyID] [int] NULL,
	[ListingID] [int] NULL,
	[YMDID] [int] NULL,
	[WhenEntered] [datetime2](3) NULL,
	[LeadID] [numeric](20, 0) NULL,
	[LeadTypeID] [numeric](1, 0) NULL,
	[Status] [numeric](1, 0) NULL,
	[Email] [varchar](255) NULL,
	[FirstName] [varchar](80) NULL,
	[LastName] [varchar](80) NULL,
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
	[Comments] [varchar](1000) NULL,
	[LeaseTerms] [varchar](15) NULL,
	[LeadScore] [numeric](5, 2) NULL,
	[Source] [varchar](25) NULL,
	[PersonalizationID] [varchar](255) NULL,
	[CampaignID] [varchar](20) NULL,
	[EF_ID] [varchar](255) NULL,
	[EV_TRANS_ID] [varchar](255) NULL,
	[SessionID] [varchar](255) NULL,
	[reasonformove] [varchar](255) NULL,
	[pricerange] [varchar](255) NULL,
	[BusinessModel] [varchar](15) NULL,
	[CompanyID] [int] NULL,
	[UpdateYMDID] [int] NULL,
	[Device] [varchar](50) NULL,
	[PageType] [varchar](50) NULL,
	[Context] [varchar](50) NULL,
	[Endeca_ID] [varchar](50) NULL,
	[UnitLayout_ID] [int] NULL,
	[UZID] [varchar](255) NULL,
	[SortOrder] [varchar](255) NULL,
	[Refinements] [varchar](1000) NULL,
	[TVisit] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Fact].[emailleads_RDT_20160622]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[emailleads_RDT_20160622](
	[Website] [varchar](4) NULL,
	[FeedLead] [int] NOT NULL,
	[RentPropertyID] [int] NULL,
	[ListingID] [int] NOT NULL,
	[YMDID] [int] NULL,
	[WhenEntered] [datetime2](3) NOT NULL,
	[LeadID] [decimal](20, 0) NULL,
	[LeadTypeID] [decimal](1, 0) NOT NULL,
	[Status] [decimal](1, 0) NULL,
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
	[LeadScore] [decimal](5, 2) NULL,
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
/****** Object:  Table [Fact].[HourlyWebLogFailure]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[HourlyWebLogFailure](
	[FailureDateTime] [datetime] NULL,
	[LogFileNotFound] [varchar](500) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [cidx-FailureDateTime]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE CLUSTERED INDEX [cidx-FailureDateTime] ON [Fact].[HourlyWebLogFailure]
(
	[FailureDateTime] ASC,
	[LogFileNotFound] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[phoneleads_last7]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[phoneleads_last7](
	[Website] [varchar](4) NULL,
	[YMDID] [int] NULL,
	[CallID] [varchar](50) NULL,
	[ListingID] [int] NULL,
	[RentPropertyID] [int] NULL,
	[PropertyID] [int] NULL,
	[CallerName] [varchar](255) NULL,
	[CallerPhoneNumber] [varchar](15) NULL,
	[PublishedPhoneNumber] [varchar](10) NULL,
	[TargetPhoneNumber] [varchar](10) NULL,
	[CallStartDateTime] [datetime2](3) NULL,
	[CallEndDateTime] [datetime2](3) NULL,
	[DurationInSeconds] [int] NULL,
	[CallStatus] [varchar](50) NULL,
	[CallSource] [varchar](2) NULL,
	[CallType] [varchar](25) NULL,
	[AudioURL] [varchar](500) NULL,
	[CallLoadHour] [tinyint] NULL,
	[CallLoadYMDID] [int] NULL,
	[CallEndHour] [int] NULL,
	[DateAddedYMDID] [int] NULL,
	[CallerLocation] [varchar](255) NULL,
	[CallerIP] [varchar](255) NULL,
	[CallerAddress] [varchar](255) NULL,
	[CallerCity] [varchar](255) NULL,
	[CallerState] [varchar](255) NULL,
	[CallerZip] [varchar](255) NULL,
	[LinkName] [varchar](255) NULL,
	[LinkID] [varchar](255) NULL,
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
	[RenterHouseholds] [varchar](255) NULL,
	[CallerURL] [nvarchar](255) NULL,
	[CallerTrimSilenceURL] [nvarchar](255) NULL,
	[ReceiverURL] [nvarchar](255) NULL,
	[ActualCallDuration] [int] NULL,
	[CallerTrimBeginning] [int] NULL,
	[TotalCallerTrimTalkTime] [int] NULL,
	[EurekaID] [int] NULL,
	[IsAbandoned] [int] NULL,
	[TimePriorToCallerSpeaking] [int] NULL,
	[MP3URL] [nvarchar](255) NULL,
	[BusinessModel] [varchar](15) NULL,
	[AnalyticsResult] [varchar](75) NULL,
	[AnalyticsMethod] [varchar](75) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Fact].[WebLogDataLoaded]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[WebLogDataLoaded](
	[hourof] [varchar](10) NULL,
	[Lines] [int] NULL,
	[yeslines] [int] NULL,
	[Tpercent] [decimal](25, 13) NULL,
	[emailsent] [int] NOT NULL,
	[ProcessAnyway] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Fact].[WT_ActionConversion]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[WT_ActionConversion](
	[YMDID] [int] NULL,
	[Profile1] [varchar](10) NULL,
	[Profile2] [varchar](30) NULL,
	[Profile3] [varchar](30) NULL,
	[Browser] [varchar](100) NULL,
	[ContentGroup] [varchar](255) NULL,
	[clicktype] [varchar](100) NULL,
	[position] [varchar](1000) NULL,
	[Visits] [int] NULL,
	[PageViews] [int] NULL,
	[NumberOfLeads] [int] NULL,
	[TimePeriod] [varchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cidx_YMDID]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE CLUSTERED INDEX [cidx_YMDID] ON [Fact].[WT_ActionConversion]
(
	[YMDID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Fact].[WT_ACTranslation]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[WT_ACTranslation](
	[profile1] [nchar](50) NULL,
	[profile2] [nchar](50) NULL,
	[profile3] [nchar](50) NULL,
	[browser] [nvarchar](255) NULL,
	[ContentGroup] [nvarchar](255) NULL,
	[clicktype] [nvarchar](255) NULL,
	[position] [nvarchar](255) NULL,
	[Page] [nvarchar](255) NULL,
	[PageLocation] [nvarchar](255) NULL,
	[CallToAction] [nvarchar](255) NULL,
	[TYPE] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Fact].[WT_ACTranslation_BAK]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Fact].[WT_ACTranslation_BAK](
	[profile1] [nchar](50) NULL,
	[profile2] [nchar](50) NULL,
	[profile3] [nchar](50) NULL,
	[browser] [nvarchar](255) NULL,
	[ContentGroup] [nvarchar](255) NULL,
	[clicktype] [nvarchar](255) NULL,
	[position] [nvarchar](255) NULL,
	[Page] [nvarchar](255) NULL,
	[PageLocation] [nvarchar](255) NULL,
	[CallToAction] [nvarchar](255) NULL,
	[TYPE] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [reports].[LogFilesBeingProcessed]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reports].[LogFilesBeingProcessed](
	[LogFilesBeingProcessedID] [int] IDENTITY(1,1) NOT NULL,
	[LogFileName] [varchar](75) NOT NULL,
	[RunAsFlag] [int] NOT NULL,
	[BatchDate] [datetime] NOT NULL
) ON [P5TableSpace]

GO
/****** Object:  Table [reports].[ParsedDataBadData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reports].[ParsedDataBadData](
	[ParseID] [bigint] NULL,
	[ProfileID] [int] NOT NULL,
	[YMDID] [int] NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[MeasureType] [varchar](50) NOT NULL,
	[Measure] [varchar](7000) NOT NULL,
	[SubProfileID] [smallint] NULL,
	[dateadded] [date] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cidx_badparseddata_parseid]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE CLUSTERED INDEX [cidx_badparseddata_parseid] ON [reports].[ParsedDataBadData]
(
	[ParseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [reports].[WeblogFileLoad]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [reports].[WeblogFileLoad](
	[WeblogFileLoadID] [int] IDENTITY(1,1) NOT NULL,
	[SSISRun] [int] NULL,
	[Logfilename] [varchar](128) NOT NULL,
	[LogEntryType] [varchar](10) NOT NULL,
	[LinesProcessed] [int] NULL,
	[TimeLogEntryMade] [smalldatetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[ActionConversionLoader]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ActionConversionLoader](
	[Browser] [nvarchar](100) NULL,
	[ContentGroup] [nvarchar](255) NULL,
	[clicktype] [nvarchar](100) NULL,
	[position] [nvarchar](1000) NULL,
	[Visits] [int] NULL,
	[PageViews] [int] NULL,
	[NumberOfLeads] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AG_BannerStatistics]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AG_BannerStatistics](
	[Date] [nvarchar](50) NULL,
	[Order] [nvarchar](500) NULL,
	[Line item] [nvarchar](500) NULL,
	[Creative] [nvarchar](500) NULL,
	[Order ID] [nvarchar](500) NULL,
	[Line item ID] [nvarchar](500) NULL,
	[Creative ID] [nvarchar](500) NULL,
	[Order PO number] [nvarchar](500) NULL,
	[Order PO number2] [nvarchar](500) NULL,
	[Click-through URL] [nvarchar](500) NULL,
	[Total impressions] [bigint] NULL,
	[Total clicks] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AGDimOccupancy]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AGDimOccupancy](
	[ETLYMDID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[Current_Occupancy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AGDimOccupancy_Archive]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AGDimOccupancy_Archive](
	[ETLYMDID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[Current_Occupancy] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AGDimUnitLayouts]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AGDimUnitLayouts](
	[ETLYMDID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[RentPropertyID] [int] NULL,
	[IsActive] [tinyint] NOT NULL,
	[IsActiveRent] [tinyint] NULL,
	[UnitLayoutID] [int] NOT NULL,
	[UnitStyle] [varchar](100) NOT NULL,
	[Bedrooms] [tinyint] NULL,
	[FullBaths] [tinyint] NULL,
	[HalfBaths] [tinyint] NULL,
	[SqFtLow] [int] NULL,
	[SqFtHigh] [int] NULL,
	[Term] [varchar](30) NOT NULL,
	[PriceLow] [numeric](10, 2) NULL,
	[PriceHigh] [numeric](10, 2) NULL,
	[Deposit] [numeric](10, 2) NULL,
	[IsUnavailable] [int] NULL,
	[AvailableUnitCount] [int] NULL,
	[DateAvailable] [datetime2](7) NULL,
	[FLADisplay] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AGDimUnitLayouts_20141016_DONOTDELETE]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AGDimUnitLayouts_20141016_DONOTDELETE](
	[ETLYMDID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[RentPropertyID] [int] NULL,
	[IsActive] [tinyint] NOT NULL,
	[IsActiveRent] [tinyint] NULL,
	[UnitLayoutID] [int] NOT NULL,
	[UnitStyle] [varchar](100) NOT NULL,
	[Bedrooms] [tinyint] NULL,
	[FullBaths] [tinyint] NULL,
	[HalfBaths] [tinyint] NULL,
	[SqFtLow] [int] NULL,
	[SqFtHigh] [int] NULL,
	[Term] [varchar](30) NOT NULL,
	[PriceLow] [numeric](10, 2) NULL,
	[PriceHigh] [numeric](10, 2) NULL,
	[Deposit] [numeric](10, 2) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cidx_AGDimUnitLayouts_ListingID]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE UNIQUE CLUSTERED INDEX [cidx_AGDimUnitLayouts_ListingID] ON [Staging].[AGDimUnitLayouts_20141016_DONOTDELETE]
(
	[ListingID] ASC,
	[UnitLayoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[AGDimUnitLayouts_Archive]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AGDimUnitLayouts_Archive](
	[ETLYMDID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[RentPropertyID] [int] NULL,
	[IsActive] [tinyint] NOT NULL,
	[IsActiveRent] [tinyint] NULL,
	[UnitLayoutID] [int] NOT NULL,
	[UnitStyle] [varchar](100) NOT NULL,
	[Bedrooms] [tinyint] NULL,
	[FullBaths] [tinyint] NULL,
	[HalfBaths] [tinyint] NULL,
	[SqFtLow] [int] NULL,
	[SqFtHigh] [int] NULL,
	[Term] [varchar](30) NOT NULL,
	[PriceLow] [numeric](10, 2) NULL,
	[PriceHigh] [numeric](10, 2) NULL,
	[Deposit] [numeric](10, 2) NULL,
	[IsUnavailable] [int] NULL,
	[AvailableUnitCount] [int] NULL,
	[DateAvailable] [datetime] NULL,
	[FLADisplay] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cidx_AGDimUnitLayoutsArchive_ETLYMDID]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE UNIQUE CLUSTERED INDEX [cidx_AGDimUnitLayoutsArchive_ETLYMDID] ON [Staging].[AGDimUnitLayouts_Archive]
(
	[ETLYMDID] ASC,
	[ListingID] ASC,
	[UnitLayoutID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[AGDimUnitLayoutstest]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AGDimUnitLayoutstest](
	[ETLYMDID] [int] NOT NULL,
	[ListingID] [int] NOT NULL,
	[PropertyID] [int] NOT NULL,
	[RentPropertyID] [int] NULL,
	[IsActive] [tinyint] NOT NULL,
	[IsActiveRent] [tinyint] NULL,
	[UnitLayoutID] [int] NOT NULL,
	[UnitStyle] [varchar](100) NOT NULL,
	[Bedrooms] [tinyint] NULL,
	[FullBaths] [tinyint] NULL,
	[HalfBaths] [tinyint] NULL,
	[SqFtLow] [int] NULL,
	[SqFtHigh] [int] NULL,
	[Term] [varchar](30) NOT NULL,
	[PriceLow] [numeric](10, 2) NULL,
	[PriceHigh] [numeric](10, 2) NULL,
	[Deposit] [numeric](10, 2) NULL,
	[IsUnavailable] [int] NULL,
	[AvailableUnitCount] [int] NULL,
	[DateAvailable] [datetime2](7) NULL,
	[FLADisplay] [varchar](100) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AGRefinementToListingService]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AGRefinementToListingService](
	[RefinementCategory] [varchar](max) NULL,
	[RefinementType] [varchar](max) NULL,
	[RefinementFromTag] [varchar](max) NULL,
	[ListingServiceCriteria] [varchar](max) NULL,
	[ListingServiceCriteriaValue] [varchar](max) NULL,
	[OtherInfo] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AHGLead]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AHGLead](
	[AHGLead_Id] [int] NULL,
	[YMDID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AHGProspectLead]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AHGProspectLead](
	[Zip] [nvarchar](20) NULL,
	[Leads] [int] NULL,
	[ProspectLeads_Id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AHGProspectLeads]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AHGProspectLeads](
	[ProspectLeads_Id] [int] NULL,
	[AHGLead_Id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AHGTotalLead]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AHGTotalLead](
	[Zip] [nvarchar](20) NULL,
	[Leads] [int] NULL,
	[TotalLeads_Id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[AHGTotalLeads]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[AHGTotalLeads](
	[TotalLeads_Id] [int] NULL,
	[AHGLead_Id] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[ApiCallDetails]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ApiCallDetails](
	[APICount] [varchar](max) NULL,
	[ByteLimit] [varchar](max) NULL,
	[DateLoaded] [varchar](max) NULL,
	[RowRange] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[APTGCustomMeasures]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APTGCustomMeasures](
	[ymdid] [int] NULL,
	[measuretype] [varchar](125) NULL,
	[TimesFired] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[APTGVisitsTrend]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[APTGVisitsTrend](
	[Interval] [ntext] NULL,
	[Visits] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[BrowsCap]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[BrowsCap](
	[PropertyName] [varchar](500) NULL,
	[AgentID] [varchar](500) NULL,
	[MasterParent] [varchar](500) NULL,
	[LiteMode] [varchar](500) NULL,
	[Parent] [varchar](500) NULL,
	[Comments] [varchar](500) NULL,
	[Browser] [varchar](500) NULL,
	[Version] [varchar](500) NULL,
	[MajorVer] [varchar](500) NULL,
	[MinorVer] [varchar](500) NULL,
	[Platform] [varchar](500) NULL,
	[Platform_Version] [varchar](500) NULL,
	[Alpha] [varchar](500) NULL,
	[Beta] [varchar](500) NULL,
	[Win16] [varchar](500) NULL,
	[Win32] [varchar](500) NULL,
	[Win64] [varchar](500) NULL,
	[Frames] [varchar](500) NULL,
	[IFrames] [varchar](500) NULL,
	[Tables] [varchar](500) NULL,
	[Cookies] [varchar](500) NULL,
	[BackgroundSounds] [varchar](500) NULL,
	[JavaScript] [varchar](500) NULL,
	[VBScript] [varchar](500) NULL,
	[JavaApplets] [varchar](500) NULL,
	[ActiveXControls] [varchar](500) NULL,
	[isMobileDevice] [varchar](500) NULL,
	[isTablet] [varchar](500) NULL,
	[isSyndicationReader] [varchar](500) NULL,
	[Crawler] [varchar](500) NULL,
	[CssVersion] [varchar](500) NULL,
	[AolVersion] [varchar](500) NULL,
	[Browser_Type] [varchar](500) NULL,
	[Browser_Bits] [varchar](500) NULL,
	[Browser_Maker] [varchar](500) NULL,
	[Browser_Modus] [varchar](500) NULL,
	[Platform_Description] [varchar](500) NULL,
	[Platform_Bits] [varchar](500) NULL,
	[Platform_Maker] [varchar](500) NULL,
	[Device_Name] [varchar](500) NULL,
	[Device_Maker] [varchar](500) NULL,
	[Device_Type] [varchar](500) NULL,
	[Device_Pointing_Method] [varchar](500) NULL,
	[Device_Code_Name] [varchar](500) NULL,
	[Device_Brand_Name] [varchar](500) NULL,
	[RenderingEngine_Name] [varchar](500) NULL,
	[RenderingEngine_Version] [varchar](500) NULL,
	[RenderingEngine_Description] [varchar](500) NULL,
	[RenderingEngine_Maker] [varchar](500) NULL,
	[UserAgentSQL] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[browscap_20140701]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[browscap_20140701](
	[PropertyName] [varchar](500) NULL,
	[AgentID] [varchar](500) NULL,
	[MasterParent] [varchar](500) NULL,
	[LiteMode] [varchar](500) NULL,
	[Parent] [varchar](500) NULL,
	[Comments] [varchar](500) NULL,
	[Browser] [varchar](500) NULL,
	[Version] [varchar](500) NULL,
	[MajorVer] [varchar](500) NULL,
	[MinorVer] [varchar](500) NULL,
	[Platform] [varchar](500) NULL,
	[Platform_Version] [varchar](500) NULL,
	[Platform_Description] [varchar](500) NULL,
	[Alpha] [varchar](500) NULL,
	[Beta] [varchar](500) NULL,
	[Win16] [varchar](500) NULL,
	[Win32] [varchar](500) NULL,
	[Win64] [varchar](500) NULL,
	[Frames] [varchar](500) NULL,
	[IFrames] [varchar](500) NULL,
	[Tables] [varchar](500) NULL,
	[Cookies] [varchar](500) NULL,
	[BackgroundSounds] [varchar](500) NULL,
	[JavaScript] [varchar](500) NULL,
	[VBScript] [varchar](500) NULL,
	[JavaApplets] [varchar](500) NULL,
	[ActiveXControls] [varchar](500) NULL,
	[isMobileDevice] [varchar](500) NULL,
	[isSyndicationReader] [varchar](500) NULL,
	[Crawler] [varchar](500) NULL,
	[CSSVersion] [varchar](500) NULL,
	[AolVersion] [varchar](500) NULL,
	[Device_Name] [varchar](500) NULL,
	[Device_Maker] [varchar](500) NULL,
	[RenderingEngine_Name] [varchar](500) NULL,
	[RenderingEngine_Version] [varchar](500) NULL,
	[RenderingEngine_Description] [varchar](500) NULL,
	[UserAgentSQL] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[browscap_20140813]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[browscap_20140813](
	[PropertyName] [varchar](500) NULL,
	[AgentID] [varchar](500) NULL,
	[MasterParent] [varchar](500) NULL,
	[LiteMode] [varchar](500) NULL,
	[Parent] [varchar](500) NULL,
	[Comments] [varchar](500) NULL,
	[Browser] [varchar](500) NULL,
	[Version] [varchar](500) NULL,
	[MajorVer] [varchar](500) NULL,
	[MinorVer] [varchar](500) NULL,
	[Platform] [varchar](500) NULL,
	[Platform_Version] [varchar](500) NULL,
	[Platform_Description] [varchar](500) NULL,
	[Alpha] [varchar](500) NULL,
	[Beta] [varchar](500) NULL,
	[Win16] [varchar](500) NULL,
	[Win32] [varchar](500) NULL,
	[Win64] [varchar](500) NULL,
	[Frames] [varchar](500) NULL,
	[IFrames] [varchar](500) NULL,
	[Tables] [varchar](500) NULL,
	[Cookies] [varchar](500) NULL,
	[BackgroundSounds] [varchar](500) NULL,
	[JavaScript] [varchar](500) NULL,
	[VBScript] [varchar](500) NULL,
	[JavaApplets] [varchar](500) NULL,
	[ActiveXControls] [varchar](500) NULL,
	[isMobileDevice] [varchar](500) NULL,
	[isSyndicationReader] [varchar](500) NULL,
	[Crawler] [varchar](500) NULL,
	[CSSVersion] [varchar](500) NULL,
	[AolVersion] [varchar](500) NULL,
	[Device_Name] [varchar](500) NULL,
	[Device_Maker] [varchar](500) NULL,
	[RenderingEngine_Name] [varchar](500) NULL,
	[RenderingEngine_Version] [varchar](500) NULL,
	[RenderingEngine_Description] [varchar](500) NULL,
	[UserAgentSQL] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[browscap_20150820]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[browscap_20150820](
	[PropertyName] [varchar](500) NULL,
	[AgentID] [varchar](500) NULL,
	[MasterParent] [varchar](500) NULL,
	[LiteMode] [varchar](500) NULL,
	[Parent] [varchar](500) NULL,
	[Comment] [varchar](500) NULL,
	[Browser] [varchar](500) NULL,
	[Version] [varchar](500) NULL,
	[MajorVer] [varchar](500) NULL,
	[MinorVer] [varchar](500) NULL,
	[Platform] [varchar](500) NULL,
	[Platform_Version] [varchar](500) NULL,
	[Alpha] [varchar](500) NULL,
	[Beta] [varchar](500) NULL,
	[Win16] [varchar](500) NULL,
	[Win32] [varchar](500) NULL,
	[Win64] [varchar](500) NULL,
	[Frames] [varchar](500) NULL,
	[IFrames] [varchar](500) NULL,
	[Tables] [varchar](500) NULL,
	[Cookies] [varchar](500) NULL,
	[BackgroundSounds] [varchar](500) NULL,
	[JavaScript] [varchar](500) NULL,
	[VBScript] [varchar](500) NULL,
	[JavaApplets] [varchar](500) NULL,
	[ActiveXControls] [varchar](500) NULL,
	[isMobileDevice] [varchar](500) NULL,
	[isTablet] [varchar](500) NULL,
	[isSyndicationReader] [varchar](500) NULL,
	[Crawler] [varchar](500) NULL,
	[CssVersion] [varchar](500) NULL,
	[AolVersion] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[BrowsCap_5020]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[BrowsCap_5020](
	[PropertyName] [varchar](500) NULL,
	[AgentID] [varchar](500) NULL,
	[MasterParent] [varchar](500) NULL,
	[LiteMode] [varchar](500) NULL,
	[Parent] [varchar](500) NULL,
	[Comments] [varchar](500) NULL,
	[Browser] [varchar](500) NULL,
	[Version] [varchar](500) NULL,
	[MajorVer] [varchar](500) NULL,
	[MinorVer] [varchar](500) NULL,
	[Platform] [varchar](500) NULL,
	[Platform_Version] [varchar](500) NULL,
	[Platform_Description] [varchar](500) NULL,
	[Alpha] [varchar](500) NULL,
	[Beta] [varchar](500) NULL,
	[Win16] [varchar](500) NULL,
	[Win32] [varchar](500) NULL,
	[Win64] [varchar](500) NULL,
	[Frames] [varchar](500) NULL,
	[IFrames] [varchar](500) NULL,
	[Tables] [varchar](500) NULL,
	[Cookies] [varchar](500) NULL,
	[BackgroundSounds] [varchar](500) NULL,
	[JavaScript] [varchar](500) NULL,
	[VBScript] [varchar](500) NULL,
	[JavaApplets] [varchar](500) NULL,
	[ActiveXControls] [varchar](500) NULL,
	[isMobileDevice] [varchar](500) NULL,
	[isSyndicationReader] [varchar](500) NULL,
	[Crawler] [varchar](500) NULL,
	[CSSVersion] [varchar](500) NULL,
	[AolVersion] [varchar](500) NULL,
	[Device_Name] [varchar](500) NULL,
	[Device_Maker] [varchar](500) NULL,
	[RenderingEngine_Name] [varchar](500) NULL,
	[RenderingEngine_Version] [varchar](500) NULL,
	[RenderingEngine_Description] [varchar](500) NULL,
	[UserAgentSQl] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[BrowsCap_BACKOUT]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[BrowsCap_BACKOUT](
	[PropertyName] [varchar](500) NULL,
	[AgentID] [varchar](500) NULL,
	[MasterParent] [varchar](500) NULL,
	[LiteMode] [varchar](500) NULL,
	[Parent] [varchar](500) NULL,
	[Comments] [varchar](500) NULL,
	[Browser] [varchar](500) NULL,
	[Version] [varchar](500) NULL,
	[MajorVer] [varchar](500) NULL,
	[MinorVer] [varchar](500) NULL,
	[Platform] [varchar](500) NULL,
	[Platform_Version] [varchar](500) NULL,
	[Platform_Description] [varchar](500) NULL,
	[Alpha] [varchar](500) NULL,
	[Beta] [varchar](500) NULL,
	[Win16] [varchar](500) NULL,
	[Win32] [varchar](500) NULL,
	[Win64] [varchar](500) NULL,
	[Frames] [varchar](500) NULL,
	[IFrames] [varchar](500) NULL,
	[Tables] [varchar](500) NULL,
	[Cookies] [varchar](500) NULL,
	[BackgroundSounds] [varchar](500) NULL,
	[JavaScript] [varchar](500) NULL,
	[VBScript] [varchar](500) NULL,
	[JavaApplets] [varchar](500) NULL,
	[ActiveXControls] [varchar](500) NULL,
	[isMobileDevice] [varchar](500) NULL,
	[isSyndicationReader] [varchar](500) NULL,
	[Crawler] [varchar](500) NULL,
	[CSSVersion] [varchar](500) NULL,
	[AolVersion] [varchar](500) NULL,
	[Device_Name] [varchar](500) NULL,
	[Device_Maker] [varchar](500) NULL,
	[RenderingEngine_Name] [varchar](500) NULL,
	[RenderingEngine_Version] [varchar](500) NULL,
	[RenderingEngine_Description] [varchar](500) NULL,
	[UserAgentSQL] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[BrowsCap_BACKOUT_RC]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[BrowsCap_BACKOUT_RC](
	[PropertyName] [varchar](500) NULL,
	[AgentID] [varchar](500) NULL,
	[MasterParent] [varchar](500) NULL,
	[LiteMode] [varchar](500) NULL,
	[Parent] [varchar](500) NULL,
	[Comments] [varchar](500) NULL,
	[Browser] [varchar](500) NULL,
	[Version] [varchar](500) NULL,
	[MajorVer] [varchar](500) NULL,
	[MinorVer] [varchar](500) NULL,
	[Platform] [varchar](500) NULL,
	[Platform_Version] [varchar](500) NULL,
	[Platform_Description] [varchar](500) NULL,
	[Alpha] [varchar](500) NULL,
	[Beta] [varchar](500) NULL,
	[Win16] [varchar](500) NULL,
	[Win32] [varchar](500) NULL,
	[Win64] [varchar](500) NULL,
	[Frames] [varchar](500) NULL,
	[IFrames] [varchar](500) NULL,
	[Tables] [varchar](500) NULL,
	[Cookies] [varchar](500) NULL,
	[BackgroundSounds] [varchar](500) NULL,
	[JavaScript] [varchar](500) NULL,
	[VBScript] [varchar](500) NULL,
	[JavaApplets] [varchar](500) NULL,
	[ActiveXControls] [varchar](500) NULL,
	[isMobileDevice] [varchar](500) NULL,
	[isSyndicationReader] [varchar](500) NULL,
	[Crawler] [varchar](500) NULL,
	[CSSVersion] [varchar](500) NULL,
	[AolVersion] [varchar](500) NULL,
	[Device_Name] [varchar](500) NULL,
	[Device_Maker] [varchar](500) NULL,
	[RenderingEngine_Name] [varchar](500) NULL,
	[RenderingEngine_Version] [varchar](500) NULL,
	[RenderingEngine_Description] [varchar](500) NULL,
	[UserAgentSQL] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[BrowsCap_BAk]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[BrowsCap_BAk](
	[PropertyName] [varchar](500) NULL,
	[AgentID] [varchar](500) NULL,
	[MasterParent] [varchar](500) NULL,
	[LiteMode] [varchar](500) NULL,
	[Parent] [varchar](500) NULL,
	[Comments] [varchar](500) NULL,
	[Browser] [varchar](500) NULL,
	[Version] [varchar](500) NULL,
	[MajorVer] [varchar](500) NULL,
	[MinorVer] [varchar](500) NULL,
	[Platform] [varchar](500) NULL,
	[Platform_Version] [varchar](500) NULL,
	[Platform_Description] [varchar](500) NULL,
	[Alpha] [varchar](500) NULL,
	[Beta] [varchar](500) NULL,
	[Win16] [varchar](500) NULL,
	[Win32] [varchar](500) NULL,
	[Win64] [varchar](500) NULL,
	[Frames] [varchar](500) NULL,
	[IFrames] [varchar](500) NULL,
	[Tables] [varchar](500) NULL,
	[Cookies] [varchar](500) NULL,
	[BackgroundSounds] [varchar](500) NULL,
	[JavaScript] [varchar](500) NULL,
	[VBScript] [varchar](500) NULL,
	[JavaApplets] [varchar](500) NULL,
	[ActiveXControls] [varchar](500) NULL,
	[isMobileDevice] [varchar](500) NULL,
	[isSyndicationReader] [varchar](500) NULL,
	[Crawler] [varchar](500) NULL,
	[CSSVersion] [varchar](500) NULL,
	[AolVersion] [varchar](500) NULL,
	[Device_Name] [varchar](500) NULL,
	[Device_Maker] [varchar](500) NULL,
	[RenderingEngine_Name] [varchar](500) NULL,
	[RenderingEngine_Version] [varchar](500) NULL,
	[RenderingEngine_Description] [varchar](500) NULL,
	[UserAgentSQL] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[BrowsCap_RC]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[BrowsCap_RC](
	[PropertyName] [varchar](500) NULL,
	[MasterParent] [varchar](500) NULL,
	[LiteMode] [varchar](500) NULL,
	[Parent] [varchar](500) NULL,
	[Comments] [varchar](500) NULL,
	[Browser] [varchar](500) NULL,
	[Version] [varchar](500) NULL,
	[MajorVer] [varchar](500) NULL,
	[MinorVer] [varchar](500) NULL,
	[Platform] [varchar](500) NULL,
	[Platform_Version] [varchar](500) NULL,
	[Alpha] [varchar](500) NULL,
	[Beta] [varchar](500) NULL,
	[Win16] [varchar](500) NULL,
	[Win32] [varchar](500) NULL,
	[Win64] [varchar](500) NULL,
	[Frames] [varchar](500) NULL,
	[IFrames] [varchar](500) NULL,
	[Tables] [varchar](500) NULL,
	[Cookies] [varchar](500) NULL,
	[BackgroundSounds] [varchar](500) NULL,
	[JavaScript] [varchar](500) NULL,
	[VBScript] [varchar](500) NULL,
	[JavaApplets] [varchar](500) NULL,
	[ActiveXControls] [varchar](500) NULL,
	[isMobileDevice] [varchar](500) NULL,
	[isTablet] [varchar](500) NULL,
	[isSyndicationReader] [varchar](500) NULL,
	[Crawler] [varchar](500) NULL,
	[CssVersion] [varchar](500) NULL,
	[AolVersion] [varchar](500) NULL,
	[Browser_Type] [varchar](500) NULL,
	[Browser_Bits] [varchar](500) NULL,
	[Browser_Maker] [varchar](500) NULL,
	[Browser_Modus] [varchar](500) NULL,
	[Platform_Description] [varchar](500) NULL,
	[Platform_Bits] [varchar](500) NULL,
	[Platform_Maker] [varchar](500) NULL,
	[Device_Name] [varchar](500) NULL,
	[Device_Maker] [varchar](500) NULL,
	[Device_Type] [varchar](500) NULL,
	[Device_Pointing_Method] [varchar](500) NULL,
	[Device_Code_Name] [varchar](500) NULL,
	[Device_Brand_Name] [varchar](500) NULL,
	[RenderingEngine_Name] [varchar](500) NULL,
	[RenderingEngine_Version] [varchar](500) NULL,
	[RenderingEngine_Description] [varchar](500) NULL,
	[RenderingEngine_Maker] [varchar](500) NULL,
	[UserAgentSQL] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[CITYMAPPING]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CITYMAPPING](
	[ACTUAL_CITY_NAME] [varchar](40) NULL,
	[STATENAME] [varchar](50) NULL,
	[STATEABBR] [varchar](2) NULL,
	[MAPPED_CITY_NAME] [varchar](40) NULL,
	[LATITUDE] [numeric](38, 0) NULL,
	[LONGITUDE] [numeric](38, 0) NULL,
	[GEOQUALITY] [varchar](20) NULL,
	[MSACODE] [varchar](5) NULL,
	[SEARCH_RADIUS] [numeric](38, 0) NULL,
	[CALC_SEARCHRADIUS] [numeric](38, 0) NULL,
	[NUMAPT] [numeric](9, 0) NULL,
	[NUMCORP] [numeric](9, 0) NULL,
	[NUMSENIOR] [numeric](9, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[CityRefinementLoader]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[CityRefinementLoader](
	[State] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[position] [nvarchar](1000) NULL,
	[clickvalue] [nvarchar](1000) NULL,
	[Visits] [int] NULL,
	[PageViews] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[DevIndexable]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[DevIndexable](
	[URLid] [bigint] NULL,
	[url] [varchar](4000) NULL,
	[CityName] [varchar](8000) NULL,
	[StateName] [varchar](8000) NULL,
	[Neighborhood] [int] NULL,
	[ZipCode] [int] NULL,
	[LSOneRefCriteria] [int] NULL,
	[LSOneRefValue] [int] NULL,
	[LSTwoRefCriteria] [int] NULL,
	[LSTwoRefValue] [int] NULL,
	[PageType] [varchar](25) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[EREIDateRange]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[EREIDateRange](
	[Begin] [nvarchar](255) NULL,
	[End] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[EREILeaddata]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[EREILeaddata](
	[LeadData_Id] [numeric](20, 0) NULL,
	[Screened] [nvarchar](255) NULL,
	[Unscreened] [nvarchar](255) NULL,
	[Property_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[EREILeads]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[EREILeads](
	[LeadID] [nvarchar](255) NULL,
	[CustomerID] [nvarchar](255) NULL,
	[UnitNumber] [nvarchar](255) NULL,
	[FirstName] [nvarchar](255) NULL,
	[LastName] [nvarchar](255) NULL,
	[Address1] [nvarchar](255) NULL,
	[City] [nvarchar](255) NULL,
	[State] [nvarchar](255) NULL,
	[PostalCode] [nvarchar](255) NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](255) NULL,
	[string] [nvarchar](255) NULL,
	[EstimatedMoveDate] [nvarchar](255) NULL,
	[Message] [nvarchar](255) NULL,
	[VisitedProperty] [nvarchar](255) NULL,
	[LeadData_Id] [numeric](20, 0) NULL,
	[DateTime] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[EREIManagement]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[EREIManagement](
	[Management_Id] [numeric](20, 0) NULL,
	[Name] [nvarchar](255) NULL,
	[PropertyCount] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[EREIProperty]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[EREIProperty](
	[Property_Id] [numeric](20, 0) NULL,
	[RDTId] [nvarchar](255) NULL,
	[ILSId] [nvarchar](255) NULL,
	[Name] [nvarchar](255) NULL,
	[UniqueSessions] [nvarchar](255) NULL,
	[PageViews] [nvarchar](255) NULL,
	[Management_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[IndexableAtts]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[IndexableAtts](
	[id] [bigint] NULL,
	[Site] [varchar](255) NULL,
	[url] [varchar](4000) NULL,
	[PageType] [varchar](255) NULL,
	[attrs] [varchar](4000) NULL,
	[SEOPriorityScore] [smallint] NULL,
	[GeoID] [varchar](255) NULL,
	[GeoName] [varchar](255) NULL,
	[Version] [varchar](255) NULL,
	[CreatedDate] [datetime2](3) NULL,
	[DateLoaded] [datetime2](3) NULL,
	[City] [varchar](200) NULL,
	[State] [varchar](50) NULL,
	[Neighborhood] [varchar](200) NULL,
	[ZipCode] [varchar](30) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[IPLocationSearch]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[IPLocationSearch](
	[CityTest] [nvarchar](4000) NULL,
	[State] [nvarchar](4000) NULL,
	[City] [nvarchar](4000) NULL,
	[Visits] [int] NULL,
	[NumberOfLeads] [int] NULL,
	[TimePeriod] [nvarchar](4000) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[ListingServiceAdCount]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ListingServiceAdCount](
	[DateLoaded] [varchar](max) NULL,
	[URLid] [varchar](max) NULL,
	[City] [varchar](max) NULL,
	[State] [varchar](max) NULL,
	[Neighborhood] [varchar](max) NULL,
	[ZipCode] [varchar](max) NULL,
	[PropertyType] [varchar](max) NULL,
	[PageType] [varchar](max) NULL,
	[RefinementCount] [varchar](max) NULL,
	[AdvertiserCount] [varchar](max) NULL,
	[TotalListingCount] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[ListingServiceErrors]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[ListingServiceErrors](
	[ErrorCode] [varchar](max) NULL,
	[ErrorDate] [varchar](max) NULL,
	[RowNumber] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[LoaderCampaignsWLeadsShort]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[LoaderCampaignsWLeadsShort](
	[DemandChannel] [nvarchar](255) NULL,
	[Partner] [nvarchar](255) NULL,
	[MarketingProgram] [nvarchar](255) NULL,
	[MarketingActivity] [nvarchar](255) NULL,
	[CampaignDescription] [nvarchar](255) NULL,
	[CampaignID] [nvarchar](500) NULL,
	[Leadtype] [nvarchar](255) NULL,
	[Visits] [int] NULL,
	[PageViews] [int] NULL,
	[Clickthroughs] [int] NULL,
	[NumberOfLeads] [int] NULL,
	[TimePeriod] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[LoaderMostRecentSrchEngineOrg]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[LoaderMostRecentSrchEngineOrg](
	[mostRecentSearchEngine] [nvarchar](255) NULL,
	[MostRecentSearchPhrase] [nvarchar](500) NULL,
	[Visits] [int] NULL,
	[PageViews] [int] NULL,
	[NumberOfLeads] [int] NULL,
	[PercentOfAllVisits] [float] NULL,
	[AverageVisitDurationMinutes] [float] NULL,
	[Hits] [int] NULL,
	[Revenue] [int] NULL,
	[AverageRevenuePerOrder] [float] NULL,
	[Units] [int] NULL,
	[AverageUnitsPerOrder] [float] NULL,
	[Orders] [int] NULL,
	[TimePeriod] [nvarchar](100) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[LoaderVisitorsTrend]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[LoaderVisitorsTrend](
	[Interval] [nvarchar](50) NULL,
	[ActiveVisits] [int] NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[MySQLindexable]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[MySQLindexable](
	[DateLoaded] [datetime] NULL,
	[URLid] [bigint] NULL,
	[url] [varchar](4000) NULL,
	[PageType] [varchar](25) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[NAREIA_Voucher_Codes]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[NAREIA_Voucher_Codes](
	[LoadTime] [datetime] NOT NULL,
	[VoucherCode] [nvarchar](255) NOT NULL,
	[SiteID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[NewHomeGuideVisitsTrend]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[NewHomeGuideVisitsTrend](
	[Interval] [ntext] NULL,
	[Visits] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[Profile] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[PageClickPosValueShortLoader]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[PageClickPosValueShortLoader](
	[ContentGroup] [nvarchar](50) NULL,
	[ClickType] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[ClickValue] [nvarchar](100) NULL,
	[Visits] [int] NULL,
	[PageViews] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalHousesAdStoreVisits]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalHousesAdStoreVisits](
	[ScenarioAnalysisStep] [ntext] NULL,
	[Visits] [int] NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalHousesCyberSourceConversion]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalHousesCyberSourceConversion](
	[RequestID] [nvarchar](255) NULL,
	[Reviewer] [nvarchar](255) NULL,
	[ReviewerComments] [nvarchar](500) NULL,
	[ConversionDate] [datetime] NULL,
	[OriginalDecision] [nvarchar](255) NULL,
	[NewDecision] [nvarchar](255) NULL,
	[Queue] [nvarchar](255) NULL,
	[Profile] [nvarchar](255) NULL,
	[MerchantReferenceNumber] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalHousesCybersourcePaymentBatch]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalHousesCybersourcePaymentBatch](
	[batch_id] [varchar](50) NULL,
	[merchant_id] [varchar](50) NULL,
	[batch_date] [varchar](50) NULL,
	[request_id] [varchar](50) NULL,
	[merchant_ref_number] [varchar](50) NULL,
	[trans_ref_no] [varchar](50) NULL,
	[payment_method] [varchar](50) NULL,
	[currency] [varchar](50) NULL,
	[amount] [varchar](50) NULL,
	[transaction_type] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalHousesCyberSourcePaymentEvents]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalHousesCyberSourcePaymentEvents](
	[request_id] [varchar](50) NULL,
	[merchant_id] [varchar](50) NULL,
	[merchant_ref_number] [varchar](50) NULL,
	[payment_type] [varchar](50) NULL,
	[event_type] [varchar](50) NULL,
	[event_date] [varchar](50) NULL,
	[trans_ref_no] [varchar](50) NULL,
	[merchant_currency_code] [varchar](50) NULL,
	[merchant_amount] [varchar](50) NULL,
	[consumer_currency_code] [varchar](50) NULL,
	[consumer_amount] [varchar](50) NULL,
	[fee_currency_code] [varchar](50) NULL,
	[fee_amount] [varchar](50) NULL,
	[processor_message] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalHousesCyberSourceTransactions]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalHousesCyberSourceTransactions](
	[row_descriptor] [varchar](500) NULL,
	[request_id] [varchar](500) NULL,
	[transaction_date] [varchar](500) NULL,
	[merchant_ref_number] [varchar](500) NULL,
	[merchant_id] [varchar](500) NULL,
	[ics_applications] [varchar](500) NULL,
	[auth_rcode] [varchar](500) NULL,
	[auth_rflag] [varchar](500) NULL,
	[auth_rmsg] [varchar](500) NULL,
	[auth_reversal_rcode] [varchar](500) NULL,
	[auth_reversal_rflag] [varchar](500) NULL,
	[auth_reversal_rmsg] [varchar](500) NULL,
	[bill_rcode] [varchar](500) NULL,
	[bill_rflag] [varchar](500) NULL,
	[bill_rmsg] [varchar](500) NULL,
	[credit_rcode] [varchar](500) NULL,
	[credit_rflag] [varchar](500) NULL,
	[credit_rmsg] [varchar](500) NULL,
	[ecp_debit_rcode] [varchar](500) NULL,
	[ecp_debit_rflag] [varchar](500) NULL,
	[ecp_debit_rmsg] [varchar](500) NULL,
	[ecp_credit_rcode] [varchar](500) NULL,
	[ecp_credit_rflag] [varchar](500) NULL,
	[ecp_credit_rmsg] [varchar](500) NULL,
	[score_rcode] [varchar](500) NULL,
	[score_rflag] [varchar](500) NULL,
	[score_rmsg] [varchar](500) NULL,
	[tax_rcode] [varchar](500) NULL,
	[tax_rflag] [varchar](500) NULL,
	[tax_rmsg] [varchar](500) NULL,
	[dav_rcode] [varchar](500) NULL,
	[dav_rflag] [varchar](500) NULL,
	[dav_rmsg] [varchar](500) NULL,
	[export_rcode] [varchar](500) NULL,
	[export_rflag] [varchar](500) NULL,
	[export_rmsg] [varchar](500) NULL,
	[elc_rcode] [varchar](500) NULL,
	[elc_rflag] [varchar](500) NULL,
	[elc_rmsg] [varchar](500) NULL,
	[elc_revoke_rcode] [varchar](500) NULL,
	[elc_revoke_rflag] [varchar](500) NULL,
	[elc_revoke_rmsg] [varchar](500) NULL,
	[download_rcode] [varchar](500) NULL,
	[download_rflag] [varchar](500) NULL,
	[download_rmsg] [varchar](500) NULL,
	[create_isv_rcode] [varchar](500) NULL,
	[create_isv_rflag] [varchar](500) NULL,
	[create_isv_rmsg] [varchar](500) NULL,
	[add_value_to_isv_rcode] [varchar](500) NULL,
	[add_value_to_isv_rflag] [varchar](500) NULL,
	[add_value_to_isv_rmsg] [varchar](500) NULL,
	[get_isv_history_rcode] [varchar](500) NULL,
	[get_isv_history_rflag] [varchar](500) NULL,
	[get_isv_history_rmsg] [varchar](500) NULL,
	[get_isv_info_rcode] [varchar](500) NULL,
	[get_isv_info_rflag] [varchar](500) NULL,
	[get_isv_info_rmsg] [varchar](500) NULL,
	[get_isv_profiles_rcode] [varchar](500) NULL,
	[get_isv_profiles_rflag] [varchar](500) NULL,
	[get_isv_profiles_rmsg] [varchar](500) NULL,
	[modify_isv_rcode] [varchar](500) NULL,
	[modify_isv_rflag] [varchar](500) NULL,
	[modify_isv_rmsg] [varchar](500) NULL,
	[redeem_isv_rcode] [varchar](500) NULL,
	[redeem_isv_rflag] [varchar](500) NULL,
	[redeem_isv_rmsg] [varchar](500) NULL,
	[customer_firstname] [varchar](500) NULL,
	[customer_lastname] [varchar](500) NULL,
	[customer_middlename] [varchar](500) NULL,
	[bill_address1] [varchar](500) NULL,
	[bill_address2] [varchar](500) NULL,
	[bill_city] [varchar](500) NULL,
	[bill_state] [varchar](500) NULL,
	[bill_zip] [varchar](500) NULL,
	[bill_country] [varchar](500) NULL,
	[company_name] [varchar](500) NULL,
	[customer_email] [varchar](500) NULL,
	[customer_title] [varchar](500) NULL,
	[customer_phone] [varchar](500) NULL,
	[ship_to_address1] [varchar](500) NULL,
	[ship_to_address2] [varchar](500) NULL,
	[ship_to_city] [varchar](500) NULL,
	[ship_to_state] [varchar](500) NULL,
	[ship_to_zip] [varchar](500) NULL,
	[ship_to_country] [varchar](500) NULL,
	[ship_to_phone] [varchar](500) NULL,
	[customer_ipaddress] [varchar](500) NULL,
	[account_suffix] [varchar](500) NULL,
	[customer_cc_expmo] [varchar](500) NULL,
	[customer_cc_expyr] [varchar](500) NULL,
	[customer_cc_startmo] [varchar](500) NULL,
	[customer_cc_startyr] [varchar](500) NULL,
	[customer_cc_issue_number] [varchar](500) NULL,
	[payment_method] [varchar](500) NULL,
	[amount] [varchar](500) NULL,
	[currency] [varchar](500) NULL,
	[auth_auth_avs] [varchar](500) NULL,
	[auth_auth_code] [varchar](500) NULL,
	[auth_cv_result] [varchar](500) NULL,
	[shipping_method] [varchar](500) NULL,
	[score_factors] [varchar](500) NULL,
	[score_host_severity] [varchar](500) NULL,
	[score_score_result] [varchar](500) NULL,
	[score_time_local] [varchar](500) NULL,
	[customer_hostname] [varchar](500) NULL,
	[shipping_carrier] [varchar](500) NULL,
	[customer_password_provided] [varchar](500) NULL,
	[lost_password] [varchar](500) NULL,
	[repeat_customer] [varchar](500) NULL,
	[cookies_accepted] [varchar](500) NULL,
	[customer_loyalty] [varchar](500) NULL,
	[customer_promotions] [varchar](500) NULL,
	[gift_wrap] [varchar](500) NULL,
	[returns_accepted] [varchar](500) NULL,
	[customer_id] [varchar](500) NULL,
	[product_risk] [varchar](500) NULL,
	[applied_score_threshold] [varchar](500) NULL,
	[applied_time_hedge] [varchar](500) NULL,
	[applied_velocity_hedge] [varchar](500) NULL,
	[applied_host_hedge] [varchar](500) NULL,
	[applied_category_gift] [varchar](500) NULL,
	[applied_category_time] [varchar](500) NULL,
	[avs] [varchar](500) NULL,
	[cv] [varchar](500) NULL,
	[payment_processor] [varchar](500) NULL,
	[source] [varchar](500) NULL,
	[subscription_id] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalHousesVisitsTrend]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalHousesVisitsTrend](
	[Interval] [ntext] NULL,
	[Visits] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[Rentals_SalesTerritory_AGRA]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[Rentals_SalesTerritory_AGRA](
	[AccountNumber] [nvarchar](255) NULL,
	[SalesPerson] [nvarchar](255) NULL,
	[SalesPersonID] [int] NULL,
	[SalesCoordinator] [nvarchar](255) NULL,
	[SalesCoordinatorID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[Rentals_SalesTerritory_NationalAccount]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[Rentals_SalesTerritory_NationalAccount](
	[AccountNumber] [nvarchar](255) NULL,
	[SalesPerson] [nvarchar](255) NULL,
	[SalesPersonID] [int] NULL,
	[SalesCoordinator] [nvarchar](255) NULL,
	[SalesCoordinatorID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[Rentals_SalesTerritory_NationalAccount2]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[Rentals_SalesTerritory_NationalAccount2](
	[AccountNumber] [nvarchar](255) NULL,
	[SalesPerson] [nvarchar](255) NULL,
	[SalesPersonID] [int] NULL,
	[SalesCoordinator] [nvarchar](255) NULL,
	[SalesCoordinatorID] [int] NULL,
	[State] [nvarchar](255) NULL,
	[StateAbbr] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[Rentals_SalesTerritory_Owner]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[Rentals_SalesTerritory_Owner](
	[StateName] [nvarchar](255) NULL,
	[StateAbbr] [nvarchar](255) NULL,
	[SalesPerson] [nvarchar](255) NULL,
	[SalesPersonID] [int] NULL,
	[SalesCoordinator] [nvarchar](255) NULL,
	[SalesCoordinatorID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalsAdStoreTrend]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalsAdStoreTrend](
	[ScenarioAnalysisStep] [ntext] NULL,
	[Visits] [int] NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalsAdStoreVisits]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalsAdStoreVisits](
	[ScenarioAnalysisStep] [ntext] NULL,
	[Visits] [int] NULL,
	[StartDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalsCorporateAccounts]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalsCorporateAccounts](
	[SiteID] [int] NULL,
	[AccountName] [nvarchar](255) NULL,
	[Parent] [nvarchar](255) NULL,
	[Child] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalsCyberSourceConversion]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalsCyberSourceConversion](
	[RequestID] [nvarchar](255) NULL,
	[Reviewer] [nvarchar](255) NULL,
	[ReviewerComments] [nvarchar](500) NULL,
	[ConversionDate] [datetime] NULL,
	[OriginalDecision] [nvarchar](255) NULL,
	[NewDecision] [nvarchar](255) NULL,
	[Queue] [nvarchar](255) NULL,
	[Profile] [nvarchar](255) NULL,
	[MerchantReferenceNumber] [bigint] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalsCybersourcePaymentBatch]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalsCybersourcePaymentBatch](
	[batch_id] [varchar](50) NULL,
	[merchant_id] [varchar](50) NULL,
	[batch_date] [varchar](50) NULL,
	[request_id] [varchar](50) NULL,
	[merchant_ref_number] [varchar](50) NULL,
	[trans_ref_no] [varchar](50) NULL,
	[payment_method] [varchar](50) NULL,
	[currency] [varchar](50) NULL,
	[amount] [varchar](50) NULL,
	[transaction_type] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalsCyberSourcePaymentEvents]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalsCyberSourcePaymentEvents](
	[request_id] [varchar](50) NULL,
	[merchant_id] [varchar](50) NULL,
	[merchant_ref_number] [varchar](50) NULL,
	[payment_type] [varchar](50) NULL,
	[event_type] [varchar](50) NULL,
	[event_date] [varchar](50) NULL,
	[trans_ref_no] [varchar](50) NULL,
	[merchant_currency_code] [varchar](50) NULL,
	[merchant_amount] [varchar](50) NULL,
	[consumer_currency_code] [varchar](50) NULL,
	[consumer_amount] [varchar](50) NULL,
	[fee_currency_code] [varchar](50) NULL,
	[fee_amount] [varchar](50) NULL,
	[processor_message] [varchar](250) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalsCyberSourceTransactions]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalsCyberSourceTransactions](
	[row_descriptor] [varchar](500) NULL,
	[request_id] [varchar](500) NULL,
	[transaction_date] [varchar](500) NULL,
	[merchant_ref_number] [varchar](500) NULL,
	[merchant_id] [varchar](500) NULL,
	[ics_applications] [varchar](500) NULL,
	[auth_rcode] [varchar](500) NULL,
	[auth_rflag] [varchar](500) NULL,
	[auth_rmsg] [varchar](500) NULL,
	[auth_reversal_rcode] [varchar](500) NULL,
	[auth_reversal_rflag] [varchar](500) NULL,
	[auth_reversal_rmsg] [varchar](500) NULL,
	[bill_rcode] [varchar](500) NULL,
	[bill_rflag] [varchar](500) NULL,
	[bill_rmsg] [varchar](500) NULL,
	[credit_rcode] [varchar](500) NULL,
	[credit_rflag] [varchar](500) NULL,
	[credit_rmsg] [varchar](500) NULL,
	[ecp_debit_rcode] [varchar](500) NULL,
	[ecp_debit_rflag] [varchar](500) NULL,
	[ecp_debit_rmsg] [varchar](500) NULL,
	[ecp_credit_rcode] [varchar](500) NULL,
	[ecp_credit_rflag] [varchar](500) NULL,
	[ecp_credit_rmsg] [varchar](500) NULL,
	[score_rcode] [varchar](500) NULL,
	[score_rflag] [varchar](500) NULL,
	[score_rmsg] [varchar](500) NULL,
	[tax_rcode] [varchar](500) NULL,
	[tax_rflag] [varchar](500) NULL,
	[tax_rmsg] [varchar](500) NULL,
	[dav_rcode] [varchar](500) NULL,
	[dav_rflag] [varchar](500) NULL,
	[dav_rmsg] [varchar](500) NULL,
	[export_rcode] [varchar](500) NULL,
	[export_rflag] [varchar](500) NULL,
	[export_rmsg] [varchar](500) NULL,
	[elc_rcode] [varchar](500) NULL,
	[elc_rflag] [varchar](500) NULL,
	[elc_rmsg] [varchar](500) NULL,
	[elc_revoke_rcode] [varchar](500) NULL,
	[elc_revoke_rflag] [varchar](500) NULL,
	[elc_revoke_rmsg] [varchar](500) NULL,
	[download_rcode] [varchar](500) NULL,
	[download_rflag] [varchar](500) NULL,
	[download_rmsg] [varchar](500) NULL,
	[create_isv_rcode] [varchar](500) NULL,
	[create_isv_rflag] [varchar](500) NULL,
	[create_isv_rmsg] [varchar](500) NULL,
	[add_value_to_isv_rcode] [varchar](500) NULL,
	[add_value_to_isv_rflag] [varchar](500) NULL,
	[add_value_to_isv_rmsg] [varchar](500) NULL,
	[get_isv_history_rcode] [varchar](500) NULL,
	[get_isv_history_rflag] [varchar](500) NULL,
	[get_isv_history_rmsg] [varchar](500) NULL,
	[get_isv_info_rcode] [varchar](500) NULL,
	[get_isv_info_rflag] [varchar](500) NULL,
	[get_isv_info_rmsg] [varchar](500) NULL,
	[get_isv_profiles_rcode] [varchar](500) NULL,
	[get_isv_profiles_rflag] [varchar](500) NULL,
	[get_isv_profiles_rmsg] [varchar](500) NULL,
	[modify_isv_rcode] [varchar](500) NULL,
	[modify_isv_rflag] [varchar](500) NULL,
	[modify_isv_rmsg] [varchar](500) NULL,
	[redeem_isv_rcode] [varchar](500) NULL,
	[redeem_isv_rflag] [varchar](500) NULL,
	[redeem_isv_rmsg] [varchar](500) NULL,
	[customer_firstname] [varchar](500) NULL,
	[customer_lastname] [varchar](500) NULL,
	[customer_middlename] [varchar](500) NULL,
	[bill_address1] [varchar](500) NULL,
	[bill_address2] [varchar](500) NULL,
	[bill_city] [varchar](500) NULL,
	[bill_state] [varchar](500) NULL,
	[bill_zip] [varchar](500) NULL,
	[bill_country] [varchar](500) NULL,
	[company_name] [varchar](500) NULL,
	[customer_email] [varchar](500) NULL,
	[customer_title] [varchar](500) NULL,
	[customer_phone] [varchar](500) NULL,
	[ship_to_address1] [varchar](500) NULL,
	[ship_to_address2] [varchar](500) NULL,
	[ship_to_city] [varchar](500) NULL,
	[ship_to_state] [varchar](500) NULL,
	[ship_to_zip] [varchar](500) NULL,
	[ship_to_country] [varchar](500) NULL,
	[ship_to_phone] [varchar](500) NULL,
	[customer_ipaddress] [varchar](500) NULL,
	[account_suffix] [varchar](500) NULL,
	[customer_cc_expmo] [varchar](500) NULL,
	[customer_cc_expyr] [varchar](500) NULL,
	[customer_cc_startmo] [varchar](500) NULL,
	[customer_cc_startyr] [varchar](500) NULL,
	[customer_cc_issue_number] [varchar](500) NULL,
	[payment_method] [varchar](500) NULL,
	[amount] [varchar](500) NULL,
	[currency] [varchar](500) NULL,
	[auth_auth_avs] [varchar](500) NULL,
	[auth_auth_code] [varchar](500) NULL,
	[auth_cv_result] [varchar](500) NULL,
	[shipping_method] [varchar](500) NULL,
	[score_factors] [varchar](500) NULL,
	[score_host_severity] [varchar](500) NULL,
	[score_score_result] [varchar](500) NULL,
	[score_time_local] [varchar](500) NULL,
	[customer_hostname] [varchar](500) NULL,
	[shipping_carrier] [varchar](500) NULL,
	[customer_password_provided] [varchar](500) NULL,
	[lost_password] [varchar](500) NULL,
	[repeat_customer] [varchar](500) NULL,
	[cookies_accepted] [varchar](500) NULL,
	[customer_loyalty] [varchar](500) NULL,
	[customer_promotions] [varchar](500) NULL,
	[gift_wrap] [varchar](500) NULL,
	[returns_accepted] [varchar](500) NULL,
	[customer_id] [varchar](500) NULL,
	[product_risk] [varchar](500) NULL,
	[applied_score_threshold] [varchar](500) NULL,
	[applied_time_hedge] [varchar](500) NULL,
	[applied_velocity_hedge] [varchar](500) NULL,
	[applied_host_hedge] [varchar](500) NULL,
	[applied_category_gift] [varchar](500) NULL,
	[applied_category_time] [varchar](500) NULL,
	[avs] [varchar](500) NULL,
	[cv] [varchar](500) NULL,
	[payment_processor] [varchar](500) NULL,
	[source] [varchar](500) NULL,
	[subscription_id] [varchar](500) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalsLeadsMissingColumns]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalsLeadsMissingColumns](
	[YearMonth] [int] NOT NULL,
	[SiteID] [int] NOT NULL,
	[AccountID] [uniqueidentifier] NOT NULL,
	[EmailLeads_Lovely] [int] NOT NULL,
	[EmailLeads_AndroidRent] [int] NOT NULL,
	[EmailLeads_iPhoneRent] [int] NOT NULL,
	[EmailLeads_iPadRent] [int] NOT NULL,
	[EmailLeads_mApartmentGuide] [int] NOT NULL,
	[EmailLeads_ApartmentGuide] [int] NOT NULL,
	[EmailLeads_AndroidAG] [int] NOT NULL,
	[EmailLeads_IPhoneAG] [int] NOT NULL,
	[EmailLeads_IPadAG] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[RentalsVisitsTrend]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[RentalsVisitsTrend](
	[Interval] [ntext] NULL,
	[Visits] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SalesForce_Community]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SalesForce_Community](
	[MAX_Client_ID__c] [nvarchar](20) NULL,
	[AG_Community__c] [nvarchar](18) NULL,
	[LastModifiedDate] [datetime] NULL,
	[Number_of_Units__c] [float] NULL,
	[NewConstruction] [varchar](64) NULL,
	[Agent__c] [nvarchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SalesForce_Market]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SalesForce_Market](
	[Id] [nvarchar](18) NULL,
	[OwnerId] [nvarchar](18) NULL,
	[IsDeleted] [bit] NULL,
	[Name] [nvarchar](80) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedById] [nvarchar](18) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedById] [nvarchar](18) NULL,
	[SystemModstamp] [datetime] NULL,
	[ConnectionReceivedId] [nvarchar](18) NULL,
	[ConnectionSentId] [nvarchar](18) NULL,
	[Market_Potential__c] [nvarchar](255) NULL,
	[Region__c] [nvarchar](255) NULL,
	[Inactive__c] [bit] NULL,
	[NSP_Proposal_Goal__c] [float] NULL,
	[Publication_ID__c] [nvarchar](64) NULL,
	[Target_April__c] [float] NULL,
	[Target_August__c] [float] NULL,
	[Target_December__c] [float] NULL,
	[Target_February__c] [float] NULL,
	[Target_January_Prelim__c] [float] NULL,
	[Target_January__c] [float] NULL,
	[Target_July__c] [float] NULL,
	[Target_June__c] [float] NULL,
	[Target_March__c] [float] NULL,
	[Target_May__c] [float] NULL,
	[Target_November__c] [float] NULL,
	[Target_October__c] [float] NULL,
	[Target_September__c] [float] NULL,
	[Unit_Threshold__c] [float] NULL,
	[Weight_ApartmentFinder_com__c] [float] NULL,
	[Weight_Apartments_com__c] [float] NULL,
	[Weight_CraigsList_org__c] [float] NULL,
	[Weight_Forrent_com__c] [float] NULL,
	[Weight_Move_com__c] [float] NULL,
	[Weight_MyNewPlace_com__c] [float] NULL,
	[Weight_Rent_com__c] [float] NULL,
	[Cold_Call_Goal__c] [float] NULL,
	[Sales_BRC_Goal__c] [float] NULL,
	[NSP_Pending_Contract_Goal__c] [float] NULL,
	[NPS_Win_Goal__c] [float] NULL,
	[Service_BRC_Goal__c] [float] NULL,
	[USP_Proposal_Conversion_Goal__c] [float] NULL,
	[USP_Proposal_Upgrade_Goal__c] [float] NULL,
	[Contract_Conversion_Goal__c] [float] NULL,
	[Contract_Upgrade_Goal__c] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Index [cidx_createddate]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE CLUSTERED INDEX [cidx_createddate] ON [Staging].[SalesForce_Market]
(
	[CreatedDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[SalesForce_MarketForecast]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SalesForce_MarketForecast](
	[Id] [nvarchar](18) NULL,
	[IsDeleted] [bit] NULL,
	[Name] [nvarchar](80) NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedById] [nvarchar](18) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedById] [nvarchar](18) NULL,
	[SystemModstamp] [datetime] NULL,
	[LastActivityDate] [date] NULL,
	[ConnectionReceivedId] [nvarchar](18) NULL,
	[ConnectionSentId] [nvarchar](18) NULL,
	[Sales_Market__c] [nvarchar](18) NULL,
	[Month1_Backbill__c] [float] NULL,
	[Month1_Client_Count__c] [float] NULL,
	[Month1_Dropped_Recurring__c] [float] NULL,
	[Month1_MgtCo_Internet__c] [float] NULL,
	[Month1_MgtCo_Print__c] [float] NULL,
	[Month1_Modified_Base__c] [float] NULL,
	[Month1_NRC_Lead_Xcelerator__c] [float] NULL,
	[Month1_NRC_Other__c] [float] NULL,
	[Month1_NRC_Spotlight__c] [float] NULL,
	[Month1_New_Recurring__c] [float] NULL,
	[Month1_Other__c] [float] NULL,
	[Month1_Pay_For_Performance__c] [float] NULL,
	[Month1_Prior_Recurring__c] [float] NULL,
	[Month1_Recurring_Decrease__c] [float] NULL,
	[Month1_Recurring_Increase__c] [float] NULL,
	[Month1_Total_Recurring_Sales__c] [float] NULL,
	[Month2_Backbill__c] [float] NULL,
	[Month2_Client_Count__c] [float] NULL,
	[Month2_Dropped_Recurring__c] [float] NULL,
	[Month2_MgtCo_Internet__c] [float] NULL,
	[Month2_MgtCo_Print__c] [float] NULL,
	[Month2_Modified_Base__c] [float] NULL,
	[Month2_NRC_Lead_Xcelerator__c] [float] NULL,
	[Month2_NRC_Other__c] [float] NULL,
	[Month2_NRC_Spotlight__c] [float] NULL,
	[Month2_New_Recurring__c] [float] NULL,
	[Month2_Other__c] [float] NULL,
	[Month2_Pay_For_Performance__c] [float] NULL,
	[Month2_Prior_Recurring__c] [float] NULL,
	[Month2_Recurring_Decrease__c] [float] NULL,
	[Month2_Recurring_Increase__c] [float] NULL,
	[Month2_Total_Recurring_Sales__c] [float] NULL,
	[Month3_BackBill__c] [float] NULL,
	[Month3_Client_Count__c] [float] NULL,
	[Month3_Dropped_Recurring__c] [float] NULL,
	[Month3_MgtCo_Internet__c] [float] NULL,
	[Month3_MgtCo_Print__c] [float] NULL,
	[Month3_Modified_Base__c] [float] NULL,
	[Month3_NRC_Lead_Xcelerator__c] [float] NULL,
	[Month3_NRC_Other__c] [float] NULL,
	[Month3_NRC_Spotlight__c] [float] NULL,
	[Month3_New_Recurring__c] [float] NULL,
	[Month3_Other__c] [float] NULL,
	[Month3_Pay_for_Performance__c] [float] NULL,
	[Month3_Prior_Recurring__c] [float] NULL,
	[Month3_Recurring_Decrease__c] [float] NULL,
	[Month3_Recurring_Increase__c] [float] NULL,
	[Month3_Total_Recurring_Sales__c] [float] NULL,
	[Month4_Dropped_Recurring__c] [float] NULL,
	[Month4_Market_Transfers__c] [float] NULL,
	[Month4_Modified_Base__c] [float] NULL,
	[Month4_New_Recurring__c] [float] NULL,
	[Month4_Recurring_Decrease__c] [float] NULL,
	[Month4_Recurring_Increase__c] [float] NULL,
	[Month4_Total_Recurring_Sales__c] [float] NULL,
	[Month5_Dropped_Recurring__c] [float] NULL,
	[Month5_Market_Transfers__c] [float] NULL,
	[Month5_Modified_Base__c] [float] NULL,
	[Month5_New_Recurring__c] [float] NULL,
	[Month5_Recurring_Decrease__c] [float] NULL,
	[Month5_Recurring_Increase__c] [float] NULL,
	[Month5_Total_Recurring_Sales__c] [float] NULL,
	[Notes_Recurring__c] [nvarchar](255) NULL,
	[X2_Month_Avg_Recurring_Increase__c] [float] NULL,
	[X2_Month_Avg_Recurring__c] [float] NULL,
	[X3_Month_Avg_Recurring_Increase__c] [float] NULL,
	[X3_Month_Avg_Recurring__c] [float] NULL,
	[X2_Month_Avg_Recurring_Decrease__c] [float] NULL,
	[X3_Month_Avg_Recurring_Decrease__c] [float] NULL,
	[X3_Month_Avg_New_Recurring__c] [float] NULL,
	[X2_Month_Avg_New_Recurring__c] [float] NULL,
	[X2_Month_Avg_Dropped_Recurring__c] [float] NULL,
	[X3_Month_Avg_Dropped_Recurring__c] [float] NULL,
	[X3_Month_Avg_MgtCo_Internet__c] [float] NULL,
	[X3_Month_Avg_MgtCo_Print__c] [float] NULL,
	[X3_Month_Avg_Modified_Base__c] [float] NULL,
	[X2_Month_Avg_Modified_Base__c] [float] NULL,
	[X3_Month_Avg_Total_Recurring__c] [float] NULL,
	[X2_Month_Avg_Total_Recurring__c] [float] NULL,
	[X2_Month_Avg_MgtCo_Print__c] [float] NULL,
	[X2_Month_Avg_MgtCo_Internet__c] [float] NULL,
	[Month4_MgtCo_Print__c] [float] NULL,
	[Month5_MgtCo_Print__c] [float] NULL,
	[Month4_MgtCo_Internet__c] [float] NULL,
	[Month5_MgtCo_Internet__c] [float] NULL,
	[Month4_NRC_Spotlight__c] [float] NULL,
	[Month5_NRC_Spotlight__c] [float] NULL,
	[Month4_NRC_Lead_Xcelerator__c] [float] NULL,
	[Month5_NRC_Lead_Xcelerator__c] [float] NULL,
	[Month4_NRC_Other__c] [float] NULL,
	[Month5_NRC_Other__c] [float] NULL,
	[Month3_Total_Sales__c] [float] NULL,
	[Month2_Total_Sales__c] [float] NULL,
	[Month1_Total_Sales__c] [float] NULL,
	[Month4_Total_Sales__c] [float] NULL,
	[Month5_Total_Sales__c] [float] NULL,
	[X3_Month_Avg_NRC_Spotlight__c] [float] NULL,
	[X2_Month_Avg_NRC_Spotlight__c] [float] NULL,
	[X3_Month_Avg_NRC_Lead_Xcelerator__c] [float] NULL,
	[X2_Month_Avg_NRC_Lead_Xcelerator__c] [float] NULL,
	[X3_Month_Avg_NRC_Other__c] [float] NULL,
	[X2_Month_Avg_NRC_Other__c] [float] NULL,
	[X3_Month_Avg_Total_Sales__c] [float] NULL,
	[X2_Month_Avg_Total_Sales__c] [float] NULL,
	[X3_Month_Avg_Other__c] [float] NULL,
	[X2_Month_Avg_Other__c] [float] NULL,
	[X3_Month_Avg_Pay_For_Performance__c] [float] NULL,
	[X2_Month_Avg_Pay_For_Performance__c] [float] NULL,
	[X3_Month_Avg_Backbill__c] [float] NULL,
	[X2_Month_Avg_Backbill__c] [float] NULL,
	[Month3_Total_Revenue__c] [float] NULL,
	[Month2_Total_Revenue__c] [float] NULL,
	[Month1_Total_Revenue__c] [float] NULL,
	[Month4_Other__c] [float] NULL,
	[Month5_Other__c] [float] NULL,
	[Month4_Pay_For_Performance__c] [float] NULL,
	[Month4_Backbill__c] [float] NULL,
	[Month5_Pay_For_Performance__c] [float] NULL,
	[Month5_Backbill__c] [float] NULL,
	[Month4_Total_Revenue__c] [float] NULL,
	[Month5_Total_Revenue__c] [float] NULL,
	[X3_Month_Avg_Total_Revenue__c] [float] NULL,
	[X2_Month_Avg_Total_Revenue__c] [float] NULL,
	[X3_Month_Avg_Client_Count__c] [float] NULL,
	[X2_Month_Avg_Client_Count__c] [float] NULL,
	[Month3_Avg_Rev_per_Client__c] [float] NULL,
	[Month2_Avg_Rev_per_Client__c] [float] NULL,
	[Month1_Avg_Rev_per_Client__c] [float] NULL,
	[Month4_Client_Count__c] [float] NULL,
	[Month5_Client_Count__c] [float] NULL,
	[Month4_Avg_Rev_per_Client__c] [float] NULL,
	[Month5_Avg_Rev_per_Client__c] [float] NULL,
	[X3_Month_Avg_Rev_per_Client__c] [float] NULL,
	[X2_Month_Avg_Rev_per_Client__c] [float] NULL,
	[Is_Submitted__c] [bit] NULL,
	[Month1_Date_Billed__c] [date] NULL,
	[Month1_Financial_Month__c] [date] NULL,
	[Month2_Date_Billed__c] [date] NULL,
	[Month2_Financial_Month__c] [date] NULL,
	[Month3_Date_Billed__c] [date] NULL,
	[Month3_Financial_Month__c] [date] NULL,
	[Notes_Clients__c] [nvarchar](255) NULL,
	[Notes_Extra__c] [nvarchar](255) NULL,
	[Notes_Other__c] [nvarchar](255) NULL,
	[Notes_Target__c] [nvarchar](255) NULL,
	[Notes_Transfers__c] [nvarchar](255) NULL,
	[Month1_NRC_Rentals_Spotlight__c] [float] NULL,
	[Month2_NRC_Rentals_Spotlight__c] [float] NULL,
	[Month3_NRC_Rentals_Spotlight__c] [float] NULL,
	[Month4_NRC_Rentals_Spotlight__c] [float] NULL,
	[Month5_NRC_Rentals_Spotlight__c] [float] NULL,
	[X3_Month_Avg_NRC_Rentals_Spotlight__c] [float] NULL,
	[X2_Month_Avg_NRC_Rentals_Spotlight__c] [float] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SalesForce_UserRole]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SalesForce_UserRole](
	[Id] [nvarchar](18) NULL,
	[Name] [nvarchar](80) NULL,
	[ParentRoleId] [nvarchar](18) NULL,
	[RollupDescription] [nvarchar](80) NULL,
	[OpportunityAccessForAccountOwner] [nvarchar](40) NULL,
	[CaseAccessForAccountOwner] [nvarchar](40) NULL,
	[ContactAccessForAccountOwner] [nvarchar](40) NULL,
	[ForecastUserId] [nvarchar](18) NULL,
	[MayForecastManagerShare] [bit] NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedById] [nvarchar](18) NULL,
	[SystemModstamp] [datetime] NULL,
	[DeveloperName] [nvarchar](80) NULL,
	[PortalAccountId] [nvarchar](18) NULL,
	[PortalType] [nvarchar](40) NULL,
	[PortalAccountOwnerId] [nvarchar](18) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SalesForce_Users]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SalesForce_Users](
	[Id] [nvarchar](18) NULL,
	[Username] [nvarchar](80) NULL,
	[LastName] [nvarchar](80) NULL,
	[FirstName] [nvarchar](40) NULL,
	[Name] [nvarchar](121) NULL,
	[CompanyName] [nvarchar](80) NULL,
	[Division] [nvarchar](80) NULL,
	[Department] [nvarchar](80) NULL,
	[Title] [nvarchar](80) NULL,
	[Street] [nvarchar](255) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](20) NULL,
	[PostalCode] [nvarchar](20) NULL,
	[Country] [nvarchar](40) NULL,
	[Email] [nvarchar](80) NULL,
	[Phone] [nvarchar](40) NULL,
	[Fax] [nvarchar](40) NULL,
	[MobilePhone] [nvarchar](40) NULL,
	[Alias] [nvarchar](8) NULL,
	[CommunityNickname] [nvarchar](40) NULL,
	[IsActive] [bit] NULL,
	[TimeZoneSidKey] [nvarchar](40) NULL,
	[UserRoleId] [nvarchar](18) NULL,
	[LocaleSidKey] [nvarchar](40) NULL,
	[ReceivesInfoEmails] [bit] NULL,
	[ReceivesAdminInfoEmails] [bit] NULL,
	[EmailEncodingKey] [nvarchar](40) NULL,
	[ProfileId] [nvarchar](18) NULL,
	[UserType] [nvarchar](40) NULL,
	[LanguageLocaleKey] [nvarchar](40) NULL,
	[EmployeeNumber] [nvarchar](20) NULL,
	[DelegatedApproverId] [nvarchar](18) NULL,
	[ManagerId] [nvarchar](18) NULL,
	[LastLoginDate] [datetime] NULL,
	[LastPasswordChangeDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[CreatedById] [nvarchar](18) NULL,
	[LastModifiedDate] [datetime] NULL,
	[LastModifiedById] [nvarchar](18) NULL,
	[SystemModstamp] [datetime] NULL,
	[OfflineTrialExpirationDate] [datetime] NULL,
	[OfflinePdaTrialExpirationDate] [datetime] NULL,
	[UserPermissionsMarketingUser] [bit] NULL,
	[UserPermissionsOfflineUser] [bit] NULL,
	[UserPermissionsAvantgoUser] [bit] NULL,
	[UserPermissionsCallCenterAutoLogin] [bit] NULL,
	[UserPermissionsMobileUser] [bit] NULL,
	[UserPermissionsSFContentUser] [bit] NULL,
	[UserPermissionsInteractionUser] [bit] NULL,
	[UserPermissionsSupportUser] [bit] NULL,
	[ForecastEnabled] [bit] NULL,
	[UserPreferencesActivityRemindersPopup] [bit] NULL,
	[UserPreferencesEventRemindersCheckboxDefault] [bit] NULL,
	[UserPreferencesTaskRemindersCheckboxDefault] [bit] NULL,
	[UserPreferencesReminderSoundOff] [bit] NULL,
	[UserPreferencesDisableAllFeedsEmail] [bit] NULL,
	[UserPreferencesDisableFollowersEmail] [bit] NULL,
	[UserPreferencesDisableProfilePostEmail] [bit] NULL,
	[UserPreferencesDisableChangeCommentEmail] [bit] NULL,
	[UserPreferencesDisableLaterCommentEmail] [bit] NULL,
	[UserPreferencesDisProfPostCommentEmail] [bit] NULL,
	[UserPreferencesContentNoEmail] [bit] NULL,
	[UserPreferencesDisableAutoSubForFeeds] [bit] NULL,
	[UserPreferencesContentEmailAsAndWhen] [bit] NULL,
	[UserPreferencesApexPagesDeveloperMode] [bit] NULL,
	[UserPreferencesDisableMentionsPostEmail] [bit] NULL,
	[UserPreferencesDisMentionsCommentEmail] [bit] NULL,
	[UserPreferencesDisCommentAfterLikeEmail] [bit] NULL,
	[UserPreferencesDisableLikeEmail] [bit] NULL,
	[UserPreferencesDisableMessageEmail] [bit] NULL,
	[UserPreferencesDisableBookmarkEmail] [bit] NULL,
	[UserPreferencesDisableSharePostEmail] [bit] NULL,
	[ContactId] [nvarchar](18) NULL,
	[AccountId] [nvarchar](18) NULL,
	[CallCenterId] [nvarchar](18) NULL,
	[Extension] [nvarchar](40) NULL,
	[FederationIdentifier] [nvarchar](512) NULL,
	[AboutMe] [nvarchar](1000) NULL,
	[CurrentStatus] [nvarchar](1000) NULL,
	[FullPhotoUrl] [nvarchar](1024) NULL,
	[SmallPhotoUrl] [nvarchar](1024) NULL,
	[DigestFrequency] [nvarchar](40) NULL,
	[DefaultGroupNotificationFrequency] [nvarchar](40) NULL,
	[Territory_ID__c] [nvarchar](25) NULL,
	[DB_Region__c] [nvarchar](255) NULL,
	[MSM_Email__c] [nvarchar](1300) NULL,
	[echosign_dev1__EchoSign_Email_Verified__c] [bit] NULL,
	[Regional_Director_RD__c] [nvarchar](18) NULL,
	[Manager_Name__c] [nvarchar](1300) NULL,
	[SRO__c] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SearchSelectedVsTypedLoader]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SearchSelectedVsTypedLoader](
	[selectedSearchTerm] [nvarchar](400) NULL,
	[typedTerm] [nvarchar](800) NULL,
	[PageViews] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CityName] [varchar](50) NULL,
	[StateAbbr] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SearchSelectedVsTypedLoader_All]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SearchSelectedVsTypedLoader_All](
	[selectedSearchTerm] [nvarchar](400) NULL,
	[typedTerm] [nvarchar](800) NULL,
	[ProfileID] [int] NULL,
	[PageViews] [int] NULL,
	[YMDID] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CityName] [varchar](50) NULL,
	[StateAbbr] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SearchSelectedVsTypedLoader_Rentals]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SearchSelectedVsTypedLoader_Rentals](
	[selectedSearchTerm] [nvarchar](50) NULL,
	[typedTerm] [nvarchar](200) NULL,
	[PageViews] [int] NULL,
	[TimePeriod] [nvarchar](33) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CityName] [varchar](50) NULL,
	[StateAbbr] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEOAPIKeywords]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOAPIKeywords](
	[RowNum] [bigint] NULL,
	[PageType] [varchar](25) NULL,
	[APITemplate] [varchar](8000) NULL,
	[Template] [varchar](8000) NULL,
	[TemplateType] [varchar](9) NOT NULL,
	[WordCount] [int] NULL,
	[TotalBytes] [int] NULL,
	[TotalWordCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEODevIndexable]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEODevIndexable](
	[RowNumber] [bigint] NULL,
	[URLid] [bigint] NULL,
	[url] [varchar](4000) NULL,
	[CityName] [varchar](8000) NULL,
	[StateName] [varchar](8000) NULL,
	[Neighborhood] [int] NULL,
	[ZipCode] [int] NULL,
	[LSOneRefCriteria] [int] NULL,
	[LSOneRefValue] [int] NULL,
	[LSTwoRefCriteria] [int] NULL,
	[LSTwoRefValue] [int] NULL,
	[PageType] [varchar](25) NULL,
	[PropertyType] [varchar](9) NOT NULL,
	[MilitaryCity] [nvarchar](50) NULL,
	[CollegeCity] [nvarchar](50) NULL,
	[RefinementCount] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Index [idx_URLid]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE CLUSTERED INDEX [idx_URLid] ON [Staging].[SEODevIndexable]
(
	[URLid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[SEOPageNameMap]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOPageNameMap](
	[EngineeringPageType] [varchar](25) NULL,
	[SEOTeamPageType] [varchar](20) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEOPageTemplates]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOPageTemplates](
	[PropertyType] [varchar](50) NULL,
	[PageType] [varchar](50) NULL,
	[IncludeinSEOPriorityScore] [varchar](50) NULL,
	[NumberofRefinements] [int] NULL,
	[ExampleURL] [varchar](255) NULL,
	[NamedPageType] [varchar](50) NULL,
	[Template1] [varchar](255) NULL,
	[Template2] [varchar](255) NULL,
	[Template3] [varchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEOParse]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOParse](
	[URLid] [bigint] NULL,
	[CityParse] [varchar](8000) NULL,
	[StateParse] [varchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEOPriorityScore]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOPriorityScore](
	[DateRange] [nvarchar](126) NULL,
	[URLid] [bigint] NULL,
	[URL] [varchar](4000) NULL,
	[PageType] [varchar](25) NULL,
	[CityName] [nvarchar](4000) NULL,
	[StateName] [varchar](8000) NULL,
	[Visits] [int] NOT NULL,
	[TotalLeadTagCount] [bigint] NOT NULL,
	[CurrentPercentTAM] [decimal](28, 16) NOT NULL,
	[CurrentAdverstiserCount] [varchar](max) NULL,
	[BilledRPP] [decimal](26, 13) NOT NULL,
	[Template1] [varchar](8000) NULL,
	[Template1SearchVolume] [float] NOT NULL,
	[Template2] [varchar](8000) NULL,
	[Template2SearchVolume] [float] NOT NULL,
	[Template3] [varchar](8000) NULL,
	[Template3SearchVolume] [float] NOT NULL,
	[AvgSearchVolume] [float] NOT NULL,
	[SEOPriorityScore] [float] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEOScoreAllMetrics]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOScoreAllMetrics](
	[DateRange] [nvarchar](126) NULL,
	[URLid] [bigint] NULL,
	[URL] [varchar](4000) NULL,
	[PageType] [varchar](25) NULL,
	[CityName] [nvarchar](4000) NULL,
	[StateName] [varchar](8000) NULL,
	[Visits] [int] NOT NULL,
	[TotalLeadTagCount] [bigint] NOT NULL,
	[CurrentPercentTAM] [decimal](28, 16) NOT NULL,
	[CurrentAdverstiserCount] [varchar](max) NULL,
	[BilledRPP] [decimal](26, 13) NOT NULL,
	[Template1] [varchar](8000) NULL,
	[Template1SearchVolume] [float] NOT NULL,
	[Template2] [varchar](8000) NULL,
	[Template2SearchVolume] [float] NOT NULL,
	[Template3] [varchar](8000) NULL,
	[Template3SearchVolume] [float] NOT NULL,
	[AvgSearchVolume] [float] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEOScoreInternalMetrics]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOScoreInternalMetrics](
	[DateRange] [nvarchar](126) NULL,
	[URLid] [bigint] NULL,
	[URL] [varchar](4000) NULL,
	[CityName] [nvarchar](4000) NULL,
	[StateName] [varchar](8000) NULL,
	[PropertyType] [varchar](9) NOT NULL,
	[PageType] [varchar](25) NULL,
	[Visits] [int] NOT NULL,
	[TotalLeadTagCount] [bigint] NOT NULL,
	[CurrentPercentTAM] [decimal](28, 16) NOT NULL,
	[CurrentAdverstiserCount] [varchar](max) NULL,
	[BilledRPP] [decimal](26, 13) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEOSearchVolume]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOSearchVolume](
	[DateLoaded] [datetime] NULL,
	[string] [varchar](max) NULL,
	[volume] [float] NULL,
	[NeedsUpdate] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEOSearchVolume_LastRun]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOSearchVolume_LastRun](
	[DateLoaded] [datetime] NULL,
	[string] [varchar](max) NULL,
	[volume] [float] NULL,
	[NeedsUpdate] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEOSearchVolume_Test]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOSearchVolume_Test](
	[DateLoaded] [datetime] NULL,
	[string] [varchar](max) NULL,
	[volume] [float] NULL,
	[NeedsUpdate] [bigint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Staging].[SEOUrlMetrics]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[SEOUrlMetrics](
	[YearMonth] [int] NULL,
	[URL] [varchar](500) NULL,
	[PageCategory] [varchar](30) NULL,
	[Path] [varchar](500) NULL,
	[CityName] [varchar](200) NULL,
	[StateName] [varchar](50) NULL,
	[Neighborhood] [varchar](200) NULL,
	[ZipCode] [varchar](30) NULL,
	[Visits] [int] NULL,
	[RefinementOne] [varchar](50) NULL,
	[RefinementOneType] [varchar](20) NULL,
	[RefinementOneCategory] [varchar](20) NULL,
	[RefinementTwo] [varchar](50) NULL,
	[RefinementTwoType] [varchar](20) NULL,
	[RefinementTwoCategory] [varchar](20) NULL,
	[EmailleadTagCount] [bigint] NULL,
	[PhoneLeadTagCount] [bigint] NULL,
	[TotalLeadTagCount] [bigint] NULL,
	[RefinementCount] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[URLToKeyword]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[URLToKeyword](
	[URLid] [bigint] NULL,
	[url] [varchar](4000) NULL,
	[PageType] [varchar](25) NULL,
	[Template1] [varchar](8000) NULL,
	[Template1WordCount] [int] NULL,
	[Template1Bytes] [int] NULL,
	[Template2] [varchar](8000) NULL,
	[Template2WordCount] [int] NULL,
	[Template2Bytes] [int] NULL,
	[Template3] [varchar](8000) NULL,
	[Template3WordCount] [int] NULL,
	[Template3Bytes] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[weblogsparsed]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[weblogsparsed](
	[lasthourprocessed] [varchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[XFactorMeasureType]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[XFactorMeasureType](
	[XFactorMeasureTypeID] [int] IDENTITY(1,1) NOT NULL,
	[profileid] [smallint] NOT NULL,
	[SubProfileID] [smallint] NOT NULL,
	[cg_n] [varchar](50) NOT NULL,
	[item_position] [varchar](50) NOT NULL,
	[sg_clicktype] [varchar](50) NOT NULL,
	[value_clickvalue] [varchar](50) NOT NULL,
	[dl] [varchar](25) NOT NULL,
	[HasListing] [varchar](5) NOT NULL,
	[CustomMeasureType] [varchar](50) NULL,
	[UseTagValue] [tinyint] NOT NULL,
	[ValueToUse] [varchar](50) NOT NULL,
	[dateadded] [datetime] NOT NULL,
	[comments] [varchar](200) NULL,
	[LastDateFired] [date] NULL,
	[TimesFired] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idxPageContent]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE CLUSTERED INDEX [idxPageContent] ON [Staging].[XFactorMeasureType]
(
	[profileid] ASC,
	[cg_n] ASC,
	[sg_clicktype] ASC,
	[item_position] ASC,
	[value_clickvalue] ASC,
	[dl] ASC,
	[HasListing] ASC,
	[UseTagValue] ASC,
	[CustomMeasureType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Table [Staging].[YardiRentCafeDateRange]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[YardiRentCafeDateRange](
	[BeginDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[ymdid] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[YardiRentCafeLead]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[YardiRentCafeLead](
	[LeadID] [bigint] NULL,
	[CustomerID] [nvarchar](2000) NULL,
	[UnitNumber] [bigint] NULL,
	[FirstName] [nvarchar](2000) NULL,
	[LastName] [nvarchar](2000) NULL,
	[AddressAll] [nvarchar](2000) NULL,
	[Address1] [nvarchar](2000) NULL,
	[Address2] [nvarchar](2000) NULL,
	[City] [nvarchar](2000) NULL,
	[State] [nvarchar](2000) NULL,
	[PostalCode] [nvarchar](2000) NULL,
	[Email] [nvarchar](2000) NULL,
	[Phone] [nvarchar](2000) NULL,
	[ScreeningResponse] [nvarchar](2000) NULL,
	[DateTime] [nvarchar](2000) NULL,
	[EstimatedMoveDate] [nvarchar](2000) NULL,
	[Message] [bigint] NULL,
	[VisitedProperty] [nvarchar](2000) NULL,
	[LeadData_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[YardiRentCafeLeadData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[YardiRentCafeLeadData](
	[LeadData_Id] [numeric](20, 0) NULL,
	[Screened] [int] NULL,
	[Unscreened] [int] NULL,
	[Property_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[YardiRentCafeManagement]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[YardiRentCafeManagement](
	[Management_Id] [numeric](20, 0) NULL,
	[Name] [nvarchar](2000) NULL,
	[PropertyCount] [bigint] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Staging].[YardiRentCafeproperty]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Staging].[YardiRentCafeproperty](
	[PropertyLoad_Id] [numeric](20, 0) NULL,
	[RDTId] [nvarchar](2000) NULL,
	[ILSId] [bigint] NULL,
	[Name] [nvarchar](2000) NULL,
	[UniqueSessions] [tinyint] NULL,
	[PageViews] [tinyint] NULL,
	[Management_Id] [numeric](20, 0) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [idx_ProfileID]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_ProfileID] ON [dbo].[DimensionAllProfiles]
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_parseid]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_parseid] ON [dbo].[ParsedData]
(
	[ParseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [P6IndexSpace]
GO
/****** Object:  Index [idx_profiled]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_profiled] ON [dbo].[ParsedData]
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [P6IndexSpace]
GO
/****** Object:  Index [idx_parseid]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_parseid] ON [dbo].[ParsedDataByHour_20160726_NoDups]
(
	[ParseID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [P6IndexSpace]
GO
/****** Object:  Index [idx_profiled]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_profiled] ON [dbo].[ParsedDataByHour_20160726_NoDups]
(
	[ProfileID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [P6IndexSpace]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [uidx_phoneNumber]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [uidx_phoneNumber] ON [dbo].[PhoneLookupLoader]
(
	[PhoneNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_profile1]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_profile1] ON [Fact].[WT_ActionConversion]
(
	[Profile1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_profile2]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_profile2] ON [Fact].[WT_ActionConversion]
(
	[Profile2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [idx_profile3]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_profile3] ON [Fact].[WT_ActionConversion]
(
	[Profile3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [idx_Startdate]    Script Date: 9/5/2017 7:21:06 AM ******/
CREATE NONCLUSTERED INDEX [idx_Startdate] ON [Staging].[APTGVisitsTrend]
(
	[StartDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[APTGRealPagePropertyManagementLookup] ADD  CONSTRAINT [DF_APTGRealPagePropertyManagementLookup_GuestCardActive]  DEFAULT ((1)) FOR [GuestCardActive]
GO
ALTER TABLE [dbo].[DimensionMeasureTypes] ADD  CONSTRAINT [DF_DimensionMeasureTypes_MeasureTypeName]  DEFAULT ('') FOR [MeasureTypeName]
GO
ALTER TABLE [dbo].[DimensionMeasureTypes] ADD  CONSTRAINT [DF__Dimension__Marte__67A95F59]  DEFAULT ((0)) FOR [IsExcluded]
GO
ALTER TABLE [dbo].[DimensionMeasureTypes] ADD  CONSTRAINT [DF_DimensionMeasureTypes_TimesFireLast2Weeks]  DEFAULT ((0)) FOR [TimesFiredIn2Weeks]
GO
ALTER TABLE [dbo].[DimensionMeasureTypes] ADD  CONSTRAINT [DF_DimensionMeasureTypes_DateAdded]  DEFAULT (getdate()) FOR [DateAdded]
GO
ALTER TABLE [dbo].[DimensionMeasureTypes] ADD  CONSTRAINT [DF_DimensionMeasureTypes_IsPageView]  DEFAULT ((1)) FOR [IsPageView]
GO
ALTER TABLE [dbo].[DimensionMeasureTypes] ADD  CONSTRAINT [DF_DimensionMeasureTypes_IsMultiTrack]  DEFAULT ((0)) FOR [IsMultiTrack]
GO
ALTER TABLE [dbo].[DimensionMeasureTypes] ADD  CONSTRAINT [DF_DimensionMeasureTypes_LastTimeFired]  DEFAULT (getdate()-(1)) FOR [LastTimeFired]
GO
ALTER TABLE [dbo].[DimensionMeasureTypes] ADD  CONSTRAINT [DF_DimensionMeasureTypes_IsMarted]  DEFAULT ((0)) FOR [IsMarted]
GO
ALTER TABLE [dbo].[DimensionProfiles] ADD  CONSTRAINT [DF_DimensionProfiles_YMDIDToMart]  DEFAULT (CONVERT([int],CONVERT([varchar](8),getdate()-(1),(112)),(0))) FOR [YMDIDToMart]
GO
ALTER TABLE [dbo].[InvalidDimensionMeasureTypes] ADD  CONSTRAINT [DF_InvalidDimensionMeasureTypes_IsMarted]  DEFAULT ((0)) FOR [IsMarted]
GO
ALTER TABLE [dbo].[ParsedData] ADD  DEFAULT ((0)) FOR [ProfileID]
GO
ALTER TABLE [dbo].[ParsedDataByHour] ADD  DEFAULT ((0)) FOR [ProfileID]
GO
ALTER TABLE [dbo].[ReportServerConversion] ADD  CONSTRAINT [DF_ReportServerConversion_ConvertInd]  DEFAULT ((0)) FOR [ConvertInd]
GO
ALTER TABLE [dbo].[ReportServerConversion] ADD  CONSTRAINT [DF_ReportServerConversion_Converted]  DEFAULT ((0)) FOR [Converted]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [AGGCToDate]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [AGGCThisYear]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [AGGCMonth]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [ATRToDate]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [ATRThisYear]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [ATRMonth]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [ATGRToDate]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [ATGRThisYear]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [ATGRMonth]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [ALOToDate]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [ALOThisYear]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport] ADD  DEFAULT ((0)) FOR [ALOMonth]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [AGGCToDate]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [AGGCThisYear]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [AGGCMonth]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [ATRToDate]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [ATRThisYear]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [ATRMonth]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [ATGRToDate]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [ATGRThisYear]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [ATGRMonth]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [ALOToDate]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [ALOThisYear]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [ALOMonth]
GO
ALTER TABLE [dbo].[StageAPTGVenterraPropertyXMLReport_Errors] ADD  DEFAULT ((0)) FOR [YMDIDFileLoaded]
GO
ALTER TABLE [dbo].[StageEFDaily] ADD  CONSTRAINT [DF_StageEFDaily_RenewedListing]  DEFAULT ((0)) FOR [RenewedListing]
GO
ALTER TABLE [dbo].[StageEFDaily] ADD  CONSTRAINT [DF_StageEFDaily_RenewedAdvertiserRev]  DEFAULT ((0)) FOR [RenewedAdvertiserRev]
GO
ALTER TABLE [dbo].[StageEFDaily] ADD  CONSTRAINT [DF_StageEFDaily_NewListing]  DEFAULT ((0)) FOR [NewListing]
GO
ALTER TABLE [dbo].[StageEFDaily] ADD  CONSTRAINT [DF_StageEFDaily_NewAdvertiserRevenue]  DEFAULT ((0)) FOR [NewAdvertiserRevenue]
GO
ALTER TABLE [dbo].[StageEFDaily_RentCom] ADD  CONSTRAINT [DF_StageEFDaily_RentCom_Impressions]  DEFAULT ((0)) FOR [Impressions]
GO
ALTER TABLE [dbo].[StageEFDaily_RentCom] ADD  CONSTRAINT [DF_StageEFDaily_RentCom_Clicks]  DEFAULT ((0)) FOR [Clicks]
GO
ALTER TABLE [dbo].[StageEFDaily_RentCom] ADD  CONSTRAINT [DF_StageEFDaily_RentCom_Avg Position]  DEFAULT ((0)) FOR [Avg Position]
GO
ALTER TABLE [dbo].[StageEFDaily_RentCom] ADD  CONSTRAINT [DF_StageEFDaily_RentCom_Cost w  Fees(ClickThru + ViewThru)]  DEFAULT ((0)) FOR [Cost w  Fees(ClickThru + ViewThru)]
GO
ALTER TABLE [dbo].[StageEFDaily_RentCom] ADD  CONSTRAINT [DF_StageEFDaily_RentCom_CostwFees(CT)]  DEFAULT ((0)) FOR [CostwFees(CT)]
GO
ALTER TABLE [dbo].[StageEFDaily_RentCom] ADD  CONSTRAINT [DF_StageEFDaily_RentCom_sp_Hotleads(CT)]  DEFAULT ((0)) FOR [sp_Hotleads(CT)]
GO
ALTER TABLE [dbo].[StageEFDaily_RentCom] ADD  CONSTRAINT [DF_StageEFDaily_RentCom_NEW Lease Revenue  (ClickThru + ViewThru)]  DEFAULT ((0)) FOR [NEW Lease Revenue  (ClickThru + ViewThru)]
GO
ALTER TABLE [dbo].[WebLogServers] ADD  CONSTRAINT [DF__WebLogSer__Serve__6B24EA82]  DEFAULT ((0)) FOR [ServerEnabled]
GO
ALTER TABLE [Fact].[HourlyWebLogFailure] ADD  CONSTRAINT [DF__HourlyWeb__Failu__2192707E]  DEFAULT (getdate()) FOR [FailureDateTime]
GO
ALTER TABLE [reports].[LogFilesBeingProcessed] ADD  DEFAULT ((0)) FOR [RunAsFlag]
GO
ALTER TABLE [reports].[ParsedDataBadData] ADD  DEFAULT (CONVERT([date],getdate(),(0))) FOR [dateadded]
GO
ALTER TABLE [reports].[WeblogFileLoad] ADD  DEFAULT ((1)) FOR [SSISRun]
GO
ALTER TABLE [reports].[WeblogFileLoad] ADD  DEFAULT ((0)) FOR [LinesProcessed]
GO
ALTER TABLE [reports].[WeblogFileLoad] ADD  DEFAULT (getdate()) FOR [TimeLogEntryMade]
GO
ALTER TABLE [Staging].[XFactorMeasureType] ADD  DEFAULT ('1990/01/01') FOR [LastDateFired]
GO
ALTER TABLE [Staging].[XFactorMeasureType] ADD  DEFAULT ((0)) FOR [TimesFired]
GO
/****** Object:  StoredProcedure [dbo].[CheckWebLogDataHourlyRunning]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[CheckWebLogDataHourlyRunning]
/******************************************************************************************
*
* Name: dbo.CheckWebLogDataHourlyRunning
*
* Desc:	dbo.CheckWebLogDataHourlyRunning
*
* Test:	EXEC dbo.CheckWebLogDataHourlyRunning
*
* Hist:	01	03/12/2015	Clinton Woody	Initial version to check if weblog processing still running
* Hist: 02	10/13/2016	Don Wert		Ticket 24428 remove line sending only to cwoody
******************************************************************************************/
AS 
SET NOCOUNT ON
BEGIN
    DECLARE @YMDID INT
       ,@PriorYMDID INT
       ,@job_success INT
       ,@SentEmail INT
       ,@recipientstxt VARCHAR(250)
       ,@messagetxt VARCHAR(1000)
       ,@subjecttxt VARCHAR(100)
       ,@cntit INT
       ,@JobName VARCHAR(64)
       ,@Job_ID VARCHAR(64)

    SET @recipientstxt = (
                          SELECT    EmailRecipients
                          FROM      DBAUtility.dbo.EMailRoles
                          WHERE     RoleObjectName = 'BiTeam'
                         );
            
    SET @YMDID = CAST(CONVERT(VARCHAR,GETDATE(),112) AS INT)

    SET @PriorYMDID = CAST(CONVERT(VARCHAR,GETDATE() - 1,112) AS INT)
    SET @SentEmail = 0
    SET @cntit = 0
    SET @job_success = 0
    
    SET @JobName = 'ApartmentGuide 1 - Import Dimension Listings'
    SET @JobName = 'X - Pull WebLog Data Hourly'
	-- (SELECT NAME FROM MSDB.dbo.sysjobs WHERE job_id = '1BD44204-D096-44A3-AAD0-0EFADC072271')
    SET @Job_ID = (
                   SELECT   Job_id
                   FROM     MSDB.dbo.sysjobs
                   WHERE    Name = @JobName
                  )
    --PRINT @Job_ID;
    PRINT 'Checking Job ' + @jobname;
    WHILE EXISTS ( SELECT   job.name
                           ,job.job_id
                           ,job.originating_server
                           ,activity.run_requested_date
                           ,DATEDIFF(SECOND,activity.run_requested_date,GETDATE()) AS Elapsed
                   FROM     msdb.dbo.sysjobs_view job
                   JOIN     msdb.dbo.sysjobactivity activity
                            ON job.job_id = activity.job_id
                   JOIN     msdb.dbo.syssessions sess
                            ON sess.session_id = activity.session_id
                   JOIN     (
                             SELECT MAX(agent_start_date) AS max_agent_start_date
                             FROM   msdb.dbo.syssessions
                            ) sess_max
                            ON sess.agent_start_date = sess_max.max_agent_start_date
                   WHERE    run_requested_date IS NOT NULL
                            AND stop_execution_date IS NULL
                            AND job.job_id = @Job_ID --'7616F8FC-3709-46E0-B0A6-DED424D647EE'
) 
        BEGIN
            SET @cntit = @cntit + 1
            IF @cntit = 1 
                PRINT 'Hourly Web Log Running. First Pass';
            IF @cntit > 15
                AND @SentEmail = 0 
                BEGIN
                    SET @cntit = 0
                    SET @SentEmail = 1
                    SET @subjecttxt = '*** Before Midnight [' + @JobName + '] Not Completed!!!'
                    SET @messagetxt = @JobName + ' Not Completed!!!'
                    PRINT @messagetxt
                    IF DATEPART(dw,GETDATE()) = 7 -- Saturday 
                        OR DATEPART(dw,GETDATE()) = 1 -- Sunday
                        OR DATEPART(hh,GETDATE()) NOT BETWEEN 7 AND 16
                        OR RIGHT(CONVERT(VARCHAR(8),GETDATE(),112),4) IN ('1224','1225','0101') 
                        BEGIN
                            SET @RecipientsTxt = @RecipientsTxt + ';' + (
                                                                         SELECT EmailRecipients
                                                                         FROM   DBAUtility.dbo.EMailRoles
                                                                         WHERE  RoleObjectName = 'uspDailyJobReportAfterHours'
                                                                        )
                        END
			
                    IF @RecipientsTxt <> '' 
                        BEGIN
                            EXEC msdb.dbo.sp_send_dbmail 
                                @recipients = @RecipientsTxt
                               ,@body = @messagetxt
                               ,@body_format = 'TEXT'
                               ,@importance = 'High'
                               ,@subject = @subjecttxt;
                        END
                END
        END

    IF @SentEmail = 1  -- send Dimension build finished
        BEGIN
            SET @subjecttxt = @JobName + ' Completed Successfully'
            SET @messagetxt = @JobName + ' Completed Successfully'
            PRINT @messagetxt
            IF @RecipientsTxt <> '' 
                BEGIN
                    EXEC msdb.dbo.sp_send_dbmail 
                        @recipients = @RecipientsTxt
                       ,@body = @messagetxt
                       ,@body_format = 'TEXT'
                       ,@importance = 'Normal'
                       ,@subject = @subjecttxt;
                END
        END
    ELSE 
        PRINT @jobName + ' Not running';
END
SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [dbo].[pr_ArchiveStagedParsedDataByMonth]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[pr_ArchiveStagedParsedDataByMonth] (@DaysOld INT = 40)
/*****************************************************************
* HIST 00: Written by Clinton Woody 04/07/2011
* HIST 01: Written by Clinton Woody 04/12/2011 fixed missing space NT # 4426
* HIST 02: Written by Clinton Woody 04/12/2011 ensure we don't write into staging.dbo.archivedparseddata multiple times for same day NT # 4491
* HIST 03: Clinton Woody 04/19/2011 moved spanish,selectapartmentguide,shoprentals,development to partitions numera # 4511
* HIST 04: Clinton Woody 04/20/2011 moved rentlist,newhomeguide,APTGTesting,Rentals to partitions numera # 4526
* HIST 05: Clinton Woody 04/21/2011 fixed newhomeguide partition sp call.
* HIST 06: Clinton Woody 05/01/2011 fixed RentalHouses Partitioning numera # 4645
* HIST 07: Clinton Woody 05/01/2011 added moving ProfileID 99 to MovingToday ParsedDataClone for analysis purposes
* HIST 08: Clinton Woody 06/15/2011 Update ProfileID for MovingToday ParsedDataClone for Movingtoday=50 and Mobile APTG=51 numera # 5330
* HIST 09: Clinton Woody 06/16/2011 Update ProfileID for MovingToday ParsedDataClone for Mobile Rentals=52 numera # 5351
* HIST 10: Clinton Woody 06/19/2011 Renamed MovingToday ndd  ParsedDataClone to AutoTagging/WebParsedeData numera # 5377
* HIST 11: Clinton Woody 06/19/2011 Renamed dbo.pr_CheckCreatePartiions to dbo.pr_CheckCreatePartitions  numera # 5466
* Hist 12:	08/14/2011	Clinton Woody		coded for moving Archived Data Numera # 6018
											once the tables have been moved just need to uncommnet new code and comment out old code
* Hist 13:	08/19/2011	Clinton Woody		moving auto tagging out of here into 1st job Data Numera # 6179
*  Moves Web Log Parsed Data to Archive
* Hist 14:	08/21/2011	Clinton Woody		only archives to staging.archiveparseddata now # 6179
* Hist 15:	01/05/2012	Clinton Woody		checks for new column SubProcessID, if so adds it to Archive # 7623
* Hist 16:	03/05/2012	Clinton Woody		reactivated job on USNORTBI to pull parsed data
* Hist 17:  02/25/2013  John Cox            Added new version of logging
* Hist 18:	03/04/2013	Clinton Woody		removed reference to webparseddata 11805
* Hist 19:  04/16/2013  John Brennan		changed to point to new ArchivedStaging DB   
* Hist 20:  11/18/2013  Clinton Woody		changed auto firing Usnortbi Job so as not to conflict between warehouse01 and warehosueclu01
* Hist 21:  01/22/2014  John Brennan		removed reference to defunct server USNORTBI
* exec [dbo].[pr_ArchiveStagedParsedDataByMonth]
*  Uses Individual Databases for Product Lines by Month NT# 4380
SELECT name,size/128.0 AS SizeOf ,size/128.0 - CAST(FILEPROPERTY(name, 'SpaceUsed') AS int)/128.0 AS AvailableSpaceInMB
FROM sys.database_files;
******************************************************************/
AS 
SET NOCOUNT ON

BEGIN

    DECLARE @DatabaseName VARCHAR(128)
    SET @DatabaseName = DB_NAME()

    DECLARE @YMDID INT
       ,@YMDIDToDelete INT
       ,@YMStrToUse VARCHAR(6)
    DECLARE @YMStr VARCHAR(6)
    DECLARE @YMDStr VARCHAR(8)
    DECLARE @LogicalFileName SYSNAME
    DECLARE @RowsAffected INT
       ,@StrSQL VARCHAR(4000)
    DECLARE @FailString VARCHAR(2000)
    DECLARE @FailFlag INT

    SET @FailFlag = 0
    SET @FailString = ''
    SET @YMDID = (
                  SELECT DISTINCT
                            YMDID
                  FROM      [dbo].[ParsedData]
                 )
-- use this to create table for current month	
    SET @YMStr = CONVERT(VARCHAR(6),GETDATE(),112)
    SET @YMDStr = CONVERT(VARCHAR(8),GETDATE() + 10,112)  -- change to create new partitions 10 days before next month
    SET @YMDStr = LEFT(@YMDStr,6) + '01'
    SET @YMStrToUse = LEFT(CAST(@YMDID AS VARCHAR),6)
--print @YMDID
--Print @YMStr
--print @YMStrToUse	
--Print @YMDStr
--set @YMStrToUse='201105'
    DECLARE @LastDateTime DATETIME;
    DECLARE @StartDateTime DATETIME;
    DECLARE @SecondsStr VARCHAR(300)
    DECLARE @TotalSecondsStr VARCHAR(300)

    SET @lastdateTime = GETDATE();
    SET @StartdateTime = GETDATE();	

    EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
        @DatabaseName
       ,'pr_ArchiveStagedParsedDataByMonth'
       ,'START'
       ,'0 Seconds'
       ,0
       ,'Starting';

    SET @lastdateTime = GETDATE();

    SET @YMDIDToDelete = CAST(CONVERT(VARCHAR(8),GETDATE() - @DaysOld,112) AS INT)
	
-- Patch to prevent loading data mulitple times into ArchivedParsedData
    SET @RowsAffected = 1

    IF EXISTS ( SELECT TOP 1
                        parseid
                FROM    [ArchivedStaging].[dbo].[ArchivedParsedData]
                WHERE   ymdid = @ymdid ) 
        BEGIN
            WHILE @RowsAffected > 0 
                BEGIN
                    DELETE TOP (50000)
                    FROM    [ArchivedStaging].[dbo].[ArchivedParsedData]
                    WHERE   YMDID = @YMDID
			
                    SET @RowsAffected = @@ROWCOUNT
                END
        END
	-- End new delete in batches code
-- in case no time elapased wait 1 millisecond	
    WAITFOR DELAY '00:00:01'
	
    SET @SecondsStr = CAST(DATEDIFF(ss,@lastdatetime,GETDATE()) AS VARCHAR(300)) + ' Seconds';
    EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
        @DatabaseName
       ,'pr_ArchiveStagedParsedDataByMonth'
       ,'DeletePreArch'
       ,@SecondsStr
       ,0
       ,'End Delete Pre Archived Data'
    SET @lastdateTime = GETDATE();

    BEGIN TRY
        BEGIN TRANSACTION

        INSERT  INTO [ArchivedStaging].[dbo].[ArchivedParsedData]
                ([ParseID]
                ,[ProfileID]
                ,[YMDID]
                ,[EventDate]
                ,[MeasureType]
                ,[Measure]
                ,SubProfileID)
                SELECT  [ParseID]
                       ,[ProfileID]
                       ,[YMDID]
                       ,[EventDate]
                       ,[MeasureType]
                       ,[Measure]
                       ,SubProfileID
                FROM    [dbo].[ParsedData] WITH (NOLOCK)
                ORDER BY YMDID
                       ,ProfileID
                       ,ParseID
        COMMIT TRANSACTION
    END TRY		 
    BEGIN CATCH
        ROLLBACK TRANSACTION
        SET @FailFlag = 1
    END CATCH

    doneit:

    SET @SecondsStr = CAST(DATEDIFF(ss,@lastdatetime,GETDATE()) AS VARCHAR(300)) + ' Seconds';
    EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
        @DatabaseName
       ,'pr_ArchiveStagedParsedDataByMonth'
       ,'ArchiveAll'
       ,@SecondsStr
       ,0
       ,'End Archive All'
    SET @lastdateTime = GETDATE();

-- wait a second so this shows as last step
    WAITFOR DELAY '00:00:01'

    SET @SecondsStr = CAST(DATEDIFF(ss,@lastdatetime,GETDATE()) AS VARCHAR(300)) + ' Seconds';
    SET @TotalSecondsStr = 'Final Step, ' + CAST(DATEDIFF(ss,@Startdatetime,GETDATE()) AS VARCHAR(300)) + ' Total Seconds';
    EXEC dbautility.dbo.[pr_Logging_StoredProcs] 
        @DatabaseName
       ,'pr_ArchiveStagedParsedDataByMonth'
       ,'EndArchive'
       ,@SecondsStr
       ,0
       ,@TotalSecondsStr

    DECLARE @RecipientsTxt VARCHAR(500)
    SET @recipientsTxt = (
                          SELECT    emailrecipients
                          FROM      dbautility.dbo.emailroles
                          WHERE     roleobjectname = 'BITeam'
                         )
    IF @FailFlag = 1 
        BEGIN
            EXEC msdb.dbo.sp_send_dbmail 
                @recipients = 'cwoody@primedia.com'
               ,@subject = 'Archive ParsedData Failures'
               ,@body = @FailString
               ,@importance = 'High'
               ,@body_format = 'TEXT'
        END	
   
   
   
   --- JMB 01/22/15 
   --   Commented routine as USNORTBI is being de-commissioned 
    -- JMB 12/25/2012 -- uncommented (again).. 
	-- when re-enabling .. check data to backfill as needed
-- if this fails then it is being run by the other server
--    BEGIN TRY
---- this will test to see if the job has already started today    
--        IF (
--            SELECT  MAX(start_execution_date)
--            FROM    USNORTBI.msdb.dbo.sysjobactivity
--            WHERE   job_id = '74BD7ED2-9FB9-4F1A-9B6F-F61C4AF434EE'
--           ) < CAST(GETDATE() AS DATE) 
--            BEGIN
--                PRINT 'Starting Job'
--                EXEC USNORTBI.msdb.dbo.sp_start_job 
--                    @job_id = '74BD7ED2-9FB9-4F1A-9B6F-F61C4AF434EE'
--            END
--        ELSE 
--            PRINT 'Job Already Started'

--    END TRY
--    BEGIN CATCH
--    END CATCH

END


GO
/****** Object:  StoredProcedure [dbo].[pr_DeleteCreateMonsterReportTables]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
*
* Name:	pr_DropCreateMonsterReportTables
*
* Desc:	Used for Tracy Dodd Group Monster Report
*		drops or creates temp tables for processing
*
* Test:	exec dbo.pr_DeleteCreateMonsterReportTables null
* Test:	exec dbo.pr_DeleteCreateMonsterReportTables '2010/05/01'
*
* Note:
*
* Tables: StageLeadsByCampaignShort
* Hist:	01	05/14/2010	Clinton Woody		Initial Version
* Hist:	02	05/21/2010	Clinton Woody		Renamed and moved tables to ApartmentGuide.com
* Hist:	03	06/24/2010	Clinton Woody		Created Staging Tables for All Feeds	
*			this is required for remarting concerns and reliability of 3rd party feeds
* Hist:	04	08/26/2010	Clinton Woody		Changed Marchex Staging Table to be Call Detail
* Hist:	05	09/14/2010	Clinton Woody		Added SuperPages
*
* select ymdid,count(1) as items from [ApartmentGuide].fact.[CampaignLeadsShort]
	group by ymdid order by ymdid desc;

* truncate table [ApartmentGuide].[Fact].[BKVImportDaily]	
* select * from [ApartmentGuide].[Fact].[BKVImportDaily]
* update [ApartmentGuide].[Fact].[BKVImportDaily] set ymdid=cast(convert(varchar(8),DateOF,112) as int)

* select * from [Corporate].[Fact].[EFDaily]
 update [ApartmentGuide].[Fact].[MarchexImportDaily] set ymdid=cast(convert(varchar(8),dateof,112) as int)
* truncate table [ApartmentGuide].[Fact].[MarchexImportDaily]
* select * from [ApartmentGuide].[Fact].[MarchexImportDaily]
* update [ApartmentGuide].[Fact].[MarchexImportDaily] set ymdid=cast(convert(varchar(8),DateOF,112) as int)
* execute from command prompt
dtexec /f "c:\woody\IntegrationServices\WT AutoGuide\WT AutoGuide\APTGMonsterReport (1).dtsx"
 /Set "\Package.Variables[User::DateToProcess].Properties[Value]";"2010/01/01"'
select * from apartmentguide.Reports.DailyMonsterSEMNew
select * from Staging.[dbo].[StageCampaignLeadsShort]

******************************************************************************************/
CREATE PROCEDURE [dbo].[pr_DeleteCreateMonsterReportTables]
AS
BEGIN
	SET NOCOUNT ON;
--DROP TABLE apartmentguide.fact.LeadsByCampaignShort

	if NOT EXISTS(SELECT name FROM staging.sys.sysobjects WHERE name = 'StageCampaignLeadsShort')
	begin
		CREATE TABLE [Staging].[dbo].[StageCampaignLeadsShort](
			[YMDDate] DATETIME,
			[MediaSource] [ntext] COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[Visits] [int] NULL,
			[PageViews] [int] NULL,
			[Clickthroughs] [int] NULL,
			[NumberOfLeads] [int] NULL,
			[Partner] [ntext] null
		) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
	END
	
	TRUNCATE TABLE [Staging].dbo.[StageCampaignLeadsShort]
	
	if NOT EXISTS(SELECT name FROM apartmentguide.sys.sysobjects WHERE name = 'CampaignLeadsShort')
	begin
		CREATE TABLE [ApartmentGuide].fact.[CampaignLeadsShort](
			[YMDID] [int],
			[YMDDate] DATETIME,
			[MediaSource] [varchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[Visits] [int] NULL,
			[PageViews] [int] NULL,
			[Clickthroughs] [int] NULL,
			[NumberOfLeads] [int] NULL
		) ON [PRIMARY] 

		CREATE CLUSTERED INDEX [cuidx_CampaignLeadsShort_YMDID] ON [ApartmentGuide].[Fact].[CampaignLeadsShort] 
		(
			[YMDID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

	END
	
/****** Object:  Table [Fact].[BKVImportDaily]    Script Date: 05/24/2010 11:40:29 ******/
	IF Not  EXISTS (SELECT name FROM staging.sys.sysobjects WHERE name = 'StageBKVImportDaily')
	BEGIN
-- drop table [Staging].[DBO].[StageBKVImportDaily]
		CREATE TABLE [Staging].[DBO].[StageBKVImportDaily](
			[DateOf] [datetime] NULL,
			[MediaSource] [nvarchar](125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[Gross Cost] [numeric](17, 2) NULL,
			[Impressions] [bigint] NULL,
			[Visits] [bigint] NULL,
			[CostPerVisit] [numeric](17, 2) NULL,
			[VendorClicks] [int] NULL,
			[Webleads] [int] NULL,
			[TotalPaidLeadsAfterRatio] [int] NULL
		) ON [PRIMARY]
	END
	
	TRUNCATE TABLE 	[Staging].[DBO].[StageBKVImportDaily]
	
/****** Object:  Table [Fact].[BKVImportDaily]    Script Date: 05/24/2010 11:40:29 ******/
	IF Not  EXISTS (SELECT name FROM apartmentguide.sys.sysobjects WHERE name = 'BKVImportDaily')
	BEGIN

		CREATE TABLE [ApartmentGuide].[Fact].[BKVImportDaily](
			[YMDID] INT NOT NULL,
			[DateOf] [datetime] NULL,
			[MediaSource] [nvarchar](125) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[Gross Cost] [numeric](17, 2) NULL,
			[Impressions] [bigint] NULL,
			[Visits] [bigint] NULL,
			[CostPerVisit] [numeric](17, 2) NULL,
			[VendorClicks] [int] NULL,
			[Webleads] [int] NULL,
			[TotalPaidLeadsAfterRatio] [int] NULL
		) ON [PRIMARY]

		CREATE CLUSTERED INDEX [cuidx_BKVImportDaily_YMDID] ON [ApartmentGuide].[Fact].[BKVImportDaily] 
		(
			[YMDID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

	END

	IF Not  EXISTS (SELECT name FROM staging.sys.sysobjects WHERE name = 'StageMarchexCallDetail')
	BEGIN
		CREATE TABLE [dbo].[StageMarchexCallDetail](
			[DateOf] [datetime] NULL,
			[YMDID] [int] NULL,
			[id] [varchar](50) NULL,
			[start_time] [datetime] NULL,
			[billable] [varchar](50) NULL,
			[fraud_rule] [varchar](50) NULL,
			[external_id] [varchar](50) NULL,
			[listing_city] [varchar](50) NULL,
			[listing_state] [varchar](50) NULL,
			[listing_zip] [varchar](50) NULL,
			[market_code] [varchar](50) NULL,
			[tracking_phone] [varchar](50) NULL,
			[destination_phone] [varchar](50) NULL,
			[publisher_name] [varchar](50) NULL
		) ON [PRIMARY]
	END

	Truncate Table [Staging].[dbo].[StageMarchexCallDetail]

--	IF Not  EXISTS (SELECT name FROM apartmentguide.sys.sysobjects WHERE name = 'MarchexImportDaily')
--	BEGIN
---- drop table [ApartmentGuide].[Fact].[MarchexImportDaily]	
--		CREATE TABLE [ApartmentGuide].[Fact].[MarchexImportDaily](
--			[YMDID] INT NOT NULL,
--			[DateOf] DATETIME,
--			BillableCalls int
--		) ON [PRIMARY]

--		CREATE CLUSTERED INDEX [cuidx_MarchexImportDaily_YMDID] ON [ApartmentGuide].[Fact].[MarchexImportDaily] 
--		(
--			[YMDID] ASC
--		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

--	END

	IF Not  EXISTS (SELECT name FROM apartmentguide.sys.sysobjects WHERE name = 'MarchexCallDetail')
	BEGIN
-- drop table [ApartmentGuide].[Fact].[MarchexImportDaily]	
		CREATE TABLE ApartmentGuide.[Fact].[MarchexCallDetail](
			[DateOf] [datetime] NULL,
			[YMDID] [int] NULL,
			[id] [varchar](50) NULL,
			[start_time] [datetime] NULL,
			[billable] [tinyint] NULL,
			[fraud_rule] [tinyint] NULL,
			[Listing_id] [varchar](50) NULL,
			[listing_city] [varchar](50) NULL,
			[listing_state] [varchar](50) NULL,
			[listing_zip] [varchar](50) NULL,
			[market_code] [varchar](50) NULL,
			[tracking_phone] [varchar](10) NULL,
			[destination_phone] [varchar](10) NULL,
			[publisher_name] [varchar](50) NULL
		) ON [PRIMARY]

		CREATE CLUSTERED INDEX [cuidx_MarchexCallDetail_YMDID] ON [ApartmentGuide].[Fact].[MarchexCallDetail] 
		(
			[YMDID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

	END
/****** Object:  Table [Fact].[EFDailyImport]    Script Date: 05/24/2010 12:28:57 ******/
	IF Not  EXISTS (SELECT name FROM staging.sys.sysobjects WHERE name = 'StageEFDaily')
	BEGIN
	
		CREATE TABLE Staging.[dbo].[StageEFDaily](
			[Portfolio] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[MediaSource] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[YMDID] [int] NULL,
			[DateOf] [datetime] NULL,
			[Impressions] [int] NULL,
			[Clicks] [int] NULL,
			[CTR] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[CostwEFFees] [numeric](17, 2) NULL,
			[CPC] [numeric](17, 2) NULL,
			[CPCwEFFees] [numeric](17, 2) NULL,
			[AvgPosition] [numeric](17, 2) NULL,
			[Lead] [int] NULL,
			[CPL] [numeric](17, 2) NULL,
			[CPLwEFFees] [numeric](17, 2) NULL,
			[RenewedListing] [numeric](17, 2) NULL,
			[RenewedAdvertiserRev] [numeric](17, 2) NULL,
			[NewListing] [numeric](17, 2) NULL,
			[NewAdvertiserRevenue] [numeric](17, 2) NULL,
			[FacebookCostwEFFees] numeric(17,2),
			[DisplayCostwEFFees] numeric(17,2)
		) ON [PRIMARY]

	END
	
	TRUNCATE TABLE Staging.[dbo].[StageEFDaily]
	
	IF Not  EXISTS (SELECT name FROM corporate.sys.sysobjects WHERE name = 'EFDaily')
	BEGIN
	
		CREATE TABLE corporate.[fact].[EFDaily](
			[Portfolio] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[MediaSource] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[YMDID] [int] NULL,
			[DateOf] [datetime] NULL,
			[Impressions] [int] NULL,
			[Clicks] [int] NULL,
			[CTR] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[CostwEFFees] [numeric](17, 2) NULL,
			[CPC] [numeric](17, 2) NULL,
			[CPCwEFFees] [numeric](17, 2) NULL,
			[AvgPosition] [numeric](17, 2) NULL,
			[Lead] [int] NULL,
			[CPL] [numeric](17, 2) NULL,
			[CPLwEFFees] [numeric](17, 2) NULL,
			[RenewedListing] [numeric](17, 2) NULL,
			[RenewedAdvertiserRev] [numeric](17, 2) NULL,
			[NewListing] [numeric](17, 2) NULL,
			[NewAdvertiserRevenue] [numeric](17, 2) NULL
		) ON [PRIMARY]

		CREATE CLUSTERED INDEX [cuidx_EFDaily_YMDID] ON corporate.[fact].[EFDaily] 
		(
			[YMDID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	END
	
	Truncate Table staging.dbo.StageRentalsLeadSubTypebyCampaignID
	
	IF Not  EXISTS (SELECT name FROM staging.sys.sysobjects WHERE name = 'StageSuperPages')
	BEGIN
	
		CREATE TABLE staging.[dbo].[StageSuperPages](
			[Date] [datetime] NULL,
			[CampaignID] [varchar](50) NULL,
			[AdName] [varchar](50) NULL,
			[Headline] [varchar](50) NULL,
			[AllImp] [varchar](50) NULL,
			[Clicks] [varchar](50) NULL,
			[CTR] [varchar](50) NULL,
			[Avg MaxPrice] [varchar](50) NULL,
			[AvgCPC] [varchar](50) NULL,
			[Cost] [varchar](50) NULL,
			[AvgImpPos] [varchar](50) NULL,
			[DisplayURL] [varchar](500) NULL,
			[DestinationURL] [varchar](500) NULL,
			[Description] [varchar](100) NULL,
			[Status] [varchar](50) NULL,
			[YMDID] [int] NULL
		) ON [PRIMARY]

	END

	IF Not  EXISTS (SELECT name FROM apartmentguide.sys.sysobjects WHERE name = 'SuperPages')
	BEGIN
	
		CREATE TABLE ApartmentGuide.[fact].[SuperPages](
			[YMDID] [int] NOT NULL,
			[DateOf] [datetime] NULL,
			[CampaignID] [varchar](50) NULL,
			[AdName] [varchar](50) NULL,
			[Headline] [varchar](50) NULL,
			[AllImp] int NULL,
			[Clicks] int NULL,
			[CTR] [varchar](50) NULL,
			[AvgMaxPrice] [varchar](50) NULL,
			[AvgCPC] [varchar](50) NULL,
			[Cost] [varchar](50) NULL,
			[AvgImpPos] [varchar](50) NULL,
			[DisplayURL] [varchar](500) NULL,
			[DestinationURL] [varchar](500) NULL,
			[Description] [varchar](100) NULL,
			[Status] [varchar](50) NULL,
		) ON [PRIMARY]

		CREATE CLUSTERED INDEX [cuidx_SuperPages_YMDID] ON ApartmentGuide.[fact].[SuperPages] 
		(
			[YMDID] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	END
	
	Truncate Table staging.dbo.StageSuperpages

END	

GO
/****** Object:  StoredProcedure [dbo].[pr_DeleteCreateParsedDataTable]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/**********************************************
* Hist 01:	Clinton Woody	2010/11/29	Removed Drop and replaced with truncate because of 
*			using Source Control
*
* Hist 01:	Clinton Woody	2011/01/12	Added dropping of an index and I don't khow where it came from
* Hist 02:	Clinton Woody	2012/01/04	Changed ParseID from int to bigint for new weblog parseing # 7623
**********************************************/
CREATE Procedure [dbo].[pr_DeleteCreateParsedDataTable] 
		
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN Try
		Truncate Table Staging.[dbo].[ParsedData] ;
	END TRY
	BEGIN CATCH
	END CATCH	
	
	BEGIN TRY
		Drop INDEX [idx#ParseID] ON staging.[dbo].[ParsedData];
	END TRY
	BEGIN CATCH
	END Catch

	BEGIN TRY
		CREATE TABLE Staging.[dbo].[ParsedData](
			[ParseID] [Bigint] not null,
			[ProfileID] [int] not null default 0,
			[YMDID] [int] NOT NULL,
			[EventDate] [datetime] NOT NULL,
			[MeasureType] [varchar](50) NOT NULL,
			[Measure] [varchar] (7000) not null
		) ON [PRIMARY];
	END TRY
	BEGIN CATCH
	END CATCH

	BEGIN TRY
		ALTER TABLE dbo.ParsedData
		ALTER COLUMN ParseID BIGINT;
	END TRY
	BEGIN CATCH	
	END CATCH	

	BEGIN TRY
		DROP INDEX [cidx_profiled] ON [dbo].[ParsedData];
	END TRY
	BEGIN CATCH
	END Catch

	BEGIN TRY
		Drop INDEX [idx#MeasureType] ON staging.[dbo].[ParsedData];
	END TRY
	BEGIN CATCH
	END Catch

	BEGIN TRY
		Drop INDEX [idx#ParseID] ON staging.[dbo].[ParsedData];
	END TRY
	BEGIN CATCH
	END Catch
-- this cropped up somewhere???
	BEGIN TRY
		Drop INDEX [ParseID] ON staging.[dbo].[ParsedData];
	END TRY
	BEGIN CATCH
	END Catch

END	

GO
/****** Object:  StoredProcedure [dbo].[pr_DropCreateStageAPTGRealPageGCTables]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
*
* Name:	pr_DropCreateStageAPTGRealPageGCTables
*
* Desc:	Drops and Recreates Tables Used In XML Lead Data Loads
*
* Test:	exec dbo.pr_DropCreateStageAPTGRealPageGCTables
*
* Note:
*
* Hist:	01	06/26/2008	Clinton Woody		Initial Version
* Hist:	02	10/08/2010	Clinton Woody		Changed Property Name size to 100
*
******************************************************************************************/
CREATE PROCEDURE [dbo].[pr_DropCreateStageAPTGRealPageGCTables]
AS
BEGIN
	SET NOCOUNT ON;
	
-- this is actually the parameters table, converted into the RequestEcho table
	if exists (select 1 from information_schema.tables
	where table_name='StageAPTGRealPageGCRequestEcho' and table_type='Base Table')
		drop table dbo.StageAPTGRealPageGCRequestEcho

	create table dbo.StageAPTGRealPageGCRequestEcho
	(
	RealPageCompanyID int,
	YMDID int
	)

	if exists (select 1 from information_schema.tables
	where table_name='StageAPTGRealPageGCProperty' and table_type='Base Table')
		drop table dbo.StageAPTGRealPageGCProperty

	create table dbo.StageAPTGRealPageGCProperty
	(
	RealPageCompanyID int
	,PropertyID nvarchar(10)  -- internal id
	,PropertyName nvarchar(125)
	,XMLProperty_ID int
	)

	if exists (select 1 from information_schema.tables
	where table_name='StageAPTGRealPageGCContactTypeCount' and table_type='Base Table')
		drop table dbo.StageAPTGRealPageGCContactTypeCount

	create table dbo.StageAPTGRealPageGCContactTypeCount
	(	RealPageCompanyID int,
	ContactName nvarchar(50),
	ContactID nvarchar(10),
	Count int,
	XMLProperty_ID nvarchar(10)
	)
	
-- This is the final base table used to post data to ApartmentGuide

	if exists (select 1 from information_schema.tables
	where table_name='StageAPTGRealPageGCReport' and table_type='Base Table')
		drop table  dbo.StageAPTGRealPageGCReport

	create table dbo.StageAPTGRealPageGCReport
	(YMDID int,
	RealPageCompanyID int,
	ExternalPropertyID VARCHAR(20),
	ApartmentGuidePropertyID int,
	ApartmentGuidePropertyName varchar(100),
	RealPagePropertyName varchar(125),
	RealPagePropertyContactName varchar(50),
	ContactCount int
	)

END

GO
/****** Object:  StoredProcedure [dbo].[pr_DropCreateStageAPTGVenterraXML]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec pr_DropCreateStageAPTGVenterraXML
-- Hist 01: Clinton Woody  2008/06/24
--   check for table [] and recreate if it does not exists
CREATE PROCEDURE [dbo].[pr_DropCreateStageAPTGVenterraXML]
AS
SET NOCOUNT ON
if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraProperty' and table_type='Base Table' and
  table_schema='dbo')
	drop table [dbo].[StageAPTGVenterraProperty]
if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraTotalRequests' and table_type='Base Table' and
  table_schema='dbo')
	drop table [dbo].[StageAPTGVenterraTotalRequests]
if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraTotalGuideRequests' and table_type='Base Table' and
  table_schema='dbo')
	drop table [dbo].[StageAPTGVenterraTotalGuideRequests]
if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraGuestCards' and table_type='Base Table' and
  table_schema='dbo')
	drop table [dbo].[StageAPTGVenterraGuestCards]
if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraLeasesFromOnlineSources' and table_type='Base Table' and
  table_schema='dbo')
	drop table [dbo].[StageAPTGVenterraLeasesFromOnlineSources]

if not exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraPropertyComplete' and table_type='Base Table' and
  table_schema='dbo')
BEGIN
	CREATE TABLE [dbo].[StageAPTGVenterraPropertyComplete](
		[PropertyID] [int] NOT NULL,
		[CurrentMonthDate] [datetime] NOT NULL,
		[ThisMonthYMDID] [int] NOT NULL,
		[LastMonthDate] [datetime] NOT NULL,
		[LastMonthYMDID] [int] NOT NULL,
		[ThisMonthDate] [varchar](6) NOT NULL,
		[AGGCToDate] [int] NOT NULL DEFAULT ((0)),
		[AGGCThisYear] [int] NOT NULL DEFAULT ((0)),
		[AGGCLastMonth] [int] NOT NULL DEFAULT ((0)),
		[AGGCThisMonth] [int] NOT NULL DEFAULT ((0)),
		[ATRToDate] [int] NOT NULL DEFAULT ((0)),
		[ATRThisYear] [int] NOT NULL DEFAULT ((0)),
		[ATRLastMonth] [int] NOT NULL DEFAULT ((0)),
		[ATRThisMonth] [int] NOT NULL DEFAULT ((0)),
		[ATGRToDate] [int] NOT NULL DEFAULT ((0)),
		[ATGRThisYear] [int] NOT NULL DEFAULT ((0)),
		[ATGRLastMonth] [int] NOT NULL DEFAULT ((0)),
		[ATGRThisMonth] [int] NOT NULL DEFAULT ((0)),
		[ALOToDate] [int] NOT NULL DEFAULT ((0)),
		[ALOThisYear] [int] NOT NULL DEFAULT ((0)),
		[ALOLastMonth] [int] NOT NULL DEFAULT ((0)),
		[ALOThisMonth] [int] NOT NULL DEFAULT ((0))
	) ON [PRIMARY]
END

/****** Object:  Table [dbo].[APTGCuideGuestCards]    Script Date: 11/21/2007 10:14:58 ******/
CREATE TABLE [dbo].[StageAPTGVenterraProperty](
	[Property_Key] [numeric](20, 0) Not NULL,
	[PropertyID] [int] Not NULL,
	[ThisMonthDate] varchar(6) Not NULL
) 

CREATE TABLE [dbo].[StageAPTGVenterraGuestCards](
	[AGGCToDate] [int] Not NULL default 0,
	[AGGCThisYear] [int]  Not NULL default 0,
	[AGGCLastMonth] [int]  Not NULL default 0,
	[AGGCThisMonth] [int]  Not NULL default 0,
	[Property_Key] [numeric](20, 0)  Not NULL
) 

CREATE TABLE [dbo].[StageAPTGVenterraTotalRequests](
	[ATRToDate] [int]  Not NULL default 0,
	[ATRThisYear] [int]  Not NULL default 0,
	[ATRLastMonth] [int]  Not NULL default 0,
	[ATRThisMonth] [int]  Not NULL default 0,
	[Property_Key] [numeric](20, 0) NOT NULL
) 

CREATE TABLE [dbo].[StageAPTGVenterraTotalGuideRequests](
	[ATGRToDate] [int]  Not NULL default 0,
	[ATGRThisYear] [int]  Not NULL default 0,
	[ATGRLastMonth] [int]  Not NULL default 0,
	[ATGRThisMonth] [int]  Not NULL default 0,
	[Property_Key] [numeric](20, 0) NOT NULL
) 

CREATE TABLE [dbo].[StageAPTGVenterraLeasesFromOnlineSources](
	[ALOToDate] [int]  Not NULL default 0,
	[ALOThisYear] [int]  Not NULL default 0,
	[ALOLastMonth] [int]  Not NULL default 0,
	[ALOThisMonth] [int]  Not NULL default 0,
	[Property_Key] [numeric](20, 0) NOT NULL
) 



GO
/****** Object:  StoredProcedure [dbo].[pr_PreProcessAPTGCallTrendLoader]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
*
* Name:	pr_PreProcessCallTrendLoader
*
* Desc:	creates the temp tables to load the hourly calls for trend analysis/issues
*
* Test:	exec dbo.pr_PreProcessCallTrendLoader
*
* Note: This is run each hour based upon Management requirements
*		it rebuilds the dimension trend tables every Monday for the previous 5 weeks
*
* Hist:	01	09/18/2008	Clinton Woody		Initial Version
*
* Hist:	02	10/01/2008	Clinton Woody	
*   we cannot use CallsApartmentGuide, need to build by calls loaded from EStara by hour
* Hist:	03	10/08/2008	Clinton Woody	
*	ignore fact records that generated alerts
* Hist:	04	01/24/2009	Clinton Woody	changed schema of AopartmentGuide Tables
* Hist:	05	03/11/2009	Clinton Woody	removed NH and renamed for APTG
* Hist:	06	01/06/2011	Clinton Woody	removed all NH references
******************************************************************************************/
CREATE PROCEDURE [dbo].[pr_PreProcessAPTGCallTrendLoader]
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @DayOfWeek INT
	DECLARE @StartYMDID INT, @EndYMDID INT
	DECLARE @StartDate DATETIME
	DECLARE @StartHour Int
	DECLARE @EndHour Int
	DECLARE @LastFactHour Int
	DECLARE @CTCStartDate DATETIME
	DECLARE @EndDate DATETIME
-- use last 5 weeks, redo dimension table every Monday	
	SET @StartDate=GETDATE()-16
	SET @EndDate=GETDATE()-1

	SET @DayOfWeek=DATEPART(dw,GETDATE())

	IF @DayOfWeek=2 --2 this should be Monday, add test for 1st time run
	BEGIN

		TRUNCATE TABLE ApartmentGuide.Dimension.APTGCallTrendMatrix
		
--SELECT DISTINCT calltype FROM apartmentguide.[dbo].[CallsApartmentGuide]
--AGC
--ASG
--byEgg
--crop
--CTC
--Print
--Rentals
--Web
-- reset this table every Monday, got back 15 weeks 

		SET @StartYMDID = CAST(CONVERT(VARCHAR(8),GETDATE()-((7*13)+1),112) AS INT)
		IF @StartYMDID<20080801
			SET @StartYMDID=20080801
		SET @EndYMDID = CAST(CONVERT(VARCHAR(8),GETDATE()-1,112) AS INT)
		BEGIN Try
			DROP TABLE  ##tmpAnalCalls						
		END TRY
		BEGIN CATCH
		END CATCH

			SELECT 
			FactID AS TmpID
				,DayofWeek
						,Callhour
						,TotalCall AS TotalCalls
						,ConnectedCall AS ConnectedCalls
						,MissedCall AS MissedCalls
						,ASGConnectedCall AS ASGConnectedCalls
						,ASGMissedCall AS ASGMissedCalls
						,AGCConnectedCall AS AGCConnectedCalls
						,AGCMissedCall AS AGCMissedCalls
						,WebConnectedCall AS WebConnectedCalls
						,WebMissedCall AS WebMissedCalls
						,CTCConnectedCall AS CTCConnectedCalls
						,CTCMissedCall AS CTCMissedCalls
						,RentalsConnectedCall AS RentalsConnectedCalls
						,RentalsMissedCall AS RentalsMissedCalls
				 INTO ##tmpAnalCalls						
				 FROM 
				(SELECT FactID,ymdid
				,dayofweek
				,callhour
						,TotalCall
						,ConnectedCall
						,MissedCall
						,ASGConnectedCall
						,ASGMissedCall
						,AGCConnectedCall
						,AGCMissedCall
						,WebConnectedCall
						,WebMissedCall
						,CTCConnectedCall
						,CTCMissedCall
						,RentalsConnectedCall
						,RentalsMissedCall
				 FROM [ApartmentGuide].[Fact].[ApartmentGuideCallTrend]
				WHERE ymdid BETWEEN @STARTYMDID AND @EndYmdid
				AND evaluated=1)a
				 
			DECLARE facCursor CURSOR FOR
			SELECT tmpid,dayofweek,callhour,totalcalls FROM ##tmpAnalCalls
			ORDER BY dayofweek,callhour,totalcalls desc
			DECLARE @TotalCalls Int
			DECLARE @Hour INT
			DECLARE @LastHour INT
			DECLARE @LastTmpID int
			DECLARE @LastTotal INT
			DECLARE @DeleteCnt INT
			DECLARE @TmpID INT
			DECLARE @CntHour int
			SET @CntHour=0
			SET @LastHour=25
			--SET @phase=1 -- 1 = delete, 2= keep, 3= delete
			OPEN facCursor
			FETCH NEXT FROM faccursor INTO @TmpID,@DayOfWeek,@Hour,@TotalCalls
			WHILE @@FETCH_STATUS=0
			BEGIN
			-- deletes max
				IF @hour=@lastHour
				begin
					SET @CntHour=@cntHour+1
					IF (@TotalCalls*1.5)<@LastTotal AND @DeleteCnt=0
						DELETE FROM ##tmpAnalCalls WHERE tmpID=@LastTmpID
					IF @Hour BETWEEN 0 AND 4 AND @TotalCalls>100
						DELETE FROM ##tmpAnalCalls WHERE tmpID=@TmpID
					IF @Hour BETWEEN 9 AND 21 AND @TotalCalls<50 AND @CntHour>2
						DELETE FROM ##tmpAnalCalls WHERE tmpID=@TmpID
					IF @Hour BETWEEN 9 AND 21 AND @TotalCalls<50 AND @CntHour>2
						DELETE FROM ##tmpAnalCalls WHERE tmpID=@TmpID
					IF  @TotalCalls=1 AND @CntHour>2
						DELETE FROM ##tmpAnalCalls WHERE tmpID=@TmpID
					SET @DeleteCnt=1
				END
				ELSE
				BEGIN
			-- just delete top 2 if close	
					IF @Hour BETWEEN 0 AND 4 AND @TotalCalls>100
						DELETE FROM ##tmpAnalCalls WHERE tmpID=@TmpID
					SET @CntHour=0
					SET @DeleteCnt=0
				END
				SET @LastTmpID=@TmpID
				SET @LastTotal=@TotalCalls
				SET @LastHour=@Hour
				FETCH NEXT FROM faccursor INTO @TmpID,@DayOfWeek,@Hour,@TotalCalls
			END
			CLOSE facCursor
			DEALLOCATE facCursor
			
			INSERT INTO [ApartmentGuide].[Dimension].[APTGCallTrendMatrix] (
				[DayOfWeek],
				[CallHour],
				[MaxTotalCalls],
				[MinTotalCalls],
				[AvgTotalCalls],
				[AvgPercentTotalCalls],
				[MaxConnectedCalls],
				[MinConnectedCalls],
				[AvgConnectedCalls],
				[AvgPercentConnectedCalls],
				[MaxMissedCalls],
				[MinMissedCalls],
				[AvgMissedCalls],
				[AvgPercentMissedCalls],
				[MaxAGCConnectedCalls],
				[MinAGCConnectedCalls],
				[AVGAGCConnectedCalls],
				[AvgPercentAGCConnectedCalls],
				[MaxAGCMissedCalls],
				[MinAGCMissedCalls],
				[AvgAGCMissedCalls],
				[AvgPercentAGCMissedCalls],
				[MaxASGConnectedCalls],
				[MinASGConnectedCalls],
				[AvgASGConnectedCalls],
				[AvgPercentASGConnectedCalls],
				[MaxASGMissedCalls],
				[MinASGMissedCalls],
				[AVGASGMissedCalls],
				[AvgPercentASGMissedCalls],
				[MaxWEBConnectedCalls],
				[MinWEBConnectedCalls],
				[AvgWEBConnectedCalls],
				[AvgPercentWEBConnectedCalls],
				[MaxWEBMissedCalls],
				[MinWEBMissedCalls],
				[AVGWEBMissedCalls],
				[AvgPercentWEBMissedCalls],
				[MaxRentalsConnectedCalls],
				[MinRentalsConnectedCalls],
				[AvgRentalsConnectedCalls],
				[AvgPercentRentalsConnectedCalls],
				[MaxRentalsMissedCalls],
				[MinRentalsMissedCalls],
				[AvgRentalsMissedCalls],
				[AvgPercentRentalsMissedCalls],
				[MaxCTCConnectedCalls],
				[MinCTCConnectedCalls],
				[AvgCTCConnectedCalls],
				[AvgPercentCTCConnectedCalls],
				[MaxCTCMissedCalls],
				[MinCTCMissedCalls],
				[AvgCTCMissedCalls],
				[AvgPercentCTCMissedCalls]
			) 
			SELECT  base.DayOfWeek,
				base.CallHour,
				MAX(base.TotalCalls) AS MaxTotalCalls,
				Min(base.TotalCalls) AS MinTotalCalls,

				AVG(base.TotalCalls) AS AvgTotalCalls,

				CASE WHEN MAX(base.TotalCalls)=0 THEN 001.00
				 ELSE CAST(Min(base.TotalCalls)/CAST(MAX(base.TotalCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentTotalCalls, -- this is based on Min /Max

				MAX(base.ConnectedCalls) AS MaxConnectedCalls,
				Min(base.ConnectedCalls) AS MinConnectedCalls,

				AVG(base.ConnectedCalls) AS AvgConnectedCalls,

				CASE WHEN MAX(base.ConnectedCalls)=0 THEN 001.00 ELSE CAST(Min(base.ConnectedCalls)/CAST(MAX(base.ConnectedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentConnectedCalls, -- this is based on Min /Max

				MAX(base.MissedCalls) AS MaxMissedCalls,
				Min(base.MissedCalls) AS MinMissedCalls,

				AVG(base.MissedCalls) AS AvgMissedCalls,

				CASE WHEN MAX(base.MissedCalls)=0 THEN 001.00 ELSE CAST(Min(base.MissedCalls)/CAST(MAX(base.MissedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentMissedCalls, -- this is based on Min /Max

				MAX(base.AGCConnectedCalls) AS MaxAGCConnectedCalls,
				Min(base.AGCConnectedCalls) AS MinAGCConnectedCalls,

				AVG(base.AGCConnectedCalls) AS AVGAGCConnectedCalls,

				CASE WHEN MAX(base.AGCConnectedCalls)=0 THEN 001.00
				 ELSE CAST(Min(base.AGCConnectedCalls)/CAST(MAX(base.AGCConnectedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentAGCConnectedCalls, -- this is based on Min /Max

				MAX(base.AGCMissedCalls) AS MaxAGCMissedCalls,
				Min(base.AGCMissedCalls) AS MinAGCMissedCalls,

				AVG(base.AGCMissedCalls) AS AvgAGCMissedCalls,

				CASE WHEN MAX(base.AGCMissedCalls)=0 THEN 001.00 
					ELSE CAST(Min(base.AGCMissedCalls)/CAST(MAX(base.AGCMissedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
					AS AvgPercentAGCMissedCalls, -- this is based on Min /Max

				MAX(base.ASGConnectedCalls) AS MaxASGConnectedCalls,
				Min(base.ASGConnectedCalls) AS MinASGConnectedCalls,

				AVG(base.ASGConnectedCalls) AS AvgASGConnectedCalls,

				CASE WHEN MAX(base.ASGConnectedCalls)=0 THEN 001.00 ELSE CAST(Min(base.ASGConnectedCalls)/CAST(MAX(base.ASGConnectedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentASGConnectedCalls, -- this is based on Min /Max

				MAX(base.ASGMissedCalls) AS MaxASGMissedCalls,
				Min(base.ASGMissedCalls) AS MinASGMissedCalls,

				AVG(base.ASGMissedCalls) AS AVGASGMissedCalls,

				CASE WHEN MAX(base.ASGMissedCalls)=0 THEN 001.00
				 ELSE CAST(Min(base.ASGMissedCalls)/CAST(MAX(base.ASGMissedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentASGMissedCalls, -- this is based on Min /Max

				MAX(base.WEBConnectedCalls) AS MaxWEBConnectedCalls,
				Min(base.WEBConnectedCalls) AS MinWEBConnectedCalls,

				AVG(base.WEBConnectedCalls) AS AvgWEBConnectedCalls,

				CASE WHEN MAX(base.WEBConnectedCalls)=0 THEN 001.00 ELSE CAST(Min(base.WEBConnectedCalls)/CAST(MAX(base.WEBConnectedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentWEBConnectedCalls, -- this is based on Min /Max

				MAX(base.WEBMissedCalls) AS MaxWEBMissedCalls,
				Min(base.WEBMissedCalls) AS MinWEBMissedCalls,

				AVG(base.WEBMissedCalls) AS AVGWEBMissedCalls,

				CASE WHEN MAX(base.WEBMissedCalls)=0 THEN 001.00 ELSE CAST(Min(base.WEBMissedCalls)/CAST(MAX(base.WEBMissedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentWEBMissedCalls, -- this is based on Min /Max

				MAX(base.RentalsConnectedCalls) AS MaxRentalsConnectedCalls,
				Min(base.RentalsConnectedCalls) AS MinRentalsConnectedCalls,

				AVG(base.RentalsConnectedCalls) AS AvgRentalsConnectedCalls,

				CASE WHEN MAX(base.RentalsConnectedCalls)=0 THEN 001.00 ELSE CAST(Min(base.RentalsConnectedCalls)/CAST(MAX(base.RentalsConnectedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentRentalsConnectedCalls, -- this is based on Min /Max

				MAX(base.RentalsMissedCalls) AS MaxRentalsMissedCalls,
				Min(base.RentalsMissedCalls) AS MinRentalsMissedCalls,

				AVG(base.RentalsMissedCalls) AS AvgRentalsMissedCalls,

				CASE WHEN MAX(base.RentalsMissedCalls)=0 THEN 001.00 ELSE CAST(Min(base.RentalsMissedCalls)/CAST(MAX(base.RentalsMissedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS bAvgPercentRentalsMissedCalls, -- this is based on Min /Max

				MAX(base.CTCConnectedCalls) AS MaxCTCConnectedCalls,
				Min(base.CTCConnectedCalls) AS MinCTCConnectedCalls,

				AVG(base.CTCConnectedCalls) AS AvgCTCConnectedCalls,

				CASE WHEN MAX(base.CTCConnectedCalls)=0 THEN 001.00
				 ELSE CAST(Min(base.CTCConnectedCalls)/CAST(MAX(base.CTCConnectedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentCTCConnectedCalls, -- this is based on Min /Max

				MAX(base.CTCMissedCalls) AS MaxCTCMissedCalls,

				Min(base.CTCMissedCalls) AS MinCTCMissedCalls,

				AVG(base.CTCMissedCalls) AS AvgCTCMissedCalls,

				CASE WHEN MAX(base.CTCMissedCalls)=0 THEN 001.00
				 ELSE CAST(Min(base.CTCMissedCalls)/CAST(MAX(base.CTCMissedCalls) AS DECIMAL(6,2)) AS DECIMAL(5,2)) end
				 AS AvgPercentCTCMissedCalls -- this is based on Min /Max

			FROM    
			##tmpAnalCalls base
							GROUP BY base.callHour,
					base.[DayOfWeek]
				ORDER BY base.callHour,
					base.[DayOfWeek]

		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentTotalCalls] = .25 where [AvgPercentTotalCalls] <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentConnectedCalls] = .25 where [AvgPercentConnectedCalls] <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentMissedCalls] = .25 where [AvgPercentMissedCalls] <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentAGCConnectedCalls] = .25 where [AvgPercentAGCConnectedCalls] <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentAGCMissedCalls] = .25 where [AvgPercentAGCMissedCalls]  <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentASGConnectedCalls] = .25 where [AvgPercentASGConnectedCalls] <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentASGMissedCalls] = .25 where [AvgPercentASGMissedCalls]  <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentWEBConnectedCalls] = .25 where [AvgPercentWEBConnectedCalls] <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentWEBMissedCalls] = .25 where [AvgPercentWEBMissedCalls] <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentRentalsConnectedCalls] = .25 where [AvgPercentRentalsConnectedCalls] <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentRentalsMissedCalls] = .25 where [AvgPercentRentalsMissedCalls] <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentCTCConnectedCalls] = .25 where [AvgPercentCTCConnectedCalls] <.25
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentCTCMissedCalls] = .25 where [AvgPercentCTCMissedCalls] <.25

		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentTotalCalls] = .5 where [AvgPercentTotalCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentConnectedCalls] = .5 where [AvgPercentConnectedCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentMissedCalls] = .5 where [AvgPercentMissedCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentAGCConnectedCalls] = .5 where [AvgPercentAGCConnectedCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentAGCMissedCalls] = .5 where [AvgPercentAGCMissedCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentASGConnectedCalls] = .5 where [AvgPercentASGConnectedCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentASGMissedCalls] = .5 where [AvgPercentASGMissedCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentWEBConnectedCalls] = .5 where [AvgPercentWEBConnectedCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentWEBMissedCalls] = .5 where [AvgPercentWEBMissedCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentRentalsConnectedCalls] = .5 where [AvgPercentRentalsConnectedCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentRentalsMissedCalls] = .5 where [AvgPercentRentalsMissedCalls]>.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentCTCConnectedCalls] = .5 where [AvgPercentCTCConnectedCalls] >.50
		update Apartmentguide.[Dimension].[APTGCallTrendMatrix] set [AvgPercentCTCMissedCalls] = .5 where [AvgPercentCTCMissedCalls] >.50

		 UPDATE  [ApartmentGuide].[Dimension].[APTGCallTrendMatrix]
		 SET Visits=aa.Visits
		FROM
		[ApartmentGuide].[Dimension].[APTGCallTrendMatrix] catm
		join
		(
		SELECT dd.DayOfWeekNum,savt.callhour,min(savt.visits) as Visits
		 --,ctm.visits
		FROM
		(
		SELECT --TOP 50
		CAST(CONVERT(VARCHAR(8),startdate,112) AS INT) AS YMDID
		 ,CAST(LEFT(CAST(interval AS VARCHAR(5)),2) AS INT) AS CallHour
		 ,visits
		 FROM Staging.APTGVisitsTrend) savt
		 JOIN [DBAUtility].[Dimension].[Dates] dd
		 ON dd.ymdid=savt.YMDID
		 JOIN [ApartmentGuide].[Dimension].[APTGCallTrendMatrix] ctm
		 ON ctm.DayOfWeek=dd.DayOfWeekNum
		 AND savt.CallHour=ctm.callhour
		 WHERE savt.visits>0
		group by dd.DayOfWeekNum,savt.callhour)aa 
		ON aa.callhour=catm.callhour AND aa.DayOfWeekNum=catm.[DayOfWeek]
		WHERE catm.visits=0

--SELECT * FROM  ApartmentGuide.dbo.DimensionAPTGCallTrendMatrix order by hour,dayofweek
	END

	SET @StartYMDID=CAST(CONVERT(VARCHAR(8),@StartDate,112) AS INT)
	SET @EndYMDID=CAST(CONVERT(VARCHAR(8),@EndDate,112) AS INT)
	
-- Now Drop and Recreate our Loading Tables	
	BEGIN TRY
		DROP TABLE [dbo].[CallLoaderApartmentGuideTrends]
	END TRY
	BEGIN CATCH
	END CATCH

	BEGIN TRY
		DROP TABLE 	[dbo].[ClickToCallLoaderTrends]
	END TRY
	BEGIN CATCH
	END CATCH

	CREATE TABLE [dbo].[CallLoaderApartmentGuideTrends](
		[CallID] [nvarchar](255) NULL,
		[TimeInitiated] [nvarchar](255) NULL,
		[Duration] [nvarchar](255) NULL,
		[InboundTelephoneNumber] [nvarchar](255) NULL,
		[TelephoneNumber] [nvarchar](255) NULL,
		[UserTelephoneNumber] [nvarchar](255) NULL,
		[callername] [nvarchar](255) NULL,
		[callerlocation] [nvarchar](255) NULL,
		[var1] [nvarchar](255) NULL,
		[var2] [nvarchar](255) NULL,
		[var3] [nvarchar](255) NULL,
		[var4] [nvarchar](255) NULL,
		[var5] [nvarchar](255) NULL,
		[var6] [nvarchar](255) NULL,
		[var7] [nvarchar](255) NULL,
		[var8] [nvarchar](255) NULL,
		[var9] [nvarchar](255) NULL,
		[var10] [nvarchar](255) NULL,
		[calleraddress] [nvarchar](255) NULL,
		[callercity] [nvarchar](255) NULL,
		[callerstate] [nvarchar](255) NULL,
		[callerzip] [nvarchar](255) NULL,
		[LinkName] [nvarchar](255) NULL,
		[LinkID] [nvarchar](255) NULL,
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
		[RenterHouseholds] [nvarchar](255) NULL,
		[ListenURL] [nvarchar](255) NULL,
		[AudioURL] [nvarchar](255) NULL,
		[MissedAndShortCallTrackingCalls_Id] [nvarchar](255) NULL
	) ON [PRIMARY]


	/****** Object:  Table [dbo].[ClickToCallLoader]    Script Date: 09/18/2008 09:34:56 ******/
	CREATE TABLE [dbo].[ClickToCallLoaderTrends](
		[CallID] [nvarchar](255) NULL,
		[TimeInitiated] [nvarchar](255) NULL,
		[Duration] [nvarchar](255) NULL,
		[InboundTelephoneNumber] [nvarchar](255) NULL,
		[TelephoneNumber] [nvarchar](255) NULL,
		[UserTelephoneNumber] [nvarchar](255) NULL,
		[callername] [nvarchar](255) NULL,
		[callerlocation] [nvarchar](255) NULL,
		[CallerIP] [nvarchar](255) NULL,
		[var1] [nvarchar](255) NULL,
		[var2] [nvarchar](255) NULL,
		[var3] [nvarchar](255) NULL,
		[var4] [nvarchar](255) NULL,
		[var5] [nvarchar](255) NULL,
		[var6] [nvarchar](255) NULL,
		[var7] [nvarchar](255) NULL,
		[var8] [nvarchar](255) NULL,
		[var9] [nvarchar](255) NULL,
		[var10] [nvarchar](255) NULL,
		[Referrer] [nvarchar](1000) NULL,
		[calleraddress] [nvarchar](255) NULL,
		[callercity] [nvarchar](255) NULL,
		[callerstate] [nvarchar](255) NULL,
		[callerzip] [nvarchar](255) NULL,
		[LinkName] [nvarchar](255) NULL,
		[LinkID] [nvarchar](255) NULL,
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
		[RenterHouseholds] [nvarchar](255) NULL,
		[MissedAndShortCallBackCalls_Id] [nvarchar](255) NULL
	) ON [PRIMARY]

doneit:		
END
--	exec dbo.pr_PreProcessCallTrendLoader
--SELECT * FROM [ApartmentGuide].dbo.[FactApartmentGuideCallTrend] order by ymdid desc,callhour desc
--SELECT * FROM [ApartmentGuide].[Dimension].[APTGCallTrendMatrix]
-- truncate table [ApartmentGuide].dbo.[FactApartmentGuideCallTrend]

GO
/****** Object:  StoredProcedure [dbo].[pr_ProcessAPTGMonsterReportFeedData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******************************************************************************************  
*  
* Name: [dbo].[pr_ProcessAPTGMonsterReportFeedData]  
*  
* Desc: Used to process Feed Data for APTG Monster Report  
*  Used by Traci Dodd and Reports in Consumer Marketing on Prod Reports  
*  
* Test: exec [dbo].[pr_ProcessAPTGMonsterReportFeedData] 0 -- does not send email alert  
* Test: exec [dbo].[pr_ProcessAPTGMonsterReportFeedData] Null -- or 1 send email alert  
*  
* Note: External Feeds  
*  WebTrends - via ODBC Report Call on CampaignsLeadShort  
*  Efficient Frontier - via FTP login to their site. data should be ready between 9:00am and 10:00am  
*  Marchex - via FTP from our site ?  
*  BKV - via FTP from our site ?  
*  
*  Uses @SendMail to Flag if not data found sends email alert by default it will  
*  
* Hist: 01 06/24/2010 Clinton Woody  Initial Version  
* Hist: 02 07/06/2010 Clinton Woody  Added breakdown of Paid DataFeed  
* Hist: 03 07/15/2010 Clinton Woody  Added BKV as input  
* Hist: 04 07/15/2010 Clinton Woody  Changed EF from Portfolio Report to Campaign Report  
* Hist: 05 08/26/2010 Clinton Woody  Consolidated ATPG WebTrends Data, Removed Dup Items  
*   created single item for totals, also added Marchex Call Detail  
* Hist: 06 09/14/2010 Clinton Woody  added SuperPages  
* Hist: 07 01/18/2011 Clinton Woody  added CallDuration to Marchex   
* Hist: 08 02/02/2011 Clinton Woody  added FaceBook cost w eff per numera # 3396  
* Hist: 09 02/03/2011 Clinton Woody  added email alert if third party data is not received numera # 3397  
* Hist: 10 02/08/2011 Clinton Woody  fixed email alert if third party data is not received because of checking for today  
* Hist: 11 03/04/2011 Clinton Woody  removed BKV per Tracy and Numera Ticket 3931  
* Hist: 12 03/08/2011 Clinton Woody  Added Display Cost for EF Daily Numera Ticket 3971  
* Hist: 13 10/07/2011 Shetal Gandhi ISSUE 6734 - Commented OUT SuperPages Email task  
* Hist: 14  11/04/2011  Shetal Gandhi ISSUE 6963 - Modified UPDATE STATEMENT TO USE   
    Portfolio TO UPDATE the mediasource information. Commented OUT old UPDATE statements.  
* Hist: 15 02/08/2012 Clinton Woody  Updated column length EF Daily Numera Ticket 8136  
* Hist: 16 06/21/2012 Sarah Mims   Added columns to the Staging EF Daily and Corporate Fact Daily tables to handle   
*           changes to how we store the EF data per ticket #9663. Changes to EF data are reflected  
*           in the update statement.  
* Hist: 17 05/17/2012 Clinton Woody	removed Marchex and Send Subscription Numera # 12417
* Hist: 18 07/25/2013 Chadwick Smith	Added Device column to StageEFDaily and EFDaily #12948
* Hist: 19 05/17/2012 Clinton Woody		EF changed NHG and AHG portfolios #13107
* Hist: 20 01/30/2014 Clinton Woody		EF added new Portfolio which does not parse out to Meadiasource... Manually handle the new
*										portfolio # 14489 
* Hist: 21 02/11/2014 Clinton Woody		EF added/changed 2 new Portfolios for NHG added them to the pre-cursor transformation for NHG
*										portfolio # 14612
* Hist: 22 10/13/2016 Don Wert			Ticket 24426 update email recipients to use email role Monster Report Alert Group


*  Webtrends changed reports from campaignleadsshort to campaignleadsshort2 on 6/12/2010, mart old to 6/12 and new after 6/12  
* select top 50 * from corporate.fact.efdaily order by ymdid desc  
* delete from corporate.fact.efdaily where ymdid>20100731  
******************************************************************************************/  
CREATE PROCEDURE [dbo].[pr_ProcessAPTGMonsterReportFeedData] (@SendMail AS INT = NULL)
AS 
BEGIN  
--GOTO doneit
    SET NOCOUNT ON;  
    DECLARE @Importancetxt VARCHAR(40);  
    DECLARE @JobResults INT;  
    DECLARE @SubjectTxt VARCHAR(200);  
    DECLARE @RecipientsTxt VARCHAR(500);  
    DECLARE @MessageTxt VARCHAR(200);  
    DECLARE @SendMailAlert INT;  
    DECLARE @errmsg VARCHAR(4000);
    SET @JobResults = 1;  
    SET @Subjecttxt = '';  
    SET @Messagetxt = '';  
    SET @SendMail = ISNULL(@SendMail,1);  
    SET @SendMailAlert = 0;  
    DECLARE @YMDID INT;  
    SET @YMDID = CAST(CONVERT(VARCHAR(8),GETDATE(),112) AS INT)  
-- Set up Test Flags that we received the data   
    DECLARE @APTGWTData INT  
    DECLARE @RntWTData INT  
    DECLARE @EFData INT  
    DECLARE @MarchexData INT  
    DECLARE @BKVData INT  
    DECLARE @SPData INT  
-- SELECT * FROM [Staging].[dbo].[StageEFDaily]   
-- these only get populated 1 time each day, a check is done against the production table  
-- and if data is already in it to today then it does not reload it  
-- to reprocess the data you just delete the data from the production table for that day  
    SET @APTGWTData = (
                       SELECT   COUNT(1)
                       FROM     [Staging].[dbo].[StageCampaignLeadsShort]
                      );  
    SET @RntWTData = (
                      SELECT    COUNT(1)
                      FROM      staging.dbo.StageRentalsLeadSubTypebyCampaignID
                     );  
    SET @EFData = (
                   SELECT   COUNT(1)
                   FROM     [Staging].[dbo].[StageEFDaily]
                  );  
    SET @MarchexData = (
                        SELECT  COUNT(1)
                        FROM    [Staging].[dbo].[StageMarchexCallDetail]
                       );  
    SET @BKVData = (
                    SELECT  COUNT(1)
                    FROM    [Staging].[DBO].[StageBKVImportDaily]
                   );  
    SET @SPData = (
                   SELECT   COUNT(1)
                   FROM     [Staging].[DBO].[StageSuperPages]
                  );  
  
--SET @EFData=0  
-- no longer pull this data  
    IF @RntWTData > 0 
        BEGIN  
            DELETE  FROM rentals.fact.LeadSubTypebyCampaignID
            WHERE   ymdid IN (SELECT DISTINCT
                                        CAST(CONVERT(VARCHAR(8),StartDate,112) AS INT) AS YMDID
                              FROM      staging.dbo.StageRentalsLeadSubTypebyCampaignID);  
  
            INSERT  INTO rentals.fact.LeadSubTypebyCampaignID
                    SELECT  CAST(CONVERT(VARCHAR(8),startdate,112) AS INT) AS YMDID
                           ,startdate
                           ,CAST(samevisitcampaignID AS VARCHAR(50)) AS SameVisitCampaignID
                           ,CAST(SiteApartments AS VARCHAR(50)) AS SiteApartments
                           ,CAST(LeadSubType AS VARCHAR(50)) AS LeadSubType
                           ,Visits
                           ,NumberOfLeads
                    FROM    staging.dbo.StageRentalsLeadSubTypebyCampaignID  
        END   
    IF @APTGWTData > 0 
        BEGIN  
   
-- SELECT * FROM [Staging].[dbo].[StageCampaignLeadsShort]  
            DELETE  FROM Staging.[dbo].[StageCampaignLeadsShort]
            WHERE   CAST(mediasource AS VARCHAR) = 'Paid Datafeed'
                    AND Partner IS NULL  
  
            DELETE  FROM Staging.[dbo].[StageCampaignLeadsShort]
            WHERE   CAST(mediasource AS VARCHAR) = 'Pay per Call'
                    AND Partner IS NULL  
    
            UPDATE  Staging.[dbo].[StageCampaignLeadsShort]
            SET     MediaSource = 'Total'
            WHERE   MediaSource IS NULL
                    AND PARTNER IS NULL;  
  
            UPDATE  Staging.[dbo].[StageCampaignLeadsShort]
            SET     visits = sc2.TotalVisits
            FROM    Staging.[dbo].[StageCampaignLeadsShort] sc
            JOIN    (
                     SELECT ymddate
                           ,SUM(ISNULL(visits,0)) AS TotalVisits
                     FROM   Staging.[dbo].[StageCampaignLeadsShort]
                     GROUP BY ymddate
                    ) sc2
                    ON sc.ymddate = sc2.ymddate
            WHERE   CAST(mediasource AS VARCHAR) = 'Total'  
  
            DELETE  FROM [ApartmentGuide].fact.[CampaignLeadsShort]
            WHERE   ymdid IN (SELECT DISTINCT
                                        CAST(CONVERT(VARCHAR(8),YMDDate,112) AS INT) AS YMDID
                              FROM      Staging.[dbo].[StageCampaignLeadsShort]);  
   
            INSERT  INTO [ApartmentGuide].fact.[CampaignLeadsShort]
                    SELECT  CAST(CONVERT(VARCHAR(8),YMDDate,112) AS INT) AS YMDID
                           ,YMDDate
                           ,CASE WHEN CAST(PARTNER AS VARCHAR) LIKE 'Superpages%' THEN 'Superpages'
                                 WHEN CAST(PARTNER AS VARCHAR) LIKE 'Marchex%'
                                      OR CAST(PARTNER AS VARCHAR) LIKE 'CitySearch%' THEN 'Marchex'
                                 WHEN CAST(MediaSource AS VARCHAR) = 'Paid DataFeed' THEN CAST(PARTNER AS VARCHAR)
                                 WHEN CAST(MediaSource AS VARCHAR) = 'Bing' THEN 'MSN'
                                 WHEN CAST(MediaSource AS VARCHAR) = 'condo.com' THEN 'Condo'
                                 WHEN CAST(MediaSource AS VARCHAR) = 'Trulia' THEN 'Trulia'
                                 ELSE CAST(MediaSource AS VARCHAR)
                            END AS MediaSource
                           ,SUM(Visits) AS Visits
                           ,SUM(Pageviews) AS PageViews
                           ,SUM(Clickthroughs) AS ClickThrougs
                           ,SUM(NumberOFLeads) AS NumberOfLeads
                    FROM    Staging.[dbo].[StageCampaignLeadsShort]
                    WHERE   MediaSource IS NOT NULL
                    GROUP BY YMDDate
                           ,CAST(MediaSource AS VARCHAR)
                           ,CASE WHEN CAST(PARTNER AS VARCHAR) LIKE 'Superpages%' THEN 'Superpages'
                                 WHEN CAST(PARTNER AS VARCHAR) LIKE 'Marchex%'
                                      OR CAST(PARTNER AS VARCHAR) LIKE 'CitySearch%' THEN 'Marchex'
                                 WHEN CAST(MediaSource AS VARCHAR) = 'Paid DataFeed' THEN CAST(PARTNER AS VARCHAR)
                                 WHEN CAST(MediaSource AS VARCHAR) = 'Bing' THEN 'MSN'
                                 WHEN CAST(MediaSource AS VARCHAR) = 'condo.com' THEN 'Condo'
                                 WHEN CAST(MediaSource AS VARCHAR) = 'Trulia' THEN 'Trulia'
                                 ELSE CAST(MediaSource AS VARCHAR)
                            END;   
        END  
    ELSE 
        BEGIN  
  --SET @SendMailAlert=1;  
            SET @MessageTxt = @Messagetxt + 'No APTG WebTrends Campaign Leads Short Data' + CHAR(13) + CHAR(13);  
        END  
  
    IF @EFData > 0 
        BEGIN  
-- add translation because EF did not follow normal convention
            BEGIN TRY
                UPDATE  staging.dbo.StageEFDaily
                SET     EFPortfolioOriginal = Portfolio
                
                UPDATE  staging.dbo.StageEFDaily
                SET     Portfolio = 'Primedia - American Home Guides - Google & Bing - Push'
                WHERE   portfolio = 'AHG Home Push - Google & Bing'
                        OR portfolio = 'AHG Homes Push - Google & Bing'

                UPDATE  staging.dbo.StageEFDaily
                SET     Portfolio = 'Primedia - American Home Guides - Google & Bing - Steady'
                WHERE   portfolio = 'AHG Homes Steady - Google & Bing'
                        OR portfolio = 'AHG Home Steady - Google & Bing'

                UPDATE  staging.dbo.StageEFDaily
                SET     Portfolio = 'Primedia - American Home Guides - Google & Bing - Pull'
                WHERE   portfolio = 'AHG Homes Pull - Google & Bing'
                        OR portfolio = 'AHG Home Pull - Google & Bing'

-- NHG
                UPDATE  staging.dbo.StageEFDaily
                SET     Portfolio = 'Primedia - New Home Guide - Google & Bing - Push'
                WHERE   portfolio = 'NHG Home Push - Google & Bing'
                        OR portfolio = 'NHG Homes Push - Google & Bing'
                        or Portfolio = 'NHG Homes Push'
-- NHG
                UPDATE  staging.dbo.StageEFDaily
                SET     Portfolio = 'Primedia - New Home Guide - Google & Bing - Steady'
                WHERE   portfolio = 'NHG Homes Steady - Google & Bing'
                        OR portfolio = 'NHG Home Steady - Google & Bing'
                        or Portfolio ='NHG Homes Steady'

                UPDATE  staging.dbo.StageEFDaily
                SET     Portfolio = 'Primedia - New Home Guide - Google & Bing - Pull'
                WHERE   portfolio = 'NHG Homes Pull - Google & Bing'
                        OR portfolio = 'NHG Home Pull - Google & Bing'

                UPDATE  staging.dbo.StageEFDaily
                SET     Portfolio = REPLACE(Portfolio,'Nhg home ','Primedia - New Home Guide ')

                UPDATE  staging.dbo.StageEFDaily
                SET     Portfolio = REPLACE(Portfolio,'Nhg homes ','Primedia - New Home Guide ')

                UPDATE  staging.dbo.StageEFDaily
                SET     Portfolio = REPLACE(Portfolio,'AHG home ','Primedia - American Home Guides ')

                UPDATE  staging.dbo.StageEFDaily
                SET     Portfolio = REPLACE(Portfolio,'AHG homes ','Primedia - American Home Guides ')

                UPDATE  Staging.dbo.[StageEFDaily]
                SET     MediaSource = CASE WHEN Portfolio LIKE '%facebook%' THEN [Search Engine]
                                           ELSE CASE WHEN DBAUtility.dbo.CHARINDEX2('-',Portfolio,3) <> 0 THEN LTRIM(RTRIM(SUBSTRING(Portfolio,DBAUtility.dbo.CHARINDEX2('-',Portfolio,2) + 1,(DBAUtility.dbo.CHARINDEX2('-',Portfolio,3) - DBAUtility.dbo.CHARINDEX2('-',Portfolio,2)) - 1)))
                                                     ELSE LTRIM(RTRIM(SUBSTRING(Portfolio,DBAUtility.dbo.CHARINDEX2('-',Portfolio,2) + 1,LEN(Portfolio))))
                                                END
                                      END
                       ,Portfolio = LTRIM(RIGHT(Portfolio,(LEN(Portfolio) - DBAUtility.dbo.CHARINDEX2('-',Portfolio,1))))
                       ,Division = LTRIM(RTRIM(SUBSTRING(Portfolio,DBAUtility.dbo.CHARINDEX2('-',Portfolio,1) + 1,(DBAUtility.dbo.CHARINDEX2('-',Portfolio,2) - DBAUtility.dbo.CHARINDEX2('-',Portfolio,1)) - 1)))
                       ,MediaDetail = CASE WHEN DBAUtility.dbo.CHARINDEX2('-',Portfolio,3) = 0 THEN 'None'
                                           ELSE LTRIM(RIGHT(Portfolio,(LEN(Portfolio) - DBAUtility.dbo.CHARINDEX2('-',Portfolio,3))))
                                      END
				   --,EFPortfolioOriginal = Portfolio
                       ,YMDID = CAST(CONVERT(VARCHAR(8),[start date],112) AS INT)
                FROM    Staging.dbo.[StageEFDaily]
                WHERE   Portfolio <> 'Primedia - List on ApartmentGuide'
                        AND Portfolio <> 'RentPath - List on AG'
-- Patch for new Portfolio
--SELECT DISTINCT Portfolio,MediaSource,division,MediaDetail,SearchEngine FROM Corporate.fact.EFDaily WHERE ymdid=20140128
                UPDATE  Staging.dbo.[StageEFDaily]
                SET     Portfolio = 'Primedia - List on AG'
                       ,[Search Engine] = 'Google Adwords'
                       ,MediaSource = 'Google'
                       ,division = 'RentPath'
                       ,Campaign = 'List on AG'
                       ,MediaDetail = 'none'
                       ,YMDID = CAST(CONVERT(VARCHAR(8),[start date],112) AS INT)
                WHERE   Portfolio = 'Primedia - List on ApartmentGuide'
                        OR Portfolio = 'RentPath - List on AG'

                UPDATE  Staging.dbo.[StageEFDaily]
                SET     CostwEFFees = FacebookCostwEFFees
                WHERE   portfolio LIKE '%facebook%'  
    
                UPDATE  Staging.dbo.[StageEFDaily]
                SET     CostwEFFees = FacebookCostwEFFees
                WHERE   portfolio LIKE '%Display%'    
  
                DELETE  FROM [Corporate].fact.[EFDaily]
                WHERE   ymdid IN (SELECT DISTINCT
                                            YMDID
                                  FROM      Staging.dbo.StageEFDaily);  
  
                INSERT  INTO [Corporate].fact.[EFDaily]
                        ([Portfolio]
                        ,[MediaSource]
                        ,[Campaign]
                        ,[YMDID]
                        ,[DateOf]
                        ,[Impressions]
                        ,[Clicks]
                        ,[CTR]
                        ,[CostwEFFees]
                        ,[CPC]
                        ,[CPCwEFFees]
                        ,[AvgPosition]
                        ,[Lead]
                        ,[CPL]
                        ,[CPLwEFFees]
                        ,[MUL_Lead]
                        ,[SUL_Lead]
                        ,[Division]
                        ,[MediaDetail]
                        ,[SearchEngine]
                        ,[EFPortfolioOriginal]
                        ,[Device])
                        SELECT  [Portfolio]
                               ,[MediaSource]
                               ,[Campaign]
                               ,[YMDID]
                               ,[Start Date]
                               ,[Impressions]
                               ,[Clicks]
                               ,[CTR]
                               ,[CostwEFFees]
                               ,[CPC]
                               ,[CPCwEFFees]
                               ,[AvgPosition]
                               ,[Lead]
                               ,[CPL]
                               ,[CPLwEFFees]
                               ,[MUL_Lead]
                               ,[SUL_Lead]
                               ,[Division]
                               ,[MediaDetail]
                               ,[Search Engine]
                               ,[EFPortfolioOriginal]
                               ,[Device]
                        FROM    Staging.dbo.StageEFDaily;     
            END TRY
  -- Send Email Alert on Bad or Changed Data          
            BEGIN CATCH
  --PRINT error_message()          
                SET @errmsg = (
                               SELECT   ERROR_MESSAGE()
                              );
                SET @Subjecttxt = 'EF(Adobe) Third Party Feed Has New or Corrupt Data  ';  
                SET @Messagetxt = @Subjecttxt + CHAR(13) + CHAR(13);  
                SET @Messagetxt = @Messagetxt + 'Not Able to Process EFF Data' + CHAR(13) + LEFT(@errmsg,200) + CHAR(13) + CHAR(13);  
                SET @Messagetxt = @Messagetxt + CHAR(13) + CHAR(9) + 'This Email Generated by SP Staging.dbo.pr_ProcessAPTGMonsterReportFeedData';
				SET @Recipientstxt = (SELECT emailrecipients FROM DBAUtility.dbo.EMailRoles WHERE RoleObjectName='Monster Report Alert Group');
                SET @Importancetxt = 'High';
  
                EXEC msdb.dbo.sp_send_dbmail 
                    @recipients = @RecipientsTxt
                   ,@subject = @Subjecttxt
                   ,@body = @Messagetxt
                   ,@importance = @Importancetxt
                   ,@body_format = 'TEXT'  
          
            END CATCH

        END  
    ELSE 
        BEGIN  
            SET @SendMailAlert = 1;  
            SET @MessageTxt = @Messagetxt + 'No Efficient Frontier Data' + CHAR(13) + CHAR(13);  
        END  
  
    IF @BKVData > 0 
        BEGIN  
            DELETE  FROM [Staging].[DBO].[StageBKVImportDaily]
            WHERE   MediaSource IS NULL  

            DELETE  FROM [ApartmentGuide].[Fact].[BKVImportDaily]
            WHERE   ymdid IN (SELECT DISTINCT
                                        CAST(CONVERT(VARCHAR(8),DateOf,112) AS INT) AS YMDID
                              FROM      Staging.dbo.StageBKVImportDaily);  
  
            INSERT  INTO [ApartmentGuide].[Fact].[BKVImportDaily]
                    ([YMDID]
                    ,[DateOf]
                    ,[MediaSource]
                    ,[Gross Cost]
                    ,[Impressions]
                    ,[Visits]
                    ,[CostPerVisit]
                    ,[VendorClicks]
                    ,[Webleads]
                    ,[TotalPaidLeadsAfterRatio])
                    SELECT  CAST(CONVERT(VARCHAR(8),DateOf,112) AS INT) AS YMDID
                           ,[DateOf]
                           ,[MediaSource]
                           ,[Gross Cost]
                           ,[Impressions]
                           ,[Visits]
                           ,[CostPerVisit]
                           ,[VendorClicks]
                           ,[Webleads]
                           ,[TotalPaidLeadsAfterRatio]
                    FROM    Staging.dbo.StageBKVImportDaily;  
        END  
    ELSE 
        BEGIN  
            SET @SendMailAlert = 1;  
            SET @MessageTxt = @Messagetxt + 'No BKV Monster Report Data' + CHAR(13) + CHAR(13)  
        END  
  
    IF @MarchexData > 0 
        BEGIN  
            UPDATE  staging.dbo.StageMarchexCallDetail
            SET     tracking_phone = REPLACE(tracking_phone,'+','')
                   ,destination_phone = REPLACE(destination_phone,'+','')  
  
            UPDATE  staging.dbo.StageMarchexCallDetail
            SET     tracking_phone = RIGHT(tracking_phone,10)
                   ,destination_phone = RIGHT(destination_phone,10)
                   ,ymdid = CAST(CONVERT(VARCHAR(8),start_time,112) AS INT)
                   ,DateOf = CAST(CONVERT(VARCHAR(10),start_time,112) AS DATETIME)  
  
            UPDATE  staging.dbo.StageMarchexCallDetail
            SET     CallDuration = '0'
            WHERE   ISNUMERIC(CallDuration) = 0  
    
-- select * from ApartmentGuide.[fact].[MarchexCallDetail]  
            DELETE  FROM Apartmentguide.[fact].[MarchexCallDetail]
            WHERE   ymdid IN (SELECT DISTINCT
                                        YMDID
                              FROM      Staging.dbo.StageMarchexCallDetail);  
  
            INSERT  INTO ApartmentGuide.[fact].[MarchexCallDetail]
                    ([DateOf]
                    ,[YMDID]
                    ,[id]
                    ,[start_time]
                    ,[billable]
                    ,[fraud_rule]
                    ,[Listing_id]
                    ,[listing_city]
                    ,[listing_state]
                    ,[listing_zip]
                    ,[market_code]
                    ,[tracking_phone]
                    ,[destination_phone]
                    ,[publisher_name]
                    ,[CallDuration])
                    SELECT  [DateOf]
                           ,[YMDID]
                           ,[id]
                           ,[start_time]
                           ,CAST([billable] AS TINYINT) AS billable
                           ,CASE WHEN ISNUMERIC([fraud_rule]) = 1 THEN CAST(fraud_rule AS TINYINT)
                                 ELSE 0
                            END AS Fraud_Rule
                           ,[external_id] AS Listingid
                           ,[listing_city]
                           ,[listing_state]
                           ,[listing_zip]
                           ,[market_code]
                           ,[tracking_phone]
                           ,[destination_phone]
                           ,[publisher_name]
                           ,CAST(ISNULL([CallDuration],0) AS INT)
                    FROM    Staging.dbo.StageMarchexCallDetail  
        END  
    ELSE 
        BEGIN  
            IF DATEPART(weekday,GETDATE()) NOT  IN (1,7) -- do not alert on Sat and Sun.  
                BEGIN  
                    SET @MessageTxt = @Messagetxt + 'No Marchex Monster Report Data' + CHAR(13) + CHAR(13)  
                END  
        END  
  
    IF @SPData > 0 
        BEGIN  
            UPDATE  [Staging].[DBO].[StageSuperPages]
            SET     ymdid = CAST(CONVERT(VARCHAR(8),Date,112) AS INT)  
            UPDATE  [Staging].[DBO].[StageSuperPages]
            SET     AllImp = '0'
            WHERE   ISNUMERIC(allimp) = 0  
            UPDATE  [Staging].[DBO].[StageSuperPages]
            SET     Clicks = '0'
            WHERE   ISNUMERIC(clicks) = 0  
-- select * FROM Staging.dbo.StageSuperPages   
-- select * from [ApartmentGuide].[Fact].[SuperPages]   
            DELETE  FROM [ApartmentGuide].[Fact].[SuperPages]
            WHERE   ymdid IN (SELECT DISTINCT
                                        YMDID
                              FROM      Staging.dbo.StageSuperPages);  
  
            INSERT  INTO [ApartmentGuide].[Fact].[superPages]
                    ([YMDID]
                    ,[DateOf]
                    ,[CampaignID]
                    ,[AdName]
                    ,[Headline]
                    ,[AllImp]
                    ,[Clicks]
                    ,[CTR]
                    ,[AvgMaxPrice]
                    ,[AvgCPC]
                    ,[Cost]
                    ,[AvgImpPos]
                    ,[DisplayURL]
                    ,[DestinationURL]
                    ,[Description]
                    ,[Status])
                    SELECT  [YMDID]
                           ,[Date]
                           ,[CampaignID]
                           ,[AdName]
                           ,[Headline]
                           ,[AllImp]
                           ,[Clicks]
                           ,[CTR]
                           ,[Avg MaxPrice]
                           ,[AvgCPC]
                           ,[Cost]
                           ,[AvgImpPos]
                           ,[DisplayURL]
                           ,[DestinationURL]
                           ,[Description]
                           ,[Status]
                    FROM    Staging.dbo.StageSuperPages;  
        END  
    ELSE 
        BEGIN  
            SET @SendMailAlert = 1;  
            SET @MessageTxt = @Messagetxt + 'No SuperPages Monster Report Data' + CHAR(13) + CHAR(13)  
        END  
   
-- if the job failed we don't need alert   
--declare @YMDID int  
    SET @YMDID = CAST(CONVERT(VARCHAR(8),GETDATE() - 1,112) AS INT)  
-- DECLARE @APTGWTData INT  
-- DECLARE @RntWTData INT  
-- DECLARE @EFData INT  
-- DECLARE @MarchexData INT  
-- DECLARE @BKVData INT  
-- DECLARE @SPData INT  
--print @ymdid  
--  SET @APTGWTData=(SELECT COUNT(1) FROM ApartmentGuide.fact.SEMSEO where ymdid=@YMDID);  
    SET @EFData = (
                   SELECT   COUNT(1)
                   FROM     [Corporate].fact.[EFDaily]
                   WHERE    ymdid = @YMDID
                  );  
    SET @MarchexData = (
                        SELECT  COUNT(1)
                        FROM    ApartmentGuide.[fact].[MarchexCallDetail]
                        WHERE   ymdid = @YMDID
                       );  
--print @APTGWTData  
--print @EFData  
--print  @marchexData  
--print @BKVData  
--  Print @SPData  
  
    IF (DATEPART(weekday,GETDATE()) NOT IN (1,7)
        AND DATEPART(hour,GETDATE()) < 20
        AND @EFData > 0  
--        AND @MarchexData > 0  
        )
        OR (DATEPART(weekday,GETDATE()) NOT IN (1,7)
            AND DATEPART(hour,GETDATE()) > 19) 
        BEGIN  
            IF @EFData = 0 
                BEGIN  
                    SET @Subjecttxt = 'EF(Adobe) Third Party Data Was Not Marted Today ';  
                    SET @Messagetxt = @Subjecttxt + CHAR(13) + CHAR(13);  
                    IF @EFData = 0 
                        SET @Messagetxt = @Messagetxt + 'EFF Data Not Collected' + CHAR(13) + CHAR(13);  
                    --IF @MarchexData = 0   
                    --    SET @Messagetxt = @Messagetxt + 'Marchex Data Not Collected' + CHAR(13) + CHAR(13) ;  
     
                    SET @Messagetxt = @Messagetxt + CHAR(13) + CHAR(9) + 'This Email Generated by SP Staging.dbo.pr_ProcessAPTGMonsterReportFeedData'  
					SET @Recipientstxt = (SELECT emailrecipients FROM DBAUtility.dbo.EMailRoles WHERE RoleObjectName='Monster Report Alert Group');
                    SET @Importancetxt = 'High'  
  
                    EXEC msdb.dbo.sp_send_dbmail 
                        @recipients = @RecipientsTxt
                       ,@subject = @Subjecttxt
                       ,@body = @Messagetxt
                       ,@importance = @Importancetxt
                       ,@body_format = 'TEXT'  
                END  
        END  
doneit:
END



GO
/****** Object:  StoredProcedure [dbo].[pr_ProcessAPTGMonsterReportFeedData_RentCom]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******************************************************************************************
*
* Name:	[dbo].[pr_ProcessAPTGMonsterReportFeedData_RentCom]
*
* Hist:	01	04/17/2013	Chadwick Smith		Initial Version
*											 - used [Staging].[dbo].[pr_ProcessAPTGMonsterReportFeedData] as template
* Hist:   02    06/25/2013    Clinton Woody		replace primedia.com with rentpath.com # 12744
* Hist:   03    08/20/2013    Clinton Woody		Added Device to Process # 13154
* Hist:   04    09/14/2015    Clinton Woody		file structure changed # 20739
*												added costwith CT and sp hotleads
*
******************************************************************************************/
CREATE PROCEDURE [dbo].[pr_ProcessAPTGMonsterReportFeedData_RentCom]
AS 
BEGIN
    SET NOCOUNT ON

    DECLARE @Importancetxt VARCHAR(40);
    DECLARE @SubjectTxt VARCHAR(200);
    DECLARE @RecipientsTxt VARCHAR(500);
    DECLARE @MessageTxt VARCHAR(200);
    SET @Subjecttxt = '';
    SET @Messagetxt = '';
    DECLARE @YMDID INT;
    SET @YMDID = CAST(CONVERT(VARCHAR(8),GETDATE(),112) AS INT)

	-- Set up Test Flags that we received the data	
    DECLARE @EFData_RentCom INT

	-- these only get populated 1 time each day, a check is done against the production table
	-- and if data is already in it to today then it does not reload it
	-- to reprocess the data you just delete the data from the production table for that day
    SET @EFData_RentCom = (
                           SELECT   COUNT(1)
                           FROM     [Staging].[dbo].[StageEFDaily_RentCom]
                          );

    IF @EFData_RentCom > 0 
        BEGIN
            DELETE  FROM [Corporate].fact.[EFDaily_RentCom]
            WHERE   [DateOf] IN (SELECT DISTINCT
                                        [Start Date]
                                 FROM   Staging.dbo.StageEFDaily_RentCom--WHERE	Division = 'RentCom' --need to use this if the 2 staging tables are ever combined
								 )
                    AND Division = 'RentCom';
            
            INSERT  INTO [Corporate].fact.[EFDaily_RentCom]
                    (Portfolio
                    ,Campaign
                    ,YMDID
                    ,DateOf
                    ,Impressions
                    ,Clicks
                    ,CostwEFFees
                    ,AvgPosition
                    ,Division
                    ,SearchEngine
                    ,Device
                    ,sp_Hotleads)
                    SELECT  [Portfolio]
                           ,[Campaign] --Tracy said she doesn't need this column but I will add it and just exclude from the report
                           ,YMDID = CAST(CONVERT(VARCHAR(8),[Start Date],112) AS INT)
                           ,[Start Date]
                           ,[Impressions]
                           ,[Clicks]
                           ,ISNULL([CostwFees(CT)],0)+ISNULL([Cost w  Fees(ClickThru + ViewThru)],0)
                           ,[Avg Position]
                           ,Division = 'RentCom'
                           ,[Search Engine]
                           ,Device
                           ,ISNULL([sp_Hotleads(ct)],0)
                    FROM    Staging.dbo.StageEFDaily_RentCom;			
        END
    ELSE 
        BEGIN
            SET @MessageTxt = @Messagetxt + 'No Efficient Frontier Data - RentCom' + CHAR(13) + CHAR(13);
        END
	
	-- if the job failed we don't need alert	
    SET @YMDID = CAST(CONVERT(VARCHAR(8),GETDATE() - 1,112) AS INT)
    SET @EFData_RentCom = (
                           SELECT   COUNT(1)
                           FROM     [Corporate].fact.[EFDaily_RentCom]
                           WHERE    ymdid = @YMDID
                                    AND Division = 'RentCom'
                          );

    IF (DATEPART(WEEKDAY,GETDATE()) NOT IN (1,7)
        AND DATEPART(HOUR,GETDATE()) < 20
        AND @EFData_RentCom > 0)
        OR (DATEPART(WEEKDAY,GETDATE()) NOT IN (1,7)
            AND DATEPART(HOUR,GETDATE()) > 19) 
        BEGIN
            IF @EFData_RentCom = 0 
                BEGIN
                    SET @Subjecttxt = 'Not All Third Party Data (EF) Was Marted Today - RentCom';
                    SET @Messagetxt = @Subjecttxt + CHAR(13) + CHAR(13);
                    IF @EFData_RentCom = 0 
                        SET @Messagetxt = @Messagetxt + 'EF Data Not Collected - RentCom' + CHAR(13) + CHAR(13);
				
                    SET @Messagetxt = @Messagetxt + CHAR(13) + CHAR(9) + 'This Email Generated by SP Staging.dbo.pr_ProcessAPTGMonsterReportFeedData_RentCom'
					SET @Recipientstxt = (SELECT emailrecipients FROM DBAUtility.dbo.EMailRoles WHERE RoleObjectName='Monster Report Alert Group');
                    SET @Importancetxt = 'High'

                    EXEC msdb.dbo.sp_send_dbmail 
                        @recipients = @RecipientsTxt
                       ,@subject = @Subjecttxt
                       ,@body = @Messagetxt
                       ,@importance = @Importancetxt
                       ,@body_format = 'TEXT'
                END
        END

    SET NOCOUNT OFF
END


GO
/****** Object:  StoredProcedure [dbo].[pr_ProcessAPTGRDTManagementXML]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************
* HIST 00: Created by Clinton Woody 2008/04/29
*  Takes Client Supplied XML Document and
*   Updates Reporting Table
*
* hist 01: Clinton Woody 2008/06/18
*   changes the names and makes complete job. sends emails on failures or data inconsistancies
* hist 01: Clinton Woody 2008/06/19
*   don't delete xml file if failures occure
* hist 02: Clinton Woody 2008/09/29
*   Add QuickChange Properties not in RDT XML File
* hist 03: Clinton Woody 2008/12/17
*	removed old QuickChange and used Dimension Tables instead
* hist 04: Clinton Woody 2009/06/10	 receiving leads from rental, flag lead source as from APTG or Rentals
* hist 05: Added RDT2 for ExternalPriceCode search
* hist 06: Richard Chen dbo.StageRETPropery's propertyid is 'do not use 99'
* hist 07 2014/03/27 clinton woody lead messagte increased, adjusted package to 500 only copy 255 characters # 15043
select * from ApartmentGuide.dbo.RDTManagementReport
where listingid is null
* hist 07: Clinton Woody 2013/05/28	added listing id Numera # 12481
*************************************************/
CREATE PROCEDURE [dbo].[pr_ProcessAPTGRDTManagementXML] (
    @LeadSource VARCHAR(10) = NULL)
AS 
BEGIN
    SET @LeadSource = ISNULL(@LeadSource,'APTG')
    SET NOCOUNT ON
    DECLARE @ymdid INT
       ,@RDTcode VARCHAR(8)
       ,@SendEmail INT
    DECLARE @SubjectTxt VARCHAR(35)
       ,@RecipientsTxt VARCHAR(125)
       ,@MessageTxt VARCHAR(2000)
    DECLARE @propertyID CHAR(10)
       ,@PropertyName CHAR(35)
       ,@ManagementName CHAR(35)
       ,@ExternalID AS CHAR(20)
    DECLARE @datetouse CHAR(10)

    BEGIN TRY
        DROP TABLE #tmpListings;
    END TRY
    BEGIN CATCH
    END CATCH

    BEGIN TRY
        DROP TABLE #tmpRDT;
    END TRY
    BEGIN CATCH
    END CATCH

    SELECT  propertyid
           ,listingid
           ,externalpricecode
           ,externalid
           ,ListingTypeID
           ,statusid
    INTO    #tmpListings
    FROM    (
             SELECT propertyid
                   ,listingid
                   ,externalpricecode
                   ,externalid
                   ,ListingTypeID
                   ,statusid
                   ,ROW_NUMBER() OVER (PARTITION BY propertyid,listingid,externalpricecode,externalid ORDER BY statusid DESC, ListingTypeID ASC) AS rownum
             FROM   apartmentguide.dbo.vw_alllistings
             WHERE  externalpricecode LIKE 'RDT%'
            ) vw
    WHERE   vw.rownum = 1;

    SET @SendEmail = 0

    DELETE  FROM [dbo].[StageRDTProperty]
    WHERE   ISNUMERIC(propertyid) = 0

    IF EXISTS ( SELECT  name
                FROM    staging.dbo.sysobjects
                WHERE   name = 'StageRDTDate'
                        AND type = 'U' ) 
        BEGIN
            SELECT  sdd.dateofdata
                   ,sdd.RDTid AS RDTCode
                   ,ISNULL(CAST(CONVERT(VARCHAR(8),CAST(srl.datetime AS DATETIME),112) AS INT),sdd.ymdid) AS Ymdid--sam.YMDID  
                   ,srm.name AS ManagementName
                   ,srm.propertycount AS ManagementProperties
                   ,srp.ExternalID
                   ,CAST(srp.PropertyID AS BIGINT) AS PropertyId
                   ,0 AS Listingid  --tl.listingid
                   ,srp.Name AS PropertyName
                   ,srp.UniqueSessions
                   ,srp.pageviews
                   ,srl.leadid
                   ,srl.customerid
                   ,srl.UnitNumber
                   ,srl.FirstName
                   ,srl.LastName
                   ,srl.AddressAll
                   ,srl.Address1
                   ,srl.Address2
                   ,srl.city
                   ,srl.State
                   ,srl.postalcode
                   ,srl.email
                   ,srl.phone
                   ,srl.screeningresponse
                   ,srl.datetime AS leaddatetime
                   ,srl.estimatedmovedate
                   ,LEFT(srl.message,255) AS message
                   ,srl.visitedproperty
                   ,srld.screened
                   ,srld.Unscreened
                   ,'APTG' AS LeadSource
            INTO    #tmpRDT
            FROM    dbo.StageRDTManagement srm
            JOIN    dbo.StageRDTProperty srp
                    ON srp.management_id = srm.management_id
            --LEFT OUTER JOIN #tmpListings tl
            --        ON tl.externalid = CAST(srp.ExternalID AS VARCHAR(20))
            LEFT OUTER JOIN dbo.StageRDTLeadData srld
                    ON srp.PropertyLoadid = srld.PropertyLoadid
            LEFT OUTER JOIN dbo.StageRDTLead srl
                    ON srl.leaddata_id = srld.leaddata_id
            CROSS JOIN dbo.stageRDTDate sdd
            --WHERE   datetime IS NOT NULL
            ORDER BY srm.Management_ID
                   ,srp.propertyid
--SELECT * FROM #tmpRDT
            SET @ymdid = (
                          SELECT    ymdid
                          FROM      stageRDTDate
                         )
            SET @RDTcode = (
                            SELECT  RDTid
                            FROM    stageRDTDate
                           )
            UPDATE  srp
            SET     listingid = tl.listingid
            FROM    #tmpRDT srp
            JOIN    #tmpListings tl
                    ON tl.externalid = CAST(srp.ExternalID AS VARCHAR(20))
                       AND tl.statusid = 1;

            UPDATE  srp
            SET     listingid = tl.listingid
            FROM    #tmpRDT srp
            JOIN    #tmpListings tl
                    ON tl.externalid = CAST(srp.ExternalID AS VARCHAR(20))
                       AND srp.listingid = 0;

            DELETE  FROM tl
            FROM    #tmpRDT tl
            JOIN ApartmentGuide.dbo.RDTManagementReport rd
                    ON rd.ymdid = tl.ymdid
                       AND rd.listingid = tl.listingid
                       AND rd.leadid = tl.leadid;
		
            INSERT  INTO ApartmentGuide.dbo.RDTManagementReport
                    (dateofdata
                    ,RDTcode
                    ,ymdid
                    ,ManagementName
                    ,ManagementProperties
                    ,ExternalID
                    ,PropertyID
                    ,listingid
                    ,PropertyName
                    ,UniqueSessions
                    ,pageviews
                    ,leadid
                    ,customerid
                    ,UnitNumber
                    ,FirstName
                    ,LastName
                    ,AddressAll
                    ,Address1
                    ,Address2
                    ,city
                    ,State
                    ,postalcode
                    ,email
                    ,phone
                    ,screeningresponse
                    ,leaddatetime
                    ,estimatedmovedate
                    ,message
                    ,visitedproperty
                    ,screened
                    ,Unscreened
                    ,LeadSource)
                    SELECT  dateofdata
                           ,RDTcode
                           ,ymdid
                           ,ManagementName
                           ,ManagementProperties
                           ,ExternalID
                           ,PropertyID
                           ,listingid
                           ,PropertyName
                           ,UniqueSessions
                           ,pageviews
                           ,leadid
                           ,customerid
                           ,UnitNumber
                           ,FirstName
                           ,LastName
                           ,AddressAll
                           ,Address1
                           ,Address2
                           ,city
                           ,State
                           ,postalcode
                           ,email
                           ,phone
                           ,screeningresponse
                           ,leaddatetime
                           ,estimatedmovedate
                           ,message
                           ,visitedproperty
                           ,screened
                           ,Unscreened
                           ,LeadSource
                    FROM    #tmpRDT
                    WHERE   listingid IS NOT NULL;
        END
    ELSE 
        BEGIN
            SET @SubjectTxt = 'No Data To Load From RDT XML File'
            SET @MessageTxt = 'Table [StageRDTDate] Does Not Exist!' + CHAR(13)
            SET @MessageTxt = @MessageTxt + ' This Indicates The DTS Job [APTGRDTPropertyXML.dtsx]Needs To Be Rerun!' + CHAR(13)
            SET @RecipientsTxt = (
                                  SELECT    emailrecipients
                                  FROM      [DBAUtility].[dbo].[EmailRoles]
                                  WHERE     RoleObjectName = 'pr_ProcessRDTXMLFailed'
                                 )
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

    SET @MessageTxt = ''
    IF EXISTS ( SELECT TOP 1
                        rdr.propertyid
                FROM    #tmpRDT rdr
                LEFT OUTER JOIN ApartmentGuide.dimension.Properties op
                        ON op.propertyid = rdr.propertyid
                WHERE   op.propertyid IS NULL
                        AND rdr.ymdid = @ymdid ) 
        BEGIN
            SET @MessageTxt = ' Properties In RDT XML File Not In DPS' + CHAR(13) + CHAR(13)
            SET @MessageTxt = @MessageTxt + 'Date       PropertyID ExternalID           PropertyName                        Management' + CHAR(13)
            DECLARE listingcursor CURSOR
            FOR
            SELECT DISTINCT
                    CAST(rdr.propertyid AS VARCHAR(9)) AS PropertyID
                   ,rdr.externalid
                   ,rdr.propertyname
                   ,ManagementName
            FROM    #tmpRDT rdr
            LEFT OUTER JOIN ApartmentGuide.dimension.Properties op
                    ON op.propertyid = rdr.propertyid
            WHERE   op.propertyid IS NULL
                    AND rdr.ymdid = @ymdid
            ORDER BY propertyid
            SET @datetouse = LEFT(CONVERT(VARCHAR(8),@ymdid,112),4) + '/' + SUBSTRING(CONVERT(VARCHAR(8),@ymdid,112),5,2) + '/' + RIGHT(CONVERT(VARCHAR(8),@ymdid,112),2)
            OPEN listingcursor
            FETCH NEXT FROM listingcursor INTO @propertyID,@ExternalID,@PropertyName,@ManagementName
            WHILE @@fetch_status = 0 
                BEGIN
                    SET @MessageTxt = @MessageTxt + @datetouse + ' ' + ISNULL(@propertyid,'Null' + SPACE(6)) + ' ' + ISNULL(@Externalid,'Null' + SPACE(16)) + ' ' + ISNULL(@propertyName,SPACE(35)) + ' ' + ISNULL(@ManagementName,'Null') + CHAR(13)
                    FETCH NEXT FROM listingcursor INTO @propertyID,@ExternalID,@PropertyName,@ManagementName
                END
            CLOSE listingcursor
            DEALLOCATE listingcursor
            SET @SendEmail = 1
        END
    IF EXISTS ( SELECT TOP 1
                        dl.propertyname
                FROM    ApartmentGuide.dbo.vw_AllListings dl
                WHERE   externalpricecode IN ('RDT','RDT2')
                        AND dl.listingid NOT IN (SELECT DISTINCT
                                                        rdt.listingid
                                                 FROM   ApartmentGuide.dbo.[RDTManagementReport] rdt
                                                 )
                        AND statusid = 1 ) 
        BEGIN
            SET @MessageTxt = @MessageTxt + CHAR(13) + CHAR(13) + 'RDT Properties In DPS Not In RDT XML File' + CHAR(13) + CHAR(13)
            SET @MessageTxt = @MessageTxt + 'PropertyID ExternalID           PropertyName' + CHAR(13)
            DECLARE listingcursor CURSOR
            FOR
            SELECT DISTINCT --opl.listingid,						
                    OP.PROPERTYID
                   ,EXTERNALID
                   ,op.propertyname
            FROM    ApartmentGuide.dbo.vw_AllListings op
            WHERE   externalpricecode IN ('RDT','RDT2')
                    AND listingid NOT IN (SELECT DISTINCT
                                                    listingid
                                          FROM      ApartmentGuide.dbo.[RDTManagementReport] rdt
                                          )
                    AND statusid = 1
            ORDER BY [PROPERTYNAME]			
            OPEN listingcursor
            FETCH NEXT FROM listingcursor INTO @propertyID,@ExternalID,@PropertyName
            WHILE @@fetch_status = 0 
                BEGIN
                    SET @MessageTxt = @MessageTxt + ' ' + ISNULL(@propertyid,'Null' + SPACE(6)) + ' ' + ISNULL(@Externalid,'Null' + SPACE(16)) + ' ' + ISNULL(@propertyName,SPACE(35)) + CHAR(13)
                    FETCH NEXT FROM listingcursor INTO @propertyID,@ExternalID,@PropertyName
                END
            CLOSE listingcursor
            DEALLOCATE listingcursor
            SET @SendEmail = 1

        END

    IF @SendEmail = 1 
        BEGIN
            SET @SubjectTxt = 'Data Load Inconsistancies From RDT XML File'
            SET @RecipientsTxt = (
                                  SELECT    emailrecipients
                                  FROM      [DBAUtility].[dbo].[EmailRoles]
                                  WHERE     RoleObjectName = 'pr_ProcessRDTXML'
                                 )
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

	--now cleanup staging tables
/*
    IF EXISTS ( SELECT  1
                FROM    information_schema.tables
                WHERE   table_name = 'StageRDTXMLData'
                        AND table_type = 'Base Table'
                        AND table_schema = 'dbo' ) 
        DROP TABLE [dbo].[StageRDTXMLData]
    IF EXISTS ( SELECT  1
                FROM    information_schema.tables
                WHERE   table_name = 'StageRDTProperty'
                        AND table_type = 'Base Table'
                        AND table_schema = 'dbo' ) 
        DROP TABLE [dbo].[StageRDTProperty]
    IF EXISTS ( SELECT  1
                FROM    information_schema.tables
                WHERE   table_name = 'StageRDTDate'
                        AND table_type = 'Base Table'
                        AND table_schema = 'dbo' ) 
        DROP TABLE [dbo].[StageRDTDate]
    IF EXISTS ( SELECT  1
                FROM    information_schema.tables
                WHERE   table_name = 'StageRDTManagement'
                        AND table_type = 'Base Table'
                        AND table_schema = 'dbo' ) 
        DROP TABLE [dbo].[StageRDTManagement]
    IF EXISTS ( SELECT  1
                FROM    information_schema.tables
                WHERE   table_name = 'StageRDTLead'
                        AND table_type = 'Base Table'
                        AND table_schema = 'dbo' ) 
        DROP TABLE [dbo].[StageRDTLead]

    IF EXISTS ( SELECT  1
                FROM    information_schema.tables
                WHERE   table_name = 'StageRDTLeadData'
                        AND table_type = 'Base Table'
                        AND table_schema = 'dbo' ) 
        DROP TABLE [dbo].[StageRDTLeadData]
*/
    done:

    SELECT  DeleteFile = @SendEmail

END



GO
/****** Object:  StoredProcedure [dbo].[pr_ProcessAPTGRealPageManagementGCXML]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
*
* Name:	pr_ProcessAPTGRealPageManagementGCXML
*
* Desc:	This takes the XML Data from the SSIS Package APTGRealPageManagementXML.dtsx
*		 and manipulates it into a table to use in ApartmentGuide
*		It also does some validation reporting
*
* Test:	exec dbo.pr_ProcessAPTGRealPageManagementGCXML
*
* Note:
*
* Hist:	01	06/27/2008	Clinton Woody		Initial Version
* Hist:	02	12/19/2008	Clinton Woody		Replace legacy Oracl_ tables with dimension listings
*
******************************************************************************************/
CREATE PROCEDURE [dbo].[pr_ProcessAPTGRealPageManagementGCXML]
AS
BEGIN
	SET NOCOUNT ON;
	Declare @YMDID int
	Declare @SendEmail bit
	Declare @SubjectTxt varchar(255)
	Declare @RecipientsTxt varchar(255)
	Declare @MessageTxt varchar(4000)
	Declare @Managementname char(45)
	Declare @CompanyID char(10)
	Declare @CompanyName char(45)
	Declare @PropertyName char(45)
	Declare @Contact char(15)
	Declare @Processed char(8)
	Declare @PropertyID char(11)
	Declare @ExternalID char(11)
	Declare @leads char(7)
	Declare @PropertyCount char(10)
	Declare @FlaggedToProcess char(4)
	Declare @CountIT as int
	set @SendEmail=0
	set @MessageTxt=''
	Set @SubjectTxt='RealPage Management Report'
	Set @RecipientsTxt=''

	truncate table dbo.StageAPTGRealPageGCReport

	insert into
	dbo.StageAPTGRealPageGCReport
	(YMDID,
	RealPageCompanyID,
	ExternalPropertyID,
	ApartmentGuidePropertyID,
	ApartmentGuidePropertyName,
	RealPagePropertyName,
	RealPagePropertyContactName,
	ContactCount)
	select 
	rre.YMDID
	,rre.RealPageCompanyID
	,sp.PropertyID as ExternalPropertyID
	,OPM.PropertyID as ApartmentGuidePropertyID
	,OPM.PropertyName as ApartmentGuidePropertyName
	,sp.PropertyName as RealPagePropertyName
	,sc.ContactName as RealPagePropertyContactName
	,sc.Count as ContactCount
	from 
	(select distinct RealPageCompanyID,YMDID from dbo.StageAPTGRealPageGCRequestEcho)rre
	left outer join
	 dbo.StageAPTGRealPageGCProperty sp
	on sp.RealPageCompanyID=rre.RealPageCompanyID
	left outer join
	dbo.StageAPTGRealPageGCContactTypeCount sc
	on sp.XMLProperty_id=sc.XMLProperty_ID and sc.RealPageCompanyID=sp.RealPageCompanyID
	left outer join
	(select distinct op.ExternalID,op.propertyid,op.PropertyName
				 from ApartmentGuide.dimension.listings op
						where externalpricecode='REALPAGE')OPM
					on sp.PropertyID=OPM.ExternalID

	set @YMDID=(select distinct YMDID from dbo.StageAPTGRealPageGCReport)

--truncate table  ApartmentGuide.[dbo].[RealPageManagementGCReport]
--select * from  ApartmentGuide.[dbo].[RealPageManagementGCReport]
	delete from ApartmentGuide.[dbo].[RealPageManagementGCReport]
		where YMDID=@YMDID

	IF EXISTS(
		SELECT distinct YMDID,
		RealPageCompanyID FROM dbo.StageAPTGRealPageGCReport
		WHERE realpagecompanyid NOT IN (SELECT companyid FROM dbo.APTGRealPagePropertyManagementLookup
		WHERE GuestCardActive=1))
	begin
		set @SendEmail=1
		set @SubjectTxt=@SubjectTxt+' - Not All RealPage MGT Companies Found'
		
		declare ManageCursor cursor for
		SELECT distinct 
		RealPageCompanyID FROM dbo.StageAPTGRealPageGCReport
		WHERE realpagecompanyid NOT IN (SELECT companyid FROM dbo.APTGRealPagePropertyManagementLookup
		WHERE GuestCardActive=1)
		
		Set @MessageTxt=@MessageTxt+'CompanyID Management Company'+char(13)
		open ManageCursor
		
		fetch next from ManageCursor INTO @CompanyID
		while @@fetch_status=0
		Begin
			Set @MessageTxt=@MessageTxt+@CompanyID+char(13)
			fetch next from ManageCursor into @CompanyID
		End
		close ManageCursor
		deallocate ManageCursor
		Set @MessageTxt=@MessageTxt+char(13)
	end
	if (select sum(ContactCount) from dbo.StageAPTGRealPageGCReport)=0
		and (select count(1) from ApartmentGuide.[dbo].[RealPageManagementGCReport])=0
	BEGIN
		set @SendEmail=1
		set @SubjectTxt=@SubjectTxt+' - No RealPage Leads Submitted Yet'
	END
	ELSE
	BEGIN
		Insert Into  ApartmentGuide.[dbo].[RealPageManagementGCReport]
		(YMDID,
		RealPageCompanyID,
		ExternalPropertyID,
		ApartmentGuidePropertyID,
		ApartmentGuidePropertyName,
		RealPagePropertyName,
		RealPagePropertyContactName,
		ContactCount)
		Select
		YMDID,
		RealPageCompanyID,
		ExternalPropertyID,
		ApartmentGuidePropertyID,
		ApartmentGuidePropertyName,
		RealPagePropertyName,
		RealPagePropertyContactName,
		ContactCount
		From
			dbo.StageAPTGRealPageGCReport
	END
-- Show the ManageMent Companies begin Process
	declare ManageCursor cursor for
	Select Left(ManagementName,55) as [Management Name]
		, cast(CompanyID as varchar(10)) as CompanyID
		,isnull(cast(Properties as char(4)),'N/A ') as PropertyCount
		,isnull(cast(Leads as char(4)),'N/A ') as Leads
		, case when GuestCardActive=1 
			and  sar.RealPageCompanyID is not null then 'Yes' else 'No' end as Processed
		, case when GuestCardActive=1 then 'Yes' else 'No' end as FlaggedToProcess
	from
		dbo.APTGRealPagePropertyManagementLookup arp
	left outer join
		(select RealPageCompanyID,count(ExternalPropertyID) as Properties,sum(ContactCount) as Leads
			from
		dbo.StageAPTGRealPageGCReport
		group by RealPageCompanyID)sar
		on sar.RealPageCompanyID= arp.CompanyID
	order by GuestCardActive desc
	Set @MessageTxt=@MessageTxt+'XML File Load Analysis'+char(13)+char(13)
	Set @MessageTxt=@MessageTxt+'CompanyID  Properties Leads Processed Added Management Name'+char(13)
	open ManageCursor
	fetch next from ManageCursor into @Managementname,@CompanyID,@PropertyCount,@Leads,@Processed,@FlaggedToProcess
	while @@fetch_status=0
	Begin
		Set @MessageTxt=@MessageTxt+@CompanyID+' '+@PropertyCount+' '+@Leads+' '+@Processed+' '+@FlaggedToProcess+' '+@Managementname+char(13)
		fetch next from ManageCursor into @Managementname,@CompanyID,@PropertyCount,@Leads,@Processed,@FlaggedToProcess
	End
	close ManageCursor
	deallocate ManageCursor
-- check for data feed not in QuickChange
	set @CountIT=(select count(1)
	From
		dbo.StageAPTGRealPageGCReport
	Where 	
		ApartmentGuidePropertyID is null)

	if @CountIT>0
	begin
		Set @MessageTxt=@MessageTxt+char(13)+cast(@Countit as varchar)+' Properties From RealPage Not In QuickChange'+char(13)+char(13)
		Set @MessageTxt=@MessageTxt+'CompanyID  Property ID Contact         Property Name'+char(13)
		Declare NoQCProperty cursor for
			select 
				cast (RealPageCompanyID as char(10)) as CompanyID,
				cast (ExternalPropertyID as char(10)) as [Ext Property ID],
				RealPagePropertyName as PropertyName,
				RealPagePropertyContactName as Contact
			From
				dbo.StageAPTGRealPageGCReport
			Where 	
				ApartmentGuidePropertyID is null
		open NoQCProperty
		fetch next from NoQCProperty into @CompanyID,@PropertyID,@PropertyName,@Contact
		while @@fetch_status=0
		Begin
			Set @MessageTxt=@MessageTxt+@CompanyID+' '+@PropertyID+' '+@Contact+' '+@Propertyname+char(13)
			fetch next from NoQCProperty into @CompanyID,@PropertyID,@PropertyName,@Contact
		End
		close NoQCProperty
		deallocate NoQCProperty

		set @SendEmail=1
	end

-- check for QuickChange Assigned not in DataFeed
	set @CountIT=(select count(1) from 
	(select distinct op.ExternalID,op.propertyid,op.PropertyName
				 from ApartmentGuide.dimension.listings op
						where externalpricecode='REALPAGE')OPM
	left outer join
				dbo.StageAPTGRealPageGCReport spr
	 on spr.ExternalPropertyID=OPM.ExternalID
	Where spr.ExternalPropertyID is null)
	if @CountIT>0
	begin
		print 'send email'
		Set @MessageTxt=@MessageTxt+char(13)+cast(@CountIT as varchar)+' Properties In QuickChange Not Processed'+char(13)+char(13)
		Set @MessageTxt=@MessageTxt+'External ID  Property ID   Property Name'+char(13)
		Declare NoRPProperty cursor for
		select OPM.ExternalID,OPM.PropertyID,OPM.PropertyName from 
		(select distinct op.ExternalID,op.propertyid,op.PropertyName
					 from ApartmentGuide.dimension.listings op
							where externalpricecode='REALPAGE' and StatusID='1')OPM
		left outer join
					dbo.StageAPTGRealPageGCReport spr
		 on spr.ExternalPropertyID=OPM.ExternalID
		Where spr.ExternalPropertyID is null
		open NoRPProperty
		fetch next from NoRPProperty into @ExternalID,@PropertyID,@PropertyName
		while @@fetch_status=0
		Begin
			Set @MessageTxt=@MessageTxt+@ExternalID+' '+@PropertyID+' '+@Propertyname+char(13)
			fetch next from NoRPProperty into @ExternalID,@PropertyID,@PropertyName
		End
		close NoRPProperty
		deallocate NoRPProperty

		set @SendEmail=1
	end
	if @SendEmail=1
	Begin
--print @SubjectTxt
--print @MessageTxt
			set @RecipientsTxt=(select emailrecipients from [DBAUtility].[dbo].[EmailRoles] where RoleObjectName='pr_ProcessAPTGRealPageManagementGCXML')
			IF len(@RecipientsTxt)>3
			BEGIN
				EXEC msdb.dbo.sp_send_dbmail
					@recipients				= @RecipientsTxt
					,@subject					= @SubjectTxt
					,@body						= @MessageTxt
					,@importance				= 'Normal'
					,@body_format				= 'TEXT'
			END

	End

	if exists (select 1 from information_schema.tables
	where table_name='StageAPTGRealPageGCRequestEcho' and table_type='Base Table')
		drop table dbo.StageAPTGRealPageGCRequestEcho

	if exists (select 1 from information_schema.tables
	where table_name='StageAPTGRealPageGCProperty' and table_type='Base Table')
		drop table dbo.StageAPTGRealPageGCProperty

	if exists (select 1 from information_schema.tables
	where table_name='StageAPTGRealPageGCContactTypeCount' and table_type='Base Table')
		drop table dbo.StageAPTGRealPageGCContactTypeCount

	if exists (select 1 from information_schema.tables
	where table_name='StageAPTGRealPageGCReport' and table_type='Base Table')
		drop table  dbo.StageAPTGRealPageGCReport

	
/*
http://property.onesite.realpage.com/MITSPropertyMarketingILS/MITS_reporting.asmx/GetGuestCardCount?ilsname=ApartmentGuide_com&ilsusername=apartmentguide_com&ilspassword=4p4rtm3ntgu1d3!1q7&realpagecompanyid=1240034&beginDate=2008/06/24&enddate=2008/06/24
http://property.onesite.realpage.com/MITSPropertyMarketingILS/MITS_reporting.asmx/GetGuestCardCount?ilsname=ApartmentGuide_com&ilsusername=apartmentguide_com&ilspassword=4p4rtm3ntgu1d3!1q7&realpagecompanyid=1053983&beginDate=2008/06/24&enddate=2008/06/24
http://property.onesite.realpage.com/MITSPropertyMarketingILS/MITS_reporting.asmx/GetGuestCardCount?ilsname=ApartmentGuide_com&ilsusername=apartmentguide_com&ilspassword=4p4rtm3ntgu1d3!1q7&realpagecompanyid=1049770&beginDate=2008/06/24&enddate=2008/06/24
http://property.onesite.realpage.com/MITSPropertyMarketingILS/MITS_reporting.asmx/GetGuestCardCount?ilsname=ApartmentGuide_com&ilsusername=apartmentguide_com&ilspassword=4p4rtm3ntgu1d3!1q7&realpagecompanyid=1130323&beginDate=2008/06/24&enddate=2008/06/24
http://property.onesite.realpage.com/MITSPropertyMarketingILS/MITS_reporting.asmx/GetGuestCardCount?ilsname=ApartmentGuide_com&ilsusername=apartmentguide_com&ilspassword=4p4rtm3ntgu1d3!1q7&realpagecompanyid=1050266&beginDate=2008/06/24&enddate=2008/06/24
http://property.onesite.realpage.com/MITSPropertyMarketingILS/MITS_reporting.asmx/GetGuestCardCount?ilsname=ApartmentGuide_com&ilsusername=apartmentguide_com&ilspassword=4p4rtm3ntgu1d3!1q7&realpagecompanyid=1182950&beginDate=2008/06/24&enddate=2008/06/24
http://property.onesite.realpage.com/MITSPropertyMarketingILS/MITS_reporting.asmx/GetGuestCardCount?ilsname=ApartmentGuide_com&ilsusername=apartmentguide_com&ilspassword=4p4rtm3ntgu1d3!1q7&realpagecompanyid=1255453&beginDate=2008/06/24&enddate=2008/06/24
http://property.onesite.realpage.com/MITSPropertyMarketingILS/MITS_reporting.asmx/GetGuestCardCount?ilsname=ApartmentGuide_com&ilsusername=apartmentguide_com&ilspassword=4p4rtm3ntgu1d3!1q7&realpagecompanyid=1048219&beginDate=2008/06/24&enddate=2008/06/24
*/
END



GO
/****** Object:  StoredProcedure [dbo].[pr_ProcessAPTGVenterraXML]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************
* HIST 00: Created by Clinton Woody 2007/11/21
*  Takes Client Supplied XML Document and
*   Updates Reporting Table
*
* HIST 01: Clinton Woody 2008/06/24
* HIST 02: Clinton Woody 2011/03/11  added tag where email comes from
*  Drops table [StageAPTGVenterraPropertyComplete] if no errors
*************************************************/
/*
select * into #tmpErrors from StageAPTGVenterraPropertyXMLReport_Errors
order by propertyid,ymdid desc

select * from dbo.StageAPTGVenterraPropertyXMLReport
 order by propertyid,ymdid desc
 
--truncate table StageAPTGVenterraPropertyXMLReport_Errors

select * from [dbo].[StageAPTGVenterraPropertyComplete] order by propertyid

select * from apartmentguide.fact.VenterraPropertyReport
  order by propertyid,ymdid desc
*/
CREATE PROCEDURE [dbo].[pr_ProcessAPTGVenterraXML]
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @ThisMonthYMDID int
	DECLARE @ThisMonthDate as Datetime
	DECLARE @LastMonthDate as Datetime
	DECLARE @DateProcessed as int
	DECLARE @LastMonthYMDID int
	DECLARE @ThisMonthData int,@LastMonthData int
	DECLARE @CountOf int
	DECLARE @SendEmail bit,@SubjectTxt varchar(75),@MessageTxt varchar(2000),@RecipientsTxt varchar(1000)
	set @MessageTxt=''
	set @SendEmail=0
	set @ThisMonthDate=(select distinct(left(ThisMonthDate,4))+'/'+right(ThisMonthDate,2)+'/01' from [dbo].[StageAPTGVenterraProperty])
	set @LastMonthdate=dateadd(d,-1,@thismonthdate)
	set @ThisMonthdate=dateadd(d,-1,dateadd(mm,1,@thismonthdate))

	set @ThisMonthYMDID= convert(varchar(10),@thismonthdate,112)
	set @LastMonthYMDID= convert(varchar(10),@lastmonthdate,112)
	set @DateProcessed=convert(varchar(10),GetDate(),112)

	set @ThisMonthData=0 -- indicates to add new records for this month
	set @LastMonthData=0 -- indicates to add new records for last month
	if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraPropertyComplete' and table_type='Base Table' and
		table_schema='dbo')
		drop table [dbo].[StageAPTGVenterraPropertyComplete]

	if Not exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraPropertyXMLReport' and table_type='Base Table' and
		table_schema='dbo')
		Create table [dbo].[StageAPTGVenterraPropertyXMLReport](
		[Property_KeyID] [int] identity NOT NULL,
		[PropertyID] [int] NOT NULL,
		[YMD] datetime not null,
		[YMDID] int not null,
		[AGGCToDate] [int] Not  NULL default 0,
		[AGGCThisYear] [int] Not  NULL default 0,
		[AGGCMonth] [int] Not  NULL default 0,
		[ATRToDate] [int] Not  NULL default 0,
		[ATRThisYear] [int] Not  NULL default 0,
		[ATRMonth] [int] Not  NULL default 0,
		[ATGRToDate] [int] Not  NULL default 0,
		[ATGRThisYear] [int] Not  NULL default 0,
		[ATGRMonth] [int] Not  NULL default 0,
		[ALOToDate] [int] Not  NULL default 0,
		[ALOThisYear] [int] Not  NULL default 0,
		[ALOMonth] [int] Not  NULL default 0
	) 

	if Not exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraPropertyXMLReport_Errors' and table_type='Base Table' and
		table_schema='dbo')
		Create table [dbo].[StageAPTGVenterraPropertyXMLReport_Errors](
		[Property_KeyID] [int] identity NOT NULL,
		[PropertyID] [int] NOT NULL,
		[YMD] datetime not null,
		[YMDID] int not null,
		[AGGCToDate] [int] Not  NULL default 0,
		[AGGCThisYear] [int] Not  NULL default 0,
		[AGGCMonth] [int] Not  NULL default 0,
		[ATRToDate] [int] Not  NULL default 0,
		[ATRThisYear] [int] Not  NULL default 0,
		[ATRMonth] [int] Not  NULL default 0,
		[ATGRToDate] [int] Not  NULL default 0,
		[ATGRThisYear] [int] Not  NULL default 0,
		[ATGRMonth] [int] Not  NULL default 0,
		[ALOToDate] [int] Not  NULL default 0,
		[ALOThisYear] [int] Not  NULL default 0,
		[ALOMonth] [int] Not  NULL default 0,
		[YMDIDFileLoaded] [int] Not Null default 0
		) 
-- Setup Our Dates To use Loaded Staged Table StageAPTGProperty from SSIS package

	CREATE TABLE [dbo].[StageAPTGVenterraPropertyComplete](
		[PropertyID] [int] Not NULL,
		[CurrentMonthDate] datetime not null,
		[ThisMonthYMDID] int not null,
		[LastMonthDate] datetime not null,
		[LastMonthYMDID] int not null,
		[ThisMonthDate] varchar(6) Not NULL,
		[AGGCToDate] [int] Not  NULL default 0,
		[AGGCThisYear] [int] Not  NULL default 0,
		[AGGCLastMonth] [int] Not  NULL default 0,
		[AGGCThisMonth] [int] Not  NULL default 0,
		[ATRToDate] [int] Not  NULL default 0,
		[ATRThisYear] [int] Not  NULL default 0,
		[ATRLastMonth] [int] Not  NULL default 0,
		[ATRThisMonth] [int] Not  NULL default 0,
		[ATGRToDate] [int] Not  NULL default 0,
		[ATGRThisYear] [int] Not  NULL default 0,
		[ATGRLastMonth] [int] Not  NULL default 0,
		[ATGRThisMonth] [int] Not  NULL default 0,
		[ALOToDate] [int] Not  NULL default 0,
		[ALOThisYear] [int] Not  NULL default 0,
		[ALOLastMonth] [int] Not  NULL default 0,
		[ALOThisMonth] [int] Not  NULL default 0,
		) 
	if Exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraProperty' and table_type='Base Table' and
			table_schema='dbo') and
		Exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraGuestCards' and table_type='Base Table' and
			table_schema='dbo') and 
		Exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraLeasesFromOnlineSources' and table_type='Base Table' and
			table_schema='dbo') and
		Exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraTotalGuideRequests' and table_type='Base Table' and
			table_schema='dbo') and 
		Exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraTotalRequests' and table_type='Base Table' and
			table_schema='dbo')
	BEGIN
		insert into [dbo].[StageAPTGVenterraPropertyComplete]
		([PropertyID]
		,[CurrentMonthDate]
		,[ThisMonthYMDID]
		,[LastMonthDate]
		,[LastMonthYMDID]
		,[ThisMonthDate]
		,[AGGCToDate]
		,[AGGCThisYear]
		,[AGGCLastMonth]
		,[AGGCThisMonth]
		,[ATRToDate]
		,[ATRThisYear]
		,[ATRLastMonth]
		,[ATRThisMonth]
		,[ATGRToDate]
		,[ATGRThisYear]
		,[ATGRLastMonth]
		,[ATGRThisMonth]
		,[ALOToDate]
		,[ALOThisYear]
		,[ALOLastMonth]
		,[ALOThisMonth])
		select 
		sap.[PropertyID],
		@ThisMonthDate,
		@ThisMonthYMDID,
		@LastMonthDate,
		@LastMonthYMDID,
		sap.[ThisMonthDate],
		sagc.[AGGCToDate],
		sagc.[AGGCThisYear],
		sagc.[AGGCLastMonth],
		sagc.[AGGCThisMonth],
		satr.[ATRToDate],
		satr.[ATRThisYear],
		satr.[ATRLastMonth],
		satr.[ATRThisMonth],
		stgr.[ATGRToDate],
		stgr.[ATGRThisYear],
		stgr.[ATGRLastMonth],
		stgr.[ATGRThisMonth],
		salo.[ALOToDate],
		salo.[ALOThisYear],
		salo.[ALOLastMonth],
		salo.[ALOThisMonth]
		FROM [dbo].[StageAPTGVenterraProperty] sap
		JOIN [dbo].[StageAPTGVenterraTotalRequests] satr on
		sap.Property_Key=satr.Property_Key
		JOIN [dbo].[StageAPTGVenterraTotalGuideRequests] stgr on
		sap.Property_Key=stgr.Property_Key
		JOIN [dbo].[StageAPTGVenterraGuestCards] sagc on
		sap.Property_Key=sagc.Property_Key
		JOIN [dbo].[StageAPTGVenterraLeasesFromOnlineSources] salo on
		sap.Property_Key=salo.Property_Key

	-- Verify that Last Months Data Did Not Change
		if exists(select top 1 1 from StageAPTGVenterraPropertyComplete sapc join 
		StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
		 apxr.ymdid=sapc.lastmonthymdid)
		Begin

--if it equals to 1st day of month, update last months data
			if day(getdate())=1
				Update dbo.StageAPTGVenterraPropertyXMLReport
				 set aggcMonth=sapc.AGGCLastMonth
				,ATRMonth=sapc.ATRLastMonth
				,ATGRMonth=sapc.ATGRLastMonth
				,ALOMonth=sapc.ALOLastMonth
				 from dbo.StageAPTGVenterraPropertyXMLReport sapx
				join dbo.StageAPTGVenterraPropertyComplete sapc
				on sapx.ymdid=sapc.lastmonthymdid and sapx.propertyid=sapc.propertyid
				where lastmonthYMDID=@LastMonthYMDID 
				and( sapc.AGGCLastMonth<>sapx.aggcMonth
				or sapc.ATRLastMonth<>sapx.ATRMonth
				or sapc.ATGRLastMonth<>sapx.ATGRMonth
				or sapc.ALOLastMonth<>sapx.ALOMonth)

			set @LastMonthData=1 -- means last months data already loaded
			if exists(select top 1 1 from StageAPTGVenterraPropertyComplete sapc join 
				StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
				apxr.ymdid=sapc.lastmonthymdid and 
				(apxr.[AGGCMonth]<>sapc.[AGGCLastMonth] or
				apxr.[ATRMonth]<>sapc.[ATRLastMonth] or
				apxr.[ATGRMonth]<>sapc.[ATGRLastMonth] or
				apxr.[ALOMonth]<>sapc.[ALOLastMonth])
				left outer join
				StageAPTGVenterraPropertyXMLReport_Errors ape on
				ape.[YMDIDFileLoaded]=@DateProcessed and ape.[ymdid]=apxr.[ymdid]
				and ape.propertyid=apxr.propertyid
				where ape.[propertyID] is null)
			Begin
				set @CountOf=(Select
				 count(sapc.[PropertyID])
				from StageAPTGVenterraPropertyComplete sapc join 
				StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
				apxr.ymdid=sapc.lastmonthymdid and 
				(apxr.[AGGCMonth]<>sapc.[AGGCLastMonth] or
				apxr.[ATRMonth]<>sapc.[ATRLastMonth] or
				apxr.[ATGRMonth]<>sapc.[ATGRLastMonth] or
				apxr.[ALOMonth]<>sapc.[ALOLastMonth])
				left outer join
				StageAPTGVenterraPropertyXMLReport_Errors ape on
				ape.[YMDIDFileLoaded]=@DateProcessed and ape.[ymdid]=apxr.[ymdid]
				and ape.propertyid=apxr.propertyid
				where ape.[propertyID] is null
				)
				print '['+cast(@CountOf as varchar(4))+'] Properties With Bad Data In Last Month Data!'
				set @MessageTxt='['+cast(@CountOf as varchar(4))+'] Properties With Bad Data In Last Month Data!'
				set @SendEmail=1
				insert into StageAPTGVenterraPropertyXMLReport_Errors
				([PropertyID]
				,[YMD]
				,[YMDID]
				,[AGGCToDate]
				,[AGGCThisYear]
				,[AGGCMonth]
				,[ATRToDate]
				,[ATRThisYear]
				,[ATRMonth]
				,[ATGRToDate]
				,[ATGRThisYear]
				,[ATGRMonth]
				,[ALOToDate]
				,[ALOThisYear]
				,[ALOMonth]
				,[YMDIDFileLoaded])
				Select
				 sapc.[PropertyID]
				,sapc.[LastMonthDate]
				,sapc.[LastMonthYMDID]
				,sapc.[AGGCToDate]
				,sapc.[AGGCThisYear]
				,sapc.[AGGCLastMonth]
				,sapc.[ATRToDate]
				,sapc.[ATRThisYear]
				,sapc.[ATRLastMonth]
				,sapc.[ATGRToDate]
				,sapc.[ATGRThisYear]
				,sapc.[ATGRLastMonth]
				,sapc.[ALOToDate]
				,sapc.[ALOThisYear]
				,sapc.[ALOLastMonth]
				,@DateProcessed
				from StageAPTGVenterraPropertyComplete sapc join 
				StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
				apxr.ymdid=sapc.lastmonthymdid and 
				(apxr.[AGGCMonth]<>sapc.[AGGCLastMonth] or
				apxr.[ATRMonth]<>sapc.[ATRLastMonth] or
				apxr.[ATGRMonth]<>sapc.[ATGRLastMonth] or
				apxr.[ALOMonth]<>sapc.[ALOLastMonth])
				left outer join
				StageAPTGVenterraPropertyXMLReport_Errors ape on
				ape.[YMDIDFileLoaded]=@DateProcessed and ape.[ymdid]=apxr.[ymdid]
				and ape.propertyid=apxr.propertyid
				where ape.[propertyID] is null
			end
		End

	-- Now check for new listings in last months listings which should generate error
		if exists(select 1 from StageAPTGVenterraPropertyComplete sapc left outer join 
			StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
			apxr.ymdid=@LastMonthYMDID
				left outer join
				StageAPTGVenterraPropertyXMLReport_Errors ape on
				ape.[YMDIDFileLoaded]=@DateProcessed and ape.[ymdid]=sapc.[lastmonthymdid]
				and ape.propertyid=sapc.propertyid
				where ape.[propertyID] is null
				and apxr.propertyid is null)
			 and @LastMonthData=1
		Begin
			set @CountOf=(
			Select count(sapc.[PropertyID])
			from StageAPTGVenterraPropertyComplete sapc left outer join 
				StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
					apxr.ymdid=@LastMonthYMDID
				left outer join
				StageAPTGVenterraPropertyXMLReport_Errors ape on
				ape.[YMDIDFileLoaded]=@DateProcessed and ape.[ymdid]=apxr.[ymdid]
				and ape.propertyid=apxr.propertyid
				where ape.[propertyID] is null
				and apxr.propertyid is null)
			print '['+cast(@CountOf as varchar(4))+'] Properties New Listing In Last Months Data!'
			set @MessageTxt=@MessageTxt+char(13)+'['+cast(@CountOf as varchar(4))+'] Properties New Listing In Last Months Data!'
			set @SendEmail=1
			insert into StageAPTGVenterraPropertyXMLReport_Errors
			([PropertyID]
			,[YMD]
			,[YMDID]
			,[AGGCToDate]
			,[AGGCThisYear]
			,[AGGCMonth]
			,[ATRToDate]
			,[ATRThisYear]
			,[ATRMonth]
			,[ATGRToDate]
			,[ATGRThisYear]
			,[ATGRMonth]
			,[ALOToDate]
			,[ALOThisYear]
			,[ALOMonth]
			,[YMDIDFileLoaded])
			Select sapc.[PropertyID]
			,sapc.[LastMonthDate]
			,sapc.[LastMonthYMDID]
			,sapc.[AGGCToDate]
			,sapc.[AGGCThisYear]
			,sapc.[AGGCLastMonth]
			,sapc.[ATRToDate]
			,sapc.[ATRThisYear]
			,sapc.[ATRLastMonth]
			,sapc.[ATGRToDate]
			,sapc.[ATGRThisYear]
			,sapc.[ATGRLastMonth]
			,sapc.[ALOToDate]
			,sapc.[ALOThisYear]
			,sapc.[ALOLastMonth]
			,@DateProcessed
			from StageAPTGVenterraPropertyComplete sapc left outer join 
				StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
					apxr.ymdid=@LastMonthYMDID
				left outer join
				StageAPTGVenterraPropertyXMLReport_Errors ape on
				ape.[YMDIDFileLoaded]=@DateProcessed and ape.[ymdid]=apxr.[ymdid]
				and ape.propertyid=apxr.propertyid
				where ape.[propertyID] is null
				and apxr.propertyid is null
		end
	-- verify that this months data did not decrease
		if exists(select 1 from StageAPTGVenterraPropertyComplete sapc join 
		StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
		apxr.ymdid=sapc.lastmonthymdid)
		Begin
			set @ThisMonthData=1
			if exists(select top 1 1 from StageAPTGVenterraPropertyComplete sapc join 
				StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
				apxr.ymdid=sapc.ThisMonthYMDID and 
				(apxr.[AGGCToDate]>sapc.[AGGCToDate] or
				apxr.[AGGCThisYear]>sapc.[AGGCThisYear] or
				apxr.[AGGCMonth]>sapc.[AGGCThisMonth] or
				apxr.[ATRToDate]>sapc.[ATRToDate] or
				apxr.[ATRThisYear]>sapc.[ATRThisYear] or
				apxr.[ATRMonth]>sapc.[ATRThisMonth] or
				apxr.[ATGRToDate]>sapc.[ATGRToDate] or
				apxr.[ATGRThisYear]>sapc.[ATGRThisYear] or
				apxr.[ATGRMonth]>sapc.[ATGRThisMonth] or
				apxr.[ALOToDate]>sapc.[ALOToDate] or
				apxr.[ALOThisYear]>sapc.[ALOThisYear] or
				apxr.[ALOMonth]>sapc.[ALOThisMonth])
				left outer join
				StageAPTGVenterraPropertyXMLReport_Errors sape on
				sape.[YMDIDFileLoaded]=@DateProcessed and sape.[ymdid]=apxr.[ymdid]
				and sape.propertyid=apxr.propertyid
				where sape.[propertyID] is null)
			Begin
				set @CountOf=(Select count(sapc.[PropertyID])
				from StageAPTGVenterraPropertyComplete sapc join 
				StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
				apxr.ymdid=sapc.thismonthymdid and 
				(apxr.[AGGCToDate]>sapc.[AGGCToDate] or
				apxr.[AGGCThisYear]>sapc.[AGGCThisYear] or
				apxr.[AGGCMonth]>sapc.[AGGCThisMonth] or
				apxr.[ATRToDate]>sapc.[ATRToDate] or
				apxr.[ATRThisYear]>sapc.[ATRThisYear] or
				apxr.[ATRMonth]>sapc.[ATRThisMonth] or
				apxr.[ATGRToDate]>sapc.[ATGRToDate] or
				apxr.[ATGRThisYear]>sapc.[ATGRThisYear] or
				apxr.[ATGRMonth]>sapc.[ATGRThisMonth] or
				apxr.[ALOToDate]>sapc.[ALOToDate] or
				apxr.[ALOThisYear]>sapc.[ALOThisYear] or
				apxr.[ALOMonth]>sapc.[ALOThisMonth])
				left outer join
				StageAPTGVenterraPropertyXMLReport_Errors ape on
				ape.[YMDIDFileLoaded]=@DateProcessed and ape.[ymdid]=apxr.[ymdid]
				and ape.propertyid=apxr.propertyid
				where ape.[propertyID] is null)
				print '['+cast(@countOf as varchar(3))+'] Counts Bad Data In This Month Data!'

				set @MessageTxt=@MessageTxt+char(13)+'['+cast(@countOf as varchar(3))+'] Counts Bad Data In This Month Data!'
				set @SendEmail=1
				insert into StageAPTGVenterraPropertyXMLReport_Errors
					([PropertyID]
					,[YMD]
					,[YMDID]
					,[AGGCToDate]
					,[AGGCThisYear]
					,[AGGCMonth]
					,[ATRToDate]
					,[ATRThisYear]
					,[ATRMonth]
					,[ATGRToDate]
					,[ATGRThisYear]
					,[ATGRMonth]
					,[ALOToDate]
					,[ALOThisYear]
					,[ALOMonth]
					,[YMDIDFileLoaded])
				Select sapc.[PropertyID]
				,sapc.[CurrentMonthDate]
				,sapc.[ThisMonthYMDID]
				,sapc.[AGGCToDate]
				,sapc.[AGGCThisYear]
				,sapc.[AGGCThisMonth]
				,sapc.[ATRToDate]
				,sapc.[ATRThisYear]
				,sapc.[ATRThisMonth]
				,sapc.[ATGRToDate]
				,sapc.[ATGRThisYear]
				,sapc.[ATGRThisMonth]
				,sapc.[ALOToDate]
				,sapc.[ALOThisYear]
				,sapc.[ALOThisMonth]
				,@DateProcessed
				from StageAPTGVenterraPropertyComplete sapc join 
				StageAPTGVenterraPropertyXMLReport apxr on apxr.propertyid=sapc.propertyid and
				apxr.ymdid=sapc.thismonthymdid and 
				(apxr.[AGGCToDate]>sapc.[AGGCToDate] or
				apxr.[AGGCThisYear]>sapc.[AGGCThisYear] or
				apxr.[AGGCMonth]>sapc.[AGGCThisMonth] or
				apxr.[ATRToDate]>sapc.[ATRToDate] or
				apxr.[ATRThisYear]>sapc.[ATRThisYear] or
				apxr.[ATRMonth]>sapc.[ATRThisMonth] or
				apxr.[ATGRToDate]>sapc.[ATGRToDate] or
				apxr.[ATGRThisYear]>sapc.[ATGRThisYear] or
				apxr.[ATGRMonth]>sapc.[ATGRThisMonth] or
				apxr.[ALOToDate]>sapc.[ALOToDate] or
				apxr.[ALOThisYear]>sapc.[ALOThisYear] or
				apxr.[ALOMonth]>sapc.[ALOThisMonth])
				left outer join
				StageAPTGVenterraPropertyXMLReport_Errors ape on
				ape.[YMDIDFileLoaded]=@DateProcessed and ape.[ymdid]=apxr.[ymdid]
				and ape.propertyid=apxr.propertyid
				where ape.[propertyID] is null

			End
		End
	-- Now update data and then update data, this month data has been loaded if 
		if @ThisMonthData=0
			INSERT INTO StageAPTGVenterraPropertyXMLReport
			(YMDID
			,YMD
			,PropertyID
			,[AGGCToDate]
			,[AGGCThisYear]
			,[AGGCMonth]
			,[ATRToDate]
			,[ATRThisYear]
			,[ATRMonth]
			,[ATGRToDate]
			,[ATGRThisYear]
			,[ATGRMonth]
			,[ALOToDate]
			,[ALOThisYear]
			,[ALOMonth])
			SELECT
			sapc.ThisMonthYMDID
			,sapc.CurrentMonthDate
			,sapc.PropertyID
			,sapc.[AGGCToDate]
			,sapc.[AGGCThisYear]
			,sapc.[AGGCThisMonth]
			,sapc.[ATRToDate]
			,sapc.[ATRThisYear]
			,sapc.[ATRThisMonth]
			,sapc.[ATGRToDate]
			,sapc.[ATGRThisYear]
			,sapc.[ATGRThisMonth]
			,sapc.[ALOToDate]
			,sapc.[ALOThisYear]
			,sapc.[ALOThisMonth]
			FROM StageAPTGVenterraPropertyComplete sapc
			where ThisMonthYMDID=@ThisMonthYMDID
		else
		Begin
		-- 1st update
			UPDATE StageAPTGVenterraPropertyXMLReport SET
				[AGGCToDate]=sapc.[AGGCToDate],
				[AGGCThisYear]=sapc.[AGGCThisYear],
				[AGGCMonth]=sapc.[AGGCThisMonth],
				[ATRToDate]=sapc.[ATRToDate],
				[ATRThisYear]=sapc.[ATRThisYear],
				[ATRMonth]=sapc.[ATRThisMonth],
				[ATGRToDate]=sapc.[ATGRToDate],
				[ATGRThisYear]=sapc.[ATGRThisYear],
				[ATGRMonth]=sapc.[ATGRThisMonth],
				[ALOToDate]=sapc.[ALOToDate],
				[ALOThisYear]=sapc.[ALOThisYear],
				[ALOMonth]=sapc.[ALOThisMonth]
			FROM StageAPTGVenterraPropertyXMLReport apxr
			JOIN
				StageAPTGVenterraPropertyComplete sapc  
			ON
				apxr.propertyid=sapc.propertyid and
					apxr.YMDID=sapc.ThisMonthYMDID 
		-- don't add error records
			left outer join StageAPTGVenterraPropertyXMLReport_Errors apxre
				on 	apxr.propertyid=apxre.propertyid and
					apxr.YMDID=apxre.YMDID and apxre.YMDIDFileLoaded=@DateProcessed
			where apxre.propertyid is null
		-- now add new ones
			INSERT INTO StageAPTGVenterraPropertyXMLReport
			(YMDID
			,YMD
			,PropertyID
			,[AGGCToDate]
			,[AGGCThisYear]
			,[AGGCMonth]
			,[ATRToDate]
			,[ATRThisYear]
			,[ATRMonth]
			,[ATGRToDate]
			,[ATGRThisYear]
			,[ATGRMonth]
			,[ALOToDate]
			,[ALOThisYear]
			,[ALOMonth])
			SELECT
			sapc.ThisMonthYMDID
			,sapc.CurrentMonthDate
			,sapc.PropertyID
			,sapc.[AGGCToDate]
			,sapc.[AGGCThisYear]
			,sapc.[AGGCThisMonth]
			,sapc.[ATRToDate]
			,sapc.[ATRThisYear]
			,sapc.[ATRThisMonth]
			,sapc.[ATGRToDate]
			,sapc.[ATGRThisYear]
			,sapc.[ATGRThisMonth]
			,sapc.[ALOToDate]
			,sapc.[ALOThisYear]
			,sapc.[ALOThisMonth]
			from StageAPTGVenterraPropertyComplete sapc
			left outer join StageAPTGVenterraPropertyXMLReport apxr
				on 	apxr.propertyid=sapc.propertyid and
					apxr.YMDID=sapc.ThisMonthYMDID 
			where apxr.propertyid is null
		end

		if @LastMonthData=0 -- last months not loaded yet
			INSERT INTO StageAPTGVenterraPropertyXMLReport
			(YMDID
			,YMD
			,PropertyID
			,[AGGCToDate]
			,[AGGCThisYear]
			,[AGGCMonth]
			,[ATRToDate]
			,[ATRThisYear]
			,[ATRMonth]
			,[ATGRToDate]
			,[ATGRThisYear]
			,[ATGRMonth]
			,[ALOToDate]
			,[ALOThisYear]
			,[ALOMonth])
			SELECT
			sapc.[LastMonthYMDID]
			,sapc.[LastMonthDate]
			,sapc.[PropertyID]
			,sapc.[AGGCToDate]
			,sapc.[AGGCThisYear]
			,sapc.[AGGCLastMonth]
			,sapc.[ATRToDate]
			,sapc.[ATRThisYear]
			,sapc.[ATRLastMonth]
			,sapc.[ATGRToDate]
			,sapc.[ATGRThisYear]
			,sapc.[ATGRLastMonth]
			,sapc.[ALOToDate]
			,sapc.[ALOThisYear]
			,sapc.[ALOLastMonth]
			FROM StageAPTGVenterraPropertyComplete sapc
			where sapc.LastMonthYMDID=@LastMonthYMDID
		else
		Begin
			UPDATE StageAPTGVenterraPropertyXMLReport SET
				[AGGCToDate]=sapc.[AGGCToDate],
				[AGGCThisYear]=sapc.[AGGCThisYear],
				[AGGCMonth]=sapc.[AGGCLastMonth],
				[ATRToDate]=sapc.[ATRToDate],
				[ATRThisYear]=sapc.[ATRThisYear],
				[ATRMonth]=sapc.[ATRLastMonth],
				[ATGRToDate]=sapc.[ATGRToDate],
				[ATGRThisYear]=sapc.[ATGRThisYear],
				[ATGRMonth]=sapc.[ATGRLastMonth],
				[ALOToDate]=sapc.[ALOToDate],
				[ALOThisYear]=sapc.[ALOThisYear],
				[ALOMonth]=sapc.[ALOLastMonth]
			FROM StageAPTGVenterraPropertyXMLReport apxr
			JOIN
				StageAPTGVenterraPropertyComplete sapc  
			ON
				apxr.propertyid=sapc.propertyid and
					apxr.YMDID=sapc.LastMonthYMDID 
			left outer join StageAPTGVenterraPropertyXMLReport_Errors apxre
				on 	apxre.propertyid=apxr.propertyid and
					apxr.YMDID=apxre.YMDID and apxre.YMDIDFileLoaded=@DateProcessed
			where apxre.propertyid is null

		end
		--select * from [dbo].[StageAPTGPropertyComplete]
		if @SendEmail=1
		BEGIN
			set @MessageTxt=@MessageTxt+char(13)+char(13)+'this is sent via Staging.dbo.pr_ProcessAPTGVenterraXML SP'
			set @SubjectTxt='Data Load Inconsistancies From Lease XML File'
			set @RecipientsTxt=(select emailrecipients from [DBAUtility].[dbo].[EmailRoles] where RoleObjectName='pr_ProcessAPTGXMLLeaseTable')
			IF len(@RecipientsTxt)>3
			BEGIN
				EXEC msdb.dbo.sp_send_dbmail
					@recipients				= @RecipientsTxt
					,@subject					= @SubjectTxt
					,@body						= @MessageTxt
					,@importance				= 'Normal'
					,@body_format				= 'TEXT'
			END
		END
		ELSE
		BEGIN
			Delete from ApartmentGuide.Fact.VenterraPropertyReport where YMD=@ThisMonthDate
				or YMD=@LastMonthDate
			Set identity_insert ApartmentGuide.Fact.VenterraPropertyReport on
			Insert Into ApartmentGuide.Fact.VenterraPropertyReport
				([Property_KeyID]
				,[PropertyID]
				,[YMD]
				,[YMDID]
				,[AGGCToDate]
				,[AGGCThisYear]
				,[AGGCMonth]
				,[ATRToDate]
				,[ATRThisYear]
				,[ATRMonth]
				,[ATGRToDate]
				,[ATGRThisYear]
				,[ATGRMonth]
				,[ALOToDate]
				,[ALOThisYear]
				,[ALOMonth])
			 select 
				[Property_KeyID]
				,[PropertyID]
				,[YMD]
				,[YMDID]
				,[AGGCToDate]
				,[AGGCThisYear]
				,[AGGCMonth]
				,[ATRToDate]
				,[ATRThisYear]
				,[ATRMonth]
				,[ATGRToDate]
				,[ATGRThisYear]
				,[ATGRMonth]
				,[ALOToDate]
				,[ALOThisYear]
				,[ALOMonth]
			From
				StageAPTGVenterraPropertyXMLReport
				where YMD=@ThisMonthDate
				or YMD=@LastMonthDate

			Set identity_insert ApartmentGuide.Fact.VenterraPropertyReport off

			Delete from StageAPTGVenterraPropertyXMLReport
				where ymd<@LastMonthDate
-- remove the complete table if no errors
			if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraPropertyComplete' and table_type='Base Table' and
			  table_schema='dbo')
				drop table [dbo].[StageAPTGVenterraPropertyComplete]
		END
	END
	if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraProperty' and table_type='Base Table' and
	  table_schema='dbo')
		drop table [dbo].[StageAPTGVenterraProperty]
	if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraTotalRequests' and table_type='Base Table' and
	  table_schema='dbo')
		drop table [dbo].[StageAPTGVenterraTotalRequests]
	if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraTotalGuideRequests' and table_type='Base Table' and
	  table_schema='dbo')
		drop table [dbo].[StageAPTGVenterraTotalGuideRequests]
	if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraGuestCards' and table_type='Base Table' and
		table_schema='dbo')
		drop table [dbo].[StageAPTGVenterraGuestCards]
	if exists(select 1 from information_schema.tables where table_name='StageAPTGVenterraLeasesFromOnlineSources' and table_type='Base Table' and
		table_schema='dbo')
		drop table [dbo].[StageAPTGVenterraLeasesFromOnlineSources]
done:
END
/*
use this to fix data

--SELECT * FROM dbo.StageAPTGVenterraPropertyXMLReport_Errors
--WHERE [YMDIDFileLoaded]=20090121
--AND [PropertyID]=13404
--
--SELECT * FROM dbo.StageAPTGVenterraPropertyXMLReport
--WHERE ymdid=20081231
--AND [PropertyID]=13404
--
----SELECT * FROM dbo.StageAPTGVenterraPropertyComplete
----WHERE [PropertyID]=13404

SELECT sre.propertyid

UPDATE dbo.StageAPTGVenterraPropertyXMLReport
SET aggctodate=sre.aggctodate
,aggcmonth=sre.aggcmonth
,atrtodate=sre.[ATRToDate]
,ATRMonth=sre.[ATRMonth]
,ATGRToDate=sre.[ATGRToDate]
,ATGRMonth=sre.[ATGRMonth]
,ALOToDate=sre.[ALOToDate]
,ALOMonth=sre.[ALOMonth]
FROM
dbo.StageAPTGVenterraPropertyXMLReport sr
JOIN (SELECT * FROM dbo.StageAPTGVenterraPropertyXMLReport_Errors
WHERE [YMDIDFileLoaded]=20090121 )sre
ON sre.propertyid=sr.propertyid
AND sr.ymdid=20081231

SElect sr.aggctodate,sre.aggctodate
,sr.aggcmonth,sre.aggcmonth
,sr.atrtodate,sre.[ATRToDate]
,sr.ATRMonth,sre.[ATRMonth]
,sr.ATGRToDate,sre.[ATGRToDate]
,sr.ATGRMonth,sre.[ATGRMonth]
,sr.ALOToDate,sre.[ALOToDate]
,sr.ALOMonth,sre.[ALOMonth]
FROM
dbo.StageAPTGVenterraPropertyXMLReport sr
JOIN (SELECT * FROM dbo.StageAPTGVenterraPropertyXMLReport_Errors
WHERE [YMDIDFileLoaded]=20090121 )sre
ON sre.propertyid=sr.propertyid
AND sr.ymdid=20081231
*/
--select * into apartmentguide.dbo.VenterraPropertyReport from dbo.StageAPTGVenterraPropertyXMLReport

GO
/****** Object:  StoredProcedure [dbo].[pr_ProcessAPTGYardiRentCafeManagementXML]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*************************************************
* HIST 00: Created by Clinton Woody 2013/05/20 # 12430
* HIST 01: 2013/08/24 Clinton Woody had to change estimated move date to nvarchar from datetime # 12430
* HIST 02: 2013/08/24 Clinton Woody had to change lead datetime date to nvarchar from datetime # 13804
* HIST 03: 2014/09/19 Clinton Woody had to change lead datetime date to moveindate and ymdid=date lead came in # 16825
* HIST 04: 2015/04/21 Clinton Woody removed property an dlisting id from rownumber so we get the top 1 property # 22821 
*  Takes Client Supplied XML Document and
*   Updates Reporting Table
*
* Test: exec [dbo].[pr_ProcessAPTGYardiRentCafeManagementXML]
select * from staging.YardiRentCafeDateRange

select datetime
,replace(datetime,'t',' ')
,cast(left(datetime,10) as datetime) 
from staging.YardiRentCafeLead where leadid is not null
select *  FROM ApartmentGuide.[fact].[YardiRentCafeManagementReport]

select * from #tmpYardi
*************************************************/
CREATE PROCEDURE [dbo].[pr_ProcessAPTGYardiRentCafeManagementXML]
AS 
BEGIN
    SET NOCOUNT ON;
    DECLARE @ymdid INT
       ,@YardiCode VARCHAR(8)
       ,@SendEmail INT;
    DECLARE @SubjectTxt VARCHAR(35)
       ,@RecipientsTxt VARCHAR(125)
       ,@MessageTxt VARCHAR(3000);
    DECLARE @propertyID CHAR(10)
       ,@PropertyName CHAR(35)
       ,@ManagementName CHAR(35)
       ,@ExternalID AS CHAR(20);
    DECLARE @datetouse CHAR(10);
    DECLARE @MissingProperties INT;
    DECLARE @MissingListings INT;
    DECLARE @fileName VARCHAR(500)
       ,@Query VARCHAR(1000);
	   
    SET @fileName = 'Yardi_Data_' + CONVERT(VARCHAR,GETDATE() - 1,112) + '.csv';
    SET @SendEmail = 0;

    SET @YMDID = (
                  SELECT    CAST(CONVERT(VARCHAR(8),DATEADD(day,-1,begindate),112) AS INT)
                  FROM      staging.[YardiRentCafeDateRange]
                 )

    BEGIN TRY
        DROP TABLE #tmpListings;
    END TRY
    BEGIN CATCH
    END CATCH
    
    BEGIN TRY
        DROP TABLE ##YardiInfo;
    END TRY
    BEGIN CATCH
    END CATCH

    BEGIN TRY
        DROP TABLE #tmpYardi;
    END TRY
    BEGIN CATCH
    END CATCH

    SELECT  propertyid
           ,PropertyName
           ,listingid
           ,externalpricecode
           ,externalid
           ,MgtCoName
    INTO    #tmpListings
    FROM    (
             SELECT propertyid
                   ,propertyname
                   ,listingid
                   ,externalpricecode
                   ,externalid
                   ,ListingTypeID
                   ,MgtCoName
                   ,ROW_NUMBER() OVER (PARTITION BY externalpricecode,externalid ORDER BY statusid DESC, ListingTypeID ASC) AS rownum
             FROM   apartmentguide.dbo.vw_alllistings
             WHERE  externalpricecode LIKE 'YardiRC%'
            ) vw
    WHERE   vw.rownum = 1;

--DECLARE @YardiCode VARCHAR(20);
    SET @YardiCode = 'YARDIRC';

-- this is the actual movein date not the lead created date, we will use the first day the lead came in as the lead date time
-- removed this because IF they don't put in a move in date it is 0001' AND we still want the lead
    --DELETE  FROM staging.[YardiRentCafeLead]
    --WHERE   LEFT(datetime,4) < '2013'

    SELECT  DATEADD(day,-1,sdd.begindate) AS DateOfData
           ,@YardiCode AS YardiCode
		   -- the movein date which is the lead datetime may not have been passed in but we don't want to lose the lead
           --,CAST(CONVERT(VARCHAR(8),ISNULL(CAST(LEFT(srl.datetime,10) AS DATETIME),DATEADD(day,-1,sdd.begindate)),112) AS INT) AS YMDID
		   ,CAST(CONVERT(VARCHAR(8),DATEADD(day,-1,sdd.begindate),112) AS INT) AS YMDID
           ,srm.name AS ManagementName
           ,srm.propertycount AS ManagementProperties
           ,srp.RDTID AS ExternalID
           ,dp.propertyid AS PropertyID
           ,dp.listingid
           ,srp.Name AS PropertyName
           ,srp.UniqueSessions
           ,srp.pageviews
           ,srl.leadid
           ,srl.customerid
           ,srl.UnitNumber
           ,srl.FirstName
           ,srl.LastName
           ,srl.AddressAll
           ,srl.Address1
           ,srl.Address2
           ,srl.city
           ,srl.State
           ,srl.postalcode
           ,srl.email
           ,srl.phone
           ,srl.screeningresponse
-- this is the moveindate not the leaddate
           ,CASE WHEN leadid IS NOT NULL THEN DATEADD(DAY,-1,GETDATE() - 1) end AS leaddatetime--CAST(LEFT(srl.datetime,10) AS DATETIME) AS leaddatetime
           ,CASE WHEN LEFT(srl.datetime,4)>'2010' AND leadid IS NOT null THEN Convert(VARCHAR(10),srl.datetime,112) WHEN leadid IS NOT null then 'Unknown MoveIn Date' ELSE '' end AS estimatedmovedate
           ,srl.message
           ,srl.visitedproperty
           ,srld.screened
           ,srld.Unscreened
    INTO    #tmpYardi
    FROM    staging.[YardiRentCafeDateRange] sdd
           ,staging.[YardiRentCafeManagement] srm
    LEFT OUTER JOIN staging.[YardiRentCafeproperty] srp
            ON srp.management_id = srm.management_id
    LEFT OUTER JOIN staging.[YardiRentCafeLeadData] srld
            ON srp.PropertyLoad_ID = srld.Property_id
    LEFT OUTER JOIN staging.[YardiRentCafeLead] srl
            ON srl.leaddata_id = srld.leaddata_id
    LEFT OUTER JOIN #tmpListings dp
            ON dp.externalid = srp.RDTId
    ORDER BY srm.Management_ID
           ,dp.propertyid;

-- update estimated movein date for leads where it has changed
    UPDATE  ApartmentGuide.[fact].[YardiRentCafeManagementReport]
    SET     estimatedmovedate = y.estimatedmovedate
    FROM    ApartmentGuide.[fact].[YardiRentCafeManagementReport] yrc
    JOIN    #tmpYardi y
            ON y.leadid = yrc.leadid
    --WHERE   yrc.leadid IS NOT NULL  

--SELECT ymdid,propertyid,listingid,leadid FROM #tmpYardi WHERE leadid=118658
--SELECT ymdid,propertyid,listingid,leadid FROM ApartmentGuide.[fact].[YardiRentCafeManagementReport] 

    DELETE  yc
    FROM    #tmpYardi yc
    JOIN    ApartmentGuide.[fact].[YardiRentCafeManagementReport] ycm
            ON yc.ymdid = ycm.ymdid
               AND yc.propertyid = ycm.propertyid
               AND yc.listingid = ycm.listingid
               AND yc.leadid = ycm.leadid
--SELECT leadid AS lead1,LeadDateTime,* FROM #tmpYardi
--WHERE leadid IS NOT NULL
--ORDER BY leadid
-- Remove leads already processed


    DELETE  yc
    FROM    #tmpYardi yc
    JOIN    ApartmentGuide.[fact].[YardiRentCafeManagementReport] ycm
            ON yc.leadid = ycm.leadid

    INSERT  INTO ApartmentGuide.[fact].[YardiRentCafeManagementReport]
            (dateofdata
            ,YardiCode
            ,ymdid
            ,ManagementName
            ,ManagementProperties
            ,ExternalID
            ,PropertyID
            ,listingid
            ,PropertyName
            ,UniqueSessions
            ,pageviews
            ,leadid
            ,customerid
            ,UnitNumber
            ,FirstName
            ,LastName
            ,AddressAll
            ,Address1
            ,Address2
            ,city
            ,State
            ,postalcode
            ,email
            ,phone
            ,screeningresponse
            ,leaddatetime
            ,estimatedmovedate
            ,message
            ,visitedproperty
            ,screened
            ,Unscreened)
            SELECT  DISTINCT 
					dateofdata
                   ,YardiCode
                   ,ymdid
                   ,ManagementName
                   ,ManagementProperties
                   ,ExternalID
                   ,PropertyID
                   ,ListingID
                   ,PropertyName
                   ,UniqueSessions
                   ,pageviews
                   ,leadid
                   ,customerid
                   ,UnitNumber
                   ,FirstName
                   ,LastName
                   ,AddressAll
                   ,Address1
                   ,Address2
                   ,city
                   ,State
                   ,postalcode
                   ,email
                   ,phone
                   ,screeningresponse
                   ,leaddatetime
                   ,estimatedmovedate
                   ,message
                   ,visitedproperty
                   ,screened
                   ,Unscreened
            FROM    #tmpYardi
            WHERE   Propertyid IS NOT NULL
--                    AND ISNULL(leaddatetime,'2013/05/23') < GETDATE();  -- cannot have a lead greater than today, if valid will add it tomorrow

    SET @MessageTxt = '';
-- properties not matched from yardi file to DPS

    SET @MissingProperties = (
                              SELECT    COUNT(1)
                              FROM      #tmpYardi
                              WHERE     propertyid IS NULL
                             )
    IF @MissingProperties > 0 
        BEGIN
            SET @sendemail = 1;
            SET @MessageTxt = '[' + CAST(@MissingProperties AS VARCHAR(8)) + '] Properties In Yardi XML File Not In DPS' + CHAR(13);
        END

    SET @MissingListings = (
                            SELECT  COUNT(1)
                            FROM    #tmpListings
                            WHERE   listingid NOT IN (SELECT DISTINCT
                                                                listingid
                                                      FROM      ApartmentGuide.[fact].[YardiRentCafeManagementReport])
                           )
    IF @MissingListings > 0 
        BEGIN
            SET @sendemail = 1;

            SET @MessageTxt = @MessageTxt + '[' + CAST(@MissingListings AS VARCHAR(8)) + '] Yardi Rent Cafe Properties In DPS Not In Yardi XML File' + CHAR(13) + CHAR(13);
        END

    --PRINT @MessageTxt;

    SELECT DISTINCT
            'Not Assoc to DPS' AS RecordType
           ,CAST(propertyid AS VARCHAR(9)) AS DPSPropertyID
           ,externalid
           ,propertyname
           ,ManagementName
           ,@MissingProperties AS TotalInType
    INTO    ##YardiInfo
    FROM    #tmpYARDI
    WHERE   propertyid IS NULL
    UNION
    SELECT DISTINCT --opl.listingid,						
            'Not In Yardi XML File' AS RecordType
           ,OP.PROPERTYID AS DPSPropertyID
           ,op.EXTERNALID
           ,op.propertyname
           ,op.MgtCoName
           ,@MissingListings AS TotalInType
    FROM    #tmpListings op
    WHERE   listingid NOT IN (SELECT DISTINCT
                                        listingid
                              FROM      ApartmentGuide.[fact].[YardiRentCafeManagementReport])
    ORDER BY TotalInType;
-- [dbo].[pr_ProcessAPTGYardiRentCafeManagementXML] 
    IF @SendEmail = 1
        AND (
             SELECT MAX(dateofdata)
             FROM   ApartmentGuide.[fact].[YardiRentCafeManagementReport]
            ) > '2013/06/01' 
        BEGIN
    ----------      
            SET @SubjectTxt = 'Data Load Inconsistancies From Yardi Rent Cafe XML File';
            SET @RecipientsTxt = (
                                  SELECT    emailrecipients
                                  FROM      [DBAUtility].[dbo].[EmailRoles]
                                  WHERE     RoleObjectName = 'pr_ProcessRDTXML'
                                 );
--            SET @RecipientsTxt = 'cwoody@primedia.com'
            SET @Query = 'SET NOCOUNT ON SELECT * from ##YardiInfo ORDER BY TotalInType,PropertyName SET NOCOUNT OFF';
            IF LEN(@RecipientsTxt) > 3 
                BEGIN
                    EXEC msdb.dbo.sp_send_dbmail 
                        @recipients = @RecipientsTxt
                       ,@subject = @SubjectTxt
                       ,@body = @MessageTxt
                       ,@importance = 'Normal'
                       ,@body_format = 'TEXT'
                       ,@query = @Query
                       ,@query_result_no_padding = 1
                       ,@query_result_width = 32767
                       ,@query_result_header = 1
                       ,@query_result_separator = '	'
                       ,@exclude_query_output = 0
                       ,@attach_query_result_as_file = 1
                       ,@query_attachment_filename = @fileName;
  
                END
        END
	--now cleanup staging tables
    BEGIN TRY
        DROP TABLE #tmpListings;
    END TRY
    BEGIN CATCH
    END CATCH
    
    BEGIN TRY
        DROP TABLE ##YardiInfo;
    END TRY
    BEGIN CATCH
    END CATCH

    BEGIN TRY
        DROP TABLE #tmpYardi;
    END TRY
    BEGIN CATCH
    END CATCH

END



GO
/****** Object:  StoredProcedure [dbo].[pr_ProcessPropertySolutionsManagementReport]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
*
* Name:	pr_ProcessPropertySolutionsManagementReport
*
* Desc:	
*
* Test:	exec [dbo].[pr_ProcessPropertySolutionsManagementReport]
*
* Note: Remove test for leads and site stats once we start getting Leads and Site Stats
*
* Hist:	01	06/24/2008	Clinton Woody		Initial Version
* Hist:	01	12/19/2008	Clinton Woody		removed Legacy Tables and useing new dimension tables
* Hist:	02	01/19/2011	Clinton Woody		Added Leads
* Hist:	03	01/21/2011	Clinton Woody		Added PSOLUTN2 as externalpricecode
* Hist:	04	05/23/2013	Clinton Woody		filtered out same leadid loaded day after day. # 12481
* Hist:	05	03/19/2014	Clinton Woody		Only pull leads for reserve now # 14965
*											<is_guestcard_lead>false</is_guestcard_lead>
* Hist: 06  10/14/2015  Julie DiPietro		Ticket #21108 added email alert when no leads
*										using leadid,datetime entered and email as criteria also use leaddatetime as ymdid
* Hist: 05  12/11/2015  Julie DiPietro      Ticket#21108 PS added date range to file; added date table

    SELECT  *
    from    #tmpPMSRecords
	select * FROM   dbo.StageAPTGPropertySolutionsManagement

	Something like "<is_guestcard_lead>true</is_guestcard_lead>" if the lead came through your check availability emails and "<is_guestcard_lead>false</is_guestcard_lead>"
******************************************************************************************/
CREATE PROCEDURE [dbo].[pr_ProcessPropertySolutionsManagementReport]
AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @YMDID INT;
    DECLARE @SubjectTxt VARCHAR(75);
    DECLARE @MessageTxt VARCHAR(4000);
    DECLARE @RecipientsTxt VARCHAR(400);
    DECLARE @SendEmail INT;
    DECLARE @PropertyID INT;
    DECLARE @ExternalID CHAR(20);
    DECLARE @PropertyName VARCHAR(255);
    DECLARE @VendorName CHAR(30);

    SET @SendEmail = 0;
    SET @SubjectTxt = 'Property Solutions Management Report Analysis';
    SET @MessageTxt = '';
-- do this because it loads yesterdays file with todays date	

    SET @YMDID = (
                  SELECT    CAST(CONVERT(VARCHAR(8),BeginDate,112) AS INT)
                  FROM      [dbo].[StageAPTGPropSolutionsDate]
                 );

    UPDATE  dbo.StageAPTGPropertySolutionsManagement
    SET     ymdid = @YMDID;

    --UPDATE  dbo.StageAPTGPropertySolutionsManagement
    --SET     ymdid = (
    --                 SELECT CAST(CONVERT(VARCHAR(8),DATEADD(DAY,-1,CAST(ymdid AS VARCHAR(8))),112) AS INT)
    --                )
	
    --SET @YMDID = (
    --              SELECT TOP 1
    --                        YMDID
    --              FROM      dbo.StageAPTGPropertySolutionsManagement
    --             );

    BEGIN TRY
        DROP TABLE #tmpOraclePropListings;
    END TRY	
    BEGIN CATCH
    END CATCH

    BEGIN TRY
        DROP TABLE #tmpPMSRecords;
    END TRY
    BEGIN CATCH
    END CATCH

    SELECT  propertyid
           ,listingid
           ,PropertyName
           ,externalpricecode
           ,externalid
           ,ListingTypeID
           ,statusid
    INTO    #tmpOraclePropListings
    FROM    (
             SELECT propertyid
                   ,listingid
                   ,PropertyName
                   ,externalpricecode
                   ,externalid
                   ,ListingTypeID
                   ,statusid
                   ,ROW_NUMBER() OVER (PARTITION BY propertyid,listingid,externalpricecode,externalid ORDER BY statusid DESC, ListingTypeID ASC) AS rownum
             FROM   apartmentguide.dbo.vw_alllistings
             WHERE  externalpricecode LIKE 'PSOLUTN%'
            ) vw
    WHERE   vw.rownum = 1;
  
-- This is a test so we don't process until we start getting data

    SELECT  *
    INTO    #tmpPMSRecords
    FROM    (
             SELECT ISNULL(CAST(CONVERT(VARCHAR(8),CAST(leaddatetime AS DATETIME),112) AS INT),@YMDID) AS Ymdid
                   ,sam.ManagementID
                   ,sam.VendorManagementID
                   ,sam.VendorName
                   ,sam.PropertyCount
                   ,sap.VendorPropertyID
                   ,0 AS ApartmentGuidePropertyID --OPM.PropertyID AS ApartmentGuidePropertyID
                   ,0 AS ListingID --OPM.ListingID AS ListingID
                   ,sap.PropertyName
                   ,sap.UniqueSessions
                   ,sap.PageViews
                   ,sal.Unscreened
                   ,sal.Screened
                   ,sall.Leadid
                   ,sall.CustomerID
                   ,sall.UnitNumber
                   ,sall.FirstName
                   ,sall.LastName
                   ,sall.LeadAddress
                   ,sall.LeadStatus
                   ,sall.LeadEmail
                   ,sall.LeadPhone
                   ,sall.ScreeningResponse
                   ,sall.LeadDateTime
                   ,sall.EstimatedMoveDate
                   ,sall.LeadMessage
                   ,sall.VisitedProperty
                   ,ROW_NUMBER() OVER (PARTITION BY sam.ManagementID,sap.VendorPropertyID,sall.Leadid,sall.LeadDateTime ORDER BY sap.VendorPropertyID) AS rownum
             FROM   dbo.StageAPTGPropertySolutionsManagement sam
             LEFT OUTER JOIN dbo.StageAPTGPropertySolutionsProperty sap
                    ON sam.ManagementID = sap.ManagementID
             LEFT OUTER JOIN dbo.StageAPTGPropertySolutionsLeadData sal
                    ON sal.propertyID = sap.propertyid
             LEFT OUTER JOIN dbo.StageAPTGPropertySolutionsLead sall
                    ON sal.LeadData_ID = sall.LeadData_id
                       AND ISNULL(sall.IsGuestCard_Lead,'False') = 'False'
             --LEFT OUTER JOIN #tmpOraclePropListings OPM
             --       ON CAST(sap.VendorPropertyID AS VARCHAR(20)) = OPM.ExternalID
             
            ) a
    WHERE   rownum = 1;
-- multiple properties have the same external id ugghhh
    UPDATE  ps
    SET     ApartmentGuidePropertyID = opm.propertyid
           ,listingid = opm.listingid
    FROM    #tmpPMSRecords ps
    JOIN    #tmpOraclePropListings OPM
            ON CAST(ps.VendorPropertyID AS VARCHAR(20)) = OPM.ExternalID
               AND opm.statusid = 1;

    UPDATE  ps
    SET     ApartmentGuidePropertyID = opm.propertyid
           ,listingid = opm.listingid
    FROM    #tmpPMSRecords ps
    JOIN    #tmpOraclePropListings OPM
            ON CAST(ps.VendorPropertyID AS VARCHAR(20)) = OPM.ExternalID
               AND ps.listingid = 0;
		 
    IF NOT EXISTS ( SELECT TOP 1
                            *
                    FROM    #tmpPMSRecords ) 
        BEGIN
-- We still want to send Emails and Property Analysis
            SET @SendEmail = 1;
            SET @SubjectTxt = 'No Leads or Site Stats Sent For Property Solutions';
            SET @MessageTxt = 'No Leads or Site Stats Sent For Property Solutions' + CHAR(13) + CHAR(13);
            GOTO SendEmail;
        END


    DELETE  PMS
    FROM    #tmpPMSRecords pms
    JOIN    ApartmentGuide.dbo.PropertySolutionsManagementReport aps
            ON aps.ymdid = pms.ymdid
               AND aps.leadid = pms.leadid
               AND CAST(aps.LeadDateTime AS DATETIME) = pms.LeadDateTime
               AND aps.ApartmentGuidePropertyID = pms.ApartmentGuidePropertyID
               AND aps.ManagementID = pms.ManagementID
               AND aps.VendorManagementID = pms.VendorManagementID
               AND aps.VendorName = pms.VendorName
               AND aps.vendorpropertyid = pms.vendorpropertyid;

    INSERT  INTO ApartmentGuide.dbo.PropertySolutionsManagementReport
            (YMDID
            ,ManagementID
            ,VendorManagementID
            ,VendorName
            ,PropertyCount
            ,VendorPropertyID
            ,ApartmentGuidePropertyID
            ,Listingid
            ,PropertyName
            ,UniqueSessions
            ,PageViews
            ,Unscreened
            ,Screened
            ,Leadid
            ,CustomerID
            ,UnitNumber
            ,FirstName
            ,LastName
            ,LeadAddress
            ,LeadStatus
            ,LeadEmail
            ,LeadPhone
            ,ScreeningResponse
            ,LeadDateTime
            ,EstimatedMoveDate
            ,LeadMessage
            ,VisitedProperty)
            SELECT  YMDID
                   ,ManagementID
                   ,VendorManagementID
                   ,VendorName
                   ,PropertyCount
                   ,VendorPropertyID
                   ,ApartmentGuidePropertyID
                   ,listingid
                   ,PropertyName
                   ,UniqueSessions
                   ,PageViews
                   ,Unscreened
                   ,Screened
                   ,Leadid
                   ,CustomerID
                   ,UnitNumber
                   ,FirstName
                   ,LastName
                   ,LeadAddress
                   ,LeadStatus
                   ,LeadEmail
                   ,LeadPhone
                   ,ScreeningResponse
                   ,LeadDateTime
                   ,EstimatedMoveDate
                   ,LeadMessage
                   ,VisitedProperty
            FROM    #tmpPMSRecords
            WHERE   listingid > 0;

    SendEmail:

    IF CAST(GETDATE() - 1 AS DATE) <> (
                                       SELECT   CAST(MIN(LeadDateTime) AS DATE)
                                       FROM     #tmpPMSRecords
                                      ) 
        BEGIN 
            SET @SubjectTxt = @SubjectTxt + ', No Leads For Yesterday'
            SET @MessageTxt = @MessageTxt + 'No Property Solutions Leads for yesterday came in' + CHAR(13) + CHAR(10);
            SET @SendEmail = 1;
        END
        
    IF EXISTS ( SELECT  sap.VendorPropertyID
                FROM    dbo.StageAPTGPropertySolutionsProperty sap
                RIGHT OUTER JOIN #tmpOraclePropListings OPM
                        ON sap.VendorPropertyID = OPM.ExternalID
                WHERE   sap.VendorPropertyID = 0 ) 
        BEGIN
            DECLARE QuickChange CURSOR
            FOR
            SELECT  OPM.PROPERTYID
                   ,OPM.propertyname
                   ,OPM.ExternalID
            FROM    dbo.StageAPTGPropertySolutionsProperty sap
            RIGHT OUTER JOIN #tmpOraclePropListings OPM
                    ON sap.VendorPropertyID = OPM.ExternalID
            WHERE   sap.VendorPropertyID = 0
            ORDER BY propertyid DESC;
            OPEN QuickChange;
            SET @MessageTxt = @MessageTxt + 'DPS Properties Assigned To Property Solutions Not in Property Solutions' + CHAR(13) + CHAR(10);
            SET @MessageTxt = @MessageTxt + 'Property ID  External ID Oracle Property Name' + CHAR(13) + CHAR(10);
            FETCH NEXT FROM QuickChange INTO @PropertyID,@PropertyName,@ExternalID;
            WHILE @@Fetch_Status = 0 
                BEGIN
                    SET @MessageTxt = @MessageTxt + CAST(@PropertyId AS CHAR(10)) + ' ' + @ExternalID + ' ' + @PropertyName + CHAR(13) + CHAR(10);
                    FETCH NEXT FROM QuickChange INTO @PropertyID,@PropertyName,@ExternalID;
                END
            CLOSE QuickChange;
            DEALLOCATE QuickChange;
            SET @SendEmail = 1;
        END

    IF EXISTS ( SELECT TOP 1
                        sam.VendorName
                FROM    dbo.StageAPTGPropertySolutionsManagement sam
                JOIN    dbo.StageAPTGPropertySolutionsProperty sap
                        ON sam.ManagementID = sap.ManagementID
                LEFT OUTER JOIN #tmpOraclePropListings OPM
                        ON sap.VendorPropertyID = OPM.ExternalID
                WHERE   OPM.propertyid IS NULL ) 
        BEGIN
            DECLARE PropertySolutions CURSOR
            FOR
            SELECT  LEFT(sam.VendorName,30) AS VendorName
                   ,sap.VendorPropertyID
                   ,sap.propertyname
            FROM    dbo.StageAPTGPropertySolutionsManagement sam
            JOIN    dbo.StageAPTGPropertySolutionsProperty sap
                    ON sam.ManagementID = sap.ManagementID
            LEFT OUTER JOIN #tmpOraclePropListings OPM
                    ON sap.VendorPropertyID = OPM.ExternalID
            WHERE   OPM.propertyid IS NULL
            ORDER BY sam.VendorName
                   ,sap.propertyid DESC;
            OPEN PropertySolutions;
            SET @MessageTxt = @MessageTxt + 'Property Solutions Properties Not in DPS' + CHAR(13) + CHAR(10);
            SET @MessageTxt = @MessageTxt + 'Vendor Name                    External ID  Property Name Not in DPS' + CHAR(13) + CHAR(10);
            FETCH NEXT FROM PropertySolutions INTO @VendorName,@PropertyID,@PropertyName;
            WHILE @@Fetch_Status = 0 
                BEGIN
                    SET @MessageTxt = @MessageTxt + @VendorName + ' ' + CAST(@PropertyId AS CHAR(10)) + ' ' + @PropertyName + CHAR(13) + CHAR(10);
                    FETCH NEXT FROM PropertySolutions INTO @VendorName,@PropertyID,@PropertyName;
                END
            CLOSE PropertySolutions;
            DEALLOCATE PropertySolutions;
            SET @SendEmail = 1;
        END
    IF @SendEmail = 1 
        BEGIN
            SET @RecipientsTxt = (
                                  SELECT    emailrecipients
                                  FROM      [DBAUtility].[dbo].[EmailRoles]
                                  WHERE     RoleObjectName = 'pr_ProcessPropertySolutionsManagementReport'
                                 );
            IF LEN(@RecipientsTxt) > 3 
                BEGIN
                    EXEC msdb.dbo.sp_send_dbmail 
                        @recipients = @RecipientsTxt
                       ,@subject = @SubjectTxt
                       ,@body = @MessageTxt
                       ,@importance = 'Normal'
                       ,@body_format = 'TEXT';
                END
        END

    BEGIN TRY
        DROP TABLE #tmpOraclePropListings;
    END TRY	
    BEGIN CATCH
    END CATCH
    
    BEGIN TRY
        DROP TABLE #tmpPMSRecords;
    END TRY	
    BEGIN CATCH
    END CATCH
END


GO
/****** Object:  StoredProcedure [dbo].[pr_ProcessStagedParsedData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[pr_ProcessStagedParsedData] (
    @ProfileName VARCHAR(50))
/*****************************************************************
* HIST 00: Written by Clinton Woody 12/05/2007
*
*  Moves Web Log Parsed Data to Product DB's
*
*   looks for ProfileID =0 or 99, Profile represents Product
*    1= Aptg, 2= New Homes, 3= Autos
*
*
*	History:
*	01	12/05/2007	Clinton Woody		Initial Version
*
*	02	12/05/2007	David McFarland		Modified to pass profile name instead of id
*
*	03   06/13/2008 Clinton Woody		put begin try/catch around drop table
*	04   12/19/2008 Clinton Woody		allow for multiple DCSIDs/Profile Names
*	05   07/21/2009 Clinton Woody		push new tags if not in dimension measure types
*	06   09/16/2009 Clinton Woody		Added Update of YMDIDToMart for Marting Purposes
*	07   06/07/2010 Clinton Woody		Added Destination Database to use so multiple profile ids
*										can go to same database numera # 870
*	08   08/19/2011 Clinton Woody		add autotagging here so we can use it moving forward #6179
*	09   02/28/2012 Clinton Woody		add x-factor big int and subprofileid
*	10   08/10/2012 Clinton Woody		saved on profile id 50,51,52 for autotagging.
*	11   08/23/2012 Clinton Woody		added ag android profileid 54
*	12   09/14/2012 Clinton Woody		had to treat rentcom differently as not to eliminate measures
*	13   10/17/2012 Clinton Woody		added all measuretypes to rent.com and added nolock # 10630
*	14   02/14/2013 Clinton Woody		Changed AutoTagging going into WebParsedData to WebParsedDataDaily # 11673
*										also used DestinationDatabase from DimensionProifles to select profiles to move
*	15   03/16/2016 Clinton Woody		Removed order by and changed sort to temp db = on # 
	also added logging
*	16   03/28/2016 Clinton Woody		2016/03/28 add zutron push to rentpatd fact.zutronparseddata #22532
	SELECT * FROM DBAUtility.dbo.Logging_StoredProcs where procname like 'dbo.pr_processstaged%' order by id desc
******************************************************************/		
--	exec pr_ProcessStagedParsedData 'AutoTagging'
AS 
SET NOCOUNT ON

BEGIN
	-- declare @ProfileName varchar(50)
	-- set @ProfileName = 'ApartmentGuide'
-- Destination Database =
    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
       ,@ProcedureName VARCHAR(128)
    DECLARE @ymdid INT;
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
    SET @ProcedureName = 'dbo.pr_ProcessStagedParsedData ' + @ProfileName
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = @ProcedureName
       , -- varchar(128)
        @StepName = 'Start Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Start Procedure' -- varchar(500)
    SET @TrackDate = GETDATE()

    DECLARE @StrSQL VARCHAR(4000)
    DECLARE @ProfileID INT
    DECLARE @ProfileList VARCHAR(200)
    DECLARE @DestinationDatabase VARCHAR(50)
    DECLARE @DBExist INT
    SET @DBExist = 1
    IF @ProfileName = 'Zutron' 
        BEGIN
            SET @YMDID = (
                          SELECT TOP 1
                                    ymdid
                          FROM      dbo.ParsedData
                          WHERE     profileid = 90
                         )
            IF EXISTS ( SELECT TOP 1
                                ymdid
                        FROM    rentpath.fact.zutronparseddata ) 
                BEGIN
                    DELETE  FROM rentpath.fact.zutronparseddata
                    WHERE   ymdid = @ymdid;
                END          
            INSERT  INTO rentpath.fact.zutronparseddata
                    SELECT  *
                    FROM    dbo.ParsedData
                    WHERE   ProfileID = 90;
            GOTO doneit;
        END      
    IF @ProfileName = 'AutoTagging' 
        BEGIN
-- unlike the other parseddata tables this one currently contains the complete history of all AutoTagging WebSites.	
            IF NOT EXISTS ( SELECT TOP 1
                                    parseid
                            FROM    AutoTagging.dbo.WebParsedDataDaily
                            WHERE   ymdid IN (SELECT TOP 1
                                                        ymdid
                                              FROM      staging.dbo.parseddata) ) 
                BEGIN
                    TRUNCATE TABLE AutoTagging.dbo.WebParsedDataDaily

                    BEGIN TRY
                        DROP INDEX [idx_measuretypeDaily] ON autotagging.[dbo].[WebParsedDataDaily]
                    END TRY
                    BEGIN CATCH
                    END CATCH	

                    BEGIN TRY                    
                        DROP INDEX [idx_parseidDaily] ON autotagging.[dbo].[WebParsedDataDaily]
                    END TRY
                    BEGIN CATCH
                    END CATCH	

                    BEGIN TRY                    
                        DROP INDEX [idx_ProfileIDDaily] ON autotagging.[dbo].[WebParsedDataDaily]
                    END TRY
                    BEGIN CATCH
                    END CATCH	
                    
                    INSERT  INTO AutoTagging.dbo.WebParsedDataDaily
                            (ParseID
                            ,ProfileID
                            ,YMDID
                            ,EventDate
                            ,MeasureType
                            ,Measure
                            ,subProfileid)
                            SELECT  ParseID
                                   ,ProfileID
                                   ,YMDID
                                   ,EventDate
                                   ,MeasureType
                                   ,Measure
                                   ,SubProfileID
                            FROM    dbo.ParsedData WITH (NOLOCK)
                            WHERE   profileid IN (SELECT    profileid
                                                  FROM      dimensionprofiles
                                                  WHERE     destinationdatabase = 'AutoTagging')
                    SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE());
                    EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                        @DatabaseName = @DatabaseName
                       , -- varchar(128)
                        @ProcName = @ProcedureName
                       , -- varchar(128)
                        @StepName = 'Insert AutoTagging parsedData'
                       , -- varchar(128)
                        @VariableStates = ''
                       , -- varchar(500)
                        @LengthInSeconds = @LengthInSeconds
                       , -- int
                        @Comments = '' -- varchar(500);
                    SET @TrackDate = GETDATE();

                    CREATE NONCLUSTERED INDEX [idx_measuretypeDaily] ON autotagging.[dbo].[WebParsedDataDaily] 
                    (
                    [MeasureType] ASC
                    )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = ON, 
                    IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, 
                    ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

                    CREATE NONCLUSTERED INDEX [idx_parseidDaily] ON autotagging.[dbo].[WebParsedDataDaily] 
                    (
                    [ParseID] ASC
                    )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = ON,
                    IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, 
                    ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]

                    CREATE NONCLUSTERED INDEX [idx_ProfileIDDaily] ON autotagging.[dbo].[WebParsedDataDaily] 
                    (
                    [ProfileID] ASC
                    )WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = ON,
                    IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
                    SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
                    EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                        @DatabaseName = @DatabaseName
                       , -- varchar(128)
                        @ProcName = @ProcedureName
                       , -- varchar(128)
                        @StepName = 'Create AutoTagging Indexes'
                       , -- varchar(128)
                        @VariableStates = ''
                       , -- varchar(500)
                        @LengthInSeconds = @LengthInSeconds
                       , -- int
                        @Comments = '' -- varchar(500)
                    SET @TrackDate = GETDATE()

                END
        END			
    ELSE 
        BEGIN
            BEGIN TRY
                SET @StrSQL = 'Truncate Table [' + @ProfileName + '].[dbo].[ParsedData] ' + CHAR(13)
                EXEC (@StrSQL)
            END TRY
            BEGIN CATCH
                SET @DBExist = 0
                SET @StrSQL = 'Create Table [' + @ProfileName + '].[dbo].[ParsedData] (' + CHAR(13)
                SET @StrSQL = @StrSQL + '[ParseID] [bigint] NOT NULL,' + CHAR(13)
                SET @StrSQL = @StrSQL + '[ProfileID] [int] NOT NULL DEFAULT ((0)),' + CHAR(13)
                SET @StrSQL = @StrSQL + '[YMDID] [int] NOT NULL,' + CHAR(13)
                SET @StrSQL = @StrSQL + '[EventDate] [datetime] NOT NULL,' + CHAR(13)
                SET @StrSQL = @StrSQL + '[MeasureType] [varchar](50) NOT NULL,' + CHAR(13)
                SET @StrSQL = @StrSQL + '[Measure] [varchar](7000) NOT NULL,' + CHAR(13)
                SET @StrSQL = @StrSQL + '[SubProfileID] [tinyint] NOT NULL DEFAULT ((0)),' + CHAR(13)
                SET @StrSQL = @StrSQL + ') on [Primary]' + CHAR(13)
                EXEC(@StrSQL)
            END CATCH
            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE());
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = 'Truncate/Create  parsedData'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500);
            SET @TrackDate = GETDATE();
          
            IF @DBexist = 1 
                BEGIN
                    BEGIN TRY
                        SET @StrSQL = 'Drop INDEX [idx#MeasureType] ON [' + @ProfileName + '].[dbo].[ParsedData]'
                        EXEC(@StrSQL)
                    END TRY
                    BEGIN CATCH
                    END CATCH
                    BEGIN TRY
                        SET @StrSQL = 'Drop INDEX [idx#ParseID] ON [' + @ProfileName + '].[dbo].[ParsedData]'
                        EXEC(@StrSQL)
                    END TRY
                    BEGIN CATCH
                    END CATCH
                    SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE());
                    EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                        @DatabaseName = @DatabaseName
                       , -- varchar(128)
                        @ProcName = @ProcedureName
                       , -- varchar(128)
                        @StepName = 'Drop Indexes on parsedData'
                       , -- varchar(128)
                        @VariableStates = ''
                       , -- varchar(500)
                        @LengthInSeconds = @LengthInSeconds
                       , -- int
                        @Comments = '' -- varchar(500);
                    SET @TrackDate = GETDATE();                  
                END
            IF @Profilename = 'RentCom' 
                BEGIN
                    SET @StrSQL = 'INSERT INTO [' + @ProfileName + '].[dbo].[ParsedData] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	([ParseID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[ProfileID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[YMDID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[EventDate] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[MeasureType] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[Measure] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[SubProfileID] )' + CHAR(13)
                    SET @StrSQL = @strSQL + '	SELECT ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	[ParseID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[ProfileID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[YMDID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[EventDate] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[MeasureType] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[Measure] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[SubProfileID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	FROM ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	[dbo].[ParsedData] with (nolock) ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	WHERE ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	[ProfileID] in (SELECT profileid FROM dimensionprofiles WHERE destinationdatabase=''' + @ProfileName + ''')' + CHAR(13)
                     --SET @StrSQL = @strSQL + '	ORDER BY [ParseID]' + CHAR(13)
                END
            ELSE 
                BEGIN
                    SET @StrSQL = 'INSERT INTO [' + @ProfileName + '].[dbo].[ParsedData] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	([ParseID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[ProfileID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[YMDID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[EventDate] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[MeasureType] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[Measure] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[SubProfileID] )' + CHAR(13)
                    SET @StrSQL = @strSQL + '	SELECT ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	[ParseID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[ProfileID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[YMDID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[EventDate] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[MeasureType] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[Measure] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	,[SubProfileID] ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	FROM ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	[dbo].[ParsedData]  with (nolock)' + CHAR(13)
                    SET @StrSQL = @strSQL + '	WHERE ' + CHAR(13)
                    SET @StrSQL = @strSQL + '	[ProfileID] in (SELECT profileid FROM dimensionprofiles WHERE destinationdatabase=''' + @ProfileName + ''')' + CHAR(13)
                    --SET @StrSQL = @strSQL + '	and ([MeasureType] in (select [MeasureType] from [dbo].[DimensionMeasureTypes] ' + CHAR(13)
                    --SET @StrSQL = @strSQL + '	WHERE ' + CHAR(13)
                    --SET @StrSQL = @strSQL + '	[IsExcluded] =0 )' + CHAR(13)
                    --SET @StrSQL = @strSQL + '	OR ( measuretype NOT IN (select [MeasureType] from [dbo].[DimensionMeasureTypes])' + CHAR(13)
                    --SET @StrSQL = @strSQL + '   AND measuretype NOT IN (select [MeasureType] from [dbo].[InvalidDimensionMeasureTypes])) )' + CHAR(13)
                    --SET @StrSQL = @strSQL + '	ORDER BY [ParseID]' + CHAR(13)
                END
--PRINT @strSQL
            EXEC (@strSQL)
            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE());
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = 'Insert parsedData'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500);
            SET @TrackDate = GETDATE();
	--	set @StrSQL='CREATE NONCLUSTERED INDEX [idx#MeasureType] ON ['+@ProfileName+'].[dbo].[ParsedData]  ('+ char(13)

            SET @StrSQL = 'CREATE NONCLUSTERED INDEX [idx#MeasureType] ON [' + @ProfileName + '].[dbo].[ParsedData]  (' + CHAR(13)
            SET @StrSQL = @StrSQL + '[MeasureType] ASC' + CHAR(13)
            SET @StrSQL = @StrSQL + ')WITH (PAD_INDEX  = OFF' + CHAR(13)
            SET @StrSQL = @StrSQL + ', STATISTICS_NORECOMPUTE  = OFF' + CHAR(13)
            SET @StrSQL = @StrSQL + ', SORT_IN_TEMPDB = ON' + CHAR(13)
            SET @StrSQL = @StrSQL + ', IGNORE_DUP_KEY = OFF' + CHAR(13)
            SET @StrSQL = @StrSQL + ', DROP_EXISTING = OFF' + CHAR(13)
            SET @StrSQL = @StrSQL + ', ONLINE = OFF' + CHAR(13)
            SET @StrSQL = @StrSQL + ', ALLOW_ROW_LOCKS  = ON' + CHAR(13)
            SET @StrSQL = @StrSQL + ', ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
	--PRINT @StrSQL
            EXEC (@StrSQL);
            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE());
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = 'Create Index IDX MeasureType On parsedData'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500);
            SET @TrackDate = GETDATE();

	--	set @StrSQL='CREATE NONCLUSTERED INDEX [idx#ParseID] ON ['+@ProfileName+'].[dbo].[ParsedData]  ('+ char(13)
            SET @StrSQL = 'CREATE NONCLUSTERED INDEX [idx#ParseID] ON [' + @ProfileName + '].[dbo].[ParsedData]  (' + CHAR(13)
            SET @StrSQL = @StrSQL + '[ParseID] ASC' + CHAR(13)
            SET @StrSQL = @StrSQL + ')WITH (PAD_INDEX  = OFF' + CHAR(13)
            SET @StrSQL = @StrSQL + ', STATISTICS_NORECOMPUTE  = OFF' + CHAR(13)
            SET @StrSQL = @StrSQL + ', SORT_IN_TEMPDB = On' + CHAR(13)
            SET @StrSQL = @StrSQL + ', IGNORE_DUP_KEY = OFF' + CHAR(13)
            SET @StrSQL = @StrSQL + ', DROP_EXISTING = OFF' + CHAR(13)
            SET @StrSQL = @StrSQL + ', ONLINE = OFF' + CHAR(13)
            SET @StrSQL = @StrSQL + ', ALLOW_ROW_LOCKS  = ON' + CHAR(13)
            SET @StrSQL = @StrSQL + ', ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]'
	--PRINT @StrSQL
            EXEC (@StrSQL)
            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE());
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = 'Create Index IDX ParseID On parsedData'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500);
            SET @TrackDate = GETDATE();

        END
	
    UPDATE  [dbo].[DimensionProfiles]
    SET     [YMDIDToMart] = CAST(CONVERT(VARCHAR(8),GETDATE() - 1,112) AS INT)
    WHERE   [DestinationDatabase] = @ProfileName	

    SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE());
    EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = @ProcedureName
       ,@StepName = 'Finished parsedData'
       ,@VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'completed' -- varchar(500);
    SET @TrackDate = GETDATE();

    doneit:
END



GO
/****** Object:  StoredProcedure [dbo].[pr_RemoveOldArchivedParsedData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[pr_RemoveOldArchivedParsedData] 
( @DaysOld        int = 40)
/*****************************************************************
* HIST 00: Written by Clinton Woody 10/02/2010
* HIST 01: Clinton Woody 11/30/2010 changed rows to 1000000 per David's analysis for best performance
* HIST 02: Clinton Woody 06/08/2011 removed test for saved data in other archived db tables Numera # 5209
* HIST 03: Clinton Woody 03/12/2012	disabled deleting until USNORTBI can catch up
* HIST 04: John Brennan 10/04/2012	same as above - changed to 150 days
* HIST 05: John Brennan 01/15/2013	same as above - changed to 300 days
* HIST 06: John Brennan 04/08/2013	set back to 40 day 
* Hist 07: John Brennan 04/16/2013  changed to point to ArchiveParsedData table on new ArchivedStaging DB
*
*  ReMoves OldParseData from ARchived ParsedData
*		 was part of [pr_ArchiveStagedParsedData] but moved it out as it was causing issues because of file size
*
* exec [dbo].[pr_RemoveOldArchivedParsedData] 70
******************************************************************/		
AS
SET NOCOUNT ON

BEGIN
--DECLARE @DaysOld INT
--SET @DaysOld=70
	declare @YMDID INT,@YMDIDToDelete int
	DECLARE @LogicalFileName sysname
-- if multiple YMDID's this will fail which is a good thing
	set @YMDID=(select distinct YMDID from [dbo].[ParsedData])

	SET @YMDIDToDelete=CAST(CONVERT(VARCHAR(8),GETDATE()-@DaysOld,112) AS INT)
--PRINT @YMDIDToDELETE
--goto doneit
/*
	BEGIN Try	
		CREATE NONCLUSTERED INDEX [idx_parseid] ON [dbo].[ParsedData] 
		([ParseID] ASC) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF
		, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF
		, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY];
	END TRY
	BEGIN CATCH
	END CATCH

	begin try
		CREATE NONCLUSTERED INDEX [idx_MeasureType] ON [dbo].[ParsedData] 
		(
			[MeasureType] ASC
		)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF
		, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF
		, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
	END TRY
	BEGIN CATCH
	END catch
*/
-- kept this in original SP	 
	DECLARE @RowsAffected int
	SET @RowsAffected = 1
	
 ---- ensure we have backed up to individual product lines
	--IF EXISTS(SELECT TOP 1 parseid FROM ArchivedStaging.dbo.NewHomeGuideArchivedParsedData
	--WHERE ymdid=@YMDIDToDelete)
	--BEGIN

		SET @RowsAffected = 1
		
		WHILE @RowsAffected > 0
		BEGIN
			DELETE TOP (1000000)
			 FROM [ArchivedStaging].[dbo].[ArchivedParsedData]
				WHERE ymdid<=@YMDIDToDelete
			SET @RowsAffected = @@ROWCOUNT
		END
	--END
doneit:	
END


GO
/****** Object:  StoredProcedure [dbo].[pr_TruncateServiceCheckListTmp]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[pr_TruncateServiceCheckListTmp] 
(@DateSelected varchar(20) OUTPUT )
/*****************************************************************
* HIST 00: Written by Richard Chen 12/07/2010
*
*  Truncate [dbo].[ServiceChecklistTemp](
*  exec [dbo].[pr_TruncateServiceCheckListTmp]
******************************************************************/		
AS
SET NOCOUNT ON

BEGIN
     TRUNCATE TABLE [dbo].[ServiceChecklistTemp]
     SELECT @DateSelected=CONVERT(VARCHAR(10),GETDATE()-300,101)+' '+ CONVERT(VARCHAR(8),GETDATE()-300,114)
END


GO
/****** Object:  StoredProcedure [dbo].[upd_ReportServerConvCheckedOut]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[upd_ReportServerConvCheckedOut]
       @CheckOutType int = 1,
       @ConvertID int,
       @CheckedOutUser varchar(65)
AS
/******************************************************************************************
* Name:	upd_ReportServerConvCheckedOut
* -----------------------------------------------------------------------------------------
* Desc:	Updates ReportServerConversion table when a report is being worked on
* -----------------------------------------------------------------------------------------
* Test:	EXEC upd_ReportServerConvCheckedOut 1,0,'PRM/MPollard'
* -----------------------------------------------------------------------------------------
* History:	
* 01   20121205     Mary Pollard        Initial Version
******************************************************************************************/
SET NOCOUNT ON

------------------------------------------------------------------
--- Declare & Set Variables
------------------------------------------------------------------
DECLARE @curDate datetime

SELECT @curDate = GETDATE()

    ------------------------------------------------------------------
    --- Update the record to "hecked out"
    --- Can only check out if it isn't checked out yet
    ------------------------------------------------------------------
    IF @CheckOutType = 1 --->Check out
    BEGIN
        UPDATE Staging.dbo.ReportServerConversion
        SET    CheckedOutBy = @CheckedOutUser,
               CheckedOutDate = @curDate
        WHERE  ConvertID = @ConvertID
        AND    CheckedOutBy IS NULL
    END

    ------------------------------------------------------------------
    --- Clear the "checked out" record
    --- Can only unheck out if it is checked out by the user already
    ------------------------------------------------------------------
    IF @CheckOutType = 2 --->UnCheck out
    BEGIN
        UPDATE Staging.dbo.ReportServerConversion
        SET    CheckedOutBy = NULL,
               CheckedOutDate = NULL
        WHERE  ConvertID = @ConvertID
        AND    CheckedOutBy = @CheckedOutUser
    END



GO
/****** Object:  StoredProcedure [Fact].[pr_CopyParseDataByHourToParsedData]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Clinton Woody
-- Create date: 2011/01/13
-- Hist 01: 2011/01/18	Clinton Woody	dropped and recreate indexes for performance issues
-- Hist 02: 2011/01/19	Clinton Woody	fixed drop index cidx
-- Hist 03: 2011/01/28	Clinton Woody	changed clustered index on profileid to nonclustered
-- Hist 04: 2011/01/31	Clinton Woody	changed nonclustered index on profileid to clustered
-- Hist 05: 2012/01/10	Clinton Woody	added flag to process data even if we don't have all 24 hours worth
-- Hist 06: 2012/03/01	Clinton Woody	made force failure error more verbose to identify while failing
-- Hist 07:	Clinton Woody 2012/03/01    truncate parseddatabyhour after copying it to parseddata # 8443
-- Hist 08:	Clinton Woody 2012/03/12    adjust hours to process based on DST # 8600
-- Hist 09:	Clinton Woody 2012/08/21    change copy from parseddatabyhour to rename # 10165
-- Hist 10:	Clinton Woody 2012/08/21    change counting logfiles processed using left parseid,10 # 10630
-- Hist 11: John Cox      2013/02/25    Add Index on MeasureType including ParseID and ProfileID
-- Hist 11: Clinton Woody 2013/03/10    Adjust for Spring DST # 11845
-- Hist 12: JC/CW         2013/04/23    Added Custom Measure Type tag generation #12200
-- Hist 13: Clinton Woody 2014/01/09    Add Portal which uses UserID instead of Listingid # 14285
-- Hist 14: Clinton Woody 2014/02/24    Add CustomMeasureTags to Fire for Dev and QA sites # 14599
-- Hist 15: Clinton Woody 2014/02/26    Removed this code CustomMeasureTags as it has to be in the base table  # 14599
-- Hist 16: Joe Evans 2014/03/14	    Commented out idx_MeasureType index, and updated idx_MeasureProfileParse by adding includes
-- Hist 17: Clinton Woody 2015/02/23	moved parseddata to filegroup PTableSpace and index to   PIndexSpace #18390
-- Hist 18: Clinton Woody 2015/04/07	moved parseddata to filegroup JTestTableSpace and index to   PIndexSpace #18390
-- Hist 19: Clinton Woody 2015/04/09	moved parseddata to filegroup E5PTableSpace/E5PindexSpace on New Raid 10 e:\asstdblun5 PIndexSpace #18390
-- Note: this moves the data from the ParseWebbyhour table to the ParsedData table for marting purposes
-- exec [Fact].[pr_CopyParseDataByHourToParsedData]
-- select * from ApartmentGuide.fact.ApartmentGuideCallTrend where ymdid=20080415

-- parsed DATA uses PRIMARY FOR PRIOR TO March 7th AND THEN ON March 9th AND 10th
-- parsed DATA uses ptablespace ON March 8 AND THEN again starting ON March 11
-- parsed DATA BY HOUR uses ptablespace ON March 8 AND THEN again starting ON March 11
-- =============================================
CREATE PROCEDURE [Fact].[pr_CopyParseDataByHourToParsedData] (
    @ProcessShortData TINYINT = NULL)
AS 
BEGIN
    SET NOCOUNT ON;

    DECLARE @TrackDate DATETIME
       ,@LengthInSeconds INT
       ,@DatabaseName VARCHAR(128)
       ,@ProcedureName VARCHAR(128)
                
    SET @TrackDate = GETDATE()
    SET @LengthInSeconds = 0
    SET @DatabaseName = DB_NAME()        
    SET @ProcedureName = 'Fact.pr_CopyParseDataByHourToParsedData'
		
    EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = @ProcedureName
       , -- varchar(128)
        @StepName = 'Start Procedure'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'Start Procedure' -- varchar(500)
    SET @TrackDate = GETDATE()

    DECLARE @YMDID INT;
    DECLARE @TodayYMDID INT;
    DECLARE @GMTOffset INT;
    DECLARE @HoursProcessed INT;
    DECLARE @ErrorMsg VARCHAR(200);
    DECLARE @Lines INT;
    DECLARE @SpringDSTYMDID INT;
    DECLARE @FallDSTYMDID INT;
    
    SET @TodayYMDID = CAST(CONVERT(VARCHAR(8),GETDATE(),112) AS INT);

    SET @YMDID = (
                  SELECT TOP 1
                            ymdid
                  FROM      staging.dbo.ParsedDatabyHour
                 );


    SET @GMTOffset = (
                      SELECT    gmtoffset
                      FROM      dbautility.Dimension.dates
                      WHERE     ymdid = @YMDID
                     );   

     --START OF DST IN Spring
    SET @SpringDSTYMDID = (
                           SELECT   MIN(ymdid)
                           FROM     DBAUtility.Dimension.Dates
                           WHERE    GMTOffset = -4
                                    AND Year = LEFT(@YMDID,4)
                          )
 
 -- start of DST in Fall
    SET @FallDSTYMDID = (
                         SELECT MAX(ymdid)
                         FROM   DBAUtility.Dimension.Dates
                         WHERE  GMTOffset = -4
                                AND Year = LEFT(@YMDID,4)
                        )
 -- change this to use the left 10 of the parseid
 
    SET @HoursProcessed = (
                           SELECT   COUNT(hourof)
                           FROM     (
                                     SELECT LEFT(parseid,10) AS hourof
                                           ,COUNT(DISTINCT parseid) AS eventfired
                                     FROM   dbo.ParsedDataByHour WITH (NOLOCK)
                                     GROUP BY LEFT(parseid,10)
                                     --HAVING COUNT(DISTINCT parseid) > 10000	--20161022 CR temporary comment out to consider smaller files from yesterday processed
                                    ) a
                          )
--    PRINT @HoursProcessed
 
    SET @ProcessShortData = ISNULL(@ProcessShortData,0)

    SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
    EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = @ProcedureName
       , -- varchar(128)
        @StepName = 'Variable Creation/Assignment'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = '' -- varchar(500)
    SET @TrackDate = GETDATE()

-- patch/hack to process 2 days of short weblogs
    --SET @HoursProcessed = 24;

    -- be sure we have all of yesterdays records
    -- We are testing this on the fly for DST, currently have spring data, Fall should still have 24 hours
    IF (@HoursProcessed = 24
        AND @SpringDSTYMDID <> @YMDID)
        OR (@HoursProcessed = 23
            AND @SpringDSTYMDID = @YMDID) 
        BEGIN
            --TRUNCATE TABLE staging.dbo.ParsedData

            DROP TABLE staging.dbo.ParsedData

            EXEC sp_RENAME 
                'ParsedDataByHour'
               ,'ParsedData'

            BEGIN TRY
                DROP INDEX [cidx_profiled] ON staging.[dbo].[ParsedData]
            END TRY
            BEGIN CATCH
            END CATCH

            BEGIN TRY
                DROP INDEX [idx_profiled] ON staging.[dbo].[ParsedData]
            END TRY
            BEGIN CATCH
            END CATCH

            BEGIN TRY
                DROP INDEX [idx_MeasureType] ON staging.[dbo].[ParsedData];
            END TRY
            BEGIN CATCH
            END CATCH

            BEGIN TRY
                DROP INDEX [idx_ParseID] ON staging.[dbo].[ParsedData];
            END TRY
            BEGIN CATCH
            END CATCH
			-- this cropped up somewhere???
            BEGIN TRY
                DROP INDEX [ParseID] ON staging.[dbo].[ParsedData];
            END TRY
            BEGIN CATCH
            END CATCH

            BEGIN TRY
                DROP INDEX [idx_MeasureProfileParse] ON staging.[dbo].[ParsedData];
            END TRY
            BEGIN CATCH
            END CATCH
-- in case I can't do it later
            BEGIN TRY
                DROP INDEX [idx_MeasureProfileParse2] ON staging.[dbo].[ParsedData];
            END TRY
            BEGIN CATCH
            END CATCH

            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = 'Rename ParseDataByHour to ParseData'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500)
            SET @TrackDate = GETDATE()

            BEGIN TRY
                DROP TABLE #ParsePivot
            END TRY
            BEGIN CATCH
            END CATCH
-- patch to change userid for My AG Portal to listing id so custom measure tags get created later on
-- this was the easist way to handle this change
            SELECT  ParseID
                   ,ProfileID
                   ,YMDID
                   ,EventDate
                   ,CG = ISNULL([WT.cg_n],'')
                   ,SG = ISNULL([clicktype],'')
                   ,Item = ISNULL([position],'')
                   ,Value = ISNULL([clickvalue],'')
                   ,DL = ISNULL([wt.dl],'')
                   ,ListingID = COALESCE([listingID],[dpg],'0')
                   ,SubProfileID
            INTO    #ParsePivot
            FROM    (
                     SELECT ParseID
                           ,ProfileID
                           ,YMDID
                           ,EventDate
                           ,CASE WHEN MeasureType = 'userid' THEN 'listingid'
                                 ELSE measuretype
                            END AS Measuretype
                           ,Measure
                           ,SubProfileID
                     FROM   Staging.dbo.ParsedData WITH (NOLOCK)
                     WHERE  MeasureType IN ('WT.cg_n','clicktype','position','clickvalue','wt.dl','listingID','dpg','userid')
                    ) X PIVOT ( MAX(X.Measure) FOR X.MeasureType IN ([WT.cg_n],[clicktype],[position],[clickvalue],[wt.dl],[listingID],[dpg],[userid]) ) X

            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = 'Custom Measure Type Pivot'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500)
            SET @TrackDate = GETDATE()

            INSERT  INTO dbo.ParsedData
                    (ParseID
                    ,ProfileID
                    ,YMDID
                    ,EventDate
                    ,MeasureType
                    ,Measure
                    ,SubProfileID)
                    SELECT  DISTINCT
                            PP.ParseID
                           ,PP.ProfileID
                           ,PP.YMDID
                           ,PP.EventDate
                           ,MeasureType = XM.CustomMeasureType
                           ,Measure = CASE WHEN XM.UseTagValue = 0 THEN XM.ValueToUse
                                           WHEN XM.HasListing = 'Y' THEN PP.ListingID
                                           ELSE '1'
                                      END
                           ,PP.SubProfileID
                    FROM    #ParsePivot PP
                    JOIN    Staging.XFactorMeasureType XM
                            ON PP.ProfileID = XM.profileid
                               AND (PP.CG = XM.cg_n
                                    OR XM.cg_n = '[varies]')
                               AND (PP.SG = XM.sg_clicktype
                                    OR XM.sg_clicktype = '[varies]')
                               AND (PP.Item = XM.item_position
                                    OR XM.item_position = '[varies]')
                               AND (PP.Value = XM.value_clickvalue
                                    OR XM.value_clickvalue = '[varies]')
                               AND (PP.DL = XM.dl
                                    OR XM.dl = '[varies]')
                    WHERE   CASE WHEN XM.HasListing = 'Y'
                                      AND PP.ListingID > '1' THEN 1
                                 WHEN XM.HasListing = 'N' THEN 1
                                 ELSE 0
                            END = 1

            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = 'Prod Custom Measure Type Table Insert'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500)
            SET @TrackDate = GETDATE()


            SET @TrackDate = GETDATE()
            BEGIN TRY	
                CREATE NONCLUSTERED INDEX [idx_profiled] ON staging.[dbo].[ParsedData] ( [ProfileID] ASC )
                WITH (
                PAD_INDEX  = OFF,
                STATISTICS_NORECOMPUTE  = OFF,
                SORT_IN_TEMPDB = OFF,
                IGNORE_DUP_KEY = OFF,
                DROP_EXISTING = OFF,
                ONLINE = OFF,
                ALLOW_ROW_LOCKS  = ON,
                ALLOW_PAGE_LOCKS  = ON)
                ON [P6IndexSpace]; --[Primary]
            END TRY
            BEGIN CATCH
            END CATCH
            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = '1st Index Creation ProfileID'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500)
            SET @TrackDate = GETDATE()

            BEGIN TRY
                CREATE NONCLUSTERED INDEX [idx_parseid] ON staging.[dbo].[ParsedData] ( [ParseID] ASC )
                WITH (
                PAD_INDEX  = OFF,
                STATISTICS_NORECOMPUTE  = OFF,
                SORT_IN_TEMPDB = OFF,
                IGNORE_DUP_KEY = OFF,
                DROP_EXISTING = OFF,
                ONLINE = OFF,
                ALLOW_ROW_LOCKS  = ON,
                ALLOW_PAGE_LOCKS  = ON)
                ON  [P6IndexSpace];
            END TRY
            BEGIN CATCH
            END CATCH
				
            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = '2nd Index Creation ParseID'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500)
            SET @TrackDate = GETDATE()
/*  uncomment this if you see it being used during marting, it takes 9 minutes to create            
            BEGIN TRY
                CREATE NONCLUSTERED INDEX [idx_MeasureProfileParse] ON [dbo].[ParsedData] ([MeasureType])
                INCLUDE ([ParseID],[ProfileID],[YMDID],[EventDate],[Measure],[SubProfileID]) ON PIndexSpace
            END TRY
            BEGIN CATCH
            END CATCH

            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = '3rd Index Creation Composite on Measuretype'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500)
            SET @TrackDate = GETDATE()
*/
-- add this so it is ready for the 4 am run incase another job step fails
            CREATE TABLE [dbo].[ParsedDataByHour] (
                [ParseID] [bigint] NULL
               ,[ProfileID] [int] NOT NULL
               ,[YMDID] [int] NOT NULL
               ,[EventDate] [datetime] NOT NULL
               ,[MeasureType] [varchar](50) NOT NULL
               ,[Measure] [varchar](7000) NOT NULL
               ,[SubProfileID] [smallint] NULL)
            ON [P5TableSpace]  ;

            SET ANSI_PADDING OFF

            ALTER TABLE [dbo].[ParsedDataByHour] ADD  DEFAULT ((0)) FOR [ProfileID]

            TRUNCATE TABLE staging.dbo.ParsedDatabyHour

            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = 'Create ParsedDataByHour'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500)
            SET @TrackDate = GETDATE()
	
        END
    ELSE 
        BEGIN 
            DECLARE chkcursor CURSOR
            FOR
            SELECT  HourInt24
                   ,ISNULL(Lines,0) AS Lines
            FROM    DBAUtility.dimension.HOURS h
            LEFT OUTER JOIN (
                             SELECT DISTINCT
                                    (DATEPART(HOUR,DATEADD(HOUR,@GMTOffset,eventdate))) AS hourof
                                   ,COUNT(DISTINCT parseid) AS Lines
                             FROM   staging.dbo.ParsedDatabyHour
                             GROUP BY DATEPART(HOUR,DATEADD(HOUR,@GMTOffset,eventdate))
                            ) pd
                    ON h.hourint24 = pd.hourof
            WHERE   ISNULL(pd.lines,0) < 5000
            ORDER BY hourint24
            SET @Errormsg = ''
            OPEN chkcursor
            FETCH NEXT FROM chkcursor INTO @HoursProcessed,@lines    
            WHILE @@fetch_status = 0 
                BEGIN
                    SET @ErrorMsg = @ErrorMsg + 'Hour ' + CAST(@HoursProcessed AS VARCHAR(2)) + ' Lines Read ' + CAST(@lines AS VARCHAR(20)) + ', '
                    FETCH NEXT FROM chkcursor INTO @HoursProcessed,@lines    
                END
            CLOSE chkcursor
            DEALLOCATE chkcursor

            SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
            EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
                @DatabaseName = @DatabaseName
               , -- varchar(128)
                @ProcName = @ProcedureName
               , -- varchar(128)
                @StepName = 'Error Logging'
               , -- varchar(128)
                @VariableStates = ''
               , -- varchar(500)
                @LengthInSeconds = @LengthInSeconds
               , -- int
                @Comments = '' -- varchar(500)
            SET @TrackDate = GETDATE()
		
            EXEC msdb.dbo.sp_stop_job 
                @job_name = @Errormsg 
        END
        
    SET @LengthInSeconds = DATEDIFF(ss,@TrackDate,GETDATE())
    EXEC DBAUtility.dbo.pr_Logging_StoredProcs 
        @DatabaseName = @DatabaseName
       , -- varchar(128)
        @ProcName = @ProcedureName
       , -- varchar(128)
        @StepName = 'End'
       , -- varchar(128)
        @VariableStates = ''
       , -- varchar(500)
        @LengthInSeconds = @LengthInSeconds
       , -- int
        @Comments = 'End Procedure' -- varchar(500)
    SET @TrackDate = GETDATE()      
END




GO
/****** Object:  StoredProcedure [Fact].[pr_ProcessApartmentGuideTrendAnalysisFromOracle]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************************
* Name:    pr_ProcessApartmentGuideTrendAnalysisFromOracle
*
* Desc:    Process/Alert When Trends are out
*
* Test:    exec fact.pr_ProcessApartmentGuideTrendAnalysisFromOracle 
*          exec Fact.pr_ProcessApartmentGuideTrendAnalysisFromOracle 
exec Fact.pr_ProcessApartmentGuideTrendAnalysisFromOracle
-- Hist	01:	08/17/2011	Clinton Woody	changed to pull from Oracle # 6146
		rewrite from Fact.pr_ProcessApartmentGuideTrendAnalysis
-- more work required to fit business rules from processed calls
* ------------------------------------------------------------------------------------------------------
* Note:

3 missed
6 suspended number or call came in when listing inactive 
1 – connected successful
4 duplicate
5 duration too short
2 busy

*select * from [ApartmentGuide].[Fact].[ApartmentGuideCallTrend] order by ymdid desc,callhour desc
* Hist:    01    08/16/2011    Clinton Woody    Initial Version borrowed and modified from pr_ProcessApartmentGuideTrendAnalysis
* Hist:    02    08/19/2011    Clinton Woody    Added CallStatus to Calls table so Visits Calls is inline with Conversion calls because of 
												callstatus coming in from oracle now # 6183
*		03	 08/31/2011	  Clinton Woody		Added Video Calls # 6325												
**********************************************************************************************************/
CREATE PROCEDURE [Fact].[pr_ProcessApartmentGuideTrendAnalysisFromOracle] 
AS
BEGIN

--return;

    SET NOCOUNT ON;
    DECLARE @StrSql VARCHAR(4000)
    DECLARE @CntAlert INT
    DECLARE @CallHourSTR CHAR(8)
    DECLARE @YMDSTR CHAR(10)
    DECLARE @Calls AS CHAR(8)
    DECLARE @MaxCnt VARCHAR(6)
    DECLARE @MinCnt VARCHAR(6)
    DECLARE @DayofWeekStr CHAR(10)
    DECLARE @FactID BIGINT
    DECLARE @WhereStr VARCHAR(550)        
    DECLARE @CTCWhereStr VARCHAR(550)        

    SET @WhereStr=''
    SET @CTCWhereStr=''

	declare @LastTime datetime
	declare @LastYMDStr as varchar(8)
	declare @LastYMDIDStr as varchar(8)
	Declare @FirstHourStr as varchar(2)
	set @Lasttime=(
	SELECT isnull(dateadd(hour,-3,MAX(ymd)),convert(varchar(13),GETDATE()-1,101)) AS LastFactTime FROM apartmentguide.[Fact].[ApartmentGuideCallTrend]
	where totalcall>0)

	set @LastYMDStr=convert(varchar(8),@LastTime,112)
	set @LastYMDIDStr=convert(varchar(8),dateadd(day,-1,@LastTime),112)
	set @FirstHourStr=cast(datepart(hour,@lastTime) as varchar(2))

	print @LastYMDStr
	print @FirstHourStr
	print @lasttime

	Truncate Table staging.dbo.CallLoaderApartmentGuideTrends

	set @STRSQL=
			'Insert into staging.dbo.CallLoaderApartmentGuideTrends
			 SELECT Call_ID,Call_Date,Duration_In_Sec,
			Toll_Free_Nbr,Prop_NBR,Client_NBR,
			callername,callerlocation,ListingID,
			var2, '''' as var3,'''' as var4,'''' as var5,'''' as var6,
			'''' as var7,'''' as var8,'''' as var9,'''' as var10,calleraddress,
			callercity,callerstate,callerzip,
			LinkName,LinkID,Population,
			AvgTravelTimeToWork,MedianHouseholdIncome,
			PerCapitaIncome,MedianEarnings,MedianContractRent,MedianRentAsked,
			MedianGrossRent,MedianPriceAsked,MedianRealEstateTaxes,
			Households,OwnerHouseholds,RenterHouseholds,
			ListenURL,AudioURL,'''' as MissedAndShortCallTrackingCalls_Id,YMDID,CallloadHour,CallLoadYMDID,status
			FROM
			OPENROWSET (''oraoledb.oracle'', ''APTG''; ''reader''; ''reader'',
			''select * from common.callsrc where 
	   callloadymdid>='+@LastYMDStr+' and ymdid>'+@LastYMDIDStr+''')'
	   --print @StrSql
		exec (@STRSQL)

-- Suspended call for specific clients
		--DELETE FROM staging.dbo.CallLoaderApartmentGuideTrends WHERE CallSTATUS=6
	
		INSERT INTO [ApartmentGuide].[Fact].[ApartmentGuideCallTrend] (
		[YMDID],
		[YMD],
		[DayOfWeek],
		[CallHour],
		[TotalCall],
		[ConnectedCall],
		[MissedCall],
		[AGCConnectedCall],
		[AGCMissedCall],
		[ASGConnectedCall],
		[ASGMissedCall],
		[WebConnectedCall],
		[WebMissedCall],
		[RentalsConnectedCall],
		[RentalsMissedCall],
		[CTCConnectedCall],
		[CTCMissedCall],
		[PaidSPConnectedCall],
		[PaidSPMissedCall],
		[CombinedFeedsConnectedCall],
		[CombinedFeedsMissedCall],
		[InfoUSAConnectedCall],
		[InfoUSAMissedCall],
		[OtherConnectedCall],
		[OtherMissedCall],
		[MarchexConnectedCall],
		[MarChexMissedCall],
		[WebLocalTrackingNumberConnectedCalls],
		[WebLocalTrackingNumberMissedCalls],
		[VideoConnectedCall],        
		[VideoMissedCall]
		)
		SELECT cd.ymdid,date,cd.dayofweek,HourInt24
		,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
		FROM dbautility.dimension.dates cd 
		JOIN dbautility.Dimension.Hours h
		ON 1=1
		LEFT OUTER JOIN [ApartmentGuide].[Fact].[ApartmentGuideCallTrend] act
		ON act.ymdid=cd.ymdid AND h.hourint24=Callhour
		WHERE date=CAST(GETDATE() AS DATE)
		AND act.ymdid IS NULL
                    
       update [ApartmentGuide].[Fact].[ApartmentGuideCallTrend] 
                set [TotalCall] = a.totalcalls,
                 [ConnectedCall] = a.connectedCall,
                 [MissedCall]= a.missedCall,
                 [AGCConnectedCall]= a.AGCConnectedCall,
                 [AGCMissedCall]= a.AGCMissedCall,
                 [ASGConnectedCall]= a.ASGConnectedCall,
                 [ASGMissedCall] = a.ASGMissedCall,
                 [WebConnectedCall] = a.WebConnectedCall,
                 [WebMissedCall] = a.WebMissedCall,
                 [RentalsConnectedCall]=a.RentalsConnectedCall,
                 [RentalsMissedCall] = a.RentalsMissedCall,
                 [CTCConnectedCall]= a.CTCConnectedCall,
                 [CTCMissedCall]=a.CTCMissedCall,
                 [PaidSPConnectedCall]= a.PaidSPConnectedCall,
                 [PaidSPMissedCall]=a.PaidSPMissedCall,
                 [InfoUSAConnectedCall]= a.InfoUSAConnectedCall,
                 [InfoUSAMissedCall] = a.InfoUSAMissedCall,
                 [CombinedFeedsConnectedCall]=a.CombinedFeedsConnectedCall,
                 [CombinedFeedsMissedCall]=a.CombinedFeedsMissedCall,
                 [OtherConnectedCall]=a.OtherConnectedCall,
                 [OtherMissedCall]=a.OtherMissedCall,
                 [MarchexConnectedCall]=a.MarchexConnectedCall,
                 [MarchexMissedCall]=a.MarchexMissedCall,
                 [WebLocalTrackingNumberConnectedCalls]=a.WebLocalTrackingNumberConnectedCalls,
                 [WebLocalTrackingNumberMissedCalls]=a.WebLocalTrackingNumberMissedCalls,
                 [VideoConnectedCall]=a.VideoConnectedCall,
                 [VideoMissedCall]=a.VideoMissedCall
                FROM [ApartmentGuide].[Fact].[ApartmentGuideCallTrend] act
            join
            (SELECT  callloadymdid
					,callloadhour
                    ,count(callid) AS TotalCalls
                    ,SUM(CASE WHEN callstatus=1 OR (callstatus IN(4,5) AND duration>0 ) THEN 1 
							 ELSE 0 END) AS ConnectedCall
                    ,SUM(CASE WHEN  callstatus IN(2,3) OR (callstatus IN(4,5) AND duration=0) THEN 1 
							 ELSE 0 END) AS MissedCall
                    ,SUM(CASE WHEN var2='AGC' AND callstatus=1 
                        OR (var2='AGC' AND callstatus IN(4,5) AND duration>0)
                        THEN 1 ELSE 0 END) AS AGCConnectedCall
                    ,SUM(CASE WHEN var2='AGC' AND callstatus=1 
                        OR (var2='AGC' AND callstatus IN(4,5) AND duration=0)
                         THEN 1 ELSE 0 END) AS AGCMissedCall
                    ,SUM(CASE WHEN var2='ASG' AND callstatus=1
						OR (var2='ASG' AND callstatus IN(4,5) AND duration>0)
						 THEN 1 ELSE 0 END) AS ASGConnectedCall
                    ,SUM(CASE WHEN var2='ASG' AND callstatus IN(2,3) 
	                      OR (var2='ASG' AND callstatus IN(4,5) AND duration=0)
						THEN 1 ELSE 0 END) AS ASGMissedCall
						
                    ,SUM(CASE WHEN var2='WEB' AND callstatus=1 
						OR (var2='Web' AND callstatus IN(4,5) AND duration>0)
                        THEN 1 ELSE 0 END) AS WebConnectedCall
                    ,SUM(CASE WHEN var2='WEB' AND callstatus IN(2,3) 
  						OR (var2='Web' AND callstatus IN(4,5) AND duration=0)
	                    THEN 1 ELSE 0 END) AS WebMissedCall

                    ,SUM(CASE WHEN var2='Video' AND callstatus=1 
						OR (var2='Video' AND callstatus IN(4,5) AND duration>0)
                        THEN 1 ELSE 0 END) AS VideoConnectedCall
                    ,SUM(CASE WHEN var2='Video' AND callstatus IN(2,3) 
  						OR (var2='Video' AND callstatus IN(4,5) AND duration=0)
	                    THEN 1 ELSE 0 END) AS VideoMissedCall
                        
                        ,SUM(CASE WHEN var2='CTC' AND callstatus=1 
							OR (var2='CTC' AND callstatus IN(4,5) AND duration>0)
                        THEN 1 ELSE 0 END) AS CTCConnectedCall
                        ,SUM(CASE WHEN var2='CTC' AND callstatus IN(2,3)
                        OR (var2='CTC' AND callstatus IN(4,5) AND duration=0)
                         THEN 1 ELSE 0 END) AS CTCMissedCall
                        
                        ,SUM(CASE WHEN var2='Rentals' AND callstatus=1 
							OR (var2='Rentals' AND callstatus IN(4,5) AND duration>0)
                        THEN 1 ELSE 0 END) AS RentalsConnectedCall

                        ,SUM(CASE WHEN var2='Rentals' AND callstatus IN(2,3) 
                        OR (var2='Rentals' AND callstatus IN(4,5) AND duration=0)
                        THEN 1 ELSE 0 END) AS RentalsMissedCall
                        
                        ,SUM(CASE WHEN var2='PaidSP' AND callstatus=1 
							OR (var2='PaidSP' AND callstatus IN(4,5) AND duration>0)
                        THEN 1 ELSE 0 END) AS PaidSPConnectedCall

                        ,SUM(CASE WHEN var2='PaidSP' AND callstatus IN(2,3)
                        OR (var2='PaidSP' AND callstatus IN(4,5) AND duration=0)
                         THEN 1 ELSE 0 END) AS PaidSPMissedCall
                        
                        ,SUM(CASE WHEN var2='Feeds' AND callstatus=1 
							OR (var2='Feeds' AND callstatus IN(4,5) AND duration>0)
                        THEN 1 ELSE 0 END) AS CombinedFeedsConnectedCall
                        
                        ,SUM(CASE WHEN var2='Feeds' AND callstatus IN(2,3) 
                        OR (var2='Feeds' AND callstatus IN(4,5) AND duration=0)
                        THEN 1 ELSE 0 END) AS CombinedFeedsMissedCall
                        
                        ,SUM(CASE WHEN var2='InfoUSA' AND callstatus=1 
							OR (var2='InfoUSA' AND callstatus IN(4,5) AND duration>0)
                        THEN 1 ELSE 0 END) AS InfoUSAConnectedCall
                        ,SUM(CASE WHEN var2='InfoUSA' AND callstatus IN(2,3) 
                        OR (var2='InfoUSA' AND callstatus IN(4,5) AND duration=0)
                        THEN 1 ELSE 0 END) AS InfoUSAMissedCall
                        
                        ,SUM(CASE WHEN var2='Marchex' AND callstatus=1
							OR (var2='Marchex' AND callstatus IN(4,5) AND duration>0)
                         THEN 1 ELSE 0 END) AS MarchexConnectedCall
                         
                        ,SUM(CASE WHEN var2='Marchex' AND callstatus IN(2,3) 
                        OR (var2='Marchex' AND callstatus IN(4,5) AND duration=0)
                        THEN 1 ELSE 0 END) AS MarchexMissedCall
                        
                        ,SUM(CASE WHEN var2='LOCALTEST' AND callstatus=1
							OR (var2='LOCALTEST' AND callstatus IN(4,5) AND duration>0)
                         THEN 1 ELSE 0 END) AS WebLocalTrackingNumberConnectedCalls
                         
                        ,SUM(CASE WHEN var2='LOCALTEST' AND callstatus IN(2,3) 
                        OR (var2='LOCALTEST' AND callstatus IN(4,5) AND duration=0)
                        THEN 1 ELSE 0 END) AS WebLocalTrackingNumberMissedCalls
                        
                        ,SUM(CASE WHEN var2 NOT IN('LOCALTEST','Marchex','InfoUSA',
							'Feeds','PaidSP','AGC','ASG','CTC','WEB','Web') AND callstatus=1 
							OR (var2 NOT IN('LOCALTEST','Marchex','InfoUSA',
							'Feeds','PaidSP','AGC','ASG','CTC','WEB','Web')
							 AND callstatus IN(4,5) AND duration>0)							
							THEN 1 ELSE 0 END) AS OtherConnectedCall
							
                        ,SUM(CASE WHEN var2 NOT IN('LOCALTEST','Marchex','InfoUSA',
							'Feeds','PaidSP','AGC','ASG','CTC','WEB','Web') AND  callstatus<>1 
							OR (var2 NOT IN('LOCALTEST','Marchex','InfoUSA',
							'Feeds','PaidSP','AGC','ASG','CTC','WEB','Web')
							 AND callstatus IN(4,5) AND duration=0)		
							THEN 1 ELSE 0 END) AS OtherMissedCall

                        --,SUM(CASE WHEN var2='' AND callstatus=1 THEN 1 ELSE 0 END) AS ConnectedCall
                        --,SUM(CASE WHEN var2='' AND callstatus IN(2,3) THEN 1 ELSE 0 END) AS MissedCall
                FROM    [dbo].[CallLoaderApartmentGuideTrends]
                GROUP BY callloadymdid
                  ,callloadhour
            )a
            ON a.callloadymdid=act.ymdid AND a.callLoadhour=act.callhour

            INSERT INTO [ApartmentGuide].[fact].[CallsApartmentGuideLoadByHour]
                ([CallID]
                ,[TimeInitiated]
                ,[Duration]
                ,[InboundTelephoneNumber]
                ,[TelephoneNumber]
                ,[UserTelephoneNumber]
                ,[callername]
                ,[callerlocation]
                ,[var1]
                ,[var2]
                ,[var3]
                ,[calleraddress]
                ,[callercity]
                ,[callerstate]
                ,[callerzip]
                ,[LinkName]
                ,[LinkID]
                ,[Population]
                ,[AvgTravelTimeToWork]
                ,[MedianHouseholdIncome]
                ,[PerCapitaIncome]
                ,[MedianEarnings]
                ,[Households]
                ,[OwnerHouseholds]
                ,[RenterHouseholds]
                ,[ListenURL]
                ,[AudioURL]
                ,[CallLoadYMDID]
                ,[CallLoadHour]
                ,CallStatus)
            SELECT cla.CallID
                  ,cla.TimeInitiated
                  ,cla.Duration
                  ,cla.InboundTelephoneNumber
                  ,cla.TelephoneNumber
                  ,cla.UserTelephoneNumber
                  ,cla.callername
                  ,cla.callerlocation
                  ,cla.var1
                  ,cla.var2
                  ,cla.var3
                  ,cla.calleraddress
                  ,cla.callercity
                  ,cla.callerstate
                  ,cla.callerzip
                  ,cla.LinkName
                  ,cla.LinkID
                  ,cla.Population
                  ,cla.AvgTravelTimeToWork
                  ,cla.MedianHouseholdIncome
                  ,cla.PerCapitaIncome
                  ,cla.MedianEarnings
                  ,cla.Households
                  ,cla.OwnerHouseholds
                  ,cla.RenterHouseholds
                  ,cla.ListenURL
                  ,cla.AudioURL
                  ,cla.CallLoadYMDID
                  ,cla.CallLoadHour AS [CallLoadHour]
                  ,cla.callstatus as CallStatus
            FROM  [dbo].[CallLoaderApartmentGuideTrends] cla
            LEFT OUTER JOIN [ApartmentGuide].[fact].[CallsApartmentGuideLoadByHour] cal
            ON cla.callid=cal.callid
            WHERE cal.callid IS null

        BEGIN TRY
            DROP TABLE ##tmpCallAlerts
        END TRY
        BEGIN CATCH
        END CATCH
        BEGIN TRY
            DROP TABLE #tmpCallAlertsBase
        END TRY
        BEGIN CATCH
        END CATCH

-- Keep as Example for testing/evaluation    
--SELECT fagt.ymdid
--                ,fagt.[CallHour]
--                ,fagt.[TotalCall]
--                ,[MaxTotalCalls]
--                ,fagt.[ConnectedCall]
--                ,[MaxConnectedCalls]
--                ,fagt.[MissedCall]
--                ,[MaxMissedCalls]
--                 FROM [ApartmentGuide].[Fact].[ApartmentGuideCallTrend] fagt
--                join
--                 [ApartmentGuide].[Dimension].[APTGCallTrendMatrix] dac
--                 ON fagt.dayofweek=dac.[DayOfWeek]
--                 AND fagt.[CallHour]=dac.[CallHour]
--                 WHERE 
--                 evaluated=0
--                 AND
--                 (fagt.[TotalCall]>(dac.maxTotalCalls*(1+[AvgPercentTotalCalls]))
--                 or fagt.[totalCall]<(dac.minTotalcalls-(dac.MinTotalcalls*[AvgPercentTotalCalls])))    

        BEGIN TRY
            DROP TABLE ##tmpCallAlerts
        END TRY    
        BEGIN CATCH
        END CATCH    
        BEGIN TRY
            DROP TABLE #tmpCallAlertsBase
        END TRY    
        BEGIN CATCH
        END CATCH    

--SELECT * FROM [ApartmentGuide].[Fact].[ApartmentGuideCallTrend] ORDER BY ymdid DESC,CallHour
--select * FROM ApartmentGuide.fact.VisitsByHour  ORDER BY ymdid DESC,CallHour
        UPDATE [ApartmentGuide].[Fact].[ApartmentGuideCallTrend] 
        SET visits=savt.visits
         from [ApartmentGuide].[Fact].[ApartmentGuideCallTrend] fagc
        JOIN
          ApartmentGuide.fact.VisitsByHour savt
         ON savt.ymdid=fagc.[YMDID]
         AND savt.callhour=fagc.callhour
         WHERE savt.visits>0
         AND savt.callhour<>DATEPART(HOUR,GETDATE())
         
doneit:        
    SET NOCOUNT OFF;
END


GO
/****** Object:  StoredProcedure [Mart].[pr_EREIFeedLeads]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Mart].[pr_EREIFeedLeads]
AS 
BEGIN
 /******************************************************************************************
* Name:	mart.pr_EREIFeedLeads
* ----------------------------------------------------------------------------------------
* Desc:	This proc marts EREI leads from STAGING DB into the ApartmentGuide DB
* ----------------------------------------------------------------------------------------
* NOTES:
*   1. N/A
*
* ----------------------------------------------------------------------------------------
* Test:	
*   EXEC mart.pr_EREIFeedLeads 
* ----------------------------------------------------------------------------------------
* Hist:	
*   01	11/15/2011	Brian Trembley  Initial Version
*   02	05/24/2013	Clinton Woody   Added LeadDateTime so we can include in thirdpartyfeed # 12446
*									also only add properties we join on and include propertyid and listingid
*	03	05/25/2016	Don Wert		Ticket 23144 - change the query that creates #tmpEREI from EREIId = CAST(P.RDTId AS INT) to EREIId = CAST(P.RDTId AS VARCHAR(50))


select * from apartmentguide.fact.EREIFeedData where leadid=28057 ymdid=20130519
select * from [Staging].Staging.EREIProperty
select distinct property_id from apartmentguide.fact.EREIFeedData
select * from apartmentguide.fact.EREIFeedData where listingid is null
update apartmentguide.fact.EREIFeedData
set leaddatetime=cast(ymdid as varchar(8)) where leaddatetime is null
******************************************************************************************/
    DECLARE @SubjectTxt VARCHAR(35)
       ,@RecipientsTxt VARCHAR(125)
       ,@MessageTxt VARCHAR(3000);
    DECLARE @propertyID CHAR(10)
       ,@PropertyName CHAR(35)
       ,@ManagementName CHAR(35)
       ,@ExternalID AS CHAR(20);
    DECLARE @datetouse CHAR(10);
    DECLARE @SendEmail INT
       ,@YMDID AS INT;

    SET @SendEmail = 0;
    BEGIN TRY
        DROP TABLE #tmpListings;
    END TRY
    BEGIN CATCH
    END CATCH

    BEGIN TRY
        DROP TABLE #tmpEREI;
    END TRY
    BEGIN CATCH
    END CATCH

    SET @YMDID = (
                  SELECT    CAST(CONVERT(VARCHAR(8),CAST([end] AS DATE),112) AS INT)
                  FROM      Staging.EREIDateRange
                 )	

    SELECT  propertyid
           ,PropertyName
           ,listingid
           ,externalpricecode
           ,externalid
           ,statusid
    INTO    #tmpListings
    FROM    (
             SELECT propertyid
                   ,propertyname
                   ,listingid
                   ,externalpricecode
                   ,externalid
                   ,ListingTypeID
                   ,statusid
                   ,ROW_NUMBER() OVER (PARTITION BY propertyid,listingid,externalpricecode,externalid ORDER BY statusid DESC, ListingTypeID ASC) AS rownum
             FROM   apartmentguide.dbo.vw_alllistings
             WHERE  externalpricecode LIKE 'EREI%'
            ) vw
    WHERE   vw.rownum = 1;

    SELECT  YMDID = CAST (REPLACE(LEFT(L.[DateTime],10),'-','') AS INT)
           ,Management_Id = CAST(M.Management_Id AS INT)
           ,ManagementName = M.Name
           ,PropertyCount = CAST(M.PropertyCount AS INT)
           ,p.Property_Id AS EPropertyid
           ,0 AS Property_Id --= tl.PropertyId
           ,0 AS listingId --= tl.listingid
           ,EREIId = CAST(P.RDTId AS VARCHAR(50))
           ,P.ILSId
           ,PropertyName = P.Name
           ,UniqueSessions = CAST(P.UniqueSessions AS INT)
           ,PageViews = CAST(P.PageViews AS INT)
           ,LeadData_Id = CAST(LS.LeadData_Id AS INT)
           ,Screened = CAST(LS.Screened AS INT)
           ,Unscreened = CAST(LS.Unscreened AS INT)
           ,LeadID = CAST(L.LeadID AS INT)
           ,l.[DateTime] AS LeadDateTime
           ,L.CustomerID
           ,L.UnitNumber
           ,L.FirstName
           ,L.LastName
           ,L.Address1
           ,L.City
           ,L.[State]
           ,L.PostalCode
           ,L.Email
           ,L.Phone
           ,L.string
           ,L.EstimatedMoveDate
           ,L.[Message]
           ,L.VisitedProperty
           ,DR.[Begin]
           ,DR.[End]
    INTO    #tmpEREI
    FROM    [Staging].Staging.EREIManagement M
    JOIN    [Staging].Staging.EREIProperty P
            ON M.Management_Id = P.Management_Id
    JOIN    [Staging].Staging.EREILeaddata LS
            ON P.Property_Id = LS.Property_Id
    JOIN    [Staging].Staging.EREILeads L
            ON LS.LeadData_Id = L.LeadData_Id
    CROSS JOIN [Staging].Staging.EREIDateRange DR
    ORDER BY p.Property_Id;

    UPDATE  te
    SET     te.property_id = tl.propertyid
           ,te.listingid = tl.listingid
    FROM    #tmpEREI te
    JOIN    #tmpListings tl
            ON te.EREIId = tl.externalid
               AND tl.statusid = 1

    UPDATE  te
    SET     te.property_id = tl.propertyid
           ,te.listingid = tl.listingid
    FROM    #tmpEREI te
    JOIN    #tmpListings tl
            ON te.EREIId = tl.externalid
               AND te.property_id = 0

    DELETE  te
    FROM    #tmpEREI te
    JOIN    apartmentguide.fact.EREIFeedData ed
            ON te.ymdid = ed.YMDID
               AND te.property_id = ed.property_id
               AND te.listingid = ed.listingid
               AND te.leadid = ed.LeadID;

    INSERT  INTO [ApartmentGuide].[Fact].[EREIFeedData]
            ([YMDID]
            ,[Management_Id]
            ,[ManagementName]
            ,[PropertyCount]
            ,[Property_Id]
            ,ListingID
            ,[EREIId]
            ,[ILSId]
            ,[PropertyName]
            ,[UniqueSessions]
            ,[PageViews]
            ,[LeadData_Id]
            ,[Screened]
            ,[Unscreened]
            ,[LeadID]
            ,[LeadDateTime]
            ,[CustomerID]
            ,[UnitNumber]
            ,[FirstName]
            ,[LastName]
            ,[Address1]
            ,[City]
            ,[State]
            ,[PostalCode]
            ,[Email]
            ,[Phone]
            ,[string]
            ,[EstimatedMoveDate]
            ,[Message]
            ,[VisitedProperty]
            ,[Begin]
            ,[End])
            SELECT  [YMDID]
                   ,[Management_Id]
                   ,[ManagementName]
                   ,[PropertyCount]
                   ,[Property_Id]
                   ,ListingID
                   ,[EREIId]
                   ,[ILSId]
                   ,[PropertyName]
                   ,[UniqueSessions]
                   ,[PageViews]
                   ,[LeadData_Id]
                   ,[Screened]
                   ,[Unscreened]
                   ,[LeadID]
                   ,[LeadDateTime]
                   ,[CustomerID]
                   ,[UnitNumber]
                   ,[FirstName]
                   ,[LastName]
                   ,[Address1]
                   ,[City]
                   ,[State]
                   ,[PostalCode]
                   ,[Email]
                   ,[Phone]
                   ,[string]
                   ,[EstimatedMoveDate]
                   ,[Message]
                   ,[VisitedProperty]
                   ,[Begin]
                   ,[End]
            FROM    #tmpEREI
            WHERE   property_id IS NOT NULL;

    SET @MessageTxt = '';

    IF EXISTS ( SELECT TOP 1
                        property_id
                FROM    #tmpEREI
                WHERE   property_id IS NULL ) 
        BEGIN
            SET @MessageTxt = ' Properties In EREI XML File Not In DPS' + CHAR(13) + CHAR(13);
            SET @MessageTxt = @MessageTxt + 'Date       PropertyID ExternalID           PropertyName                        Management' + CHAR(13);
            DECLARE listingcursor CURSOR
            FOR
            SELECT DISTINCT
                    CAST(property_id AS VARCHAR(9)) AS PropertyID
                   ,EREIID AS externalid
                   ,propertyname
                   ,ManagementName
            FROM    #tmpEREI
            WHERE   property_id IS NULL
            ORDER BY propertyNAME;

            SET @datetouse = LEFT(CONVERT(VARCHAR(8),@ymdid,112),4) + '/' + SUBSTRING(CONVERT(VARCHAR(8),@ymdid,112),5,2) + '/' + RIGHT(CONVERT(VARCHAR(8),@ymdid,112),2);
            OPEN listingcursor;
            FETCH NEXT FROM listingcursor INTO @propertyID,@ExternalID,@PropertyName,@ManagementName;
            WHILE @@fetch_status = 0 
                BEGIN
                    SET @MessageTxt = @MessageTxt + @datetouse + ' ' + ISNULL(@propertyid,'Null' + SPACE(6)) + ' ' + ISNULL(@Externalid,'Null' + SPACE(16)) + ' ' + ISNULL(@propertyName,SPACE(35)) + ' ' + ISNULL(@ManagementName,'Null') + CHAR(13);
                    FETCH NEXT FROM listingcursor INTO @propertyID,@ExternalID,@PropertyName,@ManagementName;
                END
            CLOSE listingcursor;
            DEALLOCATE listingcursor;
            SET @SendEmail = 1;
        END

    IF @SendEmail = 1 
        BEGIN
            SET @SubjectTxt = 'Data Load Inconsistancies From EREI XML File';
            SET @RecipientsTxt = (
                                  SELECT    emailrecipients
                                  FROM      [DBAUtility].[dbo].[EmailRoles]
                                  WHERE     RoleObjectName = 'pr_ProcessRDTXML'
                                 );
            IF LEN(@RecipientsTxt) > 3 
                BEGIN
                    SET @RecipientsTxt = @RecipientsTxt + ';cwoody@primedia.com'                
                    EXEC msdb.dbo.sp_send_dbmail 
                        @recipients = @RecipientsTxt
                       ,@subject = @SubjectTxt
                       ,@body = @MessageTxt
                       ,@importance = 'Normal'
                       ,@body_format = 'TEXT';
                    PRINT @Messagetxt;
                END
        END
END



GO
/****** Object:  StoredProcedure [reports].[rpt_checkforAllserverslogdata]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/******************************************************************************************
*
* Name:	rpt_checkforAllserverslogdata
*
* Desc:	checks to ensure that we recieve data from both data centers log files
*
* Test:	exec Reports.rpt_checkforAllserverslogdata
*select top 1 parseid from parseddatabyhour
* Note:
*
* Hist:	01	11/14/2012	Clinton Woody		Initial Version # 10932
* Hist:	02	01/30/2013	Clinton Woody		deleted the records for the hour with bad data and all those past it
* Hist:	03	02/04/2013	Clinton Woody		Added @KeepHalflogs in case we need to process and keep only half the log files
* Hist: 04	07/14/2013	Don Wert			Mix of temp table names #tmpLogparse and #tmpLogparse caused failure, changed all to #tmpLogparse
* Hist:	05	10/16/2013	Clinton Woody		added check for jobid's to disable if we don't get all the log file data due to same sp on new server #13582 
* Hist: 06  12/05/2013	Clinton Woody		changed number of Servers to be Variable and test for at least 40% data from previous day # 13978
*												renamed this procedure to rpt_checkforAllserverslogdata
* Hist 07  04/07/2014	Clinton woody		alert if different day or future hours in log data.
* Hist 08  12/10/2014	Clinton woody		Removed alerts for Measures too long and Parsed Data with older dates
* Hist 09  03/17/2015	Clinton woody		Log Hours processed and don't reprocess if already checked # 18718
* Hist 10  03/24/2015	Clinton woody		Log Hours processed and don't reprocess if already checked, check nwe hours only # 18718
* Hist 11  10/13/2016	Don Wert			Ticket 24428 set email recipients to all of BI

select * from staging.staging.weblogsparsed with (nolock)
******************************************************************************************/
CREATE PROCEDURE [reports].[rpt_checkforAllserverslogdata] (
    @keephalflogs INT = NULL)
AS 
BEGIN
--RETURN;

    SET NOCOUNT ON;
-- change this for servers processing log files    
    DECLARE @LogServers INT;
    DECLARE @LastParseid VARCHAR(18);
    DECLARE @LastParseHour VARCHAR(10);
    DECLARE @NotEnouhgData INT;
    DECLARE @MinPercent DECIMAL(4,2);
    DECLARE @WarningPercent DECIMAL(4,2);
    DECLARE @ErrorPercent DECIMAL(4,2);
    DECLARE @TodayLines CHAR(12)
       ,@YesterdayLines CHAR(12)
       ,@PercentLoaded CHAR(4);
    DECLARE @YMDID INT;
    SET @LogServers = 2;
    SET @WarningPercent = .71;
    SET @ErrorPercent = .41;
    SET @LastParseid = (
                        SELECT  MAX(parseid)
                        FROM    parseddatabyhour WITH (NOLOCK)
                       );

    SET @YMDID = CAST(LEFT(@LastParseid,8) AS INT)
    SET @LastParseHour = (
                          SELECT    lasthourprocessed
                          FROM      staging.staging.weblogsparsed WITH (NOLOCK)
                         );
--UPDATE staging.staging.weblogsparsed
--SET lasthourprocessed=2015032420
    BEGIN TRY
        DELETE  FROM [reports].[LogFilesBeingProcessed]
        WHERE   BatchDate < GETDATE() - 10;
    END TRY
    BEGIN CATCH
    END CATCH
    
    IF EXISTS ( SELECT  lasthourprocessed
                FROM    staging.staging.weblogsparsed WITH (NOLOCK)
                WHERE   lasthourprocessed = LEFT(@LastParseid,10) ) 
        BEGIN
            PRINT 'Already Processed This Hour';
            GOTO doneit;
        END
    ELSE 
        BEGIN
            UPDATE  staging.staging.weblogsparsed
            SET     lasthourprocessed = LEFT(@LastParseid,10);
        END

    IF (
        SELECT  holiday
        FROM    dbautility.dimension.dates 
        WHERE   date = (
                        SELECT  CAST(CAST(@YMDID AS VARCHAR(8)) AS DATE)
                       )
       ) = 'Holiday' 
        BEGIN
            SET @ErrorPercent = .25
            SET @WarningPercent = .51
        END
	
    SET @keephalflogs = ISNULL(@keephalflogs,0);
    
    BEGIN TRY
        DROP TABLE #tmpCheckHours;
    END TRY
    BEGIN CATCH
    END CATCH  

	SELECT  *
    INTO    #tmpCheckHours
    FROM    parseddatabyhour WITH (NOLOCK)
	WHERE 1=0;
/*
IF DATEPART(HOUR,GETDATE())<11
begin
    INSERT INTO    #tmpCheckHours
	SELECT  *
    FROM    parseddatabyhour WITH (NOLOCK);
END

IF DATEPART(HOUR,GETDATE())>10
begin
    INSERT INTO    #tmpCheckHours
	SELECT  *
    FROM    parseddatabyhour WITH (NOLOCK)
    WHERE   LEFT(parseid,10) > @LastParseHour;
END
*/
    DECLARE @MessageTxt VARCHAR(4000);
    DECLARE @SubjectTxt VARCHAR(4000);
    DECLARE @RecipientsTxt VARCHAR(2000);
    DECLARE @UnzipTxt VARCHAR(200);
    DECLARE @ParsedHour VARCHAR(10);
    DECLARE @ParsedHourFirst VARCHAR(10);
    DECLARE @JobRunning BIT;
    DECLARE @CntServers VARCHAR(2);
    DECLARE @CntLogFilesToUnzip INT;
    DECLARE @SqlStr VARCHAR(2000);
    DECLARE @ServerIPAddressReceived VARCHAR(50);
    DECLARE @LogFile VARCHAR(20);
    DECLARE @LineNumber VARCHAR(20);
    DECLARE @Query VARCHAR(2000);
    DECLARE @fileName VARCHAR(200);
    DECLARE @HourlyLogJobID VARCHAR(100);
    DECLARE @NightlyLogJobID VARCHAR(100);
    DECLARE @cnthours INT;
    DECLARE @FirstParseHour VARCHAR(10);
    SET @cnthours = 0;

    SET @fileName = 'WebLogsBadData.csv';

    SET @SqlStr = '';
    SET @CntLogFilesToUnzip = 0;
    SET @ParsedHourFirst = '';
    SET @UnzipTxt = '';
    
    SET @RecipientsTxt = (SELECT EmailRecipients FROM DBAUtility.dbo.EMailRoles WHERE RoleObjectName = 'biteam')
    
    SET @HourlyLogJobID = (
                           SELECT   job_id
                           FROM     msdb.dbo.sysjobs
                           WHERE    name = 'X - Pull WebLog Data Hourly'
                          )

    SET @NightlyLogJobID = (
                            SELECT  job_id
                            FROM    msdb.dbo.sysjobs
                            WHERE   name = '! 1 Parse Web Logs And Start Product Jobs'
                           )

    BEGIN TRY
        DROP TABLE #tmpCheckLogs;
    END TRY
    BEGIN CATCH
    END CATCH

    BEGIN TRY
        DROP TABLE #tmpLogparse
    END TRY
    BEGIN CATCH
    END CATCH

    BEGIN TRY
        DROP TABLE #tmpPercentLoaded
    END TRY
    BEGIN CATCH
    END CATCH

    BEGIN TRY
        DROP TABLE #tmpLogparse2
    END TRY
    BEGIN CATCH
    END CATCH 
-- check and delete parse data before checking number of hours so we stop if we don't hve the correct data
    SELECT  *
    INTO    #tmpLogparse2
    FROM    parseddatabyhour WITH (NOLOCK)
    WHERE  DATEDIFF(day,eventdate,CAST(ymdid AS VARCHAR(8))) > 1
	AND LEFT(parseid,10)>@LastParseHour

    IF EXISTS ( SELECT  1
                FROM    #tmpLogparse2 tlp
                LEFT OUTER JOIN reports.ParsedDataBadData pdv
                        ON tlp.parseid = pdv.parseid
                WHERE   pdv.parseid IS NULL ) 
        BEGIN
-- We no longer send the email so don't bother to log and explode table
            INSERT  INTO reports.ParsedDataBadData
                    (ParseID
                    ,ProfileID
                    ,YMDID
                    ,EventDate
                    ,MeasureType
                    ,Measure
                    ,SubProfileID
                    ,dateadded)
                    SELECT TOP 5
                            tlp.*
                           ,CAST(ymdid AS VARCHAR(8)) AS DateAdded
                    FROM    #tmpLogparse2 tlp;
/*
            SET @LogFile = (
                            SELECT TOP 1
                                    LEFT(parseid,10)
                            FROM    #tmpLogparse2
                           );
            SET @LogFile = 'ex' + @LogFile + '.log';
            SET @LineNumber = (
                               SELECT TOP 1
                                        RIGHT(parseid,7)
                               FROM     #tmpLogparse2
                              );
*/
   --         SET @SubjectTxt = 'WebLog Data With Dates Too Old '
   --         SET @Query = 'SET NOCOUNT ON 	SELECT ymdid,cast(eventdate as date) as DateOf,datepart(hh,eventdate) as hourof,count(distinct parseid) as events from #tmpLogparse2 
			--group by ymdid,cast(eventdate as date),datepart(hh,eventdate) SET NOCOUNT OFF';
   --         SET @MessageTxt = @SubjectTxt + CHAR(13) + CHAR(13) + 'Review Log File [' + @LogFile + ']' + CHAR(13) + CHAR(13)
   --         SET @MessageTxt = @MessageTxt + 'Line Number [' + @LineNumber + '] is one of the offending lines' + CHAR(13) + CHAR(13) + 'select * from reports.ParsedDataBadData where ymdid=' + CAST(@ymdid AS VARCHAR(8))
   --         SET @MessageTxt = @MessageTxt + CHAR(13) + CHAR(13) + 'This Report Generated by Sp Staging.[reports].[rpt_checkforAllserverslogdata]'
   --         EXEC msdb.dbo.sp_send_dbmail 
   --             @recipients = @RecipientsTxt
   --            ,@subject = @Subjecttxt
   --            ,@body = @Messagetxt
   --            ,@importance = 'High'
   --            ,@body_format = 'TEXT'
   --            ,@query = @Query
   --            ,@query_result_header = 1
   --            ,@query_result_no_padding = 1
   --            ,@query_result_separator = '	'
   --            ,@exclude_query_output = 0
   --            ,@attach_query_result_as_file = 1
   --            ,@query_attachment_filename = @fileName;
-- remove old data
            DELETE  FROM dbo.ParsedDataByHour
            WHERE   parseid IN (SELECT  parseid
                                FROM    #tmpLogparse2)
        END
        
    BEGIN TRY
        DROP TABLE #tmpLogparse2
    END TRY
    BEGIN CATCH
    END CATCH 

    SET @SubJectTxt = 'Parsed Data Not Recieved From Both Servers';
    
    CREATE TABLE #tmpCheckLogs (
        ParsedHour VARCHAR(10)
       ,TimesFired BIGINT
       ,ServerIPAddress VARCHAR(50));
    
    INSERT  INTO #tmpCheckLogs
            (ParsedHour
            ,TimesFired
            ,ServerIPAddress)
            SELECT  LEFT(parseid,10) AS hourof
                   ,COUNT(DISTINCT parseid) AS timesfired
                   ,measure
            FROM    parseddatabyhour WITH (NOLOCK)
            WHERE   measuretype = 'serveripaddress'
			AND LEFT(parseid,10)>@LastParseHour
            GROUP BY LEFT(parseid,10)
                   ,measure;

-- if TPercent<.71 then probably an issue, check history over holidays to be sure..
    SELECT  today.hourof
           ,today.Lines
           ,yesterday.yeslines
           ,today.Lines / CAST(yesterday.yeslines AS DECIMAL(12,2)) AS Tpercent
    INTO    #tmpPercentLoaded
    FROM    (
             SELECT LEFT(parseid,10) AS hourof
                   ,COUNT(DISTINCT parseid) AS Lines
             FROM   parseddatabyhour WITH (NOLOCK)
			 where LEFT(parseid,10)>@LastParseHour
             GROUP BY LEFT(parseid,10)
            ) today
    JOIN    (
             SELECT LEFT(parseid,10) AS hourof
                   ,COUNT(DISTINCT parseid) AS yeslines
             FROM   staging.dbo.ParsedData WITH (NOLOCK)
             GROUP BY LEFT(parseid,10)
            ) Yesterday
            ON RIGHT(today.hourof,2) = RIGHT(yesterday.hourof,2)
    ORDER BY today.hourof DESC

    IF EXISTS ( SELECT  ParsedHour
                       ,COUNT(1) AS ServersProc
                FROM    #tmpCheckLogs
                GROUP BY ParsedHour
                HAVING  COUNT(1) < @LogServers ) 
        BEGIN

--SELECT * FROM Fact.HourlyWebLogFailure order by failuredatetime
            SET @MessageTxt = @SubjectTxt + CHAR(13) + CHAR(13);
            SET @MessageTxt = @MessageTxt + 'Disabled Parsed Data By Hour Job. Re Enable It After Fixing This Hour!' + CHAR(13) + CHAR(13);
            SET @MessageTxt = @MessageTxt + 'Disabled Midnight Parsed Data Job. Re Enable It After Fixing This Hour!' + CHAR(13) + CHAR(13);
			
			-- disable parsedata by hour
            EXEC msdb.dbo.sp_update_job 
                @job_id = @HourlyLogJobID --'F394FBE2-7832-4CBB-BA04-73EF1ABB20E8'
               ,@enabled = 0;
			-- disable nightly parsedata and process
            EXEC msdb.dbo.sp_update_job 
                @job_id = @NightlyLogJobID --'DB7FA63E-BE44-4413-8664-D0D2B57D9E2F'
               ,@enabled = 0;
-- if the midnight job is running stop it...
            EXEC dbautility.dbo.pr_checkjobrunning 
                @Job_ID = @NightlyLogJobID --'DB7FA63E-BE44-4413-8664-D0D2B57D9E2F'
               ,@isRunning = @Jobrunning OUTPUT;
--print @JobRunning
            IF @JobRunning = 1 
                BEGIN
                    SET @MessageTxt = @MessageTxt + 'Stopped Midnight Job [! 1 Parse Web Logs And Start Product Jobs]' + CHAR(13) + ' because not all data from both servers there' + CHAR(13) + CHAR(13);
                END	
	
            SET @FirstParseHour = (
                                   SELECT   MIN(Parsedhour)
                                   FROM     (
                                             SELECT MIN(ParsedHour) AS ParsedHour
                                             FROM   #tmpCheckLogs
                                             GROUP BY ParsedHour
                                             HAVING COUNT(1) < @LogServers
                                            ) a
                                  )
            --PRINT @FirstParseHour
						   								                   
            DECLARE logcursor CURSOR
            FOR
            SELECT  pc.parsedhour
                   ,pc2.Servers AS CntServers
                   ,pc.serveripaddress
            FROM    #tmpCheckLogs pc
            JOIN    (
                     SELECT parsedhour
                           ,COUNT(serveripaddress) AS Servers
                     FROM   #tmpCheckLogs
                     GROUP BY ParsedHour
                    ) pc2
                    ON pc.ParsedHour = pc2.parsedhour
            WHERE   pc.parsedhour >= @FirstParseHour;
            OPEN logcursor;

--	exec Reports.rpt_checkforAllserverslogdata

            FETCH NEXT FROM logcursor INTO @ParsedHour,@CntServers,@ServerIPAddressReceived;
            WHILE @@FETCH_STATUS = 0 
                BEGIN
-- don't unzip any files that is not complete
                    IF @CntServers >= @LogServers
                        AND @ParsedHourFirst <> @ParsedHour
                        AND @cnthours = 0 
                        BEGIN
                            SET @ParsedHourFirst = @ParsedHour;                      
                            SET @UnzipTxt = 'Unzip the Following Files from D:\SSIS\Weblogs\Log' + LEFT(@ParsedHour,8) + '.zip' + CHAR(13) + CHAR(13);
                            SET @CntLogFilesToUnzip = @CntLogFilesToUnzip + 1;
                            SET @UnzipTxt = @UnzipTxt + 'ex' + @ParsedHour + '.log' + CHAR(13) + CHAR(13);
                            SET @cnthours = @cnthours + 1;
                        END
-- add next file to unzip if it has all the servers                    
                    IF @ParsedHour <> @ParsedHourFirst
                        AND @CntServers >= @LogServers 
                        BEGIN
                            SET @CntLogFilesToUnzip = @CntLogFilesToUnzip + 1;
                            SET @UnzipTxt = @UnzipTxt + 'ex' + @ParsedHour + '.log' + CHAR(13) + CHAR(13);
                        END
                        
                    IF @cntServers < @LogServers 
                        BEGIN
                            IF @ParsedHour <> @ParsedHourFirst 
                                BEGIN
                                    --PRINT 'Bad File ' + @ParsedHour
                                    SET @MessageTxt = @MessageTxt + 'Log File Hour Missing Server(s): ex' + @ParsedHour + '.log' + CHAR(13);
                                    SET @MessageTxt = @MessageTxt + 'Server Address Received: ' + @ServerIPAddressReceived + CHAR(13);
                                END
                            ELSE 
                                BEGIN
                                    --PRINT 'Sever Recieved ' + @ParsedHour
                                    SET @MessageTxt = @MessageTxt + 'Server Address Received: ' + @ServerIPAddressReceived + CHAR(13);
                                END
                        END                      
                    SET @ParsedHourFirst = @ParsedHour;
                    --INSERT  INTO fact.HourlyWebLogFailure
                    --        (FailureDateTime
                    --        ,LogFileNotFound)
                    --VALUES  (GETDATE()
                    --        ,'ex' + @ParsedHour + '.log loaded from Server: ' + @ServerIPAddressReceived);
                    FETCH NEXT FROM logcursor INTO @ParsedHour,@CntServers,@ServerIPAddressReceived;
                END
            CLOSE logcursor;
            DEALLOCATE logcursor;
            IF @CntLogFilesToUnzip > 0 
                BEGIN
                    SET @UnzipTxt = REPLACE(@UnzipTxt,'[]','[' + CAST(@CntLogFilesToUnzip AS VARCHAR(2)) + ']');
                END
            ELSE 
                SET @UnzipTxt = '';

            IF @JobRunning = 1 
                BEGIN
                    SET @MessageTxt = @MessageTxt + 'Stopped Midnight Job [! 1 Parse Web Logs And Start Product Jobs]' + CHAR(13) + ' because not all data from both servers there' + CHAR(13) + CHAR(13);
                END	
				
            SET @SqlStr = 'delete from staging.dbo.parseddatabyhour where parseid > ' + @FirstParseHour + '0000000' + CHAR(13) + CHAR(13);
            SET @MessageTxt = @MessageTxt + @UnzipTxt + CHAR(13) + CHAR(13);
            SET @MessageTxt = @MessageTxt + 'This report generated by sp in staging [Reports].rpt_checkforAllserverslogdata';

            EXEC msdb.dbo.sp_send_dbmail 
                @recipients = @RecipientsTxt
               ,@subject = @Subjecttxt
               ,@body = @Messagetxt
               ,@importance = 'High'
               ,@body_format = 'TEXT';

-- uncomment after verifying it actually works...
            IF @keephalflogs = 0 -- delete the parseids
                BEGIN
                    PRINT @SqlStr;
--pull OUT delte FOR now
                    --EXEC(@SqlStr);
                END

            IF @JobRunning = 1 
                BEGIN
                    EXEC msdb.dbo.sp_stop_job 
                        @job_id = @NightlyLogJobID;
                    SET @MessageTxt = @MessageTxt + 'Stopped Midnight Job [! 1 Parse Web Logs And Start Product Jobs]' + CHAR(13) + ' because not all data from both servers there' + CHAR(13) + CHAR(13);
                END	
			
        END               
    ELSE 
        BEGIN
            SET @messagetxt = '';
            SET @subjecttxt = '';         
            SET @unziptxt = '';     
	-- Check that we have Enough Data, less than 40 stop processing, less then 70 percent throw email warning
            IF EXISTS ( SELECT  1
                        FROM    #tmpPercentLoaded
                        WHERE   Tpercent < @WarningPercent ) 
                BEGIN
-- SELECT * FROM staging.fact.WebLogDataLoaded WITH (NOLOCK) order by hourof desc
                    INSERT  INTO staging.fact.WebLogDataLoaded
                            (hourof
                            ,Lines
                            ,yeslines
                            ,Tpercent
                            ,emailsent
                            ,ProcessAnyway)
                            SELECT  hourof
                                   ,Lines
                                   ,yeslines
                                   ,Tpercent
                                   ,0
                                   ,0
                            FROM    #tmpPercentLoaded
                            WHERE   Tpercent < @WarningPercent
                                    AND hourof NOT IN (SELECT   hourof
                                                       FROM     staging.fact.WebLogDataLoaded)

                    IF EXISTS ( SELECT  1
                                FROM    #tmpPercentLoaded tpl
                                LEFT OUTER JOIN staging.fact.WebLogDataLoaded wdl
                                        ON tpl.hourof = wdl.hourof
                                           AND wdl.emailsent = 0
                                           AND wdl.processanyway = 0
                                WHERE   tpl.TPercent < @ErrorPercent
                                        AND wdl.hourof IS NULL ) 
                        BEGIN
                            SET @NotEnouhgData = 1
                            SET @SubJectTxt = '!!! Not Enough Web Log Parsed Data Recieved Stopping Job(s) Based Upon ' + CAST(@ErrorPercent AS VARCHAR(20)) + ' Percent';
                            SET @MinPercent = @ErrorPercent			
                            SET @MessageTxt = @SubjectTxt + CHAR(13) + CHAR(13);
                            SET @MessageTxt = @MessageTxt + 'Disabled Parsed Data By Hour Job. Re Enable It After Fixing This Hour!' + CHAR(13) + CHAR(13);
                            SET @MessageTxt = @MessageTxt + 'Disabled Midnight Parsed Data Job. Re Enable It After Fixing This Hour!' + CHAR(13) + CHAR(13);
                            SET @MessageTxt = @MessageTxt + 'If we have all the data then change job [X - Pull WebLog Data Hourly] to stop after step 1 and monitor manually the rest of the day ' + CHAR(13) + CHAR(13);
                            SET @MessageTxt = @MessageTxt + 'If we have all the data then change job [! 1 Parse Web Logs And Start Product Jobs] to skip step 3' + CHAR(13) + CHAR(13);

			-- disable parsedata by hour
                            EXEC msdb.dbo.sp_update_job 
                                @job_id = @HourlyLogJobID --'F394FBE2-7832-4CBB-BA04-73EF1ABB20E8'
                               ,@enabled = 0;
			-- disable nightly parsedata and process
                            EXEC msdb.dbo.sp_update_job 
                                @job_id = @NightlyLogJobID --'DB7FA63E-BE44-4413-8664-D0D2B57D9E2F'
                               ,@enabled = 0;
-- if the midnight job is running stop it...
                            EXEC dbautility.dbo.pr_checkjobrunning 
                                @Job_ID = @NightlyLogJobID --'DB7FA63E-BE44-4413-8664-D0D2B57D9E2F'
                               ,@isRunning = @Jobrunning OUTPUT;
--print @JobRunning
                            IF @JobRunning = 1 
                                BEGIN
                                    SET @MessageTxt = @MessageTxt + 'Stopped Midnight Job [! 1 Parse Web Logs And Start Product Jobs]' + CHAR(13) + ' because not all data from both servers there' + CHAR(13) + CHAR(13);
                                END	
                        END
                    ELSE 
                        BEGIN
                            IF EXISTS ( SELECT  1
                                        FROM    #tmpPercentLoaded tpl
                                        LEFT OUTER JOIN staging.fact.WebLogDataLoaded wdl
                                                ON tpl.hourof = wdl.hourof
                                                   AND wdl.emailsent = 0
                                                   AND wdl.processanyway = 0
                                        WHERE   tpl.TPercent < @WarningPercent
                                                AND wdl.hourof IS NULL ) 
                                BEGIN                  
                                    SET @NotEnouhgData = 0  -- send warning
                                    SET @MinPercent = @WarningPercent
                                    SET @SubJectTxt = 'Warning... Not Enough Web Log Parsed Data. Reveiw and Verify we have all the data Based Upon ' + CAST(@WarningPercent AS VARCHAR(20)) + ' Percent';

                                    SET @MessageTxt = @SubjectTxt + CHAR(13) + CHAR(13);
                                    SET @MessageTxt = @MessageTxt + 'If the data is deemed good then just monitor for the rest of the hours' + CHAR(13) + CHAR(13);
                                END
                        END
                    IF EXISTS ( SELECT  1
                                FROM    #tmpPercentLoaded tpl
                                LEFT OUTER JOIN staging.fact.WebLogDataLoaded wdl
                                        ON tpl.hourof = wdl.hourof
                                           AND wdl.emailsent = 0
                                           AND wdl.processanyway = 0
                                WHERE   tpl.TPercent < @minPercent
                                        AND wdl.hourof IS NULL ) 
                        BEGIN
                            DECLARE logcursor CURSOR
                            FOR
                            SELECT  tpl.hourof
                                   ,CAST(tpl.lines AS CHAR(12)) AS lines
                                   ,CAST(tpl.yeslines AS CHAR(12)) AS yeslines
                                   ,LEFT(CAST(tpl.TPercent AS CHAR(35)),4) AS TPercent
                            FROM    #tmpPercentLoaded tpl
                            JOIN    (
                                     SELECT MIN(hourof) AS hourof
                                     FROM   #tmpPercentLoaded
                                     WHERE  Tpercent <= @MinPercent
                                    ) hr
                                    ON tpl.hourof >= hr.hourof
                            ORDER BY tpl.Hourof;
					
                            SET @ParsedHourFirst = ''

                            OPEN logcursor;
                            SET @cnthours = 0;
                            FETCH NEXT FROM logcursor INTO @ParsedHour,@TodayLines,@YesterdayLines,@PercentLoaded;
                            WHILE @@FETCH_STATUS = 0 
                                BEGIN
-- don't unzip first file as it is only half there      
							    
                                    IF @cnthours = 0
                                        AND @NotEnouhgData = 1 
                                        SET @UnzipTxt = 'Unzip the Following Files from D:\SSIS\Weblogs\Log' + LEFT(@ParsedHour,8) + '.zip' + CHAR(13) + CHAR(13);
                                    SET @cnthours = @cnthours + 1
                                    SET @ParsedHourFirst = @ParsedHour;
                                    IF @NotEnouhgData = 1
                                        AND CAST(@PercentLoaded AS DECIMAL(12,2)) >= @ErrorPercent 
                                        BEGIN                              
                                            SET @CntLogFilesToUnzip = @CntLogFilesToUnzip + 1;
                                            SET @UnzipTxt = @UnzipTxt + 'ex' + @ParsedHour + '.log' + CHAR(13);
                                        END
                                    SET @MessageTxt = @MessageTxt + 'Log File Hour Lines Processed: ex' + @ParsedHour + '.log' + CHAR(13);
                                    SET @MessageTxt = @MessageTxt + 'Lines Read Today ' + @TodayLines + ', Lines Yesterday ' + @YesterdayLines + ', Percent ' + @PercentLoaded + CHAR(13) + CHAR(13);

                                    FETCH NEXT FROM logcursor INTO @ParsedHour,@TodayLines,@YesterdayLines,@PercentLoaded;
                                END
                            CLOSE logcursor;
                            DEALLOCATE logcursor;

                            IF @CntLogFilesToUnzip > 0 
                                BEGIN
                                    SET @UnzipTxt = REPLACE(@UnzipTxt,'[]','[' + CAST(@CntLogFilesToUnzip AS VARCHAR(2)) + ']');
                                END
                            ELSE 
                                SET @UnzipTxt = '';

                            IF @JobRunning = 1
                                AND @NotEnouhgData = 1 
                                BEGIN
                                    SET @MessageTxt = @MessageTxt + '!!! Stopped Midnight Job [! 1 Parse Web Logs And Start Product Jobs]' + CHAR(13) + ' because not enough data from web log servers' + CHAR(13) + CHAR(13);
                                END	
                            IF @NotEnouhgData = 1 
                                SET @SqlStr = 'delete from staging.dbo.parseddatabyhour where parseid > ' + @ParsedHourFirst + '0000000' + CHAR(13) + CHAR(13);
                            ELSE 
                                SET @SqlStr = 'select 1'
            
                            SET @MessageTxt = @MessageTxt + @UnzipTxt + CHAR(13) + CHAR(13);
                            SET @MessageTxt = @MessageTxt + 'This report generated by sp in staging [Reports].rpt_checkforAllserverslogdata';

                            EXEC msdb.dbo.sp_send_dbmail 
                                @recipients = @RecipientsTxt
                               ,@subject = @Subjecttxt
                               ,@body = @Messagetxt
                               ,@importance = 'High'
                               ,@body_format = 'TEXT';

-- uncomment after verifying it actually works...
                            IF @keephalflogs = 0 -- delete the parseids
                                BEGIN
                                    PRINT @SqlStr;

                                    --EXEC(@SqlStr);
                                END

                            IF @JobRunning = 1 
                                BEGIN
                                    EXEC msdb.dbo.sp_stop_job 
                                        @job_id = @NightlyLogJobID;
                                    SET @MessageTxt = @MessageTxt + 'Stopped Midnight Job [! 1 Parse Web Logs And Start Product Jobs]' + CHAR(13) + ' because not all data from both servers there' + CHAR(13) + CHAR(13);
                                END	
                        END -- end of email exist check
                END  
        END

-- check for bad data and remove from processing

    SELECT  *
    INTO    #tmpLogparse
    FROM    parseddatabyhour WITH (NOLOCK)
	where LEFT(parseid,10)>@LastParseHour
    and   LEN(measure) > 3999

    IF EXISTS ( SELECT  1
                FROM    #tmpLogparse tlp
                LEFT OUTER JOIN reports.ParsedDataBadData pdv
                        ON tlp.parseid = pdv.parseid
                WHERE   pdv.parseid IS NULL ) 
        BEGIN
            DELETE  FROM ParsedDatabyHour
            WHERE   parseid IN (SELECT  parseid
                                FROM    #tmpLogparse);
								  
            DELETE  tlp
            FROM    #tmpLogparse tlp
            JOIN    reports.ParsedDataBadData pdv
                    ON tlp.parseid = pdv.parseid;

            INSERT  INTO reports.ParsedDataBadData
                    SELECT  tlp.*
                           ,CAST(tlp.ymdid AS VARCHAR(8)) AS DateAdded
                    FROM    #tmpLogparse tlp;

            SET @LogFile = (
                            SELECT TOP 1
                                    LEFT(parseid,10)
                            FROM    #tmpLogparse
                           );
            SET @LogFile = 'ex' + @LogFile + '.log';
            SET @LineNumber = (
                               SELECT TOP 1
                                        RIGHT(parseid,7)
                               FROM     #tmpLogparse
                              );
-- we don't want this any longer
			--SET @RecipientsTxt = @RecipientsTxt+';dsommers@rentpath.com;shume@rentpath.com;dxu@rent.com';

   --         SET @SubjectTxt = 'WebLog Data With Data Too Long '
   --         SET @Query = 'SET NOCOUNT ON 	SELECT * from #tmpLogparse SET NOCOUNT OFF';
   --         SET @MessageTxt = @SubjectTxt + CHAR(13) + CHAR(13) + 'Review Log File [' + @LogFile + ']' + CHAR(13) + CHAR(13)
   --         SET @MessageTxt = @MessageTxt + 'Line Number [' + @LineNumber + '] is one of the offending lines'
   --         EXEC msdb.dbo.sp_send_dbmail 
   --             @recipients = @RecipientsTxt
   --            ,@subject = @Subjecttxt
   --            ,@body = @Messagetxt
   --            ,@importance = 'High'
   --            ,@body_format = 'TEXT'
   --            ,@query = @Query
   --            ,@query_result_header = 1
   --            ,@query_result_no_padding = 1
   --            ,@query_result_separator = '	'
   --            ,@exclude_query_output = 0
   --            ,@attach_query_result_as_file = 1
   --            ,@query_attachment_filename = @fileName;
        END
    doneit:        

END



GO
/****** Object:  StoredProcedure [reports].[rpt_ReportServerCheckOutReport]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [reports].[rpt_ReportServerCheckOutReport]
       @RptRunType int = 0,
       @CheckOutType int = 1, --Update
       @ConvertID int = 0,
       @CheckedOutUser varchar(65) = ''
AS
/******************************************************************************************
* Name:	rpt_ReportServerCheckOutReport
* -----------------------------------------------------------------------------------------
* Desc:	Selects out date from reportServer table and runs the update proc
* -----------------------------------------------------------------------------------------
* Test:	EXEC rpt_ReportServerCheckOutReport
* -----------------------------------------------------------------------------------------
* History:	
* 01   20121205     Mary Pollard        Initial Version
******************************************************************************************/
SET NOCOUNT ON

------------------------------------------------------------------
--- Run the update if the report run type is set to 1 (set by report)
------------------------------------------------------------------
IF @RptRunType = 1
BEGIN
    EXEC dbo.upd_ReportServerConvCheckedOut @CheckOutType,@ConvertID, @CheckedOutUser
END


    ------------------------------------------------------------------
    --- Update the checked out field
    ------------------------------------------------------------------
    SELECT ReportServer,	
           ConvertID,
           ConvertNote,
           ReportPath,
           ReportName,
           NumOfExecutions,
           ItemID,
           LastRunDate,
           ReportModifyDate,
           AvgTimeDataRetrieval,
           AvgTimeProcessing,
           AvgTimeRendering,
           AvgTotalTime,
           DataDate,
           CASE Converted
                WHEN 0 THEN 'No'
                WHEN 1 THEN 'Yes'
                ELSE 'No'
                END Converted,
           ConvertPath,
           CheckedOutBy,
           CheckedOutDate,
           CASE WHEN CheckedOutBy IS NOT NULL 
                THEN 'Checked Out'
                ELSE ' Not Checked Out'
                END CheckedOut
    FROM   Staging.dbo.ReportServerConversion
    WHERE  ReportServer = 'PRODREPORTS'
    AND    IsNULL(ConvertNote,'') <> 'Do Not Convert'
    ORDER  BY Converted,
           CheckedOut,
           ReportPath,
           ReportName





GO
/****** Object:  StoredProcedure [Staging].[CreateDropYieldMgmtStagingTables]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
*
* Name:	CreateDropYieldMgmtStagingTables
*
* Desc:	used in DTSX Package APTGYieldMgmt.dtsx
*		creates fact data for Yield Mgmt Company
*
* Test:	exec Reports.CreateDropYieldMgmtStagingTables
*
* Note:
*
* Hist:	01	16/14/2010	Clinton Woody		Initial Version
*
select * FROM dbo.StageYieldMgmtProperty ymp
LEFT OUTER JOIN dbo.StageYieldMgmtEmailLeads yels
ON yels.property_id=ymp.property_id
LEFT OUTER JOIN dbo.StageYieldMgmtEmailLead yel
ON yel.emailleads_id=yels.emailleads_id
LEFT OUTER JOIN dbo.StageYieldMgmtFloorPlans yfps
ON yfps.property_id=ymp.property_id
LEFT OUTER JOIN dbo.StageYieldMgmtFloorPlan yfp
ON yfp.floorplans_id=yfps.floorplans_id
******************************************************************************************/
CREATE PROCEDURE [Staging].[CreateDropYieldMgmtStagingTables]
(@CreateDropFlag as Int,@YMDDate as DateTime = Null)
AS
BEGIN
	SET NOCOUNT ON;
    DECLARE @YMDID AS INT
    	
    SET @YMDDate = isnull(@YMDDate, GETDATE() );

    SET @YMDID = CAST(CONVERT(VARCHAR(8), @YMDDate, 112) AS INT);

	

	BEGIN TRY
		DROP TABLE [dbo].[StageYieldMgmtProperty]
	END TRY
	begin CATCH
	END CATCH

	BEGIN TRY
		DROP TABLE  [dbo].[StageYieldMgmtEmailLead]
	END TRY
	begin CATCH
	END CATCH

	BEGIN TRY
		DROP TABLE  [dbo].[StageYieldMgmtEmailLeads]
	END TRY
	begin CATCH
	END CATCH

	BEGIN TRY
		DROP TABLE [dbo].[StageYieldMgmtFloorPlan]
	END TRY
	begin CATCH
	END CATCH

	BEGIN TRY
		DROP TABLE [dbo].[StageYieldMgmtFloorPlans]
	END TRY
	begin CATCH
	END CATCH
	
	IF @CreateDropFlag=1
	BEGIN
		CREATE TABLE [dbo].[StageYieldMgmtProperty](
			[Property_Id] [numeric](20, 0) NULL,
			[ID] [tinyint] NULL,
			[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[numEmailLeads] [tinyint] NULL,
			[numViews] [tinyint] NULL
		) ON [PRIMARY]

		CREATE TABLE [dbo].[StageYieldMgmtEmailLead](
			[EmailDate] [datetime] NULL,
			[FromAddress] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[Subject] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[EmailBody] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[EmailLeads_Id] [numeric](20, 0) NULL
		) ON [PRIMARY]

		CREATE TABLE [dbo].[StageYieldMgmtEmailLeads](
			[EmailLeads_Id] [numeric](20, 0) NULL,
			[Property_Id] [numeric](20, 0) NULL
		) ON [PRIMARY]

		CREATE TABLE [dbo].[StageYieldMgmtFloorPlan](
			[ID] [tinyint] NULL,
			[Name] [nvarchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
			[numEmailLeads] [tinyint] NULL,
			[numViews] [tinyint] NULL,
			[Floorplans_Id] [numeric](20, 0) NULL
		) ON [PRIMARY]

		CREATE TABLE [dbo].[StageYieldMgmtFloorPlans](
			[Floorplans_Id] [numeric](20, 0) NULL,
			[Property_Id] [numeric](20, 0) NULL
		) ON [PRIMARY]

	END	

END

GO
/****** Object:  StoredProcedure [Staging].[Load_AG_CampaignsWLeadsShort2]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [Staging].[Load_AG_CampaignsWLeadsShort2]
AS /******************************************************************************************
*
* Name: Staging.Load_AG_CampaignsWLeadsShort2
*
* Desc:	Load Web trend data
*
* Test:	exec Staging.Load_AG_CampaignsWLeadsShort2
*
* Hist:	01	08/24/2010	Richard Chen	Initial Version
******************************************************************************************/
    SET NOCOUNT ON
    BEGIN

        DELETE  FROM Apartmentguide.fact.WT_CampaignsWLeadsShort2
        where   ymdid = ( SELECT    min(cast(convert(varchar(8), StartDate, 112) as int))
                          FROM      staging.LoaderCampaignsWLeadsShort
                        )
        INSERT  INTO Apartmentguide.fact.WT_CampaignsWLeadsShort2
                (
                YMDID,DemandChannel,[Partner],MarketingProgram,	MarketingActivity,CampaignDescription,CampaignID,
	            Leadtype,Visits,PageViews,Clickthroughs,NumberOfLeads,TimePeriod,StartDate,	EndDate)
                SELECT  YMDID = cast(convert(varchar(8), StartDate, 112) as int),
                        DemandChannel,[Partner],MarketingProgram,	MarketingActivity,CampaignDescription,CampaignID
	                    ,Leadtype,Visits,PageViews,Clickthroughs,NumberOfLeads,TimePeriod,StartDate,	EndDate
                FROM    staging.LoaderCampaignsWLeadsShort


    END
    SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [Staging].[Load_AG_Copy1MRSearchEngineOrganicNeedsReWriteFromWebTrendsCW20110519]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [Staging].[Load_AG_Copy1MRSearchEngineOrganicNeedsReWriteFromWebTrendsCW20110519]
AS /******************************************************************************************
*
* Name: Staging.RentalHouses_NEW_CyberSource_Insert
*
* Desc:	Load Web trend data
*
* Test:	exec Staging.Load_AG_Copy1MRSearchEngineOrganic
*
* Hist:	01	08/18/2010	Richard chen	Initial Version
******************************************************************************************/
    SET NOCOUNT ON
    BEGIN

        DELETE  FROM APARTMENTGUIDE.fact.WT_Copy1OfMostRecentSearchEngineOrganic
        where   ymdid = ( SELECT    min(cast(convert(varchar(8), StartDate, 112) as int))
                          FROM      Staging.LoaderMostRecentSrchEngineOrg
                        )
        INSERT  INTO ApartmentGuide.fact.WT_Copy1OfMostRecentSearchEngineOrganic
                (
                  YMDID,
                  MostRecentSearchEngine,
                  MostRecentSearchPhrase,
                  Visits,
                  PageViews,
                  PercentOfAllVisits,
                  AverageVisitDurationMinutes,
                  Hits,
                  Revenue,
                  AverageRevenuePerOrder,
                  Units,
                  AverageUnitsPerOrder,
                  Orders,
                  TimePeriod,
                  StartDate,
                  EndDate
                )
                SELECT  YMDID = cast(convert(varchar(8), StartDate, 112) as int),
                        mostRecentSearchEngine,
                        MostRecentSearchPhrase,
                        Visits,
                        PageViews,
                        cast(PercentOfAllVisits as decimal(12, 2)),
                        cast(AverageVisitDurationMinutes as decimal(12, 2)),
                        Hits,
                        Revenue,
                        cast(AverageRevenuePerOrder as decimal(12, 2)),
                        Units,
                        cast(AverageUnitsPerOrder as decimal(12, 2)),
                        Orders,
                        TimePeriod,
                        StartDate,
                        EndDate
                FROM    Staging.LoaderMostRecentSrchEngineOrg


    END
    SET NOCOUNT OFF


--select * FROM    Staging.LoaderMostRecentSrchEngineOrg


    --CREATE TABLE ApartmentGuide.fact.WT_Copy1OfMostRecentSearchEngineOrganic
    --    (
    --      [YMDID] [int] NOT NULL,
    --      [MostRecentSearchEngine] [varchar](255) NULL,
    --      [MostRecentSearchPhrase] [varchar](255) NULL,
    --      [Visits] [int] NULL,
    --      [PageViews] [int] NULL,
    --      [PercentOfAllVisits] decimal(12, 2) NULL,
    --      [AverageVisitDurationMinutes] decimal(12, 2) NULL,
    --      [Hits] [int] NULL,
    --      [Revenue] [int] NULL,
    --      [AverageRevenuePerOrder] decimal(12, 2) NULL,
    --      [Units] [int] NULL,
    --      [AverageUnitsPerOrder] decimal(12, 2) NULL,
    --      [Orders] [int] NULL,
    --      [TimePeriod] [varchar](100) NULL,
    --      [StartDate] [datetime] NULL,
    --      [EndDate] [datetime] NULL
    --    )
    --ON  [PRIMARY]









GO
/****** Object:  StoredProcedure [Staging].[Load_AG_MRSearchEngineOrganicWithLeadsNeedsReWriteFromWebTrendsCW20110519]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [Staging].[Load_AG_MRSearchEngineOrganicWithLeadsNeedsReWriteFromWebTrendsCW20110519]
AS /******************************************************************************************
*
* Name: Staging.Load_AG_MRSearchEngineOrganicWithLeads
*
* Desc:	Load Web trend data
*
* Test:	exec Staging.Load_AG_MRSearchEngineOrganicWithLeads
*
* Hist:	01	08/24/2010	Richard Chen	Initial Version
******************************************************************************************/
    SET NOCOUNT ON
    BEGIN

        DELETE  FROM Apartmentguide.fact.WT_MostRecentSearchEnginesOrganicWithLeads
        where   ymdid = ( SELECT    min(cast(convert(varchar(8), StartDate, 112) as int))
                          FROM      Staging.LoaderMostRecentSrchEngineOrg
                        )
        INSERT  INTO Apartmentguide.fact.WT_MostRecentSearchEnginesOrganicWithLeads
                (
                  YMDID,
                  MostRecentSearchEngine,
                  MostRecentSearchPhrase,
                  Visits,
                  PageViews,
                  NumberOfLeads,
                  TimePeriod,
                  StartDate,
                  EndDate
                )
                SELECT  YMDID = cast(convert(varchar(8), StartDate, 112) as int),
                        mostRecentSearchEngine,
                        MostRecentSearchPhrase,
                        Visits,
                        PageViews,
                        NumberOfLeads,
                        TimePeriod,
                        StartDate,
                        EndDate
                FROM    Staging.LoaderMostRecentSrchEngineOrg


    END
    SET NOCOUNT OFF

--select * from Staging.LoaderMostRecentSrchEngineOrg
--select * from ApartmentGuide.fact.WT_Copy1OfMostRecentSearchEngineOrganic

    --  create table Apartmentguide.fact.WT_MostRecentSearchEnginesOrganicWithLeads
    --  ([YMDID] [int] NOT NULL,
    --  [MostRecentSearchEngine] [varchar](255) NULL,
    --  [MostRecentSearchPhrase] [varchar](255) NULL,
    --  [Visits] [int] NULL,
    --  [PageViews] [int] NULL,
    --  [NumberOfLeads] int null,
    --  [TimePeriod] [varchar](100) NULL,
    --  [StartDate] [datetime] NULL,
    --  [EndDate] [datetime] NULL
    --   )
    --ON  [PRIMARY]

    --CREATE TABLE ApartmentGuide.fact.WT_Copy1OfMostRecentSearchEngineOrganic
    --    (
    --      [YMDID] [int] NOT NULL,
    --      [MostRecentSearchEngine] [varchar](255) NULL,
    --      [MostRecentSearchPhrase] [varchar](255) NULL,
    --      [Visits] [int] NULL,
    --      [PageViews] [int] NULL,
    --      [PercentOfAllVisits] decimal(12, 2) NULL,
    --      [AverageVisitDurationMinutes] decimal(12, 2) NULL,
    --      [Hits] [int] NULL,
    --      [Revenue] [int] NULL,
    --      [AverageRevenuePerOrder] decimal(12, 2) NULL,
    --      [Units] [int] NULL,
    --      [AverageUnitsPerOrder] decimal(12, 2) NULL,
    --      [Orders] [int] NULL,
    --      [TimePeriod] [varchar](100) NULL,
    --      [StartDate] [datetime] NULL,
    --      [EndDate] [datetime] NULL
    --    )
    --ON  [PRIMARY]


GO
/****** Object:  StoredProcedure [Staging].[Load_AG_VisitorsTrendNeedsReWriteFromWebTrendsCW20110519]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [Staging].[Load_AG_VisitorsTrendNeedsReWriteFromWebTrendsCW20110519]
AS /******************************************************************************************
*
* Name: Staging.Load_AG_VisitorsTrend
*
* Desc:	Load Web trend data
*
* Test:	exec Staging.Load_AG_VisitorsTrend
*
* Hist:	01	08/24/2010	Richard Chen	Initial Version
******************************************************************************************/
    SET NOCOUNT ON
    BEGIN

        DELETE  FROM Apartmentguide.fact.WT_VisitorsTrend
        where   ymdid = ( SELECT    min(cast(convert(varchar(8), StartDate, 112) as int))
                          FROM      staging.LoaderCampaignsWLeadsShort
                        )
        INSERT  INTO Apartmentguide.fact.WT_VisitorsTrend ( YMDID,
                                                            ActiveVisits )
                SELECT  YMDID = cast(convert(varchar(8), StartDate, 112) as int),
                        SUM(ActiveVisits)
                FROM    staging.LoaderVisitorsTrend
                group  by cast(convert(varchar(8), StartDate, 112) as int)


    END
    SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [Staging].[Load_IPLocationSearchNeedsReWriteFromWebTrendsDataCW20110519]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/******************************************************************************************
*
* Name: Staging.Load_IPLocationSearch
*
* Desc:	Load Web trend data
*
* Test:	exec Staging.Load_IPLocationSearch
*

* Hist:	01	09/20/2010	Mary Pollard    Initial Version
******************************************************************************************/
CREATE PROCEDURE [Staging].[Load_IPLocationSearchNeedsReWriteFromWebTrendsDataCW20110519]
AS

SET NOCOUNT ON
BEGIN

-----------------------------------------------
-- Drop temp tables
-----------------------------------------------
IF OBJECT_ID('tempdb..#CityStateMSA') IS NOT NULL 
   DROP TABLE #CityStateMSA
IF OBJECT_ID('tempdb..#DistinctCityState') IS NOT NULL 
   DROP TABLE #DistinctCityState
IF OBJECT_ID('tempdb..#CityStateMSALookup') IS NOT NULL 
   DROP TABLE #CityStateMSALookup

  -----------------------------------------------
  -- Delete date of data that is in staging now
  -----------------------------------------------
  DECLARE @YMDID int

  SELECT @YMDID = MIN(CAST(CONVERT(varchar(8),StartDate,112) AS INT))
  FROM   staging.staging.IPLocationSearch

        -----------------------------------------------
        -- Delete date of data that is in staging now
        -----------------------------------------------
        DELETE  FROM apartmentguide.fact.WT_IPLocationSearch
        WHERE   ymdid = @YMDID

        -----------------------------------------------
        -- Insert data from staging table
        -----------------------------------------------
        INSERT INTO apartmentguide.fact.WT_IPLocationSearch ( 
               YMDID,
               CityStateOrigin,
               CityOrigin,
               StateOrigin,
               CitySearch,
               StateSearch,
               Visits,
               NumberOfLeads)

        SELECT CAST(CONVERT(varchar(8),StartDate,112) AS INT) YMDID,
               IsNULL(citytest,'TOTAL'),
               IsNULL(REPLACE(REPLACE(substring(citytest,1,charindex(',',citytest)),',',''),'-',' '),'TOTAL') CityOrigin,
               IsNULL(REPLACE(REPLACE(LTRIM(REPLACE(SUBSTRING(substring(citytest,charindex(',',citytest)+1,65),
                              1,
                              CHARINDEX(',',substring(citytest,charindex(',',citytest)+1,65)))
                              ,',','')),'-',' '),'D.C.','District of Columbia')
                        ,'TOTAL') StateOrigin,
               IsNULL(REPLACE(City,'-',' '),'TOTAL'),
               IsNULL(LTRIM(REPLACE(REPLACE(State,'-',' '),'D.C.','District of Columbia')),'TOTAL'),
               SUM(Visits) Visits,
               SUM(NumberOfLeads) NumberOfLeads
        FROM   staging.staging.IPLocationSearch
        WHERE  City IS NOT NULL
        OR     (City IS NULL and State IS NULL)
        GROUP  BY CAST(CONVERT(varchar(8),StartDate,112) AS INT),
               IsNULL(citytest,'TOTAL'),
               IsNULL(REPLACE(REPLACE(substring(citytest,1,charindex(',',citytest)),',',''),'-',' '),'TOTAL'),
               IsNULL(REPLACE(REPLACE(LTRIM(REPLACE(SUBSTRING(substring(citytest,charindex(',',citytest)+1,65),
                              1,
                              CHARINDEX(',',substring(citytest,charindex(',',citytest)+1,65)))
                              ,',','')),'-',' '),'D.C.','District of Columbia')
                        ,'TOTAL'),
               IsNULL(REPLACE(City,'-',' '),'TOTAL'),
               IsNULL(LTRIM(REPLACE(REPLACE(State,'-',' '),'D.C.','District of Columbia')),'TOTAL')

    ---------------------------------------------------------------------------------------------------------
    -- Update Origin and Searched MSAs
    ---------------------------------------------------------------------------------------------------------

                ---------------------------------------------
                -- Get City/State MSA
                ---------------------------------------------
                SELECT msa.Actual_City_Name City,
                       msa.StateName State,
                       msa.StateAbbr StateAbbr,
                       msa.MSACode MSA,
                       msadesc.MSAName MSADesc,
                       COUNT(msa.Actual_City_Name) Total
                INTO   #CityStateMSA
                FROM   dbautility..CityMapping msa
                       INNER JOIN dbautility..zipmsalookup msadesc
                          ON convert(int,msa.msacode) = convert(int,msadesc.msacode)
                GROUP  BY msa.Actual_City_Name,
                       msa.StateName,
                       msa.StateAbbr,
                       msa.MSACode,
                       msadesc.MSAName

                       SELECT DISTINCT
                              City,
                              State,
                              StateAbbr
                       INTO   #DistinctCityState
                       FROM   #CityStateMSA

                ---------------------------------------------
                -- Get City/State & most common MSA 
                ---------------------------------------------
                SELECT DISTINCT
                       REPLACE(msa1.City,'-',' ') City,
                       REPLACE(msa1.State,'-',' ') State,
                       msa1.StateAbbr,
                       CASE WHEN msa1.Total > IsNULL(msa2.Total,0) THEN msa1.MSA 
                            ELSE msa2.MSA END MSA,
                       CASE WHEN msa1.Total > IsNULL(msa2.Total,0) THEN msa1.MSADesc
                            ELSE msa2.MSADesc END MSADesc
                INTO   #CityStateMSALookup
                FROM   #CityStateMSA msa1
                       LEFT JOIN #CityStateMSA msa2
                         ON msa1.city = msa2.city
                        AND msa1.State = msa2.State
                        AND msa1.MSA <> msa2.MSA

                        -----------------------------------------------
                        -- Update Originating and Searched MSA
                        -----------------------------------------------
                        UPDATE ipLoc
                        SET    MSAOrigin = IsNULL(msa1.MSADesc,''),
                               MSASearch = IsNULL(msa2.MSADesc,'')
                        FROM   apartmentguide.fact.WT_IPLocationSearch ipLoc
                               LEFT JOIN #CityStateMSALookup msa1
                                 ON ipLoc.StateOrigin = msa1.State
                                AND ipLoc.CityOrigin = msa1.City
                               LEFT JOIN #CityStateMSALookup msa2
                                 ON ipLoc.StateSearch = msa2.State
                                AND ipLoc.CitySearch = msa2.City
                       WHERE   ipLoc.YMDID = @YMDID

                       -- UPDATE ipLoc
                       -- SET    MSAOrigin = IsNULL(msa1.MSADesc,''),
                       --        MSASearch = IsNULL(msa2.MSADesc,'')
                       -- FROM   apartmentguide.fact.WT_IPLocationSearch ipLoc
                       --        LEFT JOIN #CityStateMSALookup msa1
                       --          ON ipLoc.StateOrigin = msa1.State
                       --         AND (ipLoc.CityOrigin = msa1.City
                       --          OR  REPLACE(ipLoc.CityOrigin,'-',' ') = msa1.City
                       --          OR  REPLACE(REPLACE(ipLoc.StateOrigin,'D.C.','District of Columbia'),'-',' ') = msa1.State)
                       --        LEFT JOIN #CityStateMSALookup msa2
                       --          ON ipLoc.StateSearch = msa2.State
                       --         AND (ipLoc.CitySearch = msa2.City
                       --          OR  REPLACE(ipLoc.CitySearch,'-',' ') = msa2.City
                       --          OR  REPLACE(REPLACE(ipLoc.StateSearch,'D.C.','District of Columbia'),'-',' ') = msa2.State)
                       --WHERE   ipLoc.YMDID = @YMDID



END
SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [Staging].[Load_Rentals_CampaignsWLeadsShort]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [Staging].[Load_Rentals_CampaignsWLeadsShort]
AS /******************************************************************************************
*
* Name: Staging.Load_Rentals_CampaignsWLeadsShort
*
* Desc:	Load Web trend data
*
* Test:	exec Staging.Load_Rentals_CampaignsWLeadsShort
*
* Hist:	01	08/30/2010	Richard Chen	Initial Version
******************************************************************************************/
    SET NOCOUNT ON
    BEGIN

        DELETE  FROM rentals.fact.WT_CampaignsWLeadsShort
        where   ymdid = ( SELECT    min(cast(convert(varchar(8), StartDate, 112) as int))
                          FROM      staging.LoaderCampaignsWLeadsShort
                        )
        INSERT  INTO rentals.fact.WT_CampaignsWLeadsShort
                (
                YMDID,DemandChannel,[Partner],MarketingProgram,	MarketingActivity,CampaignDescription,CampaignID,
	            Leadtype,Visits,PageViews,Clickthroughs,NumberOfLeads,TimePeriod,StartDate,	EndDate)
                SELECT  YMDID = cast(convert(varchar(8), StartDate, 112) as int),
                        DemandChannel,[Partner],MarketingProgram,	MarketingActivity,CampaignDescription,CampaignID
	                    ,Leadtype,Visits,PageViews,Clickthroughs,NumberOfLeads,TimePeriod,StartDate,	EndDate
                FROM    staging.LoaderCampaignsWLeadsShort


    END
    SET NOCOUNT OFF



GO
/****** Object:  StoredProcedure [Staging].[Load_Rentals_MRSearchEngineOrganic]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE [Staging].[Load_Rentals_MRSearchEngineOrganic]
AS /******************************************************************************************
*
* Name: Staging.Load_Rentals_MRSearchengineOrganic
*
* Desc:	Load Web trend data
*
* Test:	exec Staging.Load_Rentals_MRSearchEngineOrganic
*
* Hist:	01	08/18/2010	Richard chen	Initial Version
******************************************************************************************/
    SET NOCOUNT ON
    BEGIN

        DELETE  FROM rentals.fact.WT_MostRecentSearchEngineOrganic
        where   ymdid = ( SELECT    min(cast(convert(varchar(8), StartDate, 112) as int))
                          FROM      Staging.LoaderMostRecentSrchEngineOrg
                        )
        INSERT  INTO Rentals.fact.WT_MostRecentSearchEngineOrganic
                (
                  YMDID,
                  MostRecentSearchEngine,
                  MostRecentSearchPhrase,
                  Visits,
                  PageViews,
                  PercentOfAllVisits,
                  AverageVisitDurationMinutes,
                  Hits,
                  Revenue,
                  AverageRevenuePerOrder,
                  Units,
                  AverageUnitsPerOrder,
                  Orders,
                  TimePeriod,
                  StartDate,
                  EndDate
                )
                SELECT  YMDID = cast(convert(varchar(8), StartDate, 112) as int),
                        mostRecentSearchEngine,
                        MostRecentSearchPhrase,
                        Visits,
                        PageViews,
                        cast(PercentOfAllVisits as decimal(12, 2)),
                        cast(AverageVisitDurationMinutes as decimal(12, 2)),
                        Hits,
                        Revenue,
                        cast(AverageRevenuePerOrder as decimal(12, 2)),
                        Units,
                        cast(AverageUnitsPerOrder as decimal(12, 2)),
                        Orders,
                        TimePeriod,
                        StartDate,
                        EndDate
                FROM    Staging.LoaderMostRecentSrchEngineOrg


    END
    SET NOCOUNT OFF


--select * FROM    Staging.LoaderMostRecentSrchEngineOrg


    --CREATE TABLE ApartmentGuide.fact.WT_Copy1OfMostRecentSearchEngineOrganic
    --    (
    --      [YMDID] [int] NOT NULL,
    --      [MostRecentSearchEngine] [varchar](255) NULL,
    --      [MostRecentSearchPhrase] [varchar](255) NULL,
    --      [Visits] [int] NULL,
    --      [PageViews] [int] NULL,
    --      [PercentOfAllVisits] decimal(12, 2) NULL,
    --      [AverageVisitDurationMinutes] decimal(12, 2) NULL,
    --      [Hits] [int] NULL,
    --      [Revenue] [int] NULL,
    --      [AverageRevenuePerOrder] decimal(12, 2) NULL,
    --      [Units] [int] NULL,
    --      [AverageUnitsPerOrder] decimal(12, 2) NULL,
    --      [Orders] [int] NULL,
    --      [TimePeriod] [varchar](100) NULL,
    --      [StartDate] [datetime] NULL,
    --      [EndDate] [datetime] NULL
    --    )
    --ON  [PRIMARY]









GO
/****** Object:  StoredProcedure [Staging].[Load_Rentals_MRSearchEngineOrganicWithLeads]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [Staging].[Load_Rentals_MRSearchEngineOrganicWithLeads]
AS /******************************************************************************************
*
* Name: Staging.Load_Rentals_MRSearchEngineOrganicWithLeads
*
* Desc:	Load Web trend data
*
* Test:	exec Staging.Load_Rentals_MRSearchEngineOrganicWithLeads
*
* Hist:	01	08/24/2010	Richard Chen	Initial Version
******************************************************************************************/
    SET NOCOUNT ON
    BEGIN
        DELETE  FROM Rentals.fact.WT_MostRecentSearchEnginesOrganicWithLeads
        where   ymdid = ( SELECT    min(cast(convert(varchar(8), StartDate, 112) as int))
                          FROM      Staging.LoaderMostRecentSrchEngineOrg
                        )
        INSERT  INTO Rentals.fact.WT_MostRecentSearchEnginesOrganicWithLeads
                (
                  YMDID,
                  MostRecentSearchEngine,
                  MostRecentSearchPhrase,
                  Visits,
                  PageViews,
                  NumberOfLeads,
                  TimePeriod,
                  StartDate,
                  EndDate
                )
                SELECT  YMDID = cast(convert(varchar(8), StartDate, 112) as int),
                        mostRecentSearchEngine,
                        MostRecentSearchPhrase,
                        Visits,
                        PageViews,
                        NumberOfLeads,
                        TimePeriod,
                        StartDate,
                        EndDate
                FROM    Staging.LoaderMostRecentSrchEngineOrg


    END
    SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [Staging].[Load_Rentals_VisitorsTrend]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create PROCEDURE [Staging].[Load_Rentals_VisitorsTrend]
AS /******************************************************************************************
*
* Name: Staging.Load_Rentals_VisitorsTrend
*
* Desc:	Load Web trend data
*
* Test:	exec Staging.Load_Rentals_VisitorsTrend
*
* Hist:	01	08/24/2010	Richard Chen	Initial Version
******************************************************************************************/
    SET NOCOUNT ON
    BEGIN

        DELETE  FROM Rentals.fact.WT_VisitorsTrend
        where   ymdid = ( SELECT    min(cast(convert(varchar(8), StartDate, 112) as int))
                          FROM      staging.LoaderCampaignsWLeadsShort
                        )
        INSERT  INTO Rentals.fact.WT_VisitorsTrend ( YMDID,ActiveVisits )
                SELECT  YMDID = cast(convert(varchar(8), StartDate, 112) as int),
                        SUM(ActiveVisits)
                FROM    staging.LoaderVisitorsTrend
                group  by cast(convert(varchar(8), StartDate, 112) as int)


    END
    SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [Staging].[pr_SEOAdCount]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[pr_SEOAdCount]
AS
/**************************************************************************************************
* Name:	Staging.pr_SEOAdCount
* Desc: This renames the ListingAdCount table to make room for the monthly update
* -----------------------------------------------------------------------------------------
* Note: 
* -----------------------------------------------------------------------------------------
* Test:	EXEC Staging.pr_SEOAdCount
* -----------------------------------------------------------------------------------------
* Hist:	01	08/24/2017	Sarah Mims			Initial Version. SFDC W-207275
**************************************************************************************************/
BEGIN
	SET NOCOUNT ON

	------------------------------
	--Drop Last Run table
	------------------------------
	BEGIN TRY
		DROP TABLE Staging.Staging.ListingServiceAdCount_LastRun
	END TRY
	BEGIN CATCH
	END CATCH

	-------------------------------
	--Rename table
	-------------------------------
	EXEC sp_rename 'Staging.ListingServiceAdCount','ListingServiceAdCount_Yesterday'

	SET NOCOUNT OFF
END


GO
/****** Object:  StoredProcedure [Staging].[pr_SEOKeywordBuild]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[pr_SEOKeywordBuild]
AS
/**************************************************************************************************
* Name:	Staging.pr_SEOKeywordBuild
* Desc:	Applies SEO page template to urls
* -----------------------------------------------------------------------------------------
* Note: 
* -----------------------------------------------------------------------------------------
* Test:	EXEC Staging.pr_SEOKeywordBuild
* -----------------------------------------------------------------------------------------
* Hist:	01	08/18/2017	Sarah Mims			Initial Version. SFDC W-207275
**************************************************************************************************/
BEGIN TRY
    DROP TABLE #Base;
END TRY
BEGIN CATCH
END CATCH;

---------------------
--Apply relevant template to url page types
---------------------
SELECT  X.URLid
       ,X.url
       ,X.PageType
	   ,X.City
	   ,X.neighborhood
	   ,m.StateName
       ,CASE WHEN X.PageType IN ('SRPCityApt','SRPCityCondo','SRPCityHouse','SRPCityTownhouse') THEN REPLACE(X.Template1,'{city}',X.City)
			 WHEN X.PageType IN ('SRPHoodApt','SRPHoodCondo','SRPHoodTownhouse') THEN REPLACE(X.Template1,'{neighborhood}',X.neighborhood)
			 WHEN X.PageType = 'SRPHoodHouse' THEN REPLACE(REPLACE(X.Template1,'{neighborhood}',X.neighborhood),'{city}',X.City)
			 WHEN X.PageType IN ('SRPZipApt','SRPZipCondo','SRPZipHouse','SRPZipTownhouse') THEN REPLACE(X.Template1,'{zip}',X.ZipCode)
             ELSE X.Template1
        END AS Template1
       ,CASE WHEN X.PageType IN ('SRPCityApt','SRPCityCondo','SRPCityHouse') THEN REPLACE(X.Template2,'{city}',X.City)
			 WHEN X.PageType = 'SRPCityTownhouse' THEN REPLACE(REPLACE(X.Template2,'{city}',X.City),'{statecode}',m.StateAbbr)
			 WHEN X.PageType IN ('SRPHoodApt','SRPHoodCondo','SRPHoodHouse','SRPHoodTownhouse') THEN REPLACE(REPLACE(X.Template2,'{neighborhood}',X.neighborhood),'{city}',X.City)
			 WHEN X.PageType IN ('SRPZipApt','SRPZipCondo','SRPZipHouse','SRPZipTownhouse') THEN REPLACE(X.Template2,'{zip}',X.ZipCode)
             ELSE X.Template2
        END AS Template2
       ,CASE WHEN X.PageType IN ('SRPCityApt','SRPCityCondo','SRPCityHouse','SRPCityTownhouse') THEN REPLACE(REPLACE(X.Template3,'{city}',X.City),'{statecode}',m.StateAbbr)
			 WHEN X.PageType IN ('SRPHoodApt','SRPHoodCondo','SRPHoodHouse','SRPHoodTownhouse') THEN REPLACE(REPLACE(X.Template3,'{neighborhood}',X.neighborhood),'{city}',X.City)
			 WHEN X.PageType IN ('SRPZipApt','SRPZipCondo','SRPZipHouse','SRPZipTownhouse') THEN REPLACE(X.Template3,'{zip}',X.ZipCode)
             ELSE X.Template3
        END AS Template3
INTO    #Base
FROM    (
         SELECT i.URLid
               ,i.url
               ,i.PageType
               ,spt.Template1
               ,spt.Template2
               ,spt.Template3
			   ,i.CityName	AS City
			   ,i.StateName
			   ,i.Neighborhood
			   ,i.ZipCode
         FROM   Staging.Staging.SEODevIndexable AS i
         JOIN   Staging.Staging.SEOPageTemplates AS spt
                ON i.PageType = spt.NamedPageType
		 WHERE spt.IncludeinSEOPriorityScore = 'Yes' 
		 AND spt.Template1 <> ''
        ) AS X
LEFT OUTER JOIN (
                 SELECT DISTINCT
                        StateName
                       ,StateAbbr
                 FROM   DBAUtility.dbo.ZipMSA
                ) AS m
        ON REPLACE(X.StateName,'-',' ') = m.StateName;

---------------------
--Drop keyword tables
---------------------
BEGIN TRY
    DROP TABLE Staging.Staging.URLtoKeyword;
END TRY
BEGIN CATCH
END CATCH;

BEGIN TRY
    DROP TABLE Staging.Staging.SEOAPIKeywords;
END TRY
BEGIN CATCH
END CATCH;

---------------------
--Build the URL to API Keyword table
---------------------
SELECT  a.URLid
       ,a.url
       ,a.PageType
       ,a.Template1
       ,LEN(a.Template1) - LEN(REPLACE(REPLACE(a.Template1,'-',' '),' ','')) + 1 AS Template1WordCount
	   ,DATALENGTH(Template1)													 AS Template1Bytes
       ,a.Template2
       ,LEN(a.Template2) - LEN(REPLACE(REPLACE(a.Template2,'-',' '),' ','')) + 1 AS Template2WordCount
	   ,DATALENGTH(Template2)													 AS Template2Bytes
       ,a.Template3
       ,LEN(a.Template3) - LEN(REPLACE(REPLACE(a.Template3,'-',' '),' ','')) + 1 AS Template3WordCount
	   ,DATALENGTH(Template3)													 AS Template3Bytes
INTO    Staging.Staging.URLToKeyword
FROM    #Base AS a;


---------------------
--Build the API Keyword table - only need to pass duplicate values once
---------------------        
SELECT  ROW_NUMBER() OVER (ORDER BY Template)	AS RowNum
       ,b.PageType
	   ,REPLACE(b.Template,'-',' ')				AS APITemplate
       ,b.Template
       ,b.TemplateType
       ,b.WordCount
       ,SUM(b.Bytes) OVER (ORDER BY Template ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)		AS TotalBytes
       ,SUM(b.WordCount) OVER (ORDER BY Template ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)	AS TotalWordCount
INTO    Staging.Staging.SEOAPIKeywords
FROM    (
         SELECT  DISTINCT a.PageType
               ,a.Template1				AS Template
               ,'Template1'				AS TemplateType
               ,a.Template1WordCount	AS WordCount
               ,a.Template1Bytes		AS Bytes
         FROM   Staging.Staging.URLtoKeyword AS a
         UNION ALL
         SELECT  DISTINCT a.PageType
               ,a.Template2				AS Template
               ,'Template2'				AS TemplateType
               ,a.Template1WordCount	AS WordCount
               ,a.Template2Bytes		AS Bytes
         FROM   Staging.Staging.URLtoKeyword AS a
         UNION ALL
         SELECT  DISTINCT a.PageType
               ,a.Template3 AS Template
               ,'Template3' AS TemplateType
               ,Template3WordCount
               ,a.Template3Bytes		AS Bytes
         FROM   Staging.Staging.URLtoKeyword AS a
        ) AS b;




GO
/****** Object:  StoredProcedure [Staging].[pr_SEOPriorityScore]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[pr_SEOPriorityScore]
AS /**************************************************************************************************
* Name:	Staging.pr_SEOPriorityScore
* Desc:	Combines Internal Metrics and Search Volume and applies score for SEO Prioritization project 
* -----------------------------------------------------------------------------------------
* Note: This score was created by David McFarland from Data Science based on direction from the SEO team
* -----------------------------------------------------------------------------------------
* Test:	EXEC Staging.pr_SEOPriorityScore
* -----------------------------------------------------------------------------------------
* Hist:	01	08/18/2017	Sarah Mims		Initial Version. SFDC W-207275
**************************************************************************************************/
-----------------------------------------------
--Declare and set the factor values
-----------------------------------------------
DECLARE	
	@TrafficFactor				AS DECIMAL(9,3)
	,@LeadFactor				AS DECIMAL(9,3)
	,@SearchVolumeFactor		AS DECIMAL(9,3)
	,@SearchVolumeDeval			AS DECIMAL(9,3)
	,@AdvPropertyFactor			AS DECIMAL(9,3)
	,@PotentialClientFactor		AS DECIMAL(9,3)
	,@AvgRevPerPropertyFactor	AS DECIMAL(9,3)
	,@MaxTraffic				AS INTEGER
	,@MaxLeads					AS INTEGER
	,@MaxAvgSearchVolume		AS DECIMAL(9,3)
	,@MaxAdvProperty			AS INTEGER
	,@MaxPotentialClient		AS DECIMAL(9,3)
	,@MaxAvgRevPerProperty		AS DECIMAL(9,3)

/*
**** This section is where the weights can be modified *****
**** as things need tweaking                           *****
*/
	SELECT
		@TrafficFactor =			0.15
		,@LeadFactor =				0.20
		,@SearchVolumeFactor =		0.40
		,@SearchVolumeDeval =		0.20
		,@AdvPropertyFactor =		0.075
		,@PotentialClientFactor =	0.075
		,@AvgRevPerPropertyFactor =	0.10

------------------------------------------
--Drop tables
------------------------------------------
BEGIN TRY
    DROP TABLE Staging.Staging.SEOScoreAllMetrics;
END TRY
BEGIN CATCH
END CATCH;

BEGIN TRY
    DROP TABLE #StageScore;
END TRY
BEGIN CATCH
END CATCH;

BEGIN TRY
    DROP TABLE Staging.Staging.SEOPriorityScore;
END TRY
BEGIN CATCH
END CATCH;

------------------------------------------
--Create table to house 3 month metrics
------------------------------------------
SELECT  s.DateRange
       ,s.URLid
       ,s.URL
       ,u.PageType
       ,s.CityName
       ,s.StateName
       ,s.Visits
       ,s.TotalLeadTagCount
       ,s.CurrentPercentTAM
       ,s.CurrentAdverstiserCount
       ,s.BilledRPP
       ,u.Template1																AS Template1
       ,ISNULL(sv.volume,0)														AS Template1SearchVolume
       ,u.Template2																AS Template2
       ,ISNULL(ss.volume,0)														AS Template2SearchVolume
       ,u.Template3																AS Template3
       ,ISNULL(sss.volume,0)													AS Template3SearchVolume
       ,(ISNULL(sv.volume,0) + ISNULL(ss.volume,0) + ISNULL(sss.volume,0)) / 3	AS AvgSearchVolume
INTO	Staging.Staging.SEOScoreAllMetrics
FROM    Staging.Staging.SEOScoreInternalMetrics AS s
JOIN    Staging.Staging.URLToKeyword AS u
        ON s.URLid = u.URLid
LEFT OUTER JOIN Staging.Staging.SEOSearchVolume AS sv
        ON u.Template1 = sv.string
LEFT OUTER JOIN Staging.Staging.SEOSearchVolume AS ss
        ON u.Template2 = ss.string
LEFT OUTER JOIN Staging.Staging.SEOSearchVolume AS sss
        ON u.Template3 = sss.string;

------------------------------------------
-- Get max values to do normalization
------------------------------------------
SELECT
	@MaxTraffic	=					MAX(s.Visits)
	,@MaxLeads =					MAX(s.TotalLeadTagCount)
	,@MaxAvgSearchVolume =			MAX((s.Template1SearchVolume + s.Template2SearchVolume + Template3SearchVolume) / 3)
	,@MaxAdvProperty =				MAX(s.CurrentAdverstiserCount)
	,@MaxPotentialClient =			MAX(s.CurrentPercentTAM)
	,@MaxAvgRevPerProperty =		MAX(s.BilledRPP)
FROM
	Staging.Staging.SEOScoreAllMetrics AS s

------------------------------------------
--Calculate and apply initial score
------------------------------------------
SELECT s.DateRange
      ,s.URLid
      ,s.URL
      ,s.PageType
      ,s.CityName
      ,s.StateName
      ,s.Visits
      ,s.TotalLeadTagCount
      ,s.CurrentPercentTAM
      ,s.CurrentAdverstiserCount
      ,s.BilledRPP
      ,s.Template1
      ,s.Template1SearchVolume
      ,s.Template2
      ,s.Template2SearchVolume
      ,s.Template3
      ,s.Template3SearchVolume
      ,s.AvgSearchVolume
	  ,SEOPriorityScore = 
			((s.Visits/@MaxTraffic) * @TrafficFactor)
		+	((s.TotalLeadTagCount/@MaxLeads) * @LeadFactor)
		+	((s.AvgSearchVolume/@MaxAvgSearchVolume)
				*	@SearchVolumeFactor
				/* To accomodate the search volume issues with commonly named areas across cities, such as "downtown"
					a devaluation factor is used. This is added only if the average search volume per month is over 4000
					or if 2 of the 3 search volume numbers are zero
				*/
				*	CASE 
						WHEN	(s.AvgSearchVolume) > 4000
							OR	(
									CASE WHEN s.Template1SearchVolume > 0 THEN 1 ELSE 0 END
								+	CASE WHEN s.Template2SearchVolume > 0 THEN 1 ELSE 0 END
								+	CASE WHEN s.Template3SearchVolume > 0 THEN 1 ELSE 0 END
								) < 2
						THEN @SearchVolumeDeval
						ELSE 1
					END
		+	((s.CurrentAdverstiserCount/@MaxAdvProperty) * @AdvPropertyFactor)
		+	((s.CurrentPercentTAM/@MaxPotentialClient) * @PotentialClientFactor)
		+	((s.BilledRPP/@MaxAvgRevPerProperty) * @AvgRevPerPropertyFactor))
INTO #StageScore
FROM Staging.Staging.SEOScoreAllMetrics AS s

------------------------------------------
--Get final score
------------------------------------------
SELECT  ss.DateRange
       ,ss.URLid
       ,ss.URL
       ,ss.PageType
       ,ss.CityName
       ,ss.StateName
       ,ss.Visits
       ,ss.TotalLeadTagCount
       ,ss.CurrentPercentTAM
       ,ss.CurrentAdverstiserCount
       ,ss.BilledRPP
       ,ss.Template1
       ,ss.Template1SearchVolume
       ,ss.Template2
       ,ss.Template2SearchVolume
       ,ss.Template3
       ,ss.Template3SearchVolume
       ,ss.AvgSearchVolume
       ,ss.SEOPriorityScore
INTO    Staging.Staging.SEOPriorityScore
FROM    #StageScore AS ss;


------------------------------------------
--Clean up
------------------------------------------

--DROP TABLE Staging.Staging.SEOScoreAllMetrics;

GO
/****** Object:  StoredProcedure [Staging].[pr_SEOScoreInternalMetrics]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[pr_SEOScoreInternalMetrics] (@StartDateKey INT, @EndDateKey INT)
AS
/**************************************************************************************************
* Name:	Staging.pr_SEOScoreInternalMetrics
* Desc:	Combines webmetrics, ARPP and % TAM(Total Acquirable Market) for SEO Prioritization project 
* -----------------------------------------------------------------------------------------
* Note: This stores internal metrics that are included in the priority score calculation
*		John Strommen signed off on % TAM being a snapshot. See SFDC case # 01488941
* -----------------------------------------------------------------------------------------
* Test:	EXEC Staging.pr_SEOScoreInternalMetrics 20170601,20170731
* -----------------------------------------------------------------------------------------
* Hist:	01	08/18/2017	Sarah Mims			Initial Version. SFDC W-207275
**************************************************************************************************/

-------------------------------
--Declare and set variables. 
--NOTE: Hardcoded for now. Will be a 3 month lookback when Zuora data is available.
-------------------------------

SET @StartDateKey = 20170601
SET @EndDateKey = 20170731

-------------------------------
--Drop necessary tables
-------------------------------
BEGIN TRY
	DROP TABLE #Revenue
END TRY
BEGIN CATCH
END CATCH

BEGIN TRY
	DROP TABLE Staging.Staging.SEOScoreInternalMetrics
END TRY
BEGIN CATCH
END CATCH

-------------------------------
--Get billed revenue by City/State
-------------------------------
SELECT  
--LEFT(inv.ServiceStartDateKey,6)											AS YearMonth
c.ShippingCity
,c.ShippingState
,m.StateName
,SUM(inv.BilledRevenue)															AS BilledRevenue
,COUNT(DISTINCT inv.ClientKey)													AS NumberOfClients
,CAST(SUM(inv.BilledRevenue) AS DECIMAL(15,2))/COUNT(DISTINCT inv.ClientKey)	AS BilledRPP
INTO #Revenue
FROM EnterpriseDataWarehouse.Fact.InvoiceItem AS inv
JOIN EnterpriseDataWarehouse.Conformed.Client AS c
	ON inv.ClientKey = c.ClientKey
LEFT OUTER JOIN 
				(
				SELECT DISTINCT StateName
				,StateAbbr
				FROM DBAUtility.dbo.ZipMSA
				) AS m
	ON c.ShippingState = m.StateAbbr
WHERE inv.ServiceStartDateKey BETWEEN @StartDateKey AND @EndDateKey
	AND inv.ServiceEndDateKey BETWEEN @StartDateKey AND @EndDateKey
	AND (c.ShippingCity IS NOT NULL AND c.ShippingState IS NOT NULL)
GROUP BY 
--LEFT(inv.ServiceStartDateKey,6)	
c.ShippingCity
,c.ShippingState
,m.StateName
ORDER BY c.ShippingState
,c.ShippingCity

-------------------------------
--Combine billed revenue with web metrics, sfdc data and adcount data
-------------------------------
SELECT DateRange = DATENAME(MONTH,CAST(CONVERT(VARCHAR(10),@StartDateKey,121) AS DATETIME)) + '-' + DATENAME(YEAR,CAST(CONVERT(VARCHAR(10),@StartDateKey,121) AS DATETIME)) + ' to ' + DATENAME(MONTH,CAST(CONVERT(VARCHAR(10),@EndDateKey,121) AS DATETIME)) + '-' + DATENAME(YEAR,CAST(CONVERT(VARCHAR(10),@EndDateKey,121) AS DATETIME))
--pm.YearMonth
,d.URLid
,d.URL
,CASE WHEN d.PageType LIKE '%Military%' THEN COALESCE(d.MilitaryCity,d.CityName)
	  WHEN d.PageType LIKE '%College%' THEN COALESCE(d.CollegeCity,d.CityName)
	  ELSE d.CityName END			AS CityName
,d.StateName
,d.PropertyType
,d.PageType
,ISNULL(pm.Visits,0)				AS Visits
,ISNULL(pm.TotalLeadTagCount,0)		AS TotalLeadTagCount
,ISNULL(sf.CurrentPercentTAM,0)		AS CurrentPercentTAM
,ISNULL(ad.AdvertiserCount,0)		AS CurrentAdverstiserCount
,ISNULL(r.BilledRPP,0)				AS BilledRPP
INTO Staging.Staging.SEOScoreInternalMetrics
FROM Staging.Staging.SEODevIndexable AS d
LEFT OUTER JOIN	
	(
	SELECT CAST(s.url AS VARCHAR(4000)) AS url
	,SUM(s.Visits)						AS Visits
	,SUM(s.TotalLeadTagCount)			AS TotalLeadTagCount
	FROM Staging.Staging.SEOUrlMetrics AS s
	GROUP BY s.URL

	) AS pm
ON d.url = pm.url
LEFT OUTER JOIN Staging.Staging.ListingServiceAdCount AS ad
	ON d.URLid = ad.URLid
LEFT OUTER JOIN #Revenue AS r
	ON d.StateName = r.StateName
	AND CASE WHEN d.PageType LIKE '%Military%' THEN COALESCE(d.MilitaryCity,d.CityName)
	  WHEN d.PageType LIKE '%College%' THEN COALESCE(d.CollegeCity,d.CityName)
	  ELSE d.CityName END = r.ShippingCity
	--AND pm.YearMonth = r.YearMonth
LEFT OUTER JOIN
				(
				SELECT a.ShippingCity
					   ,a.ShippingState
					   ,m.StateName
					   ,COUNT(CASE WHEN a.Joint_Advertising_Status__c IN ('AG Only','Joint') THEN a.id END) AS NumAGAccounts
					   ,COUNT(a.Id) AS NumAccounts
					   ,COUNT(CASE WHEN a.Joint_Advertising_Status__c IN ('AG Only','Joint') THEN a.id END)/CAST(COUNT(a.Id) AS DECIMAL(15,2)) AS CurrentPercentTAM
				FROM    SalesForce.dbo.Account AS a
				LEFT OUTER JOIN 
								(
								SELECT DISTINCT StateName
								,StateAbbr
								FROM DBAUtility.dbo.ZipMSA
								) AS m
					ON a.ShippingState = m.StateAbbr
				WHERE   a.IsDeleted = 0
					 AND a.RecordTypeId = '012E00000005vugIAA'
				GROUP BY a.ShippingCity
					   ,a.ShippingState
					   ,m.StateName
				) AS sf
	ON d.StateName = sf.StateName
	AND CASE WHEN d.PageType LIKE '%Military%' THEN COALESCE(d.MilitaryCity,d.CityName)
	  WHEN d.PageType LIKE '%College%' THEN COALESCE(d.CollegeCity,d.CityName)
	  ELSE d.CityName END  = sf.ShippingCity



GO
/****** Object:  StoredProcedure [Staging].[ProcessYieldMgmtLeads]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************
*
* Name:	CreateDropYieldMgmtStagingTables
*
* Desc:	used in DTSX Package APTGYieldMgmt.dtsx
*		processes fact data for Yield Mgmt Company
*
* Test:	exec [Staging].[ProcessYieldMgmtLeads]
*
* Note:  LeadID is identity field generated on all records 
*					as there is no unique lead id passed in through feed file
*
* Hist:	01	02/21/2010	Clinton Woody		Initial Version
*						numera ticket 3278
* Hist:	02	05/25/2013	Clinton Woody		#12446, add listingid
*
* select ymdid,emaildate from ApartmentGuide.Fact.YieldManagementFeedData where emaildate is not null order by emaildate desc
select ymdid,emaildate from ApartmentGuide.Fact.YieldManagementFeedData order by ymdid desc
delete from apartmentguide.fact.thirdpartyfeedleads where source like '%yield%' and ymdid>20120322
--delete from ApartmentGuide.Fact.YieldManagementFeedData where ymdid>20120322
******************************************************************************************/
CREATE PROCEDURE [Staging].[ProcessYieldMgmtLeads]
AS 
BEGIN
    SET NOCOUNT ON;
    
    BEGIN TRY
        DROP TABLE #tmpYieldManagement;
    END TRY
    BEGIN CATCH	
    END	CATCH	

    BEGIN TRY
        DROP TABLE #tmpListings;
    END TRY
    BEGIN CATCH
    END CATCH

    SELECT  propertyid
           ,listingid
           ,externalpricecode
           ,externalid
           ,ListingTypeID
           ,statusid
    INTO    #tmpListings
    FROM    (
             SELECT propertyid
                   ,listingid
                   ,externalpricecode
                   ,externalid
                   ,ListingTypeID
                   ,statusid
                   ,ROW_NUMBER() OVER (PARTITION BY propertyid,listingid,externalpricecode,externalid ORDER BY statusid DESC, ListingTypeID ASC) AS rownum
             FROM   apartmentguide.dbo.vw_alllistings
             WHERE  externalpricecode LIKE 'Yield%'
            ) vw
    WHERE   vw.rownum = 1;

-- because the externalid can be in duplicate update afterwards    
    SELECT  CAST(CONVERT(VARCHAR(8),ISNULL(EmailDate,GETDATE() - 1),112) AS INT) AS YMDID
           ,0 AS Propertyid
           ,0 AS listingid
           ,CAST(sym.ManagementName AS VARCHAR) AS ManagementName
           ,CAST(syma.Address1 AS VARCHAR) AS ManagementAddress
           ,CAST(syma.City AS VARCHAR) AS ManagementCity
           ,CAST(syma.STATE AS VARCHAR) AS ManagementState
           ,CAST(syma.Zip AS VARCHAR) AS ManagementZip
           ,CAST(syma.Country AS VARCHAR) AS ManagementCountry
           ,syi.ExternalID
           ,CAST(syi.MarketingName AS VARCHAR) AS YieldPropertyName
           ,CAST(sypp.Address1 AS VARCHAR) AS PropertyAddress
           ,CAST(sypp.City AS VARCHAR) AS PropertyCity
           ,CAST(sypp.STATE AS VARCHAR) AS PropertyState
           ,CAST(sypp.Zip AS VARCHAR) AS PropertyZip
           ,CAST(sypp.Country AS VARCHAR) AS PropertyCountry
           ,CAST(sye.FirstName AS VARCHAR) AS FirstName
           ,CAST(sye.LastName AS VARCHAR) AS LastName
           ,CAST(sye.ContactEmail AS VARCHAR) AS ContactEmail
           ,CAST(sye.ContactPhone AS VARCHAR) AS ContactPhone
           ,CAST(sye.Address1 AS VARCHAR) AS ContactAddress
           ,CAST(sye.City AS VARCHAR) AS ContactCity
           ,CAST(sye.STATE AS VARCHAR) AS ContactState
           ,CAST(sye.PostalCode AS VARCHAR) AS ContactPostalCode
           ,sye.EmailDate
           ,CAST(Sye.SUBJECT AS VARCHAR) AS EmailSubject
           ,CAST(sye.comments AS VARCHAR) AS EmailComments
    INTO    #tmpYieldManagement
    FROM    dbo.StageYieldManagement sym
    JOIN    dbo.StageYieldManagementAddress syma
            ON sym.Management_ID = syma.Management_ID
    JOIN    dbo.StageYieldProperty syp
            ON sym.YieldManagement_ID = syp.YieldManagementID
    JOIN    dbo.StageYieldIdentification syi
            ON syp.YieldProperty_id = syi.YieldInternalProperty_ID
    JOIN    dbo.StageYieldPhysicalProperty sypp
            ON sypp.identification_id = syi.identification_id
    LEFT OUTER JOIN dbo.StageYieldLeads syl
            ON syl.YieldInternalProperty_id = syi.YieldInternalProperty_id
    LEFT OUTER JOIN dbo.StageYieldEmailLeads syel
            ON syel.Leads_id = syl.leads_id
    LEFT OUTER JOIN dbo.StageYieldEmail sye
            ON sye.emailleads_id = syel.emailleads_id;

    UPDATE  ty
    SET     propertyid = dl.propertyid
           ,listingid = dl.listingid
    FROM    #tmpYieldManagement ty
    JOIN    #tmpListings dl
            ON ty.ExternalID = dl.externalid
               AND dl.statusid = 1

    UPDATE  ty
    SET     propertyid = dl.propertyid
           ,listingid = dl.listingid
    FROM    #tmpYieldManagement ty
    JOIN    #tmpListings dl
            ON ty.ExternalID = dl.externalid
               AND dl.statusid = 1
               AND ty.propertyid = 0
	
    DELETE  FROM Tr
    FROM    #tmpYieldManagement tr
    LEFT OUTER JOIN ApartmentGuide.Fact.YieldManagementFeedData fd
            ON tr.ymdid = fd.YMDID
               AND tr.propertyid = fd.ymdid
               AND tr.listingid = fd.listingid
				AND tr.emaildate = fd.emaildate

    INSERT  INTO ApartmentGuide.Fact.YieldManagementFeedData
            (YMDID
            ,Propertyid
			,listingid
            ,ManagementName
            ,ManagementAddress
            ,ManagementCity
            ,ManagementState
            ,ManagementZip
            ,ManagementCountry
            ,ExternalID
            ,YieldPropertyName
            ,PropertyAddress
            ,PropertyCity
            ,PropertyState
            ,PropertyZip
            ,PropertyCountry
            ,FirstName
            ,LastName
            ,ContactEmail
            ,ContactPhone
            ,ContactAddress
            ,ContactCity
            ,ContactState
            ,ContactPostalCode
            ,EmailDate
            ,EmailSubject
            ,EmailComments)
            SELECT  tm.YMDID
                   ,Propertyid
				   ,listingid
                   ,ManagementName
                   ,ManagementAddress
                   ,ManagementCity
                   ,ManagementState
                   ,ManagementZip
                   ,ManagementCountry
                   ,tm.ExternalID
                   ,YieldPropertyName
                   ,PropertyAddress
                   ,PropertyCity
                   ,PropertyState
                   ,PropertyZip
                   ,PropertyCountry
                   ,FirstName
                   ,LastName
                   ,ContactEmail
                   ,ContactPhone
                   ,ContactAddress
                   ,ContactCity
                   ,ContactState
                   ,ContactPostalCode
                   ,tm.EmailDate
                   ,EmailSubject
                   ,EmailComments
            FROM    #tmpYieldManagement tm
            WHERE   tm.listingid > 0;

END

GO
/****** Object:  StoredProcedure [Staging].[RentalhousesCyberSource_Insert]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE PROCEDURE [Staging].[RentalhousesCyberSource_Insert]
AS
/******************************************************************************************
*
* Name: Staging.[RentalhousesCyberSource_Insert]
*
* Desc:	Inserts Cybersource transactions from Staging to Production
*
* Test:	exec Staging.RentalhousesCyberSource_Insert
*
* Hist:	01	11/18/2009	John Cox	Initial Version
******************************************************************************************/
SET NOCOUNT ON
BEGIN

        DECLARE @GMTOffset VARCHAR(6)
        -- Because the transaction_date comes in with a -04:00 or -05:00 we have to set GMTOffset to yesterday		
		SET @GMTOffset='-0'+(SELECT CAST(GMTOffset*-1 AS varchar) FROM DBAUtility.Dimension.dates WHERE YMDDate=(CAST(GETDATE()-1 AS DATE)))+':00'
		PRINT @GMTOffset

		DELETE FROM Staging.Staging.RentalHousesCyberSourceTransactions
		WHERE request_id IN (
								SELECT SC.request_id
								FROM Staging.Staging.RentalHousesCyberSourceTransactions SC
								JOIN RentalHouses.Fact.CybersourceRecon CR
								ON SC.request_id  = CR.request_id
								AND CR.transaction_date = CAST(REPLACE(REPLACE(SC.transaction_date,'T',' '),'-05:00','') AS DATETIME))


		INSERT INTO RentalHouses.Fact.CybersourceRecon(
			row_descriptor,
			request_id,
			transaction_date,
			merchant_ref_number,
			merchant_id,
			ics_applications,
			auth_rcode,
			auth_rflag,
			auth_rmsg,
			auth_reversal_rcode,
			auth_reversal_rflag,
			auth_reversal_rmsg,
			bill_rcode,
			bill_rflag,
			bill_rmsg,
			credit_rcode,
			credit_rflag,
			credit_rmsg,
			ecp_debit_rcode,
			ecp_debit_rflag,
			ecp_debit_rmsg,
			ecp_credit_rcode,
			ecp_credit_rflag,
			ecp_credit_rmsg,
			score_rcode,
			score_rflag,
			score_rmsg,
			customer_firstname,
			customer_lastname,
			customer_middlename,
			bill_address1,
			bill_address2,
			bill_city,
			bill_state,
			bill_zip,
			bill_country,
			customer_email,
			customer_phone,
			payment_method,
			amount,
			subscription_id,
			Reviewer,
			ReviewerComments,
			Reconciled,
			DateReconciled)
		SELECT T.row_descriptor,
			   T.request_id,
			   --T.transaction_date,
			   transaction_date = CAST(LEFT(REPLACE(REPLACE(T.transaction_date,'T',' '),@GMTOffset,''),19) AS DATETIME),
			   T.merchant_ref_number,
			   T.merchant_id,
			   T.ics_applications,
			   T.auth_rcode,
			   T.auth_rflag,
			   T.auth_rmsg,
			   T.auth_reversal_rcode,
			   T.auth_reversal_rflag,
			   T.auth_reversal_rmsg,
			   T.bill_rcode,
			   T.bill_rflag,
			   T.bill_rmsg,
			   T.credit_rcode,
			   T.credit_rflag,
			   T.credit_rmsg,
			   T.ecp_debit_rcode,
			   T.ecp_debit_rflag,
			   T.ecp_debit_rmsg,
			   T.ecp_credit_rcode,
			   T.ecp_credit_rflag,
			   T.ecp_credit_rmsg,
			   T.score_rcode,
			   T.score_rflag,
			   T.score_rmsg,
			   T.customer_firstname,
			   T.customer_lastname,
			   T.customer_middlename,
			   T.bill_address1,
			   T.bill_address2,
			   T.bill_city,
			   LEFT(T.bill_state,2),
			   bill_zip = LEFT(T.bill_zip,5),
			   bill_country	= CASE WHEN LEN(T.bill_country) > 2 THEN '' ELSE T.bill_country END,
			   T.customer_email,
			   T.customer_phone,
			   T.payment_method,
			   amount	= CAST(T.amount AS MONEY),
			   T.subscription_id,
			   C.Reviewer,
			   C.ReviewerComments,
			   Reconciled		= CAST(0 AS INT),
			   DateReconciled	= CAST(NULL AS DATETIME)
		FROM Staging.RentalHousesCyberSourceTransactions T
		LEFT JOIN Staging.RentalHousesCyberSourceConversion C
		ON T.request_id = C.RequestID
		
		UPDATE CSR
		SET CSR.Reviewer = RC.Reviewer, 
			CSR.ReviewerComments = RC.ReviewerComments 
		FROM RentalHouses.Fact.CybersourceRecon CSR
		JOIN (	
				SELECT DISTINCT  merchant_ref_number, Reviewer, ReviewerComments
				FROM RentalHouses.Fact.CybersourceRecon CSR
				WHERE Reviewer IS NOT NULL
		) RC
		ON CSR.merchant_ref_number = RC.merchant_ref_number
		WHERE (CSR.bill_rcode = '1' OR CSR.ecp_debit_rcode = '1')


END
SET NOCOUNT OFF










GO
/****** Object:  StoredProcedure [Staging].[RentalHousesCybersourceConversion_Insert]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Staging].[RentalHousesCybersourceConversion_Insert]
AS
/******************************************************************************************
*
* Name: Staging.[RentalHousesCybersourceConversion_Insert]
*
* Desc: Staging.[RentalHousesCybersourceConversion_Insert]
*
* Test: EXEC Staging.[RentalHousesCybersourceConversion_Insert]
*
* Hist:	01	01/01/2009	John Cox		Initial Version
******************************************************************************************/
SET NOCOUNT ON
BEGIN

		DELETE FROM Staging.Staging.RentalHousesCyberSourceConversion
		FROM Staging.Staging.RentalHousesCyberSourceConversion CSC
		JOIN RentalHouses.Fact.CybersourceNotes CSN
		ON CSN.ConversionDate = CSC.ConversionDate
		AND CSN.MerchantReferenceNumber = CSC.MerchantReferenceNumber
		AND CSN.NewDecision = CSC.NewDecision
		AND CSN.OriginalDecision = CSC.OriginalDecision
		AND CSN.Profile = CSC.Profile
		AND CSN.Queue = CSC.Queue
		AND CSN.RequestID = CSC.RequestID
		AND CSN.Reviewer = CSC.Reviewer
		AND CSN.ReviewerComments = CSC.ReviewerComments

		INSERT INTO RentalHouses.Fact.CybersourceNotes
		SELECT	RequestID,
				Reviewer,
				ReviewerComments,
				ConversionDate,
				OriginalDecision,
				NewDecision,
				Queue,
				Profile,
				MerchantReferenceNumber
		FROM Staging.Staging.RentalHousesCyberSourceConversion

END
SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [Staging].[RentalHousesPaymentBatch_Insert]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Staging].[RentalHousesPaymentBatch_Insert]
AS
/******************************************************************************************
*
* Name: Staging.RentalHousesPaymentBatch_Insert
*
* Desc: Staging.RentalHousesPaymentBatch_Insert
*
* Test: Exec Staging.RentalHousesPaymentBatch_Insert
*
* Hist:	01	01/01/2009	John Cox		Initial Version
******************************************************************************************/
SET NOCOUNT ON
BEGIN

		DELETE FROM Staging.Staging.RentalHousesCybersourcePaymentBatch
		WHERE request_id IN (SELECT request_id FROM RentalHouses.Fact.CybersourcePayments)

		INSERT INTO RentalHouses.Fact.CybersourcePayments
				(batch_id,
				 merchant_id,
				 BatchDate,
				 request_id,
				 merchant_ref_number,
				 trans_ref_no,
				 payment_method,
				 currency,
				 amount,
				 transaction_type)
		SELECT	batch_id,
				merchant_id,
				BatchDate = CAST(batch_date AS DATETIME),
				request_id,
				merchant_ref_number,
				trans_ref_no,
				payment_method,
				currency,
				amount = CAST(amount AS MONEY),
				transaction_type
		FROM Staging.RentalHousesCybersourcePaymentBatch

END
SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [Staging].[RentalHousesPaymentEvents_Insert]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Staging].[RentalHousesPaymentEvents_Insert]
AS
/******************************************************************************************
*
* Name: Staging.RentalsPaymentBatch_Insert
*
* Desc: Staging.RentalsPaymentBatch_Insert
*
* Test: Exec Staging.RentalsPaymentEvents_Insert
*
* Hist:	01	01/01/2009	John Cox		Initial Version
******************************************************************************************/
SET NOCOUNT ON
BEGIN

		DELETE FROM ST
		FROM Staging.Staging.RentalHousesCybersourcePaymentEvents ST
		JOIN RentalHouses.Fact.CybersourcePaymentEvents PE
		ON ST.request_id = PE.request_id
		AND ST.event_type = PE.event_type
		AND ST.event_date = PE.event_date
		AND ST.merchant_id = PE.merchant_id
		AND ST.merchant_ref_number = PE.merchant_ref_number
		
		INSERT INTO RentalHouses.Fact.CybersourcePaymentEvents
		SELECT	request_id,
				merchant_id,
				merchant_ref_number,
				payment_type,
				event_type,
				event_date = CAST(event_date AS DATETIME),
				trans_ref_no,
				merchant_currency_code,
				merchant_amount = CAST(merchant_amount AS MONEY),
				consumer_currency_code,
				consumer_amount = CAST(consumer_amount AS MONEY),
				fee_currency_code,
				fee_amount,
				processor_message
		FROM Staging.RentalHousesCybersourcePaymentEvents

END
SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [Staging].[RentalsCybersourceConversion_Insert]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Staging].[RentalsCybersourceConversion_Insert]
AS
/******************************************************************************************
*
* Name: Staging.RentalsCybersourceConversion_Insert
*
* Desc: Staging.RentalsCybersourceConversion_Insert
*
* Test: EXEC Staging.RentalsCybersourceConversion_Insert
*
* Hist:	01	01/01/2009	John Cox		Initial Version
******************************************************************************************/
SET NOCOUNT ON
BEGIN

		DELETE FROM Staging.Staging.RentalsCyberSourceConversion
		FROM Staging.Staging.RentalsCyberSourceConversion CSC
		JOIN Rentals.Fact.CybersourceNotes CSN
		ON CSN.ConversionDate = CSC.ConversionDate
		AND CSN.MerchantReferenceNumber = CSC.MerchantReferenceNumber
		AND CSN.NewDecision = CSC.NewDecision
		AND CSN.OriginalDecision = CSC.OriginalDecision
		AND CSN.Profile = CSC.Profile
		AND CSN.Queue = CSC.Queue
		AND CSN.RequestID = CSC.RequestID
		AND CSN.Reviewer = CSC.Reviewer
		AND CSN.ReviewerComments = CSC.ReviewerComments

		INSERT INTO Rentals.Fact.CybersourceNotes
		SELECT	RequestID,
				Reviewer,
				ReviewerComments,
				ConversionDate,
				OriginalDecision,
				NewDecision,
				Queue,
				Profile,
				MerchantReferenceNumber
		FROM Staging.Staging.RentalsCyberSourceConversion

END
SET NOCOUNT OFF


GO
/****** Object:  StoredProcedure [Staging].[RentalsPaymentBatch_Insert]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Staging].[RentalsPaymentBatch_Insert]
AS
/******************************************************************************************
*
* Name: Staging.RentalsPaymentBatch_Insert
*
* Desc: Staging.RentalsPaymentBatch_Insert
*
* Test: Exec Staging.RentalsPaymentBatch_Insert
*
* Hist:	01	01/01/2009	John Cox		Initial Version
******************************************************************************************/
SET NOCOUNT ON
BEGIN

		DELETE FROM Staging.Staging.RentalsCybersourcePaymentBatch
		WHERE request_id IN (SELECT request_id FROM Rentals.Fact.CybersourcePayments)

		INSERT INTO Rentals.Fact.CybersourcePayments
				(batch_id,
				 merchant_id,
				 BatchDate,
				 request_id,
				 merchant_ref_number,
				 trans_ref_no,
				 payment_method,
				 currency,
				 amount,
				 transaction_type)
		SELECT	batch_id,
				merchant_id,
				BatchDate = CAST(batch_date AS DATETIME),
				request_id,
				merchant_ref_number,
				trans_ref_no,
				payment_method,
				currency,
				amount = CAST(amount AS MONEY),
				transaction_type
		FROM Staging.RentalsCybersourcePaymentBatch

END
SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [Staging].[RentalsPaymentEvents_Insert]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [Staging].[RentalsPaymentEvents_Insert]
AS
/******************************************************************************************
*
* Name: Staging.RentalsPaymentBatch_Insert
*
* Desc: Staging.RentalsPaymentBatch_Insert
*
* Test: Exec Staging.RentalsPaymentEvents_Insert
*
* Hist:	01	01/01/2009	John Cox		Initial Version
******************************************************************************************/
SET NOCOUNT ON
BEGIN

		DELETE FROM ST
		FROM Staging.Staging.RentalsCybersourcePaymentEvents ST
		JOIN Rentals.Fact.CybersourcePaymentEvents PE
		ON ST.request_id = PE.request_id
		AND ST.event_type = PE.event_type
		AND ST.event_date = PE.event_date
		AND ST.merchant_id = PE.merchant_id
		AND ST.merchant_ref_number = PE.merchant_ref_number
		

		INSERT INTO Rentals.Fact.CybersourcePaymentEvents
		SELECT	request_id,
				merchant_id,
				merchant_ref_number,
				payment_type,
				event_type,
				event_date = CAST(event_date AS DATETIME),
				trans_ref_no,
				merchant_currency_code,
				merchant_amount = CAST(merchant_amount AS MONEY),
				consumer_currency_code,
				consumer_amount = CAST(consumer_amount AS MONEY),
				fee_currency_code,
				fee_amount,
				processor_message
		FROM Staging.RentalsCybersourcePaymentEvents

END
SET NOCOUNT OFF

GO
/****** Object:  StoredProcedure [Staging].[RentalsTrustCommerce_Archive]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






CREATE PROCEDURE [Staging].[RentalsTrustCommerce_Archive]
AS
/******************************************************************************************
*
* Name: Staging.RentalsTrustCommerce_Archive
*
* Desc:	Inserts TC transactions from Staging to Production
*
* Test:	exec Staging.RentalsTrustCommerce_Archive
*
* Hist:	01	09/23/2009	John Cox	Initial Version
******************************************************************************************/
SET NOCOUNT ON

BEGIN

	BEGIN TRY
		DROP TABLE #TCArchive
	END TRY
	BEGIN CATCH
	END CATCH
	
	SELECT *
	INTO #TCArchive
	FROM Staging.Staging.RentalsTrustCommerceTransactions
	
	DELETE FROM #TCArchive
	WHERE transid IN (SELECT transid FROM Sandbox.Rentals.TrustCommerceArchive)
	
	INSERT INTO Sandbox.Rentals.TrustCommerceArchive
	SELECT	cc,
			media_name,
			[exp],
			trans_date,
			transid,
			ref_transid,
			amount,
			auth_amount,
			bank_amount,
			credit_amount,
			chargeback_amount,
			action_name,
			status_name,
			[name],
			address1,
			address2,
			city,
			state,
			zip,
			phone,
			email,
			shiptosame,
			shipto_name,
			shipto_address1,
			shipto_address2,
			shipto_city,
			shipto_state,
			shipto_zip,
			expired,
			reauth,
			chain,
			chain_head,
			ticket,
			batchnum,
			authcode,
			billingid,
			custid,
			fail_name,
			avs,
			operator,
			[server],
			transid2,
			billingid2,
			customfield1,
			customfield2,
			customfield3,
			customfield4,
			customfield5,
			customfield6,
			country_code,
			tax,
			purchaseordernum,
			batchid,
			closed,
			entry_mode
	FROM #TCArchive
	
	DROP TABLE #TCArchive

END

SET NOCOUNT OFF




GO
/****** Object:  StoredProcedure [Staging].[rpt_RealPagePropertyManagement]    Script Date: 9/5/2017 7:21:06 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [Staging].[rpt_RealPagePropertyManagement]
    (
      @ManagementName varchar(50),
      @CompanyID varchar(50),
      @GuestCardActive int 
    )
AS /******************************************************************************************
*
* Name: Staging.rpt_RealPagePropertyManagement
*
* Desc:-- Real Page Property Management
*      -- Copy over name and CompanyID
*      -- GuestCardActive:   1 = Active  0 = Not Active
*
*
* Test:	exec [Staging].[rpt_RealPagePropertyManagement] 'Hagan Properties','2042062',1
*
* Hist:	01	08/10/2010	Richard Chen   Initial Version
******************************************************************************************/
    SET NOCOUNT ON

    BEGIN
       
        BEGIN TRY
            Delete  from staging..APTGRealPagePropertyManagementLookup
            where   CompanyID = @CompanyID
        END TRY
        BEGIN CATCH
        END CATCH

        INSERT  INTO staging..APTGRealPagePropertyManagementLookup
        VALUES  (
                  @ManagementName,
                  @CompanyID,
                  @GuestCardActive
                )

        SELECT  ManagementName,
                CompanyID,
                GuestCardActive = CAST(GuestCardActive as int)
        FROM    staging..APTGRealPagePropertyManagementLookup

    END

    SET NOCOUNT OFF



GO
EXEC [Staging].sys.sp_addextendedproperty @name=N'SQLSourceControl Scripts Location', @value=N'<?xml version="1.0" encoding="utf-16" standalone="yes"?>
<ISOCCompareLocation version="1" type="SvnLocation">
  <RepositoryUrl>http://svn.atl.primedia.com/repos/dev-projects/trunk/BusinessIntelligence/Warehouse01/Databases/Staging/</RepositoryUrl>
</ISOCCompareLocation>' 
GO
EXEC [Staging].sys.sp_addextendedproperty @name=N'SQLSourceControl Database Revision', @value=76588 
GO
USE [master]
GO
ALTER DATABASE [Staging] SET  READ_WRITE 
GO
