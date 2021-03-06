USE [master]
GO
/****** Object:  Database [AvtorizationApp]    Script Date: 31.01.2022 12:58:19 ******/
CREATE DATABASE [AvtorizationApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AvtorizationApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERR\MSSQL\DATA\AvtorizationApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AvtorizationApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVERR\MSSQL\DATA\AvtorizationApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AvtorizationApp] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AvtorizationApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AvtorizationApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AvtorizationApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AvtorizationApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AvtorizationApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AvtorizationApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [AvtorizationApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AvtorizationApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AvtorizationApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AvtorizationApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AvtorizationApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AvtorizationApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AvtorizationApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AvtorizationApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AvtorizationApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AvtorizationApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AvtorizationApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AvtorizationApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AvtorizationApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AvtorizationApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AvtorizationApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AvtorizationApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AvtorizationApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AvtorizationApp] SET RECOVERY FULL 
GO
ALTER DATABASE [AvtorizationApp] SET  MULTI_USER 
GO
ALTER DATABASE [AvtorizationApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AvtorizationApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AvtorizationApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AvtorizationApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AvtorizationApp] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AvtorizationApp] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AvtorizationApp', N'ON'
GO
ALTER DATABASE [AvtorizationApp] SET QUERY_STORE = OFF
GO
USE [AvtorizationApp]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 31.01.2022 12:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Code] [nchar](1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 31.01.2022 12:58:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[IDRole] [nchar](1) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Role] ([Code], [Title]) VALUES (N'a', N'admin')
INSERT [dbo].[Role] ([Code], [Title]) VALUES (N'c', N'client')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Username], [Password], [IDRole]) VALUES (1, N'admin', N'admin', N'a')
INSERT [dbo].[User] ([ID], [Username], [Password], [IDRole]) VALUES (2, N'client', N'client', N'c')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([IDRole])
REFERENCES [dbo].[Role] ([Code])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [AvtorizationApp] SET  READ_WRITE 
GO
