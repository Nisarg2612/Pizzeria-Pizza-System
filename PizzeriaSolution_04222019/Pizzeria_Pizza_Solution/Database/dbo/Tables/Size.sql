CREATE TABLE [dbo].[Size](
	[SizeId] [int] IDENTITY(1,1) NOT NULL,
	[SizeName] [nvarchar](50) NULL,
	[Abbreviation] [nvarchar](10) NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_PizzaSize] PRIMARY KEY CLUSTERED 
(
	[SizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Size] ADD  CONSTRAINT [DF_PizzaSize_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO
ALTER TABLE [dbo].[Size] ADD  CONSTRAINT [DF_PizzaSize_ModifiedDate]  DEFAULT (getdate()) FOR [ModifiedDate]