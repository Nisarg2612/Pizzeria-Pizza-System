CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerContact] [nvarchar](10) NULL,
	[DeliveryPickUpDate] [datetime] NULL,
	[StoreId] [int] NULL,
	[StatusId] [int] NULL,
	[TotalAmount] [money] NULL,
	[AdditionalInstructions] [nvarchar](100) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_TotalAmount]  DEFAULT ((0)) FOR [TotalAmount]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [DF_Order_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]