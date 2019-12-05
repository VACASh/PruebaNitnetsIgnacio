USE [DataBaseSportClub]
GO

/****** Object:  Table [dbo].[Usuarios]    Script Date: 05/12/2019 18:40:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Usuarios](
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Dni] [varchar](20) NOT NULL,
	[Email] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

