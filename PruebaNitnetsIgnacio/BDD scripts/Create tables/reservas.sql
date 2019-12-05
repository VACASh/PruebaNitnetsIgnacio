USE [DataBaseSportClub]
GO

/****** Object:  Table [dbo].[Reservas]    Script Date: 05/12/2019 18:39:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Reservas](
	[IdReservation] [int] IDENTITY(1,1) NOT NULL,
	[idCourt] [int] NOT NULL,
	[IdMember] [int] NOT NULL,
	[DateReservation] [datetime] NOT NULL,
	[KindSport] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdReservation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_Pistas] FOREIGN KEY([idCourt])
REFERENCES [dbo].[Pistas] ([IdCourt])
GO

ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_Pistas]
GO

ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_ToDeportes] FOREIGN KEY([KindSport])
REFERENCES [dbo].[Deportes] ([KindSport])
GO

ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_ToDeportes]
GO

ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [FK_Reservas_ToSocios] FOREIGN KEY([IdMember])
REFERENCES [dbo].[Socios] ([IdMember])
GO

ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [FK_Reservas_ToSocios]
GO

