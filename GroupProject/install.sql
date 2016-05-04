USE MASTER
GO
DROP DATABASE dbSD22GroupProject
GO
CREATE DATABASE dbSD22GroupProject
GO
USE dbSD22GroupProject
GO

CREATE TABLE tbClient
  (
    ClientID      INT IDENTITY (1,1) PRIMARY KEY,
    FirstName     VARCHAR(MAX),
    LastName      VARCHAR(MAX),
    Address       VARCHAR(MAX),
    City          VARCHAR(MAX),
    PostalCode    VARCHAR(MAX),
    PhoneNumber   VARCHAR(MAX),
    UserName      VARCHAR(MAX),
    Password      VARCHAR(MAX),
    Email         VARCHAR(MAX),
    AccessLevel   BIT
  )
CREATE TABLE tbConsole
  (
    ConsoleID     INT IDENTITY (1,1) PRIMARY KEY,
    ConsoleName   VARCHAR(MAX)
  )
CREATE TABLE tbCategory
  (
    CategoryID    INT IDENTITY (1,1)PRIMARY KEY,
    CategoryName  VARCHAR(MAX)
  )
CREATE TABLE tbGames
  (
    GameID        INT IDENTITY (1,1) PRIMARY KEY,
    GameName      VARCHAR(MAX),
    GameImage     VARCHAR(MAX),
    GameRating    VARCHAR(MAX),
    CategoryID    INT FOREIGN KEY REFERENCES tbCategory(CategoryID),
    ConsoleID     INT FOREIGN KEY REFERENCES tbConsole(ConsoleID)
  )

--NEED SOME INSERTS HERE FOR TESTING

GO
CREATE PROC spLogin
  (
    @UserName	    VARCHAR(MAX),
    @Password		  VARCHAR(MAX)
  )
  AS BEGIN
    IF EXISTS (SELECT UserName, Password FROM tbClient where UserName = @UserName and Password = @Password)
      BEGIN
        SELECT * FROM tbClient WHERE UserName = @UserName and Password = @Password
      END
    ELSE
      BEGIN
        SELECT 'Invalid' AS UserName
      END
  END
GO
CREATE PROC spGetClientByID
  (
    @ClientID		  INT = NULL
  )
AS BEGIN
  SELECT * FROM tbClient
  WHERE ClientID = ISNULL(@ClientID, ClientID)
END
GO
CREATE PROC spInsertClient
  (
    @FirstName     VARCHAR(MAX),
    @LastName      VARCHAR(MAX),
    @Address       VARCHAR(MAX),
    @City          VARCHAR(MAX),
    @PostalCode    VARCHAR(MAX),
    @PhoneNumber   VARCHAR(MAX),
    @UserName      VARCHAR(MAX),
    @Password      VARCHAR(MAX),
    @Email         VARCHAR(MAX),
    @AccessLevel   BIT = 0
  )
AS BEGIN
  IF EXISTS (SELECT * FROM tbClient where UserName = @UserName)
    BEGIN
      SELECT 'UserTaken' as UserName
    END
  ELSE IF EXISTS(SELECT * FROM tbClient where Email = @Email)
    BEGIN
      SELECT 'EmailTaken' as Email
    END
  ELSE
    BEGIN
      INSERT INTO tbClient(FirstName, LastName, Address, City, PostalCode, PhoneNumber, UserName, Password, AccessLevel)
      VALUES				      (@FirstName, @LastName, @Address, @City, @PostalCode, @PhoneNumber, @UserName, @Password, @AccessLevel)
      SELECT SCOPE_IDENTITY() AS 'NewClientID'
    END
END
GO
CREATE PROC spDeleteClient
  (
    @ClientID INT
  )
AS BEGIN
  DELETE FROM tbClient WHERE ClientID = @ClientID
END
GO
CREATE PROC spUpdateClient
  (
    @ClientID		   INT,
    @FirstName     VARCHAR(MAX),
    @LastName      VARCHAR(MAX),
    @Address       VARCHAR(MAX),
    @City          VARCHAR(MAX),
    @PostalCode    VARCHAR(MAX),
    @PhoneNumber   VARCHAR(MAX),
    @UserName      VARCHAR(MAX),
    @Password      VARCHAR(MAX),
    @Email         VARCHAR(MAX),
    @AccessLevel   BIT = 0
  )
AS BEGIN
  UPDATE tbClient SET
    FirstName =		 @FirstName,
    LastName =		 @LastName,
    Address =		   @Address,
    City =			   @City,
    PostalCode =   @PostalCode,
    PhoneNumber =	 @PhoneNumber,
    UserName =		 @UserName,
    Password =		 @Password,
    Email =        @Email,
    AccessLevel =  @AccessLevel
  WHERE ClientID = @ClientID
END
GO
CREATE PROC spGetConsoleByID
  (
    @ConsoleID		  INT = NULL
  )
AS BEGIN
  SELECT * FROM tbConsole
  WHERE ConsoleID = ISNULL(@ConsoleID, ConsoleID)
END
GO
CREATE PROC spInsertConsole
  (
    @ConsoleName    VARCHAR(MAX)
  )
AS BEGIN
  IF EXISTS (SELECT * FROM tbConsole where ConsoleName = @ConsoleName)
    BEGIN
      SELECT 'NameExists' as ConsoleName
    END
ELSE
  BEGIN
    INSERT INTO tbConsole (ConsoleName)
    VALUES				        (@ConsoleName)
    SELECT SCOPE_IDENTITY() AS 'NewConsoleID'
  END
END
GO
CREATE PROC spDeleteConsole
  (
    @ConsoleID      INT
  )
AS BEGIN
  DELETE  FROM tbConsole where ConsoleID = @ConsoleID
END
GO
CREATE PROC spUpdateConsole
  (
    @ConsoleID      INT,
    @ConsoleName    VARCHAR(MAX)
  )
AS BEGIN
  UPDATE tbConsole SET
    ConsoleName =   @ConsoleName
    WHERE @ConsoleID = @ConsoleID
END
GO
CREATE PROC spGetCategoryByID
  (
    @CategoryID     INT = NULL
  )
AS BEGIN
  SELECT CategoryID, CategoryName FROM tbCategory
  WHERE CategoryID = ISNULL(@CategoryID, CategoryID)
END
GO
CREATE PROC spInsertCategory
  (
    @CategoryName     VARCHAR(MAX)
  )
AS BEGIN
  IF EXISTS(SELECT * FROM tbCategory WHERE CategoryName = @CategoryName)
    BEGIN
      SELECT 'AlreadyExists' as CategoryName
    END
  ELSE
    BEGIN
      INSERT INTO tbCategory (CategoryName)
      VALUES				         (@CategoryName)
      SELECT SCOPE_IDENTITY() AS 'NewCategoryID'
    END
END
GO
CREATE PROC spDeleteCategory
  (
    @CategoryID     INT
  )
AS BEGIN
  DELETE FROM tbCategory where CategoryID = @CategoryID
END
GO
CREATE PROC spUpdateCategory
  (
    @CategoryID     INT,
    @CategoryName		VARCHAR(MAX)
  )
AS BEGIN
  UPDATE tbCategory SET
    CategoryName =			@CategoryName
  WHERE CategoryID = @CategoryID
END
GO
CREATE PROC spGetGameByCategoryID
  (
    @CategoryID     INT = NULL
  )
AS BEGIN
  SELECT * FROM tbGames
  WHERE CategoryID = ISNULL(@CategoryID, CategoryID)
END
GO
CREATE PROC spGetGameByID
  (
    @GameID      INT = NULL
  )
AS BEGIN
  SELECT * FROM tbGames
  WHERE GameID = ISNULL(@GameID, GameID)
END
GO
CREATE PROC spInsertGame
  (
    @GameName      VARCHAR(MAX),
    @GameImage     VARCHAR(MAX),
    @GameRating    VARCHAR(MAX),
    @CategoryID    INT,
    @ConsoleID     INT
  )
AS BEGIN
  IF EXISTS (SELECT * FROM tbGames WHERE GameName = @GameName)
    BEGIN

    END
  ELSE
    BEGIN
      INSERT INTO tbGames (GameName, GameImage, GameRating, CategoryID, ConsoleID)
      VALUES				      (@GameName,ISNULL(@GameImage, 'NoImages.jpg'), @CategoryID, @ConsoleID)
      SELECT SCOPE_IDENTITY() AS 'NewGameID'
    END
END
GO
CREATE PROC spDeleteGame
  (
    @GameID     INT
  )
AS BEGIN
  DELETE FROM tbGames WHERE GameID = @GameID
END
GO
CREATE PROC spUpdateGame
  (
    @GameID        INT,
    @GameName      VARCHAR(MAX),
    @GameImage     VARCHAR(MAX),
    @GameRating    VARCHAR(MAX),
    @CategoryID    INT,
    @ConsoleID     INT
  )
AS BEGIN
  UPDATE tbGames SET
    GameName =		@GameName,
    GameImage =   ISNULL(@GameImage, GameImage),
    GameRating=   @GameRating,
    CategoryID =	@CategoryID,
    ConsoleID=    @ConsoleID
  WHERE GameID =  @GameID
END