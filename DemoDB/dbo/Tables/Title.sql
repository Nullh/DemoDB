﻿CREATE TABLE [dbo].[Title]
(
	[Id] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[Name] NVARCHAR(20) NOT NULL, 
    [Rating] NVARCHAR(2) NOT NULL DEFAULT 'PG', 
    [Director] INT NOT NULL
)
