USE [DataBaseSportClub]
GO

/****** Object:  Table [dbo].[Pistas]    Script Date: 05/12/2019 18:39:34 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Pistas](
	[IdCourt] [int] IDENTITY(1,1) NOT NULL,
	[KindSport] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCourt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Pistas]  WITH CHECK ADD  CONSTRAINT [FK_Pistas_ToDeportes] FOREIGN KEY([KindSport])
REFERENCES [dbo].[Deportes] ([KindSport])
GO

ALTER TABLE [dbo].[Pistas] CHECK CONSTRAINT [FK_Pistas_ToDeportes]
GO

