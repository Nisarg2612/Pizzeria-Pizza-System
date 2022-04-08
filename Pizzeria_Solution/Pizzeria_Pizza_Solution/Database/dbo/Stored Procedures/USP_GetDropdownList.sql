-- =============================================
-- Author:		Krunal Rohit
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_GetDropdownList]
	@Mode INT = NULL
AS
BEGIN
	IF @Mode = 1
	BEGIN
		SELECT SizeId AS [Value], SizeName AS [Name]
		FROM Size
	END

	ELSE IF @Mode = 2
	BEGIN
		SELECT CategoryId AS [Value], Title AS [Name]
		FROM Category
	END
END