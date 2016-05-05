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
    GameRating    VARCHAR(MAX),--1 to 5
    CategoryID    INT FOREIGN KEY REFERENCES tbCategory(CategoryID),
    ConsoleID     INT FOREIGN KEY REFERENCES tbConsole(ConsoleID)
  )

--NEED SOME INSERTS HERE FOR TESTING

INSERT INTO tbClient(FirstName, LastName, Address,City,PostalCode,PhoneNumber,UserName,Password,Email,AccessLevel)  VALUES
  ('Andrew', 'Leake', '69 Loli Lane','Winnipeg','R2N 4N5','1 204 996 1783',
   'Grunt','1234','Andrew.Leake@Robertsoncollege.net', 1),
  ('Christian', 'Earl', '12 Filipino Avenue','Winnipeg','R6P 0Y5','1 204 555 5555',
   'Earl','1234','Christian.Earl@Robertsoncollege.net', 1),
  ('Jizka', 'Clement', '420 Vapesmoke road','Vape Nation','R7F 2K9','1 204 555 5999',
   'Jessy','1234','Jessy.Clement@Robertsoncollege.net', 1),
  ('Christian', 'Kessler', '11 Filipino Avenue','Winnipeg','R6P 0Y5','1 204 999 5555',
   'Kessler','1234','Christian.Kessler@Robertsoncollege.net', 1),

  ('John', 'Doe', '123 Home Street','New York','55416','1555 555 5555',
   'JonDoe','1234','Jon.Doe@Robertsoncollege.net', 0),
  ('Jane', 'Doe', '123 Home Street','New York','55416','1555 555 5555',
   'JaneDoe','1234','Jane.Doe@Robertsoncollege.net', 0),
  ('Naruto', 'Uzumaki', '123 Konoha Street','Konoha','56453','1555 555 5555',
   'JonDoe','1234','IWannaBeTheHokage@Hokage.com', 0)

INSERT INTO  tbConsole(ConsoleName) VALUES
  ('PSP'),
  ('PC'),
  ('XBOX'),
  ('PS3'),
  ('PS4'),
  ('WII')
INSERT INTO tbCategory(CategoryName) VALUES
  ('Action'),
  ('Adventure & RPG (Role Playing Game)'),
  ('Arcade'),
  ('Casino'),
  ('Family'),
  ('Puzzle'),
  ('Sports'),
  ('strategy')
INSERT INTO tbGames(GameName,GameImage,GameRating,CategoryID,ConsoleID)values
  -- insert for action category
  ('ARC of Templar','ARCOFTEMPLAR.jpg','3',1,2),
  ('Bear in super Action','BEARINSUPERACTION.jpg','2',1,2),
  ('Crest Breakout 2','CRESTBREAKOUT2.jpg','4',1,4),
  ('Earth Taken 3','EarthTaken3.jpg','2',1,2),
  ('Furious Space','FURIOUSSPACE.jpg','4',1,5),
  ('Raider took my DOG','raderstookmydog.jpg','2',1,2),
  ('Super Battle City','SUPERBATTLECITY.jpg','2',1,1),
  ('Wild WasteLand','WildWasteLand.jpeg','5',1,4)
  -- insert for Adventure & RPG category


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
      VALUES				      (@GameName,ISNULL(@GameImage, 'NoImages.jpg'),@GameRating, @CategoryID, @ConsoleID)
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