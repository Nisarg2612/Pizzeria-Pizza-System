CREATE TABLE [dbo].[PizzaSize](
	[PizzaSizeId] [int] IDENTITY(1,1) NOT NULL,
	[PizzaId] [int] NULL,
	[SizeId] [int] NULL,
	[Price] [money] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_PizzaSize_1] PRIMARY KEY CLUSTERED 
(
	[PizzaSizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[PizzaSize]  WITH CHECK ADD  CONSTRAINT [FK_PizzaSize_Pizza] FOREIGN KEY([PizzaId])
REFERENCES [dbo].[Pizza] ([PizzaId])
GO

ALTER TABLE [dbo].[PizzaSize] CHECK CONSTRAINT [FK_PizzaSize_Pizza]
GO
ALTER TABLE [dbo].[PizzaSize]  WITH CHECK ADD  CONSTRAINT [FK_PizzaSize_Size] FOREIGN KEY([SizeId])
REFERENCES [dbo].[Size] ([SizeId])
GO

ALTER TABLE [dbo].[PizzaSize] CHECK CONSTRAINT [FK_PizzaSize_Size]
GO
ALTER TABLE [dbo].[PizzaSize] ADD  CONSTRAINT [DF_PizzaSize_CreatedDate_1]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[PizzaSize] ADD  CONSTRAINT [DF_PizzaSize_ModifiedDate_1]  DEFAULT (getdate()) FOR [ModifiedDate]