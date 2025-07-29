CREATE TABLE [dbo].[AWBuildVersionTest] (
    [SystemInformationID] TINYINT       IDENTITY (1, 1) NOT NULL,
    [Database Version]    NVARCHAR (25) NOT NULL,
    [VersionDate]         DATETIME      NOT NULL,
    [ModifiedDate]        DATETIME      CONSTRAINT [DF_AWBuildVersion_ModifiedDateTest] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_AWBuildVersion_SystemInformationIDTest] PRIMARY KEY CLUSTERED ([SystemInformationID] ASC)
);


GO

