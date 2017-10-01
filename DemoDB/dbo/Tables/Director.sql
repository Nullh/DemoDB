CREATE TABLE [dbo].[Director]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [Name] NVARCHAR(50) NOT NULL, 
    [Nationality] NVARCHAR(20) NULL
)
