USE [BriefcaseNgDB]
GO
/****** Object:  Table [dbo].[Appointments]    Script Date: 11/11/2021 10:53:53 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Appointments](
	[UniqueID] [int] IDENTITY(1,1) NOT NULL,
	[Type] [int] NULL,
	[StartDate] [smalldatetime] NULL,
	[EndDate] [smalldatetime] NULL,
	[AllDay] [bit] NULL,
	[Subject] [nvarchar](50) NULL,
	[Location] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Status] [int] NULL,
	[Label] [int] NULL,
	[ResourceID] [int] NULL,
	[ResourceIDs] [nvarchar](max) NULL,
	[ReminderInfo] [nvarchar](max) NULL,
	[RecurrenceInfo] [nvarchar](max) NULL,
	[CustomField1] [nvarchar](max) NULL,
 CONSTRAINT [PK_Appointments] PRIMARY KEY CLUSTERED 
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Billing]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Billing](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CaseID] [int] NULL,
	[ClientID] [int] NULL,
	[AmountPaid] [float] NULL,
	[DatePaid] [datetime2](7) NULL,
	[Balance] [float] NULL,
	[BalancePaymentDate] [datetime2](7) NULL,
	[BillingOfficer] [nvarchar](50) NULL,
	[BillingOfficerID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CaseAssignedStaff]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseAssignedStaff](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CaseID] [int] NULL,
	[StaffID] [int] NULL,
	[StaffName] [nvarchar](50) NULL,
	[TeamLeaderID] [nvarchar](10) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CaseCategories]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseCategories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TypeID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Encryption] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CaseDetails]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseDetails](
	[CaseID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NULL,
	[Name] [nvarchar](max) NULL,
	[CaseNumber] [nvarchar](50) NULL,
	[Type] [nvarchar](50) NULL,
	[TypeID] [int] NULL,
	[Category] [nvarchar](50) NULL,
	[CategoryID] [int] NULL,
	[Stage] [nvarchar](50) NULL,
	[DateOpened] [datetime2](7) NULL,
	[PracticeArea] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[Court] [nvarchar](max) NULL,
	[Status] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CaseStages]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseStages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Step] [int] NULL,
	[CatID] [int] NULL,
	[Icon] [nvarchar](50) NULL,
	[Label] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CaseTypes]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CaseTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Encryption] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Clients]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clients](
	[ClientID] [int] IDENTITY(1,1) NOT NULL,
	[Surname] [nvarchar](50) NULL,
	[Firstname] [nvarchar](50) NULL,
	[Middlename] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ContactGroup] [nvarchar](50) NULL,
	[ClientPortalEnabled] [bit] NULL,
	[MobilePhoneNo] [nvarchar](50) NULL,
	[WorkPhoneNo] [nvarchar](50) NULL,
	[HomePhoneNo] [nvarchar](50) NULL,
	[Address] [nvarchar](max) NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [nvarchar](150) NULL,
	[RegDate] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ContactGroups]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactGroups](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConversationsThread]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConversationsThread](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TicketID] [int] NULL,
	[UserID] [nvarchar](50) NULL,
	[Message] [nvarchar](max) NULL,
	[Date] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourtHearingSchedules]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourtHearingSchedules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CaseID] [int] NULL,
	[CourtID] [int] NULL,
	[CourtName] [nvarchar](max) NULL,
	[Date] [datetime2](7) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Courts]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Courts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Address] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Milestones]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Milestones](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CaseID] [int] NULL,
	[Stage] [nvarchar](50) NULL,
	[DateAchieved] [datetime2](7) NULL,
	[Milestone] [nvarchar](max) NULL,
	[SupportingDocuments] [nvarchar](max) NULL,
	[Icon] [nvarchar](50) NULL,
	[Label] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PracticeAreas]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PracticeAreas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Resources]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resources](
	[UniqueID] [int] IDENTITY(1,1) NOT NULL,
	[ResourceID] [int] NOT NULL,
	[ResourceName] [nvarchar](50) NULL,
	[Color] [int] NULL,
	[Image] [image] NULL,
	[CustomField1] [nvarchar](max) NULL,
 CONSTRAINT [PK_Resources] PRIMARY KEY CLUSTERED 
(
	[UniqueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Studyweek]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Studyweek](
	[Week] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nvarchar](50) NULL,
	[CaseID] [int] NULL,
	[Subject] [nvarchar](max) NULL,
	[Priority] [nvarchar](50) NULL,
	[Date] [datetime2](7) NULL,
	[LastUpdated] [datetime2](7) NULL,
	[Category] [nvarchar](50) NULL,
	[TicketID] [nvarchar](50) NULL,
	[Status] [nvarchar](50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Firstname] [nvarchar](50) NULL,
	[Middlename] [nvarchar](50) NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[Email] [varchar](160) NULL,
	[UserType] [varchar](20) NULL,
	[YearOfCall] [nvarchar](50) NULL,
	[Phone] [varchar](13) NULL,
	[WorkPhone] [varchar](13) NULL,
	[Address] [nvarchar](max) NULL,
	[DOB] [date] NULL,
	[StaffID] [nvarchar](50) NULL,
	[NoK_Fullname] [nvarchar](50) NULL,
	[NoK_Relationship] [nvarchar](50) NULL,
	[NoK_Phone] [varchar](13) NULL,
	[NoK_Email] [nvarchar](50) NULL,
	[NoK_Address] [nvarchar](max) NULL,
	[Status] [tinyint] NULL,
	[Logs] [int] NULL,
	[DateAdded] [datetime2](7) NULL,
	[Password] [varchar](40) NULL,
	[RoleID] [int] NULL,
	[PasswordSetDate] [date] NULL,
	[LoginAttempt] [int] NULL,
	[LockStatus] [nvarchar](10) NULL,
	[LockTime] [datetime2](7) NULL,
	[Last6Passwords] [nvarchar](max) NULL,
	[RegDate] [datetime2](7) NULL,
	[ProfilePicUrl] [nvarchar](150) NULL,
	[TaskLoad] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Users2]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users2](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Firstname] [nvarchar](50) NULL,
	[Middlename] [nvarchar](50) NULL,
	[Name] [varchar](50) NOT NULL,
	[Gender] [nvarchar](50) NULL,
	[Email] [varchar](160) NULL,
	[UserType] [varchar](20) NULL,
	[YearOfCall] [nvarchar](50) NULL,
	[Phone] [varchar](13) NULL,
	[WorkPhone] [varchar](13) NULL,
	[Address] [nvarchar](max) NULL,
	[DOB] [date] NULL,
	[StaffID] [nvarchar](50) NULL,
	[NoK_Fullname] [nvarchar](50) NULL,
	[NoK_Relationship] [nvarchar](50) NULL,
	[NoK_Phone] [varchar](13) NULL,
	[NoK_Email] [nvarchar](50) NULL,
	[NoK_Address] [nvarchar](max) NULL,
	[Status] [tinyint] NULL,
	[Logs] [int] NULL,
	[DateAdded] [date] NULL,
	[Password] [varchar](40) NULL,
	[FirmID] [int] NULL,
	[RoleID] [int] NULL,
	[PasswordSetDate] [date] NULL,
	[LoginAttempt] [int] NULL,
	[LockStatus] [nvarchar](10) NULL,
	[LockTime] [datetime2](7) NULL,
	[Last6Passwords] [nvarchar](max) NULL,
	[AccountNumber] [nvarchar](50) NULL,
	[BankName] [nvarchar](50) NULL,
	[PIN] [nvarchar](50) NULL,
	[AccountID] [nvarchar](50) NULL,
	[AccountType] [nvarchar](50) NULL,
	[Balance] [float] NULL,
	[RegDate] [datetime2](7) NULL,
	[ProfilePicUrl] [nvarchar](150) NULL,
	[Profile] [nvarchar](max) NULL,
	[Domain] [nvarchar](50) NULL,
	[TaskLoad] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserTypes]    Script Date: 11/11/2021 10:53:54 pm ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Appointments] ON 

INSERT [dbo].[Appointments] ([UniqueID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField1]) VALUES (3, 0, CAST(N'2020-07-13 09:00:00' AS SmallDateTime), CAST(N'2020-07-13 11:00:00' AS SmallDateTime), 0, N'Team Inauguration', N'Conference Room', N'A team of lawyers and barristers shall be drafted to handle the case of Shehu Ahmed vs the State Government', 2, 1, 7, NULL, NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([UniqueID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField1]) VALUES (4, 0, CAST(N'2021-02-18 10:00:00' AS SmallDateTime), CAST(N'2021-02-18 11:30:00' AS SmallDateTime), 0, N'Panel Setup', NULL, N'Little Note', 2, 0, 1, NULL, NULL, NULL, NULL)
INSERT [dbo].[Appointments] ([UniqueID], [Type], [StartDate], [EndDate], [AllDay], [Subject], [Location], [Description], [Status], [Label], [ResourceID], [ResourceIDs], [ReminderInfo], [RecurrenceInfo], [CustomField1]) VALUES (5, 0, CAST(N'2021-01-18 13:23:00' AS SmallDateTime), CAST(N'2021-01-18 13:53:00' AS SmallDateTime), 0, N'Team Setup', N'Conference Room', N'Attendance is mandatory', 2, 1, 8, NULL, N'<Reminders>
<Reminder AlertTime="02/18/2021 04:17:07" TimeBeforeStart="00:05:00" />
</Reminders>', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Appointments] OFF
SET IDENTITY_INSERT [dbo].[CaseAssignedStaff] ON 

INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (1, 3, 22, N'Barr. Udokwu Michael ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (2, 3, 23, N'Barr. Ahmed Temitope ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (3, 3, 16, N' Benedict Azeez ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (4, 3, 11, N'Barr. Faith Okpethere ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (5, 3, 12, N' Frank Egwu ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (6, 3, 14, N'Barr. Funmilayo Ojo ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (13, 2, 22, N'Barr. Udokwu Michael ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (14, 2, 23, N'Barr. Ahmed Temitope ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (15, 2, 16, N' Benedict Azeez ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (16, 2, 11, N'Barr. Faith Okpethere ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (17, 2, 12, N' Frank Egwu ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (18, 1, 12, N' Frank Egwu ', N'12')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (19, 1, 14, N'Barr. Funmilayo Ojo ', N'12')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (20, 1, 10, N'Barr. Jenifa Eyo ', N'12')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (21, 1, 15, N' Ken Atusue ', N'12')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (22, 6, 11, N'Barr. Faith Okpethere ', N'11')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (23, 6, 12, N' Frank Egwu ', N'11')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (24, 6, 14, N'Barr. Funmilayo Ojo ', N'11')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (25, 6, 10, N'Barr. Jenifa Eyo ', N'11')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (26, 6, 15, N' Ken Atusue ', N'11')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (27, 5, 23, N'Barr. Ahmed Temitope ', N'23')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (28, 5, 16, N' Benedict Azeez ', N'23')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (29, 5, 11, N'Barr. Faith Okpethere ', N'23')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (30, 5, 12, N' Frank Egwu ', N'23')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (31, 5, 14, N'Barr. Funmilayo Ojo ', N'23')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (32, 4, 22, N'Barr. Udokwu Michael ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (33, 4, 23, N'Barr. Ahmed Temitope ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (34, 4, 16, N' Benedict Azeez ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (35, 4, 11, N'Barr. Faith Okpethere ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (36, 4, 12, N' Frank Egwu ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (43, 8, 22, N'Barr. Udokwu Michael ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (44, 8, 15, N' Ken Atusue ', N'22')
INSERT [dbo].[CaseAssignedStaff] ([ID], [CaseID], [StaffID], [StaffName], [TeamLeaderID]) VALUES (45, 8, 23, N'Barr. Ahmed Temitope ', N'22')
SET IDENTITY_INSERT [dbo].[CaseAssignedStaff] OFF
SET IDENTITY_INSERT [dbo].[CaseCategories] ON 

INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (1, 1, N'Trial Courts', N'VUpYYWh4R0lEOVdkeVIzYw==')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (2, 1, N'Election Petitions', N'RnhXWmpSWGF2NUdJUVZHZHBSWGF2NTJj')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (3, 1, N'Appeals (Sharia Court)', N'PT1RUXdCWFpoeDJjZ2d5VW9GbWNwRkdJRDlXZHlSWEs=')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (4, 1, N'Appeals (Court of Appeal)', N'PT1RUXdCWFpoeDJjZ2d5UXZWbmMwQnlibUJTUXdCWFpoeFdL')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (5, 1, N'Appeals (Supreme Court)', N'PUVFY3dWV1lzTkhJb01WZHdKWFp0VkdJRDlXZHlSWEs=')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (6, 3, N'Contracts', N'RDltYjBKWFlqUjNj')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (7, 3, N'Letters', N'PT1BVGxSSGRsSjNj')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (8, 3, N'Mediation', N'TlZHWnBGR2RwOW1i')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (9, 3, N'Incorporation', N'PT1RU3VOMmJ5QjNieUZHZHA5bWI=')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (10, 3, N'Property', N'PUFsY3ZCWFp5Ulhl')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (11, 4, N'Police', N'UTlHYnBOV1o=')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (12, 4, N'EFCC', N'PT1RUkdOMFE=')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (13, 4, N'ICPC', N'PT1RU0RCMVE=')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (14, 4, N'Ministry of Justice', N'PT1RVHA1V2F6Um5jNUJ5Ym1CaVMxTkhkcE5XWg==')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (15, 4, N'INEC', N'PT1RU09WMFE=')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (16, 4, N'National Assembly', N'PTRVWTBsMmJ1RkdiZ0UwY3pWV2JpeFdl')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (17, 4, N'Internal Memos', N'PWtrYjBWbWN1RkdiZzBVWnQ5MmM=')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (18, 4, N'Others', N'UFJIYWxKM2M=')
INSERT [dbo].[CaseCategories] ([ID], [TypeID], [Name], [Encryption]) VALUES (19, 2, N'Arbitrations', N'QkpuWXBSbmNoUlhhdjUyYw==')
SET IDENTITY_INSERT [dbo].[CaseCategories] OFF
SET IDENTITY_INSERT [dbo].[CaseDetails] ON 

INSERT [dbo].[CaseDetails] ([CaseID], [ClientID], [Name], [CaseNumber], [Type], [TypeID], [Category], [CategoryID], [Stage], [DateOpened], [PracticeArea], [Description], [Court], [Status]) VALUES (1, 4, N'Ojo Maureen vs Employer', N'LI/2020/06/20/001', N'Arbitration', 2, N'Arbitrations', 19, N'Originating Processes', CAST(N'2020-07-07 00:00:00.0000000' AS DateTime2), N'Defamation', N'Ojo Maureen vs Employer', N'Federal High Court, Central Business District, Abuja', N'Ongoing')
INSERT [dbo].[CaseDetails] ([CaseID], [ClientID], [Name], [CaseNumber], [Type], [TypeID], [Category], [CategoryID], [Stage], [DateOpened], [PracticeArea], [Description], [Court], [Status]) VALUES (2, 5, N'Yusuf Gambo vs Employer', N'LI/2020/06/20/002', N'Litigation', 1, N'Trial Courts', 1, N'Final Written Addresses', CAST(N'2020-07-07 00:00:00.0000000' AS DateTime2), N'Civil', N'Yusuf Gambo vs Employer', N'High Court of the Federal Capital Territory', N'Ongoing')
INSERT [dbo].[CaseDetails] ([CaseID], [ClientID], [Name], [CaseNumber], [Type], [TypeID], [Category], [CategoryID], [Stage], [DateOpened], [PracticeArea], [Description], [Court], [Status]) VALUES (3, 12, N'Gregory Nnamuka vs Landlord', N'LI/2020/06/20/003', N'Litigation', 1, N'Appeals (Court of Appeal)', 4, N'Notice of Appeals', CAST(N'2020-07-07 00:00:00.0000000' AS DateTime2), N'Civil', N'Gregory Nnamuka vs Landlord', N'High Court of the Federal Capital Territory', N'Ongoing')
INSERT [dbo].[CaseDetails] ([CaseID], [ClientID], [Name], [CaseNumber], [Type], [TypeID], [Category], [CategoryID], [Stage], [DateOpened], [PracticeArea], [Description], [Court], [Status]) VALUES (4, 1, N'Yetunde Olatunji - Divorce', N'LI/2020/06/20/004', N'Litigation', 1, N'Trial Courts', 1, N'Originating Processes', CAST(N'2020-07-08 00:00:00.0000000' AS DateTime2), N'Divorce/Separation', N'Yetunde Olatunji - Divorce', N'High Court of the Federal Capital Territory', N'Ongoing')
INSERT [dbo].[CaseDetails] ([CaseID], [ClientID], [Name], [CaseNumber], [Type], [TypeID], [Category], [CategoryID], [Stage], [DateOpened], [PracticeArea], [Description], [Court], [Status]) VALUES (5, 8, N'Tersoo John - Theft', N'LI/2020/06/20/005', N'Litigation', 1, N'Trial Courts', 1, N'Originating Processes', CAST(N'2020-07-08 00:00:00.0000000' AS DateTime2), N'Criminal Defense', N'Tersoo John - Theft', N'Federal High Court, Central Business District, Abuja', N'Completed')
INSERT [dbo].[CaseDetails] ([CaseID], [ClientID], [Name], [CaseNumber], [Type], [TypeID], [Category], [CategoryID], [Stage], [DateOpened], [PracticeArea], [Description], [Court], [Status]) VALUES (6, 3, N'Abdulahi Musa vs Neighbour', N'LI/2020/06/20/006', N'Litigation', 1, N'Appeals (Sharia Court)', 3, N'Briefs of Arguments', CAST(N'2020-07-08 00:00:00.0000000' AS DateTime2), N'Civil', N'Abdulahi Musa vs Neighbour', N'Supreme Court Complex, Abuja, Nigeria', N'Ongoing')
INSERT [dbo].[CaseDetails] ([CaseID], [ClientID], [Name], [CaseNumber], [Type], [TypeID], [Category], [CategoryID], [Stage], [DateOpened], [PracticeArea], [Description], [Court], [Status]) VALUES (7, 8, N'Shehu Ahmed vs State Government', N'LI/2020/06/20/007', N'Commercial Briefs', 3, N'Contracts', 6, N'', CAST(N'2020-07-13 00:00:00.0000000' AS DateTime2), N'Business', N'Shehu Ahmed vs State Government', N'High Court of the Federal Capital Territory', N'Ongoing')
INSERT [dbo].[CaseDetails] ([CaseID], [ClientID], [Name], [CaseNumber], [Type], [TypeID], [Category], [CategoryID], [Stage], [DateOpened], [PracticeArea], [Description], [Court], [Status]) VALUES (8, 13, N'Dauda Aliyu vs Commercial Driver', N'LI/2021/02/18/001', N'Litigation', 1, N'Trial Courts', 1, N'Originating Processes', CAST(N'2021-02-18 00:00:00.0000000' AS DateTime2), N'Civil', N'Description here', N'High Court of the Federal Capital Territory', N'Ongoing')
SET IDENTITY_INSERT [dbo].[CaseDetails] OFF
SET IDENTITY_INSERT [dbo].[CaseStages] ON 

INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (1, N'Originating Processes', 1, 1, N'fa-clock', N'text-success')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (2, N'Interlucutory Applications', 2, 1, N'fa-file-alt', N'text-info')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (3, N'Final Written Addresses', 3, 1, N'fa-tasks', N'text-warning')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (4, N'Judgement', 4, 1, N'fa-gavel', N'text-purple')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (5, N'Originating Processes', 1, 2, N'fa-clock', N'text-success')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (6, N'Interlucutory Applications', 2, 2, N'fa-file-alt', N'text-info')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (7, N'Final Written Addresses', 3, 2, N'fa-tasks', N'text-warning')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (8, N'Judgement', 4, 2, N'fa-gavel', N'text-purple')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (9, N'Notice of Appeals', 1, 3, N'fa-file-alt', N'text-info')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (10, N'Applications', 2, 3, N'fa-file-alt', N'text-success')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (11, N'Briefs of Arguments', 3, 3, N'fa-tasks', N'text-warning')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (12, N'Judgement', 4, 3, N'fa-gavel', N'text-purple')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (13, N'Notice of Appeals', 1, 4, N'fa-file-alt', N'text-info')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (14, N'Applications', 2, 4, N'fa-file-alt', N'text-success')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (15, N'Briefs of Arguments', 3, 4, N'fa-tasks', N'text-warning')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (16, N'Judgement', 4, 4, N'fa-gavel', N'text-purple')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (17, N'Notice of Appeals', 1, 5, N'fa-file-alt', N'text-info')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (18, N'Applications', 2, 5, N'fa-file-alt', N'text-success')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (19, N'Briefs of Arguments', 3, 5, N'fa-tasks', N'text-warning')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (20, N'Judgement', 4, 5, N'fa-gavel', N'text-purple')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (21, N'Originating Processes', 1, 19, N'fa-clock', N'text-success')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (22, N'Interlucutory Applications', 2, 19, N'fa-file-alt', N'text-info')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (23, N'Correspondences', 3, 19, N'fa-exclamation', N'text-danger')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (24, N'Final Written Addresses', 4, 19, N'fa-tasks', N'text-warning')
INSERT [dbo].[CaseStages] ([ID], [Name], [Step], [CatID], [Icon], [Label]) VALUES (25, N'Judgement', 5, 19, N'fa-gavel', N'text-purple')
SET IDENTITY_INSERT [dbo].[CaseStages] OFF
SET IDENTITY_INSERT [dbo].[CaseTypes] ON 

INSERT [dbo].[CaseTypes] ([ID], [Name], [Encryption]) VALUES (1, N'Litigation', N'PT1BVHBSWGFuRkdkcDltYg==')
INSERT [dbo].[CaseTypes] ([ID], [Name], [Encryption]) VALUES (2, N'Arbitration', N'PUVrY2lsR2R5RkdkcDltYg==')
INSERT [dbo].[CaseTypes] ([ID], [Name], [Encryption]) VALUES (3, N'Commercial Briefs', N'PU0wYnQxV1p5TldhaHhHSUNKWGFsWjJj')
INSERT [dbo].[CaseTypes] ([ID], [Name], [Encryption]) VALUES (4, N'General Correspondences', N'PWNVWnVWbWNoeEdJRDltY3lWMmN3OW1ia1ZtYmpWMmM=')
SET IDENTITY_INSERT [dbo].[CaseTypes] OFF
SET IDENTITY_INSERT [dbo].[Clients] ON 

INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (1, N'Yetunde ', N'Olatunji', NULL, N'yetunde@gmail.com', N'Group 1', 1, N'08012345678', NULL, NULL, N'No 4 Hillary Street, Dawaki Model Estate', NULL, NULL, CAST(N'2020-06-01 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (2, N'Philip', N' Johnson ', NULL, N'tersoo@gmail.com', N'Group 1', 1, N'08012345679', NULL, NULL, N'Flat 3, Parmar Chambers, 68-72, Stuart Street', NULL, NULL, CAST(N'2020-06-01 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (3, N'Abdulahi ', N'Musa', NULL, N'a.musa@gmail.com', N'Group 1', 1, N'08012345680', NULL, NULL, N'Golden-Gate Lodge,  Lugbe-Abuja', NULL, NULL, CAST(N'2020-06-01 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (4, N'Ojo', N'Maureen', NULL, N'okoye.p@gmail.com', N'Group 1', 1, N'08012345681', NULL, NULL, N'No 4 Hillary Street, Dawaki Model Estate', NULL, NULL, CAST(N'2020-06-01 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (5, N'Yusuf ', N'Gambo', NULL, N'migwe@gmail.com', N'Group 1', 1, N'08012345682', NULL, NULL, N'Komolafe Crescent, dawaki Abuja', NULL, NULL, CAST(N'2020-06-01 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (6, N'Michelle ', N'igwe', N'', N'migwe001@gmail.com', N'Group 1', 0, N'08012345683', N'', N'', N'Komolafe Crescent, dawaki Abuja', N'08012345683', N'a946b0fc773658eaa0e1c4226a7d08a69cbad8e7', CAST(N'2020-06-01 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (7, N'Ahmed', N'Temitope', N'', N'ahmedtemitopeaii@gmail.com', N'Group 1', 0, N'07467408489', N'', N'', N'Flat 3, Parmar Chambers, 68-72, Stuart Street', N'07467408489', N'1698c2bea6c8000723d5bb70363a8352d846917e', CAST(N'2020-06-01 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (8, N'Shehu', N'Ahmed', N'', N'shehuahmed@gmail.com', N'Group 1', 1, N'09012333445', N'', N'', N'House 5, A Close, 3rd Avenue', N'09012333445', N'a734d9ebb18b38446ddd117d289f12e9b7ac2c5e', CAST(N'2020-06-01 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (10, N'Oleka', N'Ugo', N'', N'olekaugo@gmail.com', N'Group 1', 1, N'08023232387', N'', N'', N'Abuja', N'08023232387', N'6693cdec94577b52cb6bb9b20c7628099331f1a7', CAST(N'2020-06-21 21:09:10.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (11, N'Isiuzor', N'Maureen', N'', N'maureen@gmail.com', N'Group 1', 1, N'08034345671', N'', N'', N'Abuja', N'08034345671', N'0b0e8938b04bf604999abc5cb037827409398cb7', CAST(N'2020-06-21 21:11:26.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (12, N'Nnamuka', N'Gregory ', N'', N'greg.n@gmail.com', N'Group 1', 1, N'09021021044', N'', N'', N'Abuja', N'09021021044', N'0b62dd23397c07c6a69a6173ecdf316fdf94e7e5', CAST(N'2020-07-03 18:01:28.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (9, N'Obi', N'Sarah', N'', N'o.sarah@gmail.com', N'Group 1', 1, N'08012345690', N'', N'', N'Komolafe Crescent, dawaki Abuja', N'08012345690', N'5c504a8ae171602809046bde94878da7dbc4e5ab', CAST(N'2020-06-21 19:54:05.0000000' AS DateTime2))
INSERT [dbo].[Clients] ([ClientID], [Surname], [Firstname], [Middlename], [Email], [ContactGroup], [ClientPortalEnabled], [MobilePhoneNo], [WorkPhoneNo], [HomePhoneNo], [Address], [Username], [Password], [RegDate]) VALUES (13, N'Dauda', N'Aliyu', N'C.', N'd.aliyu@gmail.com', N'Group 3', 1, N'07467408499', N'07467408499', N'07467408499', N'Flat 3, Parmar Chambers, 68-72, Stuart Street', N'07467408499', N'285f362c0294bed95001ff144d55338ca726cc95', CAST(N'2021-02-18 00:42:54.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Clients] OFF
SET IDENTITY_INSERT [dbo].[ContactGroups] ON 

INSERT [dbo].[ContactGroups] ([ID], [Name]) VALUES (1, N'Group 1')
INSERT [dbo].[ContactGroups] ([ID], [Name]) VALUES (2, N'Group 2')
INSERT [dbo].[ContactGroups] ([ID], [Name]) VALUES (3, N'Group 3')
SET IDENTITY_INSERT [dbo].[ContactGroups] OFF
SET IDENTITY_INSERT [dbo].[ConversationsThread] ON 

INSERT [dbo].[ConversationsThread] ([ID], [TicketID], [UserID], [Message], [Date]) VALUES (1, 1, N'9', N'A piece of evidence is required to proceed with the case.', CAST(N'2020-07-16 16:46:42.0000000' AS DateTime2))
INSERT [dbo].[ConversationsThread] ([ID], [TicketID], [UserID], [Message], [Date]) VALUES (2, 1, N'9', N'In addition, kindly provide up with an affidavit of Age declaration', CAST(N'2020-07-16 18:55:15.0000000' AS DateTime2))
INSERT [dbo].[ConversationsThread] ([ID], [TicketID], [UserID], [Message], [Date]) VALUES (3, 1, N'9', N'In addition, kindly provide up with an affidavit of Age declaration', CAST(N'2020-07-16 19:05:42.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[ConversationsThread] OFF
SET IDENTITY_INSERT [dbo].[CourtHearingSchedules] ON 

INSERT [dbo].[CourtHearingSchedules] ([ID], [CaseID], [CourtID], [CourtName], [Date]) VALUES (4, 2, 2, N'High Court of the Federal Capital Territory', CAST(N'2020-07-15 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CourtHearingSchedules] ([ID], [CaseID], [CourtID], [CourtName], [Date]) VALUES (2, 1, 2, N'High Court of the Federal Capital Territory', CAST(N'2020-07-14 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CourtHearingSchedules] ([ID], [CaseID], [CourtID], [CourtName], [Date]) VALUES (3, 3, 2, N'High Court of the Federal Capital Territory', CAST(N'2020-07-15 00:00:00.0000000' AS DateTime2))
INSERT [dbo].[CourtHearingSchedules] ([ID], [CaseID], [CourtID], [CourtName], [Date]) VALUES (6, 4, 2, N'High Court of the Federal Capital Territory', CAST(N'2020-07-16 10:00:00.0000000' AS DateTime2))
SET IDENTITY_INSERT [dbo].[CourtHearingSchedules] OFF
SET IDENTITY_INSERT [dbo].[Courts] ON 

INSERT [dbo].[Courts] ([ID], [Name], [Address]) VALUES (1, N'Federal High Court, Central Business District, Abuja', NULL)
INSERT [dbo].[Courts] ([ID], [Name], [Address]) VALUES (2, N'High Court of the Federal Capital Territory', NULL)
INSERT [dbo].[Courts] ([ID], [Name], [Address]) VALUES (4, N'Supreme Court Complex, Abuja, Nigeria', NULL)
SET IDENTITY_INSERT [dbo].[Courts] OFF
SET IDENTITY_INSERT [dbo].[Milestones] ON 

INSERT [dbo].[Milestones] ([ID], [CaseID], [Stage], [DateAchieved], [Milestone], [SupportingDocuments], [Icon], [Label]) VALUES (5, 2, N'Originating Processes', CAST(N'2020-07-07 00:00:00.0000000' AS DateTime2), N'The originating process was initiated with the assigned staff and complainant in attendance', N'../Briefcase/Litigation/Trial Courts/Yusuf Gambo vs Employer LI_2020_06_20_002/Originating Processes/Book2.xlsx`../Briefcase/Litigation/Trial Courts/Yusuf Gambo vs Employer LI_2020_06_20_002/Originating Processes/doc2.docx`../Briefcase/Litigation/Trial Courts/Yusuf Gambo vs Employer LI_2020_06_20_002/Originating Processes/Doc2.pdf`', NULL, NULL)
INSERT [dbo].[Milestones] ([ID], [CaseID], [Stage], [DateAchieved], [Milestone], [SupportingDocuments], [Icon], [Label]) VALUES (4, 3, N'Notice of Appeals', CAST(N'2020-07-07 00:00:00.0000000' AS DateTime2), N'The notice of appeal was submitted to the Team Lead by the complainant ', N'../Briefcase/Litigation/Appeals (Court of Appeal)/Gregory Nnamuka vs Landlord LI_2020_06_20_003/Notice of Appeals/Book2.xlsx`../Briefcase/Litigation/Appeals (Court of Appeal)/Gregory Nnamuka vs Landlord LI_2020_06_20_003/Notice of Appeals/doc2.docx`../Briefcase/Litigation/Appeals (Court of Appeal)/Gregory Nnamuka vs Landlord LI_2020_06_20_003/Notice of Appeals/Doc2.pdf`', NULL, NULL)
INSERT [dbo].[Milestones] ([ID], [CaseID], [Stage], [DateAchieved], [Milestone], [SupportingDocuments], [Icon], [Label]) VALUES (6, 2, N'Interlucutory Applications', CAST(N'2020-07-10 00:00:00.0000000' AS DateTime2), N'The Interlocutory Petition began with a point of view to shield the finishes of equity from being vanquished when the Original Petition can`t address the prompt conditions. ', N'../Briefcase/Litigation/Trial Courts/Yusuf Gambo vs Employer LI_2020_06_20_002/Interlucutory Applications/Interlocutor.pdf`', NULL, NULL)
INSERT [dbo].[Milestones] ([ID], [CaseID], [Stage], [DateAchieved], [Milestone], [SupportingDocuments], [Icon], [Label]) VALUES (7, 2, N'Interlucutory Applications', CAST(N'2020-07-10 00:00:00.0000000' AS DateTime2), N'The original appeal of is identified with the purpose of the start of a dispute while the interlocutory request is recorded within the main appeal.', N'../Briefcase/Litigation/Trial Courts/Yusuf Gambo vs Employer LI_2020_06_20_002/Interlucutory Applications/Interlocutor - 2.pdf`', NULL, NULL)
INSERT [dbo].[Milestones] ([ID], [CaseID], [Stage], [DateAchieved], [Milestone], [SupportingDocuments], [Icon], [Label]) VALUES (9, 2, N'Final Written Addresses', CAST(N'2020-07-11 00:00:00.0000000' AS DateTime2), N'The plank of the appellants case with regards to this issue centers on whether the appellant satisfied the evidential burden of establishing that the terms incorporated in exhibit 1, were indeed altered by agreement made between it and the alleged agents of the respondents. This is so because, the law places the burden of proving a fact asserted on that party that made the assertion. ', N'../Briefcase/Litigation/Trial Courts/Yusuf Gambo vs Employer LI_2020_06_20_002/Final Written Addresses/ADDRESS.pdf`', NULL, NULL)
INSERT [dbo].[Milestones] ([ID], [CaseID], [Stage], [DateAchieved], [Milestone], [SupportingDocuments], [Icon], [Label]) VALUES (10, 6, N'Notice of Appeals', CAST(N'2020-07-09 00:00:00.0000000' AS DateTime2), N'The notice of appeal was submitted to the Team Lead by the complainant ', N'../Briefcase/Litigation/Appeals (Sharia Court)/Abdulahi Musa vs Neighbour LI_2020_06_20_006/Notice of Appeals/Mahmud Briefcase Interrogations.txt`', NULL, NULL)
INSERT [dbo].[Milestones] ([ID], [CaseID], [Stage], [DateAchieved], [Milestone], [SupportingDocuments], [Icon], [Label]) VALUES (11, 6, N'Applications', CAST(N'2020-07-09 00:00:00.0000000' AS DateTime2), N'The application began with a point of view to shield the finishes of equity from being vanquished when the Original Petition can`t address the prompt conditions. ', N'../Briefcase/Litigation/Appeals (Sharia Court)/Abdulahi Musa vs Neighbour LI_2020_06_20_006/Applications/Doc2.pdf`', NULL, NULL)
INSERT [dbo].[Milestones] ([ID], [CaseID], [Stage], [DateAchieved], [Milestone], [SupportingDocuments], [Icon], [Label]) VALUES (12, 6, N'Briefs of Arguments', CAST(N'2020-07-10 00:00:00.0000000' AS DateTime2), N'The application ended with a point of view to shield the finishes of equity from being vanquished when the Original Petition can`t address the prompt conditions.', N'../Briefcase/Litigation/Appeals (Sharia Court)/Abdulahi Musa vs Neighbour LI_2020_06_20_006/Briefs of Arguments/doc2 (1).docx`', NULL, NULL)
INSERT [dbo].[Milestones] ([ID], [CaseID], [Stage], [DateAchieved], [Milestone], [SupportingDocuments], [Icon], [Label]) VALUES (13, 8, N'Originating Processes', CAST(N'2021-02-18 00:00:00.0000000' AS DateTime2), N'Preliminary Investigations', N'../Briefcase/Litigation/Trial Courts/Dauda Aliyu vs Commercial Driver LI_2021_02_18_001/Originating Processes/blank.pdf`../Briefcase/Litigation/Trial Courts/Dauda Aliyu vs Commercial Driver LI_2021_02_18_001/Originating Processes/Preliminar Investigation Findings.docx`', NULL, NULL)
INSERT [dbo].[Milestones] ([ID], [CaseID], [Stage], [DateAchieved], [Milestone], [SupportingDocuments], [Icon], [Label]) VALUES (14, 8, N'Originating Processes', CAST(N'2021-02-18 00:00:00.0000000' AS DateTime2), N'Description', N'../Briefcase/Litigation/Trial Courts/Dauda Aliyu vs Commercial Driver LI_2021_02_18_001/Originating Processes/Doc1.docx`', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Milestones] OFF
SET IDENTITY_INSERT [dbo].[PracticeAreas] ON 

INSERT [dbo].[PracticeAreas] ([ID], [Name]) VALUES (1, N'Bankruptcy')
INSERT [dbo].[PracticeAreas] ([ID], [Name]) VALUES (2, N'Business')
INSERT [dbo].[PracticeAreas] ([ID], [Name]) VALUES (3, N'Civil')
INSERT [dbo].[PracticeAreas] ([ID], [Name]) VALUES (4, N'Criminal Defense')
INSERT [dbo].[PracticeAreas] ([ID], [Name]) VALUES (5, N'Divorce/Separation')
INSERT [dbo].[PracticeAreas] ([ID], [Name]) VALUES (6, N'Foreclosure')
INSERT [dbo].[PracticeAreas] ([ID], [Name]) VALUES (7, N'Canon')
INSERT [dbo].[PracticeAreas] ([ID], [Name]) VALUES (8, N'Defamation')
SET IDENTITY_INSERT [dbo].[PracticeAreas] OFF
SET IDENTITY_INSERT [dbo].[Resources] ON 

INSERT [dbo].[Resources] ([UniqueID], [ResourceID], [ResourceName], [Color], [Image], [CustomField1]) VALUES (1, 1, N'Ojo Maureen vs Employer', 1, NULL, NULL)
INSERT [dbo].[Resources] ([UniqueID], [ResourceID], [ResourceName], [Color], [Image], [CustomField1]) VALUES (2, 2, N'Yusuf Gambo vs Employer', NULL, NULL, NULL)
INSERT [dbo].[Resources] ([UniqueID], [ResourceID], [ResourceName], [Color], [Image], [CustomField1]) VALUES (3, 3, N'Gregory Nnamuka vs Landlord', NULL, NULL, NULL)
INSERT [dbo].[Resources] ([UniqueID], [ResourceID], [ResourceName], [Color], [Image], [CustomField1]) VALUES (4, 4, N'Yetunde Olatunji - Divorce', NULL, NULL, NULL)
INSERT [dbo].[Resources] ([UniqueID], [ResourceID], [ResourceName], [Color], [Image], [CustomField1]) VALUES (5, 5, N'Tersoo John - Theft', NULL, NULL, NULL)
INSERT [dbo].[Resources] ([UniqueID], [ResourceID], [ResourceName], [Color], [Image], [CustomField1]) VALUES (6, 6, N'Abdulahi Musa vs Neighbour', NULL, NULL, NULL)
INSERT [dbo].[Resources] ([UniqueID], [ResourceID], [ResourceName], [Color], [Image], [CustomField1]) VALUES (7, 7, N'Shehu Ahmed vs State Government', NULL, NULL, NULL)
INSERT [dbo].[Resources] ([UniqueID], [ResourceID], [ResourceName], [Color], [Image], [CustomField1]) VALUES (8, 8, N'Dauda Aliyu vs Commercial Driver', NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Resources] OFF
INSERT [dbo].[Studyweek] ([Week]) VALUES (3)
SET IDENTITY_INSERT [dbo].[Tickets] ON 

INSERT [dbo].[Tickets] ([ID], [UserID], [CaseID], [Subject], [Priority], [Date], [LastUpdated], [Category], [TicketID], [Status]) VALUES (1, N'9', 6, N'Evidence Required', N'Normal', CAST(N'2020-07-16 16:46:42.0000000' AS DateTime2), CAST(N'2020-07-16 19:05:42.0000000' AS DateTime2), NULL, NULL, N'Open')
SET IDENTITY_INSERT [dbo].[Tickets] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (9, N'Admin', N'', N'Admin', N'', NULL, N'Admin', NULL, N'admin@itoolbox.net', N'admin', N'2009', N'09021021096', N'09021021096', N'Abuja', NULL, NULL, N'Engr. Chris Udokwu', N'Brother', N'08012345678', NULL, N'Flat 3, Parmar Chambers, 68-72, Stuart Street', 1, 200, NULL, N'dac3990e1a41fe7053d5bcb15792547525cccde5', 1, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar.png', 0)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (10, N'Staff001', N'Barr.', N'Jenifa', N'Eyo', NULL, N'Jenifa', N'Female', N'staff001@briefcase.ng', N'Lawyer', N'2009', N'09021021097', N'09021021097', N'Abuja', NULL, NULL, N'Engr. Chris Udokwu', N'Brother', N'08012345678', NULL, N'Flat 3, Parmar Chambers, 68-72, Stuart Street', 1, 1, NULL, N'dac3990e1a41fe7053d5bcb15792547525cccde5', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar2.png', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (11, N'Staff002', N'Barr.', N'Faith', N'Okpethere', N'', N'Faith', N'Female', N'staff001@briefcase.ng', N'Lawyer', N'2009', N'09021021098', N'', N'Abuja', NULL, NULL, N'Engr. Chris Udokwu', N'Brother', N'08012345678', N'', N'Flat 3, Parmar Chambers, 68-72, Stuart Street', 1, 1, NULL, N'9f2b773b05bfc719e7391dc49e1224a90802c00e', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar2.png', 3)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (12, N'Staff003', N'', N'Frank', N'Egwu', NULL, N'Frank', N'Male', N'staff001@briefcase.ng', N'Support Staff', N'2009', N'09021021099', N'09021021099', N'Abuja', NULL, NULL, N'Engr. Chris Udokwu', N'Brother', N'08012345678', NULL, N'Flat 3, Parmar Chambers, 68-72, Stuart Street', 0, 1, NULL, N'dac3990e1a41fe7053d5bcb15792547525cccde5', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar.png', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (13, N'Staff004', N'', N'Temitope', N'Ahmed', NULL, N'Temitope', N'Male', N'staff001@briefcase.ng', N'Support Staff', N'2009', N'09021021000', N'09021021000', N'Abuja', NULL, NULL, N'Engr. Chris Udokwu', N'Brother', N'08012345678', NULL, N'Flat 3, Parmar Chambers, 68-72, Stuart Street', 1, 1, NULL, N'dac3990e1a41fe7053d5bcb15792547525cccde5', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar.png', 4)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (14, N'Staff005', N'Barr.', N'Funmilayo', N'Ojo', NULL, N'Funmilayo', N'Female', N'staff001@briefcase.ng', N'Lawyer', N'2009', N'09021021001', N'09021021001', N'Abuja', NULL, NULL, N'Engr. Chris Udokwu', N'Brother', N'08012345678', NULL, N'Flat 3, Parmar Chambers, 68-72, Stuart Street', 0, 1, NULL, N'dac3990e1a41fe7053d5bcb15792547525cccde5', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar2.png', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (15, N'Staff006', N'', N'Ken', N'Atusue', NULL, N'Ken', N'Male', N'staff001@briefcase.ng', N'Support Staff', N'2009', N'09021021002', N'09021021002', N'Abuja', NULL, NULL, N'Engr. Chris Udokwu', N'Brother', N'08012345678', NULL, N'Flat 3, Parmar Chambers, 68-72, Stuart Street', 1, 1, NULL, N'dac3990e1a41fe7053d5bcb15792547525cccde5', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar.png', 1)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (16, N'Staff007', N'', N'Benedict', N'Azeez', NULL, N'Benedict', N'Male', N'staff001@briefcase.ng', N'Support Staff', N'2009', N'09021021003', N'09021021003', N'Abuja', NULL, NULL, N'Engr. Chris Udokwu', N'Brother', N'08012345678', NULL, N'Flat 3, Parmar Chambers, 68-72, Stuart Street', 0, 1, NULL, N'dac3990e1a41fe7053d5bcb15792547525cccde5', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar.png', 2)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (22, N'09012345678', N'Barr.', N'Udokwu', N'Michael', N'', N'Barr. Michael Michael ', N'Male', N'm.udokwu@gmail.com', N'Lawyer', N'2009', N'09012345678', N'', N'Flat 3, Parmar Chambers, 68-72, Stuart Street', NULL, NULL, N'Engr. Chris Udokwu', N'Brother', N'08012345678', N'', N'Flat 3, Parmar Chambers, 68-72, Stuart Street', 1, 0, CAST(N'2020-07-08 00:00:00.0000000' AS DateTime2), N'c66c453881dabd43afc9be6c5f1ba0bea1ef4d10', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar.png', 0)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (23, N'07467408459', N'Barr.', N'Ahmed', N'Temitope', N'', N'Barr. Temitope Temitope ', N'Male', N'ahmedtemitopeai@gmail.com', N'Lawyer', N'2009', N'07467408459', N'', N'Flat 3, Parmar Chambers, 68-72, Stuart Street', NULL, NULL, N'Femi Ahmed', N'Brother', N'07467408459', N'', N'House 5, A Close, 3rd Avenue', 1, 0, CAST(N'2020-07-08 00:00:00.0000000' AS DateTime2), N'1698c2bea6c8000723d5bb70363a8352d846917e', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar.png', 0)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (24, N'09021021066', N'Barr.', N'Bamiloye', N'Oluwakemi', N'F.', N'Barr. Oluwakemi Oluwakemi F.', N'Female', N'k.bamiloye@gmail.com', N'Lawyer', N'2009', N'09021021066', N'09021021066', N'45 Palm Beach Avenue, Galadima Abuja', NULL, NULL, N'Bamiloye', N'Folorunsho', N'09021021067', N'f.bamiloye@gmail.com', N'45 Palm Beach Avenue, Galadima Abuja', 1, 0, CAST(N'2021-02-18 00:00:00.0000000' AS DateTime2), N'afe268b6f67398286fce00cdd1fc1d83c6c92945', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar2.png', 0)
INSERT [dbo].[Users] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [RegDate], [ProfilePicUrl], [TaskLoad]) VALUES (25, N'09021021076', N'Barr.', N'Bawa', N'Balikis', N'W.', N'Barr. Balikis Balikis W.', N'Male', N'b.bawa@gmail.com', N'Lawyer', N'2012', N'09021021076', N'09021021076', N'Yobe Investment House, CBD Abuja', NULL, NULL, N'Bawa K. D.', N'Brother', N'09021021077', N'bawakb@gmail.com', N'Yobe Investment House, CBD Abuja', 1, 0, CAST(N'2021-02-18 00:00:00.0000000' AS DateTime2), N'743378e5974cb98742a3105eb21d5debe45fa192', 2, NULL, NULL, NULL, NULL, NULL, NULL, N'../img/user/avatar.png', 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Users2] ON 

INSERT [dbo].[Users2] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [AccountNumber], [BankName], [PIN], [AccountID], [AccountType], [Balance], [RegDate], [ProfilePicUrl], [Profile], [Domain], [TaskLoad]) VALUES (1, N'Admin', NULL, NULL, NULL, NULL, N'Admin', NULL, N'admin@itoolbox.net', N'admin', NULL, N'09021021096', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1447, CAST(N'2017-12-10' AS Date), N'dac3990e1a41fe7053d5bcb15792547525cccde5', 1, 1, CAST(N'2018-08-02' AS Date), 1, N'Unlocked', CAST(N'1990-01-01 06:00:00.0000000' AS DateTime2), N'dac3990e1a41fe7053d5bcb15792547525cccde5;', NULL, NULL, NULL, N'admin', N'Active', 0, NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Users2] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [AccountNumber], [BankName], [PIN], [AccountID], [AccountType], [Balance], [RegDate], [ProfilePicUrl], [Profile], [Domain], [TaskLoad]) VALUES (2, N'Staff001', NULL, NULL, NULL, NULL, N'Jenifa Eyo', NULL, N'staff001@itoolbox.net', N'Lawyer', NULL, N'09021021097', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2017-12-10' AS Date), N'dac3990e1a41fe7053d5bcb15792547525cccde5', 1, 2, CAST(N'2018-08-02' AS Date), 1, N'Unlocked', CAST(N'1990-01-01 06:00:00.0000000' AS DateTime2), N'dac3990e1a41fe7053d5bcb15792547525cccde5;', NULL, NULL, NULL, N'staff001', N'Active', 0, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Users2] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [AccountNumber], [BankName], [PIN], [AccountID], [AccountType], [Balance], [RegDate], [ProfilePicUrl], [Profile], [Domain], [TaskLoad]) VALUES (3, N'Staff002', NULL, NULL, NULL, NULL, N'Faith Okpethere', NULL, N'staff002@itoolbox.net', N'Lawyer', NULL, N'09021021098', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2017-12-10' AS Date), N'dac3990e1a41fe7053d5bcb15792547525cccde5', 1, 2, CAST(N'2018-08-02' AS Date), 1, N'Unlocked', CAST(N'1990-01-01 06:00:00.0000000' AS DateTime2), N'dac3990e1a41fe7053d5bcb15792547525cccde5;', NULL, NULL, NULL, N'staff001', N'Active', 0, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[Users2] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [AccountNumber], [BankName], [PIN], [AccountID], [AccountType], [Balance], [RegDate], [ProfilePicUrl], [Profile], [Domain], [TaskLoad]) VALUES (4, N'Staff003', NULL, NULL, NULL, NULL, N'Frank Egwu', NULL, N'staff003@itoolbox.net', N'Support Staff', NULL, N'09021021099', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 23, CAST(N'2017-12-10' AS Date), N'dac3990e1a41fe7053d5bcb15792547525cccde5', 1, 2, CAST(N'2018-08-02' AS Date), 1, N'Unlocked', CAST(N'1990-01-01 06:00:00.0000000' AS DateTime2), N'dac3990e1a41fe7053d5bcb15792547525cccde5;', NULL, NULL, NULL, N'staff001', N'Active', 0, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Users2] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [AccountNumber], [BankName], [PIN], [AccountID], [AccountType], [Balance], [RegDate], [ProfilePicUrl], [Profile], [Domain], [TaskLoad]) VALUES (5, N'Staff004', NULL, NULL, NULL, NULL, N'Temitope Ahmed', NULL, N'ahmedtemitopeai@gmail.com', N'Support Staff', NULL, N'7467408459', NULL, NULL, NULL, N'N0001', N'', NULL, NULL, NULL, NULL, 1, 0, CAST(N'2019-08-29' AS Date), N'cb1a421ca09ee9bb177d2879e0dcdeb21a3972f0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Inactive', NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Users2] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [AccountNumber], [BankName], [PIN], [AccountID], [AccountType], [Balance], [RegDate], [ProfilePicUrl], [Profile], [Domain], [TaskLoad]) VALUES (6, N'Staff005', NULL, NULL, NULL, NULL, N'Funmilayo Ojo', NULL, N'staff002@itoolbox.net', N'Lawyer', NULL, N'09021021088', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, CAST(N'2017-12-10' AS Date), N'dac3990e1a41fe7053d5bcb15792547525cccde5', 1, 2, CAST(N'2018-08-02' AS Date), 1, N'Unlocked', CAST(N'1990-01-01 06:00:00.0000000' AS DateTime2), N'dac3990e1a41fe7053d5bcb15792547525cccde5;', NULL, NULL, NULL, N'staff001', N'Active', 0, NULL, NULL, NULL, NULL, 4)
INSERT [dbo].[Users2] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [AccountNumber], [BankName], [PIN], [AccountID], [AccountType], [Balance], [RegDate], [ProfilePicUrl], [Profile], [Domain], [TaskLoad]) VALUES (7, N'Staff006', NULL, NULL, NULL, NULL, N'Ken Atusue', NULL, N'staff003@itoolbox.net', N'Support Staff', NULL, N'09021021089', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 23, CAST(N'2017-12-10' AS Date), N'dac3990e1a41fe7053d5bcb15792547525cccde5', 1, 2, CAST(N'2018-08-02' AS Date), 1, N'Unlocked', CAST(N'1990-01-01 06:00:00.0000000' AS DateTime2), N'dac3990e1a41fe7053d5bcb15792547525cccde5;', NULL, NULL, NULL, N'staff001', N'Active', 0, NULL, NULL, NULL, NULL, 2)
INSERT [dbo].[Users2] ([UserID], [Username], [Title], [Surname], [Firstname], [Middlename], [Name], [Gender], [Email], [UserType], [YearOfCall], [Phone], [WorkPhone], [Address], [DOB], [StaffID], [NoK_Fullname], [NoK_Relationship], [NoK_Phone], [NoK_Email], [NoK_Address], [Status], [Logs], [DateAdded], [Password], [FirmID], [RoleID], [PasswordSetDate], [LoginAttempt], [LockStatus], [LockTime], [Last6Passwords], [AccountNumber], [BankName], [PIN], [AccountID], [AccountType], [Balance], [RegDate], [ProfilePicUrl], [Profile], [Domain], [TaskLoad]) VALUES (8, N'Staff007', NULL, NULL, NULL, NULL, N'Benedict Azeez', NULL, N'ahmedtemitopeai@gmail.com', N'Support Staff', NULL, N'09021021089', NULL, NULL, NULL, N'N0001', N'', NULL, NULL, NULL, NULL, 1, 0, CAST(N'2019-08-29' AS Date), N'cb1a421ca09ee9bb177d2879e0dcdeb21a3972f0', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'Inactive', NULL, NULL, NULL, NULL, NULL, 1)
SET IDENTITY_INSERT [dbo].[Users2] OFF
SET IDENTITY_INSERT [dbo].[UserTypes] ON 

INSERT [dbo].[UserTypes] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[UserTypes] ([ID], [Name]) VALUES (2, N'Lawyer')
INSERT [dbo].[UserTypes] ([ID], [Name]) VALUES (3, N'Support Staff')
SET IDENTITY_INSERT [dbo].[UserTypes] OFF
