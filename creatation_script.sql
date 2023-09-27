USE [master]
GO
/****** Object:  Database [MovieDB]    Script Date: 2023/09/27 17:18:57 ******/
CREATE DATABASE [MovieDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MovieDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\MovieDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [MovieDB] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MovieDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MovieDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieDB] SET  MULTI_USER 
GO
ALTER DATABASE [MovieDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [MovieDB] SET QUERY_STORE = OFF
GO
USE [MovieDB]
GO
/****** Object:  User [john]    Script Date: 2023/09/27 17:18:57 ******/
CREATE USER [john] FOR LOGIN [john] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Actors]    Script Date: 2023/09/27 17:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Actors](
	[ActorID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](120) NULL,
	[BirthDate] [date] NULL,
	[ActorImage] [varbinary](max) NULL,
	[Birthplace] [varchar](80) NULL,
	[CountryOfBirth] [varchar](100) NULL,
 CONSTRAINT [PK_Actors] PRIMARY KEY CLUSTERED 
(
	[ActorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ActorUpdates]    Script Date: 2023/09/27 17:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActorUpdates](
	[MovieID] [int] NULL,
	[FirstName] [varchar](80) NULL,
	[LastName] [varchar](120) NULL,
	[BirthDate] [date] NULL,
	[BirthPlace] [varchar](80) NULL,
	[CountryOfBirth] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Directors]    Script Date: 2023/09/27 17:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Directors](
	[DirectorID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](120) NULL,
	[BirthDate] [date] NULL,
	[DirectorImage] [varbinary](max) NULL,
	[BirthPlace] [varchar](80) NULL,
	[CountryOfBirth] [varchar](100) NULL,
 CONSTRAINT [PK_Directors] PRIMARY KEY CLUSTERED 
(
	[DirectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 2023/09/27 17:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[City] [varchar](50) NULL,
	[Lat] [float] NULL,
	[Lon] [float] NULL,
	[Geo] [geography] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 2023/09/27 17:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[MovieID] [int] IDENTITY(1,1) NOT NULL,
	[MovieName] [varchar](120) NULL,
	[ReleaseDate] [date] NULL,
	[RunningTime] [int] NULL,
	[MovieDescription] [varchar](8000) NULL,
	[Genre] [varchar](1000) NULL,
	[MoviePoster] [varbinary](max) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[MovieID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producers]    Script Date: 2023/09/27 17:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producers](
	[ProducerID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](120) NULL,
	[BirthDate] [date] NULL,
	[ProducerImage] [varbinary](max) NULL,
	[BirthPlace] [varchar](80) NULL,
	[CountryOfBirth] [varchar](100) NULL,
 CONSTRAINT [PK_Producers] PRIMARY KEY CLUSTERED 
(
	[ProducerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Writers]    Script Date: 2023/09/27 17:18:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writers](
	[WriterID] [int] IDENTITY(1,1) NOT NULL,
	[MovieID] [int] NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](120) NULL,
	[BirthDate] [date] NULL,
	[WriterImage] [varbinary](max) NULL,
	[BirthPlace] [varchar](80) NULL,
	[CountryOfBirth] [varchar](100) NULL,
 CONSTRAINT [PK_Writers] PRIMARY KEY CLUSTERED 
(
	[WriterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Actors] ON 
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (1, 1, N'Bill', N'Murray', CAST(N'1950-09-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (2, 1, N'Dan', N'Aykroyd', CAST(N'1952-07-01' AS Date), NULL, N'Ontario', N'Canada')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (3, 1, N'Sigourney', N'Weaver', CAST(N'1949-10-08' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (4, 1, N'Harold', N'Ramis', CAST(N'1944-11-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (5, 1, N'Rick', N'Moranis', CAST(N'1953-04-18' AS Date), NULL, N'Ontario', N'Canada')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (6, 1, N'Ernie', N'Hudson', CAST(N'1945-12-17' AS Date), NULL, N'Michigan', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (7, 2, N'Kevin', N'Costner', CAST(N'1955-01-18' AS Date), NULL, N'California', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (8, 2, N'Mary', N'McDonnell', CAST(N'1952-04-28' AS Date), NULL, N'Pennsylvania', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (9, 3, N'Sigourney', N'Weaver', CAST(N'1949-10-08' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (10, 3, N'Michael', N'Biehn', CAST(N'1956-07-31' AS Date), NULL, N'Alabama', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (11, 3, N'Paul', N'Reiser', CAST(N'1957-03-30' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (12, 3, N'Lance', N'Henriksen', CAST(N'1940-05-05' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (13, 3, N'Bill', N'Paxton', CAST(N'1955-05-17' AS Date), NULL, N'Texas', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (14, 4, N'Harrison', N'Ford', CAST(N'1942-07-13' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (15, 4, N'Rutger', N'Hauer', CAST(N'1944-01-23' AS Date), NULL, N'Utrecht', N'Netherlands')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (16, 4, N'Sean', N'Young', CAST(N'1959-11-20' AS Date), NULL, N'Kentucky', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (17, 4, N'Daryl', N'Hannah', CAST(N'1960-12-03' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (18, 5, N'Noomi', N'Rapace', CAST(N'1979-12-28' AS Date), NULL, N'Hudiksvall', N'Sweden')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (19, 5, N'Michael', N'Fassbender', CAST(N'1977-04-02' AS Date), NULL, N'Heidelberg', N'West Germany')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (20, 5, N'Charlize', N'Theron', CAST(N'1975-08-07' AS Date), NULL, N'Benoni', N'South Africa')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (21, 5, N'Idris', N'Elba', CAST(N'1972-09-06' AS Date), NULL, N'London', N'UK')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (22, 5, N'Guy', N'Pearce', CAST(N'1967-10-05' AS Date), NULL, N'Cambridgeshire', N'UK')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (23, 6, N'Tom', N'Skerritt', CAST(N'1933-08-25' AS Date), NULL, N'Michigan', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (24, 6, N'Sigourney', N'Weaver', CAST(N'1949-10-08' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (25, 6, N'Veronica', N'Cartwright', CAST(N'1949-04-20' AS Date), NULL, N'Bristol', N'UK')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (26, 6, N'John', N'Hurt', CAST(N'1940-01-22' AS Date), NULL, N'Derbyshire', N'UK')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (27, 6, N'Ian', N'Holm', CAST(N'1931-09-12' AS Date), NULL, N'Essex', N'UK')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (28, 6, N'Yaphet', N'Kotto', CAST(N'1939-11-15' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (29, 7, N'Bill', N'Murray', CAST(N'1950-09-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (30, 7, N'Andie', N'MacDowell', CAST(N'1958-04-21' AS Date), NULL, N'South Carolina', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (31, 7, N'Chris', N'Elliott', CAST(N'1960-05-31' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (32, 7, N'Stephen', N'Tobolowsky', CAST(N'1951-05-30' AS Date), NULL, N'Dallas', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (33, 7, N'Harold', N'Ramis', CAST(N'1944-11-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (34, 8, N'Keanu', N'Reeves', CAST(N'1964-09-02' AS Date), NULL, N'Beirut', N'Lebanon')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (35, 8, N'Laurence', N'Fishburne', CAST(N'1961-07-30' AS Date), NULL, N'Georgia', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (36, 8, N'Carrie-Anne', N'Moss', CAST(N'1967-08-21' AS Date), NULL, N'Vancouver', N'Canada')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (37, 8, N'Hugo', N'Weaving', CAST(N'1960-04-04' AS Date), NULL, N'Ibadan', N'Nigeria')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (38, 8, N'Joe', N'Pantoliano', CAST(N'1951-09-12' AS Date), NULL, N'New Jersey', N'USA')
GO
INSERT [dbo].[Actors] ([ActorID], [MovieID], [FirstName], [LastName], [BirthDate], [ActorImage], [Birthplace], [CountryOfBirth]) VALUES (39, 8, N'Matt', N'Doran', CAST(N'1976-03-30' AS Date), NULL, N'Sidney', N'Australia')
GO
SET IDENTITY_INSERT [dbo].[Actors] OFF
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (1, N'Bill', N'Murray', CAST(N'1950-09-21' AS Date), N'Chicago', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (1, N'Dan', N'Aykroyd', CAST(N'1952-07-01' AS Date), N'Ontario', N'Canada')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (1, N'Sigourney', N'Weaver', CAST(N'1949-10-08' AS Date), N'New York', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (1, N'Harold', N'Ramis', CAST(N'1944-11-21' AS Date), N'Chicago', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (1, N'Rick', N'Moranis', CAST(N'1953-04-18' AS Date), N'Ontario', N'Canada')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (1, N'Ernie', N'Hudson', CAST(N'1945-12-17' AS Date), N'Michigan', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (2, N'Kevin', N'Costner', CAST(N'1955-01-18' AS Date), N'California', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (2, N'Mary', N'McDonnell', CAST(N'1952-04-28' AS Date), N'Pennsylvania', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (3, N'Sigourney', N'Weaver', CAST(N'1949-10-08' AS Date), N'New York', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (3, N'Michael', N'Biehn', CAST(N'1956-07-31' AS Date), N'Alabama', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (3, N'Paul', N'Reiser', CAST(N'1957-03-30' AS Date), N'New York', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (3, N'Lance', N'Henriksen', CAST(N'1940-05-05' AS Date), N'New York', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (3, N'Bill', N'Paxton', CAST(N'1955-05-17' AS Date), N'Texas', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (4, N'Harrison', N'Ford', CAST(N'1942-07-13' AS Date), N'Chicago', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (4, N'Rutger', N'Hauer', CAST(N'1944-01-23' AS Date), N'Utrecht', N'Netherlands')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (4, N'Sean', N'Young', CAST(N'1959-11-20' AS Date), N'Kentucky', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (4, N'Daryl', N'Hannah', CAST(N'1960-12-03' AS Date), N'Chicago', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (5, N'Noomi', N'Rapace', CAST(N'1979-12-28' AS Date), N'Hudiksvall', N'Sweden')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (5, N'Michael', N'Fassbender', CAST(N'1977-04-02' AS Date), N'Heidelberg', N'West Germany')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (5, N'Charlize', N'Theron', CAST(N'1975-08-07' AS Date), N'Benoni', N'South Africa')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (5, N'Idris', N'Elba', CAST(N'1972-09-06' AS Date), N'London', N'UK')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (5, N'Guy', N'Pearce', CAST(N'1967-10-05' AS Date), N'Cambridgeshire', N'UK')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (6, N'Tom', N'Skerritt', CAST(N'1933-08-25' AS Date), N'Michigan', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (6, N'Sigourney', N'Weaver', CAST(N'1949-10-08' AS Date), N'New York', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (6, N'Veronica', N'Cartwright', CAST(N'1949-04-20' AS Date), N'Bristol', N'UK')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (6, N'John', N'Hurt', CAST(N'1940-01-22' AS Date), N'Derbyshire', N'UK')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (6, N'Ian', N'Holm', CAST(N'1931-09-12' AS Date), N'Essex', N'UK')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (6, N'Yaphet', N'Kotto', CAST(N'1939-11-15' AS Date), N'New York', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (7, N'Bill', N'Murray', CAST(N'1950-09-21' AS Date), N'Chicago', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (7, N'Andie', N'MacDowell', CAST(N'1958-04-21' AS Date), N'South Carolina', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (7, N'Chris', N'Elliott', CAST(N'1960-05-31' AS Date), N'New York', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (7, N'Stephen', N'Tobolowsky', CAST(N'1951-05-30' AS Date), N'Dallas', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (7, N'Harold', N'Ramis', CAST(N'1944-11-21' AS Date), N'Chicago', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (8, N'Keanu', N'Reeves', CAST(N'1964-09-02' AS Date), N'Beirut', N'Lebanon')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (8, N'Laurence', N'Fishburne', CAST(N'1961-07-30' AS Date), N'Georgia', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (8, N'Carrie-Anne', N'Moss', CAST(N'1967-08-21' AS Date), N'Vancouver', N'Canada')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (8, N'Hugo', N'Weaving', CAST(N'1960-04-04' AS Date), N'Ibadan', N'Nigeria')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (8, N'Joe', N'Pantoliano', CAST(N'1951-09-12' AS Date), N'New Jersey', N'USA')
GO
INSERT [dbo].[ActorUpdates] ([MovieID], [FirstName], [LastName], [BirthDate], [BirthPlace], [CountryOfBirth]) VALUES (8, N'Matt', N'Doran', CAST(N'1976-03-30' AS Date), N'Sidney', N'Australia')
GO
SET IDENTITY_INSERT [dbo].[Directors] ON 
GO
INSERT [dbo].[Directors] ([DirectorID], [MovieID], [FirstName], [LastName], [BirthDate], [DirectorImage], [BirthPlace], [CountryOfBirth]) VALUES (1, 1, N'Ivan', N'Reitman', CAST(N'1946-10-27' AS Date), NULL, N'Komárno', N'Slovak Republic')
GO
INSERT [dbo].[Directors] ([DirectorID], [MovieID], [FirstName], [LastName], [BirthDate], [DirectorImage], [BirthPlace], [CountryOfBirth]) VALUES (2, 2, N'Kevin', N'Costner', CAST(N'1955-01-18' AS Date), NULL, N'California', N'USA')
GO
INSERT [dbo].[Directors] ([DirectorID], [MovieID], [FirstName], [LastName], [BirthDate], [DirectorImage], [BirthPlace], [CountryOfBirth]) VALUES (3, 3, N'James', N'Cameron', CAST(N'1954-08-16' AS Date), NULL, N'Ontario', N'Canada')
GO
INSERT [dbo].[Directors] ([DirectorID], [MovieID], [FirstName], [LastName], [BirthDate], [DirectorImage], [BirthPlace], [CountryOfBirth]) VALUES (4, 4, N'Ridley', N'Scott', CAST(N'1937-11-30' AS Date), NULL, N'England', N'UK')
GO
INSERT [dbo].[Directors] ([DirectorID], [MovieID], [FirstName], [LastName], [BirthDate], [DirectorImage], [BirthPlace], [CountryOfBirth]) VALUES (5, 5, N'Ridley', N'Scott', CAST(N'1937-11-30' AS Date), NULL, N'England', N'UK')
GO
INSERT [dbo].[Directors] ([DirectorID], [MovieID], [FirstName], [LastName], [BirthDate], [DirectorImage], [BirthPlace], [CountryOfBirth]) VALUES (6, 6, N'Ridley', N'Scott', CAST(N'1937-11-30' AS Date), NULL, N'England', N'UK')
GO
INSERT [dbo].[Directors] ([DirectorID], [MovieID], [FirstName], [LastName], [BirthDate], [DirectorImage], [BirthPlace], [CountryOfBirth]) VALUES (7, 7, N'Harold', N'Ramis', CAST(N'1944-11-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Directors] ([DirectorID], [MovieID], [FirstName], [LastName], [BirthDate], [DirectorImage], [BirthPlace], [CountryOfBirth]) VALUES (8, 8, N'Lana', N'Wachowski', CAST(N'1965-06-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Directors] ([DirectorID], [MovieID], [FirstName], [LastName], [BirthDate], [DirectorImage], [BirthPlace], [CountryOfBirth]) VALUES (9, 8, N'Lilly', N'Wachowski', CAST(N'1967-12-29' AS Date), NULL, N'Chicago', N'USA')
GO
SET IDENTITY_INSERT [dbo].[Directors] OFF
GO
INSERT [dbo].[Locations] ([City], [Lat], [Lon], [Geo]) VALUES (N'Carpinteria', 34.398, -119.518, 0xE6100000010C6DE7FBA9F1324140FED478E926E15DC0)
GO
INSERT [dbo].[Locations] ([City], [Lat], [Lon], [Geo]) VALUES (N'New York', 40.71, -74.005, 0xE6100000010C7B14AE47E15A4440B81E85EB518052C0)
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 
GO
INSERT [dbo].[Movies] ([MovieID], [MovieName], [ReleaseDate], [RunningTime], [MovieDescription], [Genre], [MoviePoster]) VALUES (1, N'Ghostbusters', CAST(N'1984-06-08' AS Date), 105, N'', N'Comedy, Horror', NULL)
GO
INSERT [dbo].[Movies] ([MovieID], [MovieName], [ReleaseDate], [RunningTime], [MovieDescription], [Genre], [MoviePoster]) VALUES (2, N'Dances With Wolves', CAST(N'1990-11-21' AS Date), 181, N'', N'Drama, Western, Romance', NULL)
GO
INSERT [dbo].[Movies] ([MovieID], [MovieName], [ReleaseDate], [RunningTime], [MovieDescription], [Genre], [MoviePoster]) VALUES (3, N'Aliens', CAST(N'1986-07-18' AS Date), 137, N'', N'Action, Horror, Drama, Science Fiction', NULL)
GO
INSERT [dbo].[Movies] ([MovieID], [MovieName], [ReleaseDate], [RunningTime], [MovieDescription], [Genre], [MoviePoster]) VALUES (4, N'Bladerunner', CAST(N'1982-06-25' AS Date), 117, N'', N'Science Fiction, Drama', NULL)
GO
INSERT [dbo].[Movies] ([MovieID], [MovieName], [ReleaseDate], [RunningTime], [MovieDescription], [Genre], [MoviePoster]) VALUES (5, N'Prometheus', CAST(N'2012-06-08' AS Date), 124, N'', N'Drama, Science Fiction, Action, Horror', NULL)
GO
INSERT [dbo].[Movies] ([MovieID], [MovieName], [ReleaseDate], [RunningTime], [MovieDescription], [Genre], [MoviePoster]) VALUES (6, N'Alien', CAST(N'1979-06-22' AS Date), 117, N'', N'Horror, Suspense, Science Fiction', NULL)
GO
INSERT [dbo].[Movies] ([MovieID], [MovieName], [ReleaseDate], [RunningTime], [MovieDescription], [Genre], [MoviePoster]) VALUES (7, N'Groundhog Day', CAST(N'1993-02-12' AS Date), 101, N'', N'Comedy, Romance', NULL)
GO
INSERT [dbo].[Movies] ([MovieID], [MovieName], [ReleaseDate], [RunningTime], [MovieDescription], [Genre], [MoviePoster]) VALUES (8, N'The Matrix', CAST(N'1999-03-31' AS Date), 136, N'', N'Science Fiction, Action', NULL)
GO
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Producers] ON 
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (1, 1, N'Ivan', N'Reitman', CAST(N'1946-10-27' AS Date), NULL, N'Komárno', N'Slovak Republic')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (2, 2, N'Kevin', N'Costner', CAST(N'1955-01-18' AS Date), NULL, N'California', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (3, 3, N'James', N'Cameron', CAST(N'1954-08-16' AS Date), NULL, N'Ontario', N'Canada')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (4, 4, N'Michael', N'Deeley', CAST(N'1932-08-06' AS Date), NULL, N'London', N'UK')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (5, 4, N'Hampton', N'Fancher', CAST(N'1938-07-18' AS Date), NULL, N'California', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (6, 5, N'David', N'Giler', CAST(N'1948-09-15' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (7, 5, N'Walter', N'Hill', CAST(N'1942-01-10' AS Date), NULL, N'California', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (8, 5, N'Ridley', N'Scott', CAST(N'1937-11-30' AS Date), NULL, N'England', N'UK')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (9, 6, N'Gordon', N'Carroll', CAST(N'1959-09-15' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (10, 6, N'David', N'Giler', CAST(N'1948-09-15' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (11, 6, N'Walter', N'Hill', CAST(N'1942-01-10' AS Date), NULL, N'California', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (12, 7, N'Trevor', N'Albert', CAST(N'1959-09-15' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (13, 7, N'Harold', N'Ramis', CAST(N'1944-11-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (14, 8, N'Joel', N'Silver', CAST(N'1952-07-14' AS Date), NULL, N'New Jersey', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (15, 8, N'Lana', N'Wachowski', CAST(N'1965-06-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Producers] ([ProducerID], [MovieID], [FirstName], [LastName], [BirthDate], [ProducerImage], [BirthPlace], [CountryOfBirth]) VALUES (16, 8, N'Lilly', N'Wachowski', CAST(N'1967-12-29' AS Date), NULL, N'Chicago', N'USA')
GO
SET IDENTITY_INSERT [dbo].[Producers] OFF
GO
SET IDENTITY_INSERT [dbo].[Writers] ON 
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (1, 1, N'Dan', N'Aykroyd', CAST(N'1952-07-01' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (2, 1, N'Harold', N'Ramis', CAST(N'1944-11-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (3, 2, N'Michael', N'Blake', CAST(N'1945-07-05' AS Date), NULL, N'North Carolina', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (4, 3, N'James', N'Cameron', CAST(N'1954-08-16' AS Date), NULL, N'Ontario', N'Canada')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (5, 3, N'David', N'Giler', CAST(N'1948-09-15' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (6, 4, N'Hampton', N'Fancher', CAST(N'1938-07-18' AS Date), NULL, N'California', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (7, 4, N'David', N'Peoples', CAST(N'1940-09-15' AS Date), NULL, N'Connecticut', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (8, 4, N'Philip K', N'Dick', CAST(N'1928-12-16' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (9, 5, N'Jon', N'Spaihts', CAST(N'1959-09-15' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (10, 5, N'Damon', N'Lindelof', CAST(N'1973-04-24' AS Date), NULL, N'New Jersey', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (11, 6, N'Dan', N'O''Bannon', CAST(N'1946-09-30' AS Date), NULL, N'Missouri', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (12, 6, N'Ronald', N'Shusett', CAST(N'1959-09-15' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (13, 7, N'Danny', N'Rubin', CAST(N'1957-09-15' AS Date), NULL, N'New York', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (14, 7, N'Harold', N'Ramis', CAST(N'1944-11-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (15, 8, N'Lana', N'Wachowski', CAST(N'1965-06-21' AS Date), NULL, N'Chicago', N'USA')
GO
INSERT [dbo].[Writers] ([WriterID], [MovieID], [FirstName], [LastName], [BirthDate], [WriterImage], [BirthPlace], [CountryOfBirth]) VALUES (16, 8, N'Lilly', N'Wachowski', CAST(N'1967-12-29' AS Date), NULL, N'Chicago', N'USA')
GO
SET IDENTITY_INSERT [dbo].[Writers] OFF
GO
ALTER TABLE [dbo].[Directors]  WITH CHECK ADD  CONSTRAINT [CK_DirectorBirthDate] CHECK  (([BirthDate]<getdate()))
GO
ALTER TABLE [dbo].[Directors] CHECK CONSTRAINT [CK_DirectorBirthDate]
GO
ALTER TABLE [dbo].[Producers]  WITH CHECK ADD  CONSTRAINT [CK_ProducerBirthDate] CHECK  (([BirthDate]<getdate()))
GO
ALTER TABLE [dbo].[Producers] CHECK CONSTRAINT [CK_ProducerBirthDate]
GO
ALTER TABLE [dbo].[Writers]  WITH CHECK ADD  CONSTRAINT [CK_WriterBirthDate] CHECK  (([BirthDate]<getdate()))
GO
ALTER TABLE [dbo].[Writers] CHECK CONSTRAINT [CK_WriterBirthDate]
GO
USE [master]
GO
ALTER DATABASE [MovieDB] SET  READ_WRITE 
GO
