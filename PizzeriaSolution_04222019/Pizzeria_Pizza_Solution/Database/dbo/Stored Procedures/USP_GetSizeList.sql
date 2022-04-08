-- =============================================
-- Author:		Krunal Rohit
-- Description:	<Description,,>
-- [USP_GetSizeList] '', '', '', 1, 1000, NULL
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetSizeList]
	@searchExpression NVARCHAR(MAX) = NULL,
	@sortExpression NVARCHAR(MAX) = NULL,
	@sortDirection NVARCHAR(MAX) = NULL,
	@startIndex BIGINT = NULL,
	@pageSize BIGINT = NULL,
	@totalRecords BIGINT OUTPUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	--SET NOCOUNT ON;

	DECLARE @SqlQuery NVARCHAR(MAX)
	DECLARE @CountQuery NVARCHAR(MAX)
	DECLARE @Joins NVARCHAR(MAX)
	DECLARE @ParmDefinition NVARCHAR(500)
	SET @ParmDefinition = N'@totalRecords BIGINT OUTPUT'
	
	IF (@sortExpression IS NULL) OR (LEN(@sortExpression)=0)
	BEGIN
		SET @sortExpression = 'CreatedDate'
	END
	
	IF (@sortDirection IS NULL) OR (LEN(@sortDirection)=0)
	BEGIN
		SET @sortDirection = 'DESC'
	END

	SET @Joins = ' '
	
	SET @SqlQuery = 'SELECT
	 SizeId,
	 SizeName,
	 Abbreviation
	 FROM Size' + @Joins
					
	SET @CountQuery = 'SELECT @totalRecords = COUNT(*) FROM Size' + @Joins
	

	IF (@searchExpression IS NOT NULL) AND (LEN(@searchExpression)>0)
	BEGIN
		SET @SqlQuery = @SqlQuery + ' WHERE ' + @searchExpression
		SET @CountQuery = @CountQuery + ' WHERE ' + @searchExpression
	END	
	
	SET @SqlQuery = @SqlQuery + ' ORDER BY ' + @sortExpression + ' ' + @sortDirection
	SET @SqlQuery = @SqlQuery + ' OFFSET ' + CAST((@pageSize * (@startIndex - 1)) AS NVARCHAR(10)) + 
					' ROWS FETCH NEXT ' + CAST(@pageSize AS NVARCHAR(10)) + ' ROWS ONLY'
	
	SET @SqlQuery = @SqlQuery + '; ' + @CountQuery
	
	PRINT @SqlQuery
		
	EXECUTE SP_EXECUTESQL @SqlQuery, @ParmDefinition, @totalRecords OUTPUT	

	PRINT @totalRecords


	--SELECT
	--SizeId,
	--SizeName,
	--Abbreviation
	--FROM Size

END