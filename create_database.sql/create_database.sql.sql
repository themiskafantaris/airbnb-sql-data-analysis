
CREATE DATABASE [Greek Airbnb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Greek Airbnb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Greek Airbnb.mdf' , SIZE = 1187840KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Greek Airbnb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Greek Airbnb_log.ldf' , SIZE = 3547136KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Greek Airbnb] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Greek Airbnb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Greek Airbnb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Greek Airbnb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Greek Airbnb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Greek Airbnb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Greek Airbnb] SET ARITHABORT OFF 
GO
ALTER DATABASE [Greek Airbnb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Greek Airbnb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Greek Airbnb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Greek Airbnb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Greek Airbnb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Greek Airbnb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Greek Airbnb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Greek Airbnb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Greek Airbnb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Greek Airbnb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Greek Airbnb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Greek Airbnb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Greek Airbnb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Greek Airbnb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Greek Airbnb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Greek Airbnb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Greek Airbnb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Greek Airbnb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Greek Airbnb] SET  MULTI_USER 
GO
ALTER DATABASE [Greek Airbnb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Greek Airbnb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Greek Airbnb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Greek Airbnb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Greek Airbnb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Greek Airbnb] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Greek Airbnb] SET QUERY_STORE = ON
GO
ALTER DATABASE [Greek Airbnb] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Greek Airbnb]
GO
/****** Object:  Table [dbo].[calendar]    Script Date: 1/3/2025 2:26:47 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[calendar](
	[listing_id] [bigint] NOT NULL,
	[date] [varchar](50) NOT NULL,
	[available] [varchar](3) NULL,
	[price] [varchar](50) NULL,
	[adjusted_price] [varchar](50) NOT NULL,
	[minimum_nights] [varchar](50) NULL,
	[maximum_nights] [varchar](50) NULL,
	[price_temp] [numeric](18, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[listings]    Script Date: 1/3/2025 2:26:47 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[listings](
	[id] [bigint] NOT NULL,
	[listing_url] [nvarchar](50) NOT NULL,
	[scrape_id] [datetime2](7) NOT NULL,
	[last_scraped] [date] NOT NULL,
	[source] [nvarchar](50) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](1050) NULL,
	[neighborhood_overview] [nvarchar](1050) NULL,
	[picture_url] [nvarchar](150) NOT NULL,
	[host_id] [int] NULL,
	[host_url] [nvarchar](50) NULL,
	[host_name] [nvarchar](50) NULL,
	[host_since] [date] NULL,
	[host_location] [nvarchar](50) NULL,
	[host_about] [nvarchar](max) NULL,
	[host_response_time] [nvarchar](50) NULL,
	[host_response_rate] [nvarchar](50) NULL,
	[host_acceptance_rate] [nvarchar](50) NULL,
	[host_is_superhost] [bit] NULL,
	[host_thumbnail_url] [nvarchar](150) NULL,
	[host_picture_url] [nvarchar](150) NULL,
	[host_neighbourhood] [nvarchar](50) NULL,
	[host_listings_count] [bigint] NULL,
	[host_total_listings_count] [smallint] NULL,
	[host_verifications] [nvarchar](50) NULL,
	[host_has_profile_pic] [bit] NULL,
	[host_identity_verified] [bit] NULL,
	[neighbourhood] [varchar](max) NULL,
	[neighbourhood_cleansed] [nvarchar](50) NULL,
	[neighbourhood_group_cleansed] [nvarchar](1) NULL,
	[latitude] [float] NOT NULL,
	[longitude] [float] NOT NULL,
	[property_type] [nvarchar](50) NOT NULL,
	[room_type] [nvarchar](50) NOT NULL,
	[accommodates] [tinyint] NOT NULL,
	[bathrooms] [nvarchar](1) NULL,
	[bathrooms_text] [nvarchar](50) NULL,
	[bedrooms] [tinyint] NULL,
	[beds] [tinyint] NULL,
	[amenities] [varchar](max) NOT NULL,
	[price] [money] NOT NULL,
	[minimum_nights] [smallint] NOT NULL,
	[maximum_nights] [smallint] NOT NULL,
	[minimum_minimum_nights] [smallint] NOT NULL,
	[maximum_minimum_nights] [smallint] NOT NULL,
	[minimum_maximum_nights] [smallint] NOT NULL,
	[maximum_maximum_nights] [smallint] NOT NULL,
	[minimum_nights_avg_ntm] [float] NOT NULL,
	[maximum_nights_avg_ntm] [float] NOT NULL,
	[calendar_updated] [nvarchar](1) NULL,
	[has_availability] [bit] NOT NULL,
	[availability_30] [tinyint] NOT NULL,
	[availability_60] [tinyint] NOT NULL,
	[availability_90] [tinyint] NOT NULL,
	[availability_365] [smallint] NOT NULL,
	[calendar_last_scraped] [date] NOT NULL,
	[number_of_reviews] [smallint] NOT NULL,
	[number_of_reviews_ltm] [tinyint] NOT NULL,
	[number_of_reviews_l30d] [tinyint] NOT NULL,
	[first_review] [date] NULL,
	[last_review] [date] NULL,
	[review_scores_rating] [float] NULL,
	[review_scores_accuracy] [float] NULL,
	[review_scores_cleanliness] [float] NULL,
	[review_scores_checkin] [float] NULL,
	[review_scores_communication] [float] NULL,
	[review_scores_location] [float] NULL,
	[review_scores_value] [float] NULL,
	[license] [nvarchar](50) NULL,
	[instant_bookable] [bit] NOT NULL,
	[calculated_host_listings_count] [bigint] NOT NULL,
	[calculated_host_listings_count_entire_homes] [bigint] NOT NULL,
	[calculated_host_listings_count_private_rooms] [bigint] NOT NULL,
	[calculated_host_listings_count_shared_rooms] [bigint] NOT NULL,
	[reviews_per_month] [float] NULL,
 CONSTRAINT [PK_listings] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[reviews]    Script Date: 1/3/2025 2:26:47 μμ ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reviews](
	[listing_id] [bigint] NOT NULL,
	[id] [bigint] NOT NULL,
	[date] [date] NOT NULL,
	[reviewer_id] [int] NOT NULL,
	[reviewer_name] [nvarchar](50) NULL,
	[comments] [nvarchar](max) NULL,
 CONSTRAINT [PK_reviews] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[calendar]  WITH CHECK ADD  CONSTRAINT [FK_calendar_listings] FOREIGN KEY([listing_id])
REFERENCES [dbo].[listings] ([id])
GO
ALTER TABLE [dbo].[calendar] CHECK CONSTRAINT [FK_calendar_listings]
GO
ALTER TABLE [dbo].[reviews]  WITH CHECK ADD  CONSTRAINT [reviews_listings] FOREIGN KEY([listing_id])
REFERENCES [dbo].[listings] ([id])
GO
ALTER TABLE [dbo].[reviews] CHECK CONSTRAINT [reviews_listings]
GO
USE [master]
GO
ALTER DATABASE [Greek Airbnb] SET  READ_WRITE 
GO
