USE [DataBaseSportClub]
GO

/****** Object:  Table [dbo].[Socios]    Script Date: 05/12/2019 18:39:50 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Socios](
	[IdMember] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[FirstSurname] [varchar](50) NOT NULL,
	[SecondSurname] [varchar](50) NULL,
	[IdentityNumber] [varchar](20) NOT NULL,
	[AddressStreet] [varchar](50) NOT NULL,
	[AdressNumber] [varchar](10) NOT NULL,
	[AddressFloor] [int] NULL,
	[ZipCode] [varchar](15) NOT NULL,
	[Email] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMember] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

