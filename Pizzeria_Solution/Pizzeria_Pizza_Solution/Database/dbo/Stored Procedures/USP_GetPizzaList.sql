-- =============================================
-- Author:		Krunal 
-- Description:	<Description,,>
-- [USP_GetPizzaList] '', '', '', 1, 1000, NULL
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetPizzaList]
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
		SET @sortExpression = 'P.Title'
	END
	
	IF (@sortDirection IS NULL) OR (LEN(@sortDirection)=0)
	BEGIN
		SET @sortDirection = 'DESC'
	END

	SET @Joins = ' JOIN Category C ON C.CategoryId=P.CategoryId'
	SET @Joins = @Joins + ' LEFT JOIN PizzaSize PS ON PS.PizzaId=P.PizzaId'
	
	SET @SqlQuery = 'SELECT DISTINCT
	 P.PizzaId,
	 P.Title,
	 P.Description,
	 P.CategoryId,
	 C.Title AS CategoryName,
	 ISNULL(STUFF((SELECT DISTINCT '', '' + S.Abbreviation
         FROM PizzaSize ps1
		 JOIN Size S ON S.SizeId=ps1.SizeId
         WHERE PS.PizzaId = ps1.PizzaId
            FOR XML PATH(''''), TYPE
            ).value(''.'', ''NVARCHAR(MAX)'')
        ,1,1,''''), ''M'') AS Sizes,
	 ISNULL((SELECT MIN(Price) FROM PizzaSize WHERE PizzaId=P.PizzaId), 0) AS Price,
	 P.FilePath,
	 P.CreatedDate
	 FROM Pizza P' + @Joins
					
	SET @CountQuery = 'SELECT @totalRecords = COUNT(*) FROM Pizza P' + @Joins
	

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