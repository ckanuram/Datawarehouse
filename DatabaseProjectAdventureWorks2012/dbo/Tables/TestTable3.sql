CREATE TABLE [dbo].[TestTable3] (
    [ID]     TINYINT       IDENTITY (1, 1) NOT NULL,
    [Name]   NVARCHAR (25) NOT NULL,
    [Salary] DATETIME      NOT NULL
);
GO

ALTER TABLE [dbo].[TestTable3]
    ADD CONSTRAINT [PK_TestTable3_ID] PRIMARY KEY CLUSTERED ([ID] ASC);
GO

