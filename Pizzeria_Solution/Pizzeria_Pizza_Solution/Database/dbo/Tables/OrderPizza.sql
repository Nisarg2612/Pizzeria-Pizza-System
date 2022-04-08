CREATE TABLE [dbo].[OrderPizza](
	[OrderPizzaId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NULL,
	[PizzaId] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_OrderPizza] PRIMARY KEY CLUSTERED 
(
	[OrderPizzaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderPizza]  WITH CHECK ADD  CONSTRAINT [FK_OrderPizza_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO

ALTER TABLE [dbo].[OrderPizza] CHECK CONSTRAINT [FK_OrderPizza_Order]
GO
ALTER TABLE [dbo].[OrderPizza]  WITH CHECK ADD  CONSTRAINT [FK_OrderPizza_Pizza] FOREIGN KEY([PizzaId])
REFERENCES [dbo].[Pizza] ([PizzaId])
GO

ALTER TABLE [dbo].[OrderPizza] CHECK CONSTRAINT [FK_OrderPizza_Pizza]
GO
ALTER TABLE [dbo].[OrderPizza] ADD  CONSTRAINT [DF_OrderPizza_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[OrderPizza] ADD  CONSTRAINT [DF_OrderPizza_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]