-- =============================================
-- Author:		Krunal Rohit
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_ManagePizza]
	@Mode CHAR(5) = NULL,
	@PizzaId INT = NULL,
	@Title NVARCHAR(100) = NULL,
	@Description NVARCHAR(500) = NULL,
	@CategoryId INT = NULL,
	@FilePath NVARCHAR(MAX) = NULL

AS
BEGIN
	
	IF @Mode = 'C'
	BEGIN
		INSERT INTO Pizza(Title, Description, CategoryId, FilePath)
		VALUES(@Title, @Description, @CategoryId, @FilePath)

		SELECT SCOPE_IDENTITY()
	END

	ELSE IF @Mode = 'U'
	BEGIN
		UPDATE Pizza SET
		Title = @Title,
		Description = @Description,
		CategoryId = @CategoryId,
		FilePath = @FilePath,
		ModifiedDate = GETDATE()
		WHERE PizzaId = @PizzaId

		SELECT @PizzaId
	END

END