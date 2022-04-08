-- =============================================
-- Author:		Krunal Rohit
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[USP_ManageSize]
	@Mode CHAR(4) = NULL,
	@SizeId INT = NULL,
	@SizeName NVARCHAR(50),
	@Abbreviation NVARCHAR(10)

AS
BEGIN
	
	IF @Mode = 'C'
	BEGIN
		INSERT INTO Size (SizeName, Abbreviation)
		VALUES (@SizeName, @Abbreviation)
	END

	ELSE IF @Mode = 'U'
	BEGIN
		UPDATE Size SET
		SizeName = @SizeName,
		Abbreviation = @Abbreviation,
		ModifiedDate = GETDATE()
		WHERE SizeId=@SizeId
	END

END