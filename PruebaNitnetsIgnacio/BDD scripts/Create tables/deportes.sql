USE [DataBaseSportClub]
GO

/****** Object:  Table [dbo].[Deportes]    Script Date: 05/12/2019 18:39:22 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Deportes](
	[KindSport] [varchar](50) NOT NULL,
	[DescSport] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[KindSport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

