USE [INV_DB]

GO

/****** Object:  Table [dbo].[AdvanceEntry]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdvanceEntry](
	[Id] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[Deduction] [decimal](18, 2) NOT NULL,
	[WorkingDate] [datetime] NOT NULL,
 CONSTRAINT [PK_AdvanceEntry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Attendance]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attendance](
	[Att_ID] [int] IDENTITY(1,1) NOT NULL,
	[AdmissionNo] [nchar](30) NOT NULL,
	[StaffID] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[SubjectCode] [nchar](50) NOT NULL,
	[Status] [nchar](10) NOT NULL,
	[AttendanceID] [int] NOT NULL,
 CONSTRAINT [PK_Attendance] PRIMARY KEY CLUSTERED 
(
	[Att_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AttendanceMaster]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceMaster](
	[ID] [int] NOT NULL,
	[AttendanceType] [nchar](100) NOT NULL,
 CONSTRAINT [PK_AttendanceMaster] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AttendanceType]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttendanceType](
	[Type] [nchar](100) NOT NULL,
 CONSTRAINT [PK_AttendanceType] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MonthlyEmailLog]    Script Date: 17/07/2025 01:45:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MonthlyEmailLog](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [BatchNumber] [nvarchar](20)  NULL,
    [BatchDate] [date] NULL,
    [QuantityProduced] [decimal](18,2) NULL,
	[BatchName] [NVARCHAR](100) NULL,
    [LastSentDate] [date] NULL,
 CONSTRAINT [PK_MonthlyEmailLog] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
)WITH (
    PAD_INDEX = OFF, 
    STATISTICS_NORECOMPUTE = OFF, 
    IGNORE_DUP_KEY = OFF, 
    ALLOW_ROW_LOCKS = ON, 
    ALLOW_PAGE_LOCKS = ON
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FinancialSet]    Script Date: 17/07/2025 04:45:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FinancialSet](
    [ID] [int] IDENTITY(1,1) NOT NULL,
    [ExchangeRate] [decimal](10, 0) NOT NULL,
    [RoundingFactor] [decimal](10, 0) NOT NULL,
    [EntryDate] [datetime] NOT NULL DEFAULT GETDATE(),
 CONSTRAINT [PK_FinancialSet] PRIMARY KEY CLUSTERED 
(
    [ID] ASC
)WITH (
    PAD_INDEX = OFF, 
    STATISTICS_NORECOMPUTE = OFF, 
    IGNORE_DUP_KEY = OFF, 
    ALLOW_ROW_LOCKS = ON, 
    ALLOW_PAGE_LOCKS = ON
) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[InvoiceInfo11]    Script Date: 17/07/2025 05:10:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceInfo11](
    [Inv_ID] [int] NOT NULL,
    [InvoiceNo][nchar](30) NOT NULL,
    [InvoiceDate] [datetime] NOT NULL,
    [ServiceID] [int] NOT NULL,
    [RepairCharges] [decimal](18, 0) NOT NULL,
    [Upfront] [decimal](18, 0) NOT NULL,
    [ProductCharges] [decimal](18, 0) NOT NULL,
    [ServiceTaxPer] [decimal](18, 0) NOT NULL,
    [ServiceTax] [decimal](18, 0) NOT NULL,
    [GrandTotal] [decimal](18, 0) NOT NULL,
    [TotalPaid] [decimal](18, 0) NOT NULL,
    [Balance] [decimal](18, 0) NOT NULL,
    [Remarks] [nvarchar](max) NULL,
    [Store_Name]  [nvarchar](100) NULL,
    [Store_Name1] [nvarchar](100) NULL,
    [TaxGuid] [uniqueidentifier] NULL,
    [IsTaxed] [bit] NULL,
    [ApiTaxRandomNum] [nvarchar](max) NULL,
    [GrandSales] [decimal](18, 0) NULL,
    [TaxSales] [decimal](18, 0) NULL,
    [txt1] [decimal](18, 0) NULL,
    [txt2] [decimal](18, 0) NULL,
    [txt3] [decimal](18, 0) NULL,
    [InvoiceDate1] [datetime] NULL,
    [SalesmanID] [int] NULL,
 CONSTRAINT [PK_InvoiceInfo11] PRIMARY KEY CLUSTERED 
(
    [Inv_ID] ASC
)WITH (
    PAD_INDEX = OFF, 
    STATISTICS_NORECOMPUTE = OFF, 
    IGNORE_DUP_KEY = OFF, 
    ALLOW_ROW_LOCKS = ON, 
    ALLOW_PAGE_LOCKS = ON
) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice11_Payment]    Script Date: 17/07/2025 05:10:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice11_Payment](
    [IP_ID] [int] IDENTITY(1,1) NOT NULL,
    [InvoiceID] [int] NOT NULL,
    [PaymentDate] [datetime] NOT NULL,
    [TotalPaid] [decimal](18, 0) NOT NULL,
    [PaymentMode]  [nchar](150) NOT NULL,
 CONSTRAINT [PK_Invoice11_Payment] PRIMARY KEY CLUSTERED 
(
    [IP_ID] ASC
)WITH (
    PAD_INDEX = OFF, 
    STATISTICS_NORECOMPUTE = OFF, 
    IGNORE_DUP_KEY = OFF, 
    ALLOW_ROW_LOCKS = ON, 
    ALLOW_PAGE_LOCKS = ON
) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Invoice11_Product]    Script Date: 17/07/2025 05:11:00 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice11_Product](
    [Ipo_ID] [int] IDENTITY(1,1) NOT NULL,
    [InvoiceID] [int] NOT NULL,
    [ProductID] [int] NOT NULL,
    [CostPrice] [decimal](18, 0) NOT NULL,
    [SellingPrice] [decimal](18, 0) NOT NULL,
    [Margin] [decimal](18, 0) NOT NULL,
    [Qty] [decimal](18, 2) NOT NULL,
    [Amount] [decimal](18, 0) NOT NULL,
    [DiscountPer] [decimal](18, 0) NOT NULL,
    [Discount] [decimal](18, 0) NOT NULL,
    [VATPer] [decimal](18, 0) NOT NULL,
    [VAT] [decimal](18, 0) NOT NULL,
    [TotalAmount] [decimal](18, 0) NOT NULL,
    [Barcode][nchar](30) NULL,
 CONSTRAINT [PK_Invoice11_Product] PRIMARY KEY CLUSTERED 
(
    [Ipo_ID] ASC
)WITH (
    PAD_INDEX = OFF, 
    STATISTICS_NORECOMPUTE = OFF, 
    IGNORE_DUP_KEY = OFF, 
    ALLOW_ROW_LOCKS = ON, 
    ALLOW_PAGE_LOCKS = ON
) ON [PRIMARY]
) ON [PRIMARY]
GO


/****** Object:  Table [dbo].[Book]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[AccessionNo] [nchar](150) NOT NULL,
	[BookTitle] [nvarchar](250) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[Author] [nvarchar](250) NOT NULL,
	[JointAuthors] [nvarchar](250) NULL,
	[SubCategoryID] [int] NOT NULL,
	[Barcode] [nchar](150) NULL,
	[ISBN] [nchar](150) NULL,
	[Volume] [nchar](150) NULL,
	[Edition] [nchar](150) NULL,
	[Publisher] [nchar](200) NULL,
	[PlaceOfPublisher] [nchar](200) NULL,
	[PublishingYear] [nchar](50) NULL,
	[Section] [nchar](150) NULL,
	[Language] [nchar](150) NULL,
	[BookPosition] [nchar](150) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[BillNo] [nchar](150) NULL,
	[BillDate] [datetime] NULL,
	[NoOfPages] [int] NOT NULL,
	[Condition] [nchar](100) NULL,
	[Status] [nchar](100) NULL,
	[Remarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[AccessionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Book_RI]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book_RI](
	[IssueID] [int] NOT NULL,
	[ReservationID] [int] NOT NULL,
 CONSTRAINT [PK_Book_RI] PRIMARY KEY CLUSTERED 
(
	[IssueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookClass]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookClass](
	[ClassName] [nchar](200) NOT NULL,
 CONSTRAINT [PK_BookClass] PRIMARY KEY CLUSTERED 
(
	[ClassName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookIssue_Staff]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookIssue_Staff](
	[ID] [int] NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[AccessionNo] [nchar](150) NOT NULL,
	[StaffID] [int] NOT NULL,
	[Status] [nchar](50) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_BookIssue_Staff_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookIssue_Student]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookIssue_Student](
	[ID] [int] NOT NULL,
	[IssueDate] [datetime] NOT NULL,
	[DueDate] [datetime] NOT NULL,
	[AccessionNo] [nchar](150) NOT NULL,
	[AdmissionNo] [nchar](30) NOT NULL,
	[Status] [nchar](50) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_BookIssue_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BookReservation]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookReservation](
	[ID] [int] NOT NULL,
	[AccessionNo] [nchar](150) NOT NULL,
	[StaffID] [int] NOT NULL,
	[R_Date] [datetime] NOT NULL,
	[Status] [nchar](100) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_BookIssue_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BusCardHolder_Staff]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BusCardHolder_Staff](
	[BCH_ID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
	[BusNo] [nchar](100) NOT NULL,
	[Location] [varchar](250) NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[Status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_BusCardHolder_Staff] PRIMARY KEY CLUSTERED 
(
	[BCH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BusCardHolder_Student]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BusCardHolder_Student](
	[BCH_Id] [int] NOT NULL,
	[AdmissionNo] [nchar](30) NOT NULL,
	[BusNo] [nchar](100) NOT NULL,
	[Location] [varchar](250) NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[Status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_BusHolder] PRIMARY KEY CLUSTERED 
(
	[BCH_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BusFeePayment_Staff]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BusFeePayment_Staff](
	[BFP_ID] [int] NOT NULL,
	[PaymentID] [nchar](30) NOT NULL,
	[BusHolderID] [int] NOT NULL,
	[Session] [nchar](15) NOT NULL,
	[Installment] [nchar](20) NOT NULL,
	[TotalFee] [decimal](18, 2) NOT NULL,
	[DiscountPer] [decimal](18, 2) NOT NULL,
	[DiscountAmt] [decimal](18, 2) NOT NULL,
	[PreviousDue] [decimal](18, 2) NOT NULL,
	[Fine] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[TotalPaid] [decimal](18, 2) NOT NULL,
	[ModeOfPayment] [nchar](100) NOT NULL,
	[PaymentModeDetails] [varchar](250) NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentDue] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_BusFeePayment_Staff_1] PRIMARY KEY CLUSTERED 
(
	[BFP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BusFeePayment_Student]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BusFeePayment_Student](
	[BFP_ID] [int] NOT NULL,
	[PaymentID] [nchar](30) NOT NULL,
	[BusHolderID] [int] NOT NULL,
	[Session] [nchar](15) NOT NULL,
	[Installment] [nchar](20) NOT NULL,
	[TotalFee] [decimal](18, 2) NOT NULL,
	[DiscountPer] [decimal](18, 2) NOT NULL,
	[DiscountAmt] [decimal](18, 2) NOT NULL,
	[PreviousDue] [decimal](18, 2) NOT NULL,
	[Fine] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[TotalPaid] [decimal](18, 2) NOT NULL,
	[ModeOfPayment] [nchar](100) NOT NULL,
	[PaymentModeDetails] [varchar](250) NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentDue] [decimal](18, 2) NOT NULL,
	[Student_Class] [nchar](50) NULL,
 CONSTRAINT [PK_BusFeePayment] PRIMARY KEY CLUSTERED 
(
	[BFP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BusInfo]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BusInfo](
	[BusNo] [nchar](100) NOT NULL,
	[DriverName] [nchar](150) NOT NULL,
	[ContactNo] [nchar](100) NOT NULL,
	[SupporterName] [nchar](150) NULL,
	[S_ContactNo] [nchar](100) NULL,
 CONSTRAINT [PK_BusInfo] PRIMARY KEY CLUSTERED 
(
	[BusNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Class]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class](
	[ClassName] [nchar](100) NOT NULL,
	[ClassType] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Class_1] PRIMARY KEY CLUSTERED 
(
	[ClassName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ClassType]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClassType](
	[Type] [nchar](150) NOT NULL,
 CONSTRAINT [PK_ClassType] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseFee]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CourseFee](
	[C_ID] [int] NOT NULL,
	[SchoolID] [int] NOT NULL,
	[Class] [nchar](100) NOT NULL,
	[FeeName] [nvarchar](250) NOT NULL,
	[Month] [nchar](50) NOT NULL,
	[Fee] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_CourseFee] PRIMARY KEY CLUSTERED 
(
	[C_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CourseFeePayment]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseFeePayment](
	[CFP_ID] [int] NOT NULL,
	[PaymentID] [nchar](30) NOT NULL,
	[AdmissionNo] [nchar](30) NOT NULL,
	[Session] [nchar](15) NOT NULL,
	[TotalFee] [decimal](18, 2) NOT NULL,
	[DiscountPer] [decimal](18, 2) NOT NULL,
	[DiscountAmt] [decimal](18, 2) NOT NULL,
	[PreviousDue] [decimal](18, 2) NOT NULL,
	[Fine] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[TotalPaid] [decimal](18, 2) NOT NULL,
	[ModeOfPayment] [nchar](100) NOT NULL,
	[PaymentModeDetails] [varchar](250) NULL,
	[PaymentDate] [datetime] NOT NULL,
	[PaymentDue] [decimal](18, 2) NOT NULL,
	[Student_Class] [nchar](50) NULL,
 CONSTRAINT [PK_CourseFeePayment] PRIMARY KEY CLUSTERED 
(
	[CFP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CourseFeePayment_Join]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CourseFeePayment_Join](
	[CFPJ_Id] [int] IDENTITY(1,1) NOT NULL,
	[C_PaymentID] [int] NOT NULL,
	[FeeName] [varchar](250) NOT NULL,
	[Fee] [decimal](18, 2) NOT NULL,
	[Month] [nchar](50) NOT NULL,
 CONSTRAINT [PK_CourseFeePayment_Join] PRIMARY KEY CLUSTERED 
(
	[CFPJ_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Department]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] NOT NULL,
	[DepartmentName] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designation]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designation](
	[Designation] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Designation] PRIMARY KEY CLUSTERED 
(
	[Designation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdmissionNo] [nchar](30) NOT NULL,
	[Feetype] [nchar](50) NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Discount_Staff]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Discount_Staff](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StaffID] [int] NOT NULL,
	[Discount] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Discount_Staff] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Document]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Document](
	[Doc_Id] [int] NOT NULL,
	[DocName] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED 
(
	[Doc_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Exam]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam](
	[ID] [int] NOT NULL,
	[ExamType] [nchar](150) NOT NULL,
	[SchoolID] [int] NOT NULL,
 CONSTRAINT [PK_Exam] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Exam_Subject]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Exam_Subject](
	[ES_ID] [int] IDENTITY(1,1) NOT NULL,
	[ExamID] [int] NOT NULL,
	[SubjectCode] [nchar](50) NOT NULL,
	[ExamDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Exam_Subject] PRIMARY KEY CLUSTERED 
(
	[ES_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExamType]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamType](
	[Type] [nchar](150) NOT NULL,
 CONSTRAINT [PK_ExamType] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Expense]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Expense](
	[ExpenseName] [nvarchar](250) NOT NULL,
	[ExpenseType] [nchar](200) NOT NULL,
 CONSTRAINT [PK_Expense_1] PRIMARY KEY CLUSTERED 
(
	[ExpenseName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ExpenseType]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExpenseType](
	[Type] [nchar](200) NOT NULL,
 CONSTRAINT [PK_ExpenseType] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Fee]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fee](
	[Feename] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Fee_1] PRIMARY KEY CLUSTERED 
(
	[Feename] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[GradeMaster]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeMaster](
	[Grade] [nchar](10) NOT NULL,
	[GradePoint] [decimal](18, 1) NOT NULL,
	[MarksStartFrom] [int] NOT NULL,
	[MarksEndTo] [int] NOT NULL,
 CONSTRAINT [PK_GradeMaster] PRIMARY KEY CLUSTERED 
(
	[Grade] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Hosteler]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hosteler](
	[H_Id] [int] NOT NULL,
	[AdmissionNo] [nchar](30) NOT NULL,
	[HostelID] [int] NOT NULL,
	[JoiningDate] [datetime] NOT NULL,
	[Status] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Hosteler] PRIMARY KEY CLUSTERED 
(
	[H_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[HostelFeePayment]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HostelFeePayment](
	[HFP_Id] [int] NOT NULL,
	[PaymentID] [nchar](30) NOT NULL,
	[HostelerID] [int] NOT NULL,
	[Session] [nchar](15) NOT NULL,
	[Installment] [nchar](20) NOT NULL,
	[TotalFee] [decimal](18, 2) NOT NULL,
	[DiscountPer] [decimal](18, 2) NOT NULL,
	[DiscountAmt] [decimal](18, 2) NOT NULL,
	[PreviousDue] [decimal](18, 2) NOT NULL,
	[Fine] [decimal](18, 2) NOT NULL,
	[GrandTotal] [decimal](18, 2) NOT NULL,
	[TotalPaid] [decimal](18, 2) NOT NULL,
	[ModeOfPayment] [nchar](100) NOT NULL,
	[PaymentModeDetails] [varchar](250) NULL,
	[Paymentdate] [datetime] NOT NULL,
	[PaymentDue] [decimal](18, 2) NOT NULL,
	[Student_Class] [nchar](50) NULL,
 CONSTRAINT [PK_HostelFeePayment1] PRIMARY KEY CLUSTERED 
(
	[HFP_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HostelInfo]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[HostelInfo](
	[HI_Id] [int] NOT NULL,
	[Hostelname] [nchar](150) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[ContactNo] [nchar](15) NOT NULL,
	[ManagedBy] [nchar](100) NULL,
	[Person_ContactNo] [nchar](15) NULL,
 CONSTRAINT [PK_HostelInfo] PRIMARY KEY CLUSTERED 
(
	[HI_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Installment_Bus]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Installment_Bus](
	[IB_ID] [int] NOT NULL,
	[Installment] [nchar](20) NOT NULL,
	[Charges] [decimal](18, 2) NOT NULL,
	[Location] [varchar](250) NULL,
 CONSTRAINT [PK_Installment] PRIMARY KEY CLUSTERED 
(
	[IB_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Installment_Hostel]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Installment_Hostel](
	[IH_ID] [int] NOT NULL,
	[Installment] [nchar](20) NOT NULL,
	[Charges] [decimal](18, 2) NOT NULL,
	[HostelID] [int] NOT NULL,
	[Class] [nchar](100) NOT NULL,
	[SchoolID] [int] NOT NULL,
 CONSTRAINT [PK_Installment_Hostel_Student] PRIMARY KEY CLUSTERED 
(
	[IH_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[JournalAndMagazines]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JournalAndMagazines](
	[ID] [int] NOT NULL,
	[JM_Name] [nchar](200) NOT NULL,
	[SubscriptionNo] [nchar](50) NULL,
	[SubscriptionDate] [datetime] NOT NULL,
	[Subscription] [nchar](100) NULL,
	[SubscriptionDateFrom] [datetime] NOT NULL,
	[SubscriptionDateTo] [datetime] NOT NULL,
	[BillNo] [nchar](100) NOT NULL,
	[BillDate] [datetime] NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[PaidOn] [datetime] NOT NULL,
	[IssueNo] [nchar](100) NULL,
	[IssueDate] [datetime] NOT NULL,
	[Months] [nchar](50) NULL,
	[JM_year] [int] NOT NULL,
	[Volume] [nchar](100) NULL,
	[V_num] [nchar](100) NULL,
	[DateOfReceipt] [datetime] NULL,
	[SupplierID] [int] NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[Remarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_JournalAndMagazines] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]



GO
/****** Object:  Table [dbo].[Location]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Location](
	[LocationName] [varchar](250) NOT NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[MarksEntry]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarksEntry](
	[M_Id] [int] NOT NULL,
	[AdmissionNo] [nchar](30) NOT NULL,
	[Session] [nchar](15) NOT NULL,
	[EntryDate] [datetime] NOT NULL,
	[Student_Class] [nchar](100) NOT NULL,
	[Result] [nchar](20) NULL,
 CONSTRAINT [PK_MarksEntry] PRIMARY KEY CLUSTERED 
(
	[M_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MarksEntry_Join]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MarksEntry_Join](
	[MJ_Id] [int] IDENTITY(1,1) NOT NULL,
	[SubCode] [nchar](50) NOT NULL,
	[MaxMarks] [int] NOT NULL CONSTRAINT [DF_MarksEntry_Join_MaxMarks]  DEFAULT ((0)),
	[CreditHour] [int] NOT NULL,
	[OGTheory] [nchar](10) NULL CONSTRAINT [DF_MarksEntry_Join_OGTheory]  DEFAULT ((0)),
	[OMTheory] [int] NULL CONSTRAINT [DF_MarksEntry_Join_OMTheory]  DEFAULT ((0)),
	[OGPractical] [nchar](10) NULL,
	[OMPractical] [int] NULL CONSTRAINT [DF_MarksEntry_Join_OMPractical]  DEFAULT ((0)),
	[FinalGrade] [nchar](10) NULL,
	[GradePoint] [decimal](18, 1) NULL CONSTRAINT [DF_MarksEntry_Join_GradePoint]  DEFAULT ((0.0)),
	[MarksID] [int] NOT NULL,
	[MMPractical] [int] NOT NULL CONSTRAINT [DF_MarksEntry_Join_MMPractical]  DEFAULT ((0)),
 CONSTRAINT [PK_MarksEntry_Join] PRIMARY KEY CLUSTERED 
(
	[MJ_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[NewsPaper]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsPaper](
	[ID] [int] NOT NULL,
	[Papername] [nvarchar](250) NOT NULL,
	[N_Date] [datetime] NOT NULL,
	[Status] [nchar](30) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_NewsPaper] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Newspaper_Master]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Newspaper_Master](
	[NewsPaper] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_Newspaper_Master] PRIMARY KEY CLUSTERED 
(
	[NewsPaper] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quotation1]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation1](
	[OrderID] [int] NOT NULL,
	[OrderNo] [nchar](30) NOT NULL,
	[From] [nchar](250) NULL,
	[From_Address] [nchar](250) NULL,
	[From_ContactNo] [nchar](150) NULL,
	[To] [nchar](250) NULL,
	[To_Address] [nchar](250) NULL,
	[To_ContactNo] [nchar](150) NULL,
	[OrderDate] [datetime] NOT NULL,
	[DepartmentID] [int] NULL,
	[Remarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_Quotation1] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quotation1_Join]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation1_Join](
	[QJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[AccessionNo] [nchar](150) NOT NULL,
	[QJ_OrderID] [int] NOT NULL,
	[Qty] [int] NOT NULL,
 CONSTRAINT [PK_Quotation1_Join] PRIMARY KEY CLUSTERED 
(
	[QJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Return_Staff]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return_Staff](
	[ID] [int] NOT NULL,
	[IssueID] [int] NOT NULL,
	[ReturnDate] [datetime] NOT NULL,
	[Fine] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_Return_Staff] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Return_Student]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Return_Student](
	[ID] [int] NOT NULL,
	[IssueID] [int] NOT NULL,
	[ReturnDate] [datetime] NOT NULL,
	[Fine] [decimal](18, 2) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_Return_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SchoolInfo]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[SchoolInfo](
	[S_Id] [int] NOT NULL,
	[SchoolName] [varchar](250) NOT NULL,
	[Address] [varchar](250) NOT NULL,
	[ContactNo] [nchar](50) NOT NULL,
	[AltContactNo] [nchar](50) NULL,
	[FaxNo] [nchar](50) NULL,
	[Email] [varchar](250) NOT NULL,
	[Website] [varchar](250) NULL,
	[Logo] [image] NOT NULL,
	[RegistrationNo] [nchar](150) NULL,
	[EstablishedYear] [int] NOT NULL,
	[SchoolType] [nchar](150) NOT NULL,
 CONSTRAINT [PK_SchoolInfo] PRIMARY KEY CLUSTERED 
(
	[S_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SchoolType]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SchoolType](
	[Type] [nchar](150) NOT NULL,
 CONSTRAINT [PK_SchoolType] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Section]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Section](
	[Id] [int] NOT NULL,
	[SectionName] [nchar](15) NOT NULL,
	[Class] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Section] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Session_Master]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Session_Master](
	[Session] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Session_Master] PRIMARY KEY CLUSTERED 
(
	[Session] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Setting]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[BookType] [nchar](30) NOT NULL,
	[MaxDays_Staff] [int] NOT NULL,
	[MaxDays_Student] [int] NOT NULL,
	[FinePerDay_Student] [decimal](18, 2) NOT NULL,
	[FinePerDay_Staff] [decimal](18, 2) NOT NULL,
	[MaxBooks_Staff] [int] NOT NULL,
	[MaxBooks_Student] [int] NOT NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[BookType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Staff]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Staff](
	[St_ID] [int] NOT NULL,
	[StaffID] [nchar](15) NOT NULL,
	[StaffName] [nchar](150) NOT NULL,
	[DateOfJoining] [datetime] NOT NULL,
	[Gender] [nchar](15) NOT NULL,
	[FatherName] [nchar](150) NOT NULL,
	[TemporaryAddress] [varchar](250) NOT NULL,
	[PermanentAddress] [varchar](250) NOT NULL,
	[Designation] [nchar](150) NOT NULL,
	[Qualifications] [varchar](250) NOT NULL,
	[DOB] [datetime] NOT NULL,
	[PhoneNo] [nchar](100) NULL,
	[MobileNo] [nchar](100) NOT NULL,
	[Email] [nchar](150) NULL,
	[Photo] [image] NOT NULL,
	[ClassType] [nchar](150) NOT NULL,
	[SchoolID] [int] NOT NULL,
	[AccountName] [nchar](150) NOT NULL,
	[AccountNumber] [nchar](100) NOT NULL,
	[Bank] [varchar](250) NOT NULL,
	[Branch] [nchar](150) NOT NULL,
	[IFSCcode] [nchar](100) NULL,
	[Status] [nchar](50) NOT NULL,
	[Salary] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[St_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Staff_Department]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Staff_Department](
	[SD_ID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentID] [int] NOT NULL,
	[StaffID] [int] NOT NULL,
 CONSTRAINT [PK_Staff_Department] PRIMARY KEY CLUSTERED 
(
	[SD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaffAttendance]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StaffAttendance](
	[Id] [int] NOT NULL,
	[WorkingDate] [datetime] NOT NULL,
	[StaffID] [int] NOT NULL,
	[Status] [nchar](20) NOT NULL,
	[InTime] [nchar](30) NOT NULL,
	[OutTime] [nchar](30) NOT NULL,
 CONSTRAINT [PK_EmployeeAttendance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StaffPayment]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[StaffPayment](
	[Id] [int] NOT NULL,
	[PaymentID] [nchar](20) NOT NULL,
	[DateFrom] [datetime] NOT NULL,
	[DateTo] [datetime] NOT NULL,
	[StaffID] [int] NOT NULL,
	[PresentDays] [int] NOT NULL,
	[Salary] [decimal](18, 2) NOT NULL,
	[Advance] [decimal](18, 2) NOT NULL,
	[Deduction] [decimal](18, 2) NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[ModeOfPayment] [nchar](50) NOT NULL,
	[PaymentModeDetails] [varchar](max) NULL,
	[NetPay] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_EmployeePayment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Student]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[AdmissionNo] [nchar](30) NOT NULL,
	[EnrollmentNo] [nchar](15) NULL,
	[GRNo] [nchar](50) NULL,
	[UID] [nchar](50) NULL,
	[StudentName] [nchar](100) NOT NULL,
	[FatherName] [nchar](100) NOT NULL,
	[MotherName] [nchar](100) NOT NULL,
	[FatherCN] [nchar](15) NULL,
	[PermanentAddress] [varchar](250) NOT NULL,
	[TemporaryAddress] [varchar](250) NOT NULL,
	[ContactNo] [nchar](15) NOT NULL,
	[EmailID] [varchar](250) NULL,
	[DOB] [datetime] NOT NULL,
	[Gender] [nchar](10) NOT NULL,
	[AdmissionDate] [datetime] NOT NULL,
	[Session] [nchar](15) NOT NULL,
	[Caste] [nchar](100) NOT NULL,
	[Religion] [nchar](100) NOT NULL,
	[SectionID] [int] NOT NULL,
	[Photo] [image]  NULL,
	[Nationality] [nchar](100) NULL,
	[SchoolID] [int] NOT NULL,
	[LastSchoolAttended] [nvarchar](250) NULL,
	[Result] [nchar](20) NULL,
	[PassPercentage] [nchar](10) NULL,
	[Status] [nchar](15) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[AdmissionNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[StudentDocSubmitted]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentDocSubmitted](
	[SDS_id] [int] IDENTITY(1,1) NOT NULL,
	[AdmissionNo] [nchar](30) NOT NULL,
	[DocId] [int] NOT NULL,
 CONSTRAINT [PK_StudentDocSubmitted] PRIMARY KEY CLUSTERED 
(
	[SDS_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Subject]    Script Date: 01/02/2024 08:37:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[SubjectCode] [nchar](50) NOT NULL,
	[SubjectName] [nvarchar](max) NOT NULL,
	[Class] [nchar](100) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[SubjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[dish]    Script Date: 01/07/2023 06:32:40 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[dish](
	[ItemID] [int] NOT NULL,
	[DishName] [nchar](150) NULL,
	[Category] [nchar](150) NULL,
	[Kitchen] [nchar](150) NULL,
	[Rate] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
	[InventoryType] [nchar](50) NULL,
	[PID] [int] NULL,
	[lastUsed] [datetime] NULL,
 CONSTRAINT [PK_dish] PRIMARY KEY CLUSTERED 
(
	[ItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Departmenth_Tbl]    Script Date: 10/06/2023 14:59:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Departmenth_Tbl](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
	[T1] [nvarchar](50) NULL,
 CONSTRAINT [PK_[Departmenth_Tbl] PRIMARY KEY CLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO

/****** Object:  Table [dbo].[subdeph]    Script Date: 10/06/2023 14:46:04 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[subdeph](
	[ID] [int] NOT NULL,
	[SubdepName] [nvarchar](50) NOT NULL,
	[depname] [nvarchar](50) NOT NULL,
	[bad] [int] NULL,
	[rat] [nchar](10) NULL,
	[active] [nchar](10) NULL,
	[ItemsDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_supdeph] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


GO
/****** Object:  Table [dbo].[subdep]    Script Date: 16/04/2023 04:28:25 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subdep](
	[ID] [int] NOT NULL,
	[SubdepName] [nvarchar](50) NOT NULL,
	[depname] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_supdep] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Department_Tbl]    Script Date: 16/04/2023 04:28:45 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department_Tbl](
	[DepartmentID] [int] NOT NULL,
	[DepartmentName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_[Department_Tbl] PRIMARY KEY CLUSTERED 
(
	[DepartmentName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employee_Tbl]    Script Date: 16/04/2023 04:29:02 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee_Tbl](
	[EmployeeID] [int] NOT NULL,
	[EmployeeName] [nvarchar](100) NULL,
	[DepartmentID] [int] NULL,
	[JobID] [int] NULL,
	[BirthDate] [date] NULL,
	[Salary] [decimal](18, 2) NULL,
	[Mobile] [nvarchar](50) NULL,
	[Address] [nvarchar](150) NULL,
	[Notes] [nvarchar](150) NULL,
	[StartWorkDate] [date] NULL,
	[Emp_Pic] [image] NULL,
	[SubdepID] [int] NULL,
 CONSTRAINT [PK_Employee_Tbl] PRIMARY KEY CLUSTERED 
(
	[EmployeeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Stock_IN_Tbl]    Script Date: 27/06/2020 10:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_IN_Tbl](
	[Stock_IN_ID] [int] IDENTITY(1,1) NOT NULL,
	[Stock_ID] [int] NOT NULL,
	[Money] [decimal](18, 2) NULL,
	[Date_In] [date] NULL,
	[EmpName] [nvarchar](80) NULL,
	[Reason] [nvarchar](250) NULL,
 CONSTRAINT [PK_Stock_IN_Tbl] PRIMARY KEY CLUSTERED 
(
	[Stock_IN_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock_Money_Tbl]    Script Date: 27/06/2020 10:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_Money_Tbl](
	[Stock_ID] [int] NOT NULL,
	[Money] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Stock_Money_Tbl] PRIMARY KEY CLUSTERED 
(
	[Stock_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock_Out_Tbl]    Script Date: 27/06/2020 10:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_Out_Tbl](
	[Stock_Out_ID] [int] IDENTITY(1,1) NOT NULL,
	[Stock_ID] [int] NOT NULL,
	[Money] [decimal](18, 2) NULL,
	[DateOut] [date] NULL,
	[EmpName] [nvarchar](80) NULL,
	[Reason] [nvarchar](250) NULL,
 CONSTRAINT [PK_Stock_Out_Tbl] PRIMARY KEY CLUSTERED 
(
	[Stock_Out_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock_Tbl]    Script Date: 27/06/2020 10:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_Tbl](
	[Stock_ID] [int] NOT NULL,
	[Stock_Name] [nvarchar](250) NULL,
	[stockdefult] [int] NULL,
	[stockdefult2] [int] NULL,
 CONSTRAINT [PK_Stock_Tbl] PRIMARY KEY CLUSTERED 
(
	[Stock_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock_To_Bank]    Script Date: 27/06/2020 10:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_To_Bank](
	[Bank_Transfer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Money] [decimal](18, 2) NULL,
	[TransferDate] [date] NULL,
	[StockName] [nvarchar](50) NULL,
	[BankName] [nvarchar](50) NULL,
	[EmpName] [nvarchar](80) NULL,
	[Reason] [nvarchar](250) NULL,
 CONSTRAINT [PK_Stock_To_Bank] PRIMARY KEY CLUSTERED 
(
	[Bank_Transfer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock_To_Stock_Tbl]    Script Date: 27/06/2020 10:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_To_Stock_Tbl](
	[Stock_Transfer_ID] [int] IDENTITY(1,1) NOT NULL,
	[Money] [decimal](18, 2) NULL,
	[TransferDate] [date] NULL,
	[StockFrom] [nvarchar](150) NULL,
	[StockTo] [nvarchar](150) NULL,
	[EmpName] [nvarchar](80) NULL,
	[Reason] [nvarchar](250) NULL,
 CONSTRAINT [PK_Stock_To_Stock_Tbl] PRIMARY KEY CLUSTERED 
(
	[Stock_Transfer_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DestoryProduct]    Script Date: 03/04/2023 10:19:01 Õ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[DestoryProduct](
	[pid] [int] NOT NULL,
	[id] [nchar](10) NULL,
	[Date] [date] NULL,
	[Name] [nchar](50) NULL,
	[EmployeeName] [nvarchar](50) NULL,
	[EmployeeID] [int] NULL,
	[Mobile] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[SubTotal] [decimal](18, 0) NULL,
	[DiscountPer] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
	[VATPer] [decimal](18, 0) NULL,
	[VATAmt] [decimal](18, 0) NULL,
	[PreviousDue] [decimal](18, 0) NULL,
	[FreightCharges] [decimal](18, 0) NULL,
	[OtherCharges] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
	[RoundOff] [decimal](18, 0) NULL,
	[GrandTotal] [decimal](18, 0) NULL,
	[TotalPayment] [decimal](18, 0) NULL,
	[PaymentDue] [decimal](18, 0) NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_DestoryProduct] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Destory_join]    Script Date: 03/04/2023 10:19:22 Õ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Destory_join](
	[pid] [int] IDENTITY(1,1) NOT NULL,
	[id] [int] NULL,
	[ProductID] [nchar](10) NULL,
	[Qty] [decimal](18, 2) NULL,
	[Price] [decimal](18, 0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[Barcode] [nvarchar](50) NULL,
	[ProductName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Destory_join] PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Destory_join]  WITH CHECK ADD  CONSTRAINT [FK_Destory_join_DestoryProduct] FOREIGN KEY([id])
REFERENCES [dbo].[DestoryProduct] ([pid])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Destory_join] CHECK CONSTRAINT [FK_Destory_join_DestoryProduct]
GO


/****** Object:  Table [dbo].[Job_Tbl]    Script Date: 17/02/2023 13:57:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Job_Tbl](
	[JobID] [int] NOT NULL,
	[JobName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Job_Tbl] PRIMARY KEY CLUSTERED 
(
	[JobID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Table [dbo].[accountprint]    Script Date: 23/09/2022 10:08:50 ã ******/

SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[accountprint](
	[ID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[Col1] [datetime] NULL,
	[Col2] [varchar](max) NULL,
	[Col3] [varchar](max) NULL,
	[Col4] [varchar](max) NULL,
	[Col5] [varchar](max) NULL,
	[Col6] [decimal](18, 0) NOT NULL,
	[Col7] [decimal](18, 0) NOT NULL,
	[Col8] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_accountprint] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Activation]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Activation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HardwareID] [nchar](100) NOT NULL,
	[SerialNo] [nchar](100) NOT NULL,
	[ActivationID] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Activation] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryName] [nchar](150) NOT NULL,
	[VAT1] [decimal](18, 0) NULL,
	[ST] [decimal](18, 0) NULL,
	[SC] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nchar](200) NOT NULL,
	[Address] [nvarchar](250) NOT NULL,
	[ContactNo] [nchar](150) NOT NULL,
	[EmailID] [nchar](150) NOT NULL,
	[Logo] [varbinary](max) NULL,
	[TIN] [nchar](150) NULL,
	[STNo] [nchar](150) NULL,
	[CIN] [nchar](150) NULL,
	[TaxNum] [nchar](150) NULL,
	[Footer] [nchar](150) NULL,
	[PriceUsd] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Company_Contacts]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company_Contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ContactPerson] [nchar](150) NOT NULL,
	[ContactNo] [nchar](150) NOT NULL,
	[Price] [decimal](18, 0)  NULL,
 CONSTRAINT [PK_Company_Contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[ID] [int] NOT NULL,
	[CustomerID] [nchar](30) NULL,
	[Name] [nchar](200) NULL,
	[Gender] [nchar](10) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nchar](200) NULL,
	[State] [nchar](150) NULL,
	[ZipCode] [nchar](15) NULL,
	[ContactNo] [nchar](150) NULL,
	[EmailID] [nchar](200) NULL,
	[Remarks] [nvarchar](max) NULL,
	[Photo] [image] NULL,
	[CustomerType] [nchar](30) NULL,
	[OpeningBalance] [decimal](18, 0) NULL,
	[OpeningBalanceType] [nchar](20) NULL,
	[SchoolID] [int] NULL,
	[SectionID] [int] NULL,
	[MotherName] [nchar](100) NULL,
	[Session] [nchar](15) NULL,
	[DOB] [datetime] NULL,
	[AdmissionDate] [datetime] NULL,
	[Status] [nchar](15)  NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[EmailSetting]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EmailSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ServerName] [nchar](150) NOT NULL,
	[SMTPAddress] [nvarchar](250) NOT NULL,
	[Username] [nchar](200) NOT NULL,
	[Password] [nchar](100) NOT NULL,
	[Port] [int] NOT NULL,
	[TLS_SSL_Required] [nchar](10) NOT NULL,
	[IsDefault] [nchar](10) NOT NULL,
	[IsActive] [nchar](10) NOT NULL,
 CONSTRAINT [PK_EmailSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice_Payment]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Payment](
	[IP_ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[TotalPaid] [decimal](18, 0) NOT NULL,
	[PaymentMode] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Invoice_Payment] PRIMARY KEY CLUSTERED 
(
	[IP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice_Product]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice_Product](
	[IPo_ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CostPrice] [decimal](18, 0) NOT NULL,
	[SellingPrice] [decimal](18, 0) NOT NULL,
	[Margin] [decimal](18, 0) NOT NULL,
	[Qty][decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[DiscountPer] [decimal](18, 0) NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[VATPer] [decimal](18, 0) NOT NULL,
	[VAT] [decimal](18, 0) NOT NULL,
	[TotalAmount] [decimal](18, 0) NOT NULL,
	[Barcode] [nchar](30) NULL,
	[Unit] [nchar](20) NULL,
	[Unit2] [nchar](20) NULL,
	[nunit2] [int] null,
	[Unit3] [nchar](20) NULL,
	[nunit3] [int] null,
	[SellingPrice2] [decimal](18, 0)  NULL,
	[SellingPrice3] [decimal](18, 0)  NULL,
	[CostPrice2] [decimal](18, 0)  NULL,
	[CostPrice3] [decimal](18, 0)  NULL,
	[Qty1][decimal](18, 2)  NULL,
	[Qty2][decimal](18, 2)  NULL,
	[Qty3][decimal](18, 2)  NULL,
 CONSTRAINT [PK_Invoice_Product] PRIMARY KEY CLUSTERED 
(
	[IPo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Invoice_Product2]    Script Date: 29/05/2023 10:34:59 ã ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Invoice_Product2](
	[IPo_ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CostPrice] [decimal](18, 0) NOT NULL,
	[SellingPrice] [decimal](18, 0) NOT NULL,
	[Margin] [decimal](18, 0) NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[DiscountPer] [decimal](18, 0) NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[VATPer] [decimal](18, 0) NOT NULL,
	[VAT] [decimal](18, 0) NOT NULL,
	[TotalAmount] [decimal](18, 0) NOT NULL,
	[Barcode] [nchar](30) NULL,
	[Unit] [nchar](20) NULL,
	[Unit2] [nchar](20) NULL,
	[nunit2] [int] NULL,
	[Unit3] [nchar](20) NULL,
	[nunit3] [int] NULL,
	[SellingPrice2] [decimal](18, 0) NULL,
	[SellingPrice3] [decimal](18, 0) NULL,
	[CostPrice2] [decimal](18, 0) NULL,
	[CostPrice3] [decimal](18, 0) NULL,
	[Qty1] [decimal](18, 2) NULL,
	[Qty2] [decimal](18, 2) NULL,
	[Qty3] [decimal](18, 2) NULL,
 CONSTRAINT [PK_Invoice_Product2] PRIMARY KEY CLUSTERED 
(
	[IPo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]


GO
/****** Object:  Table [dbo].[Invoice1_Payment]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice1_Payment](
	[IP_ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[PaymentDate] [datetime] NOT NULL,
	[TotalPaid] [decimal](18, 0) NOT NULL,
	[PaymentMode] [nchar](150) NOT NULL,
 CONSTRAINT [PK_Invoice1_Payment] PRIMARY KEY CLUSTERED 
(
	[IP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Invoice1_Product]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Invoice1_Product](
	[Ipo_ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[CostPrice] [decimal](18, 0) NOT NULL,
	[SellingPrice] [decimal](18, 0) NOT NULL,
	[Margin] [decimal](18, 0) NOT NULL,
	[Qty][decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[DiscountPer] [decimal](18, 0) NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[VATPer] [decimal](18, 0) NOT NULL,
	[VAT] [decimal](18, 0) NOT NULL,
	[TotalAmount] [decimal](18, 0) NOT NULL,
	[Barcode] [nchar](30) NULL,
 CONSTRAINT [PK_Invoice1_Product] PRIMARY KEY CLUSTERED 
(
	[Ipo_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceInfo]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceInfo](
	[Inv_ID] [int] NOT NULL,
	[InvoiceNo] [nchar](30) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[InvoiceDate1] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[SalesmanID] [int] NULL,
	[GrandTotal] [decimal](18, 0) NOT NULL,
	[TotalPaid] [decimal](18, 0) NOT NULL,
	[Balance] [decimal](18, 0) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Inv_ID_2] [nvarchar](50) NULL,
	[Manual_Inv] [nvarchar](50) NULL,
	[PO_No] [nvarchar](50) NULL,
	[Store_Name] [nvarchar](100) NULL,
	[Store_Address] [nvarchar](max) NULL,
	[TaxGuid] [uniqueidentifier] NULL,
	[IsTaxed] [bit] NULL,
	[ApiTaxRandomNum] [nvarchar](max) NULL,
	[GrandSales][decimal](18, 0) NULL,
	[TaxSales][decimal](18, 0) NULL,
	[Discount][decimal](18, 0) NULL,
	[txt1] [decimal](18, 0) NULL,
	[txt2] [decimal](18, 0) NULL,
	[txt3] [decimal](18, 0) NULL,
	[Balance1] [decimal](18, 0) NULL,
	[Gold] [decimal](18, 0) NULL,
	[StateIn] [nchar](150) NULL,
	[StateOut] [nchar](150) NULL,
	[Round] [decimal](18, 0) NULL,
 CONSTRAINT [PK_InvoiceInfo] PRIMARY KEY CLUSTERED 
(
	[Inv_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvoiceInfo1]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvoiceInfo1](
	[Inv_ID] [int] NOT NULL,
	[InvoiceNo] [nchar](30) NOT NULL,
	[InvoiceDate] [datetime] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[RepairCharges] [decimal](18, 0) NOT NULL,
	[Upfront] [decimal](18, 0) NOT NULL,
	[ProductCharges] [decimal](18, 0) NOT NULL,
	[ServiceTaxPer] [decimal](18, 0) NOT NULL,
	[ServiceTax] [decimal](18, 0) NOT NULL,
	[GrandTotal] [decimal](18, 0) NOT NULL,
	[TotalPaid] [decimal](18, 0) NOT NULL,
	[Balance] [decimal](18, 0) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Store_Name] [nvarchar](100) NULL,
	[Store_Name1] [nvarchar](100) NULL,
	[TaxGuid] [uniqueidentifier] NULL,
	[IsTaxed] [bit] NULL,
	[ApiTaxRandomNum] [nvarchar](max) NULL,
	[GrandSales] [decimal](18, 0) NULL,
	[TaxSales] [decimal](18, 0) NULL,
	[txt1] [decimal](18, 0) NULL,
	[txt2] [decimal](18, 0) NULL,
	[txt3] [decimal](18, 0) NULL,
	[InvoiceDate1] [datetime] NULL,
 CONSTRAINT [PK_InvoiceInfo1] PRIMARY KEY CLUSTERED 
(
	[Inv_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LedgerBook]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LedgerBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Name] [nchar](200) NOT NULL,
	[LedgerNo] [nchar](50) NOT NULL,
	[Label] [nchar](200) NOT NULL,
	[Debit] [decimal](18, 0) NOT NULL,
	[Credit] [decimal](18, 0) NOT NULL,
	[PartyID] [nchar](30) NULL,
	[Manual_Inv] [decimal](18, 0) NULL,
 CONSTRAINT [PK_LedgerBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[LedgerBook]    Script Date: 03/08/2025 09:11:34 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[LedgerBookDollar](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Name] [nchar](200) NOT NULL,
	[LedgerNo] [nchar](50) NOT NULL,
	[Label] [nchar](200) NOT NULL,
	[Debit] [decimal](18, 0) NOT NULL,
	[Credit] [decimal](18, 0) NOT NULL,
	[PartyID] [nchar](30) NULL,
	[Manual_Inv] [decimal](18, 0) NULL,
 CONSTRAINT [PK_LedgerBookDollar] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


/****** Object:  Table [dbo].[Logs]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [nchar](100) NOT NULL,
	[Operation] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[T_ID] [int] NOT NULL,
	[TransactionID] [nchar](20) NOT NULL,
	[Date] [datetime] NOT NULL,
	[PaymentMode] [nchar](30) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[T_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment_2]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_2](
	[TC_ID] [int] NOT NULL,
	[TransactionID] [nchar](20) NOT NULL,
	[Date] [datetime] NOT NULL,
	[PaymentMode] [nchar](30) NOT NULL,
	[CustomerID] [nchar](30) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[Check_ID] [nvarchar](50) NULL,
	[Check_Date] [datetime] NULL,
	[Bank] [nvarchar](250) NULL,
	[SalesMan_ID] [int] NULL,
	[SalesMan_Name] [nvarchar](50) NULL,
	[SalesMan_Comession] [decimal](18, 0) NULL,
	[SalesMan_ID_2] [nvarchar](50) NULL,
	[Manual] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payment_2] PRIMARY KEY CLUSTERED 
(
	[TC_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Payment_3]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment_3](
	[TCD_ID] [int] NOT NULL,
	[TransactionID] [nchar](20) NOT NULL,
	[Date] [datetime] NOT NULL,
	[CustomerID] [nchar](30) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[Remarks] [nvarchar](250) NULL,
	[SalesMan_ID] [int] NULL,
	[SalesMan_Name] [nvarchar](50) NULL,
	[SalesMan_Comession] [decimal](18, 0) NULL,
	[SalesMan_ID_2] [nvarchar](50) NULL,
 CONSTRAINT [PK_Payment_3] PRIMARY KEY CLUSTERED 
(
	[TCD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[PID] [int] NOT NULL,
	[ProductCode] [nchar](30) NOT NULL,
	[ProductName] [nchar](200) NOT NULL,
	[SubCategoryID] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CostPrice] [decimal](18, 0) NOT NULL,
	[SellingPrice] [decimal](18, 0) NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[VAT] [decimal](18, 0) NOT NULL,
	[Barcode] [nchar](30) NULL,
	[ReorderPoint] [int] NOT NULL,
	[OpeningStock] [decimal](18, 2) NOT NULL,
	[Price2] [decimal](18, 0) NULL,
	[Unit] [nchar](20) NULL,
	[nunit] [int] NULL,
	[Unit2] [nchar](20) NULL,
	[nunit2] [int] NULL,
	[Unit3] [nchar](20) NULL,
	[nunit3] [int] NULL,
	[Datexp] [Date] NULL,
	[Datext] [Date] NULL,
	[SellingPrice2] [decimal](18, 0) NULL,
	[SellingPrice3] [decimal](18, 0) NULL,
	[Barcode2] [nchar](30) NULL,
	[Barcode3] [nchar](30) NULL,
	[CostPrice2] [decimal](18, 0)  NULL,
	[CostPrice3] [decimal](18, 0)  NULL,
	[Cost] [decimal](18, 2)  NULL,
	[Selling] [decimal](18, 2)  NULL,
	[color] [nchar](20) NULL,
	[Creat] [nchar](20) NULL,
	[lastUsed] [timestamp] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Join]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Join](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Photo] [image] NOT NULL,
 CONSTRAINT [PK_Product_Join] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseReturn]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReturn](
	[PR_ID] [int] NOT NULL,
	[PRNo] [nchar](30) NULL,
	[Date] [datetime] NULL,
	[PurchaseID] [int] NULL,
	[SubTotal] [decimal](18, 0) NULL,
	[DiscPer] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
	[VATPer] [decimal](18, 0) NULL,
	[VATAmt] [decimal](18, 0) NULL,
	[Total] [decimal](18, 0) NULL,
	[RoundOff] [decimal](18, 0) NULL,
	[GrandTotal] [decimal](18, 0) NULL,
 CONSTRAINT [PK_PurchaseReturn] PRIMARY KEY CLUSTERED 
(
	[PR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PurchaseReturn_Join]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseReturn_Join](
	[PRJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseReturnID] [int] NOT NULL,
	[ProductID] [nchar](10) NULL,
	[Qty][decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[Barcode] [nchar](50) NULL,
	[ReturnQty] [decimal](18, 2) NULL,
	[Unit] [nchar](20) NULL,
 CONSTRAINT [PK_PurchaseReturn_Join] PRIMARY KEY CLUSTERED 
(
	[PRJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quotation]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation](
	[Q_ID] [int] NOT NULL,
	[QuotationNo] [nchar](30) NOT NULL,
	[Date] [datetime] NOT NULL,
	[CustomerID] [int] NOT NULL,
	[GrandTotal] [decimal](18, 0) NOT NULL,
	[Remarks] [nvarchar](max) NULL,
 CONSTRAINT [PK_Quotation] PRIMARY KEY CLUSTERED 
(
	[Q_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Quotation_Join]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quotation_Join](
	[QJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[QuotationID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Cost] [decimal](18, 0) NOT NULL,
	[Qty][decimal](18, 2) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[DiscountPer] [decimal](18, 0) NOT NULL,
	[Discount] [decimal](18, 0) NOT NULL,
	[VATPer] [decimal](18, 0) NOT NULL,
	[VAT] [decimal](18, 0) NOT NULL,
	[TotalAmount] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Quotation_Join] PRIMARY KEY CLUSTERED 
(
	[QJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Registration]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Registration](
	[UserID] [nchar](100) NOT NULL,
	[UserType] [nchar](150) NOT NULL,
	[Password] [nchar](100) NOT NULL,
	[Name] [nchar](200) NOT NULL,
	[ContactNo] [nchar](150) NOT NULL,
	[EmailID] [nchar](200) NULL,
	[JoiningDate] [datetime] NULL,
	[Active] [nchar](10) NULL,
	[StartNum] [nchar](10) NULL,
 CONSTRAINT [PK_Registration_1] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sales_Locations]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sales_Locations](
	[iD] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](150) NULL,
	[Mandoop] [nchar](150) NULL,
	[Masaool] [nchar](150) NULL,
	[Phone] [nchar](150) NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Sales_Locations] PRIMARY KEY CLUSTERED 
(
	[iD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesMan]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesMan](
	[SM_ID] [int] NOT NULL,
	[SalesMan_ID] [nchar](30) NULL,
	[Name] [nchar](200) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nchar](200) NULL,
	[State] [nchar](150) NULL,
	[ZipCode] [nchar](15) NULL,
	[ContactNo] [nchar](150) NULL,
	[EmailID] [nchar](200) NULL,
	[Remarks] [nvarchar](max) NULL,
	[Photo] [image] NULL,
	[CommissionPer] [decimal](18, 0) NULL,
 CONSTRAINT [PK_SalesMan] PRIMARY KEY CLUSTERED 
(
	[SM_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Salesman_Commission]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salesman_Commission](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[InvoiceID] [int] NOT NULL,
	[CommissionPer] [decimal](18, 0) NOT NULL,
	[Commission] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Salesman_Commission] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesReturn]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesReturn](
	[SR_ID] [int] NOT NULL,
	[SRNo] [nchar](30) NULL,
	[Date] [datetime] NULL,
	[SalesID] [int] NULL,
	[GrandTotal] [decimal](18, 0) NULL,
	[GrandSales][decimal](18, 0) NULL,
	[TaxSales][decimal](18, 0) NULL,
	[Grand][decimal](18, 0) NULL,
	[Payment][decimal](18, 0) NULL,
	 CONSTRAINT [PK_SalesReturn] PRIMARY KEY CLUSTERED 
(
	[SR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SalesReturn_Join]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesReturn_Join](
	[SRJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[SalesReturnID] [int] NOT NULL,
	[ProductID] [nchar](10) NULL,
	[Qty][decimal](18, 2) NOT NULL,
	[Price] [decimal](18,0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[Barcode] [nchar](50) NULL,
	[ReturnQty] [decimal](18, 2) NULL,
	[VATPer] [decimal](18,0) NULL,
	[VAT] [decimal](18, 3) NULL,
	[DiscountPer] [decimal](18,0) NULL,
	[Discount] [decimal](18,0) NULL,
	[CostPrice] [decimal](18,0) NULL,
	[Margin] [decimal](18,0) NULL,
	[Unit] [nchar](20) NULL,
	[Qty1][decimal](18, 2)  NULL,
	[nunit][decimal](18, 0)  NULL,
	[size] [nvarchar](10) NULL,
 CONSTRAINT [PK_SalesReturn_Join] PRIMARY KEY CLUSTERED 
(
	[SRJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[TSalesReturn]    Script Date: 12/08/2025 05:20:57 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TSalesReturn](
	[SR_ID] [int] NOT NULL,
	[SRNo] [nchar](30) NULL,
	[Date] [datetime] NULL,
	[SalesID] [int] NULL,
	[GrandTotal] [decimal](18, 0) NULL,
	[GrandSales] [decimal](18, 0) NULL,
	[TaxSales] [decimal](18, 0) NULL,
	[Grand] [decimal](18, 0) NULL,
	[Payment] [decimal](18, 0) NULL,
	[Inv_ID2] [nvarchar](10) NULL,
 CONSTRAINT [PK_TSalesReturn] PRIMARY KEY CLUSTERED 
(
	[SR_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[TSalesReturn_Join]    Script Date: 12/08/2025 05:21:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[TSalesReturn_Join](
	[SRJ_ID] [int] IDENTITY(1,1) NOT NULL,
	[SalesReturnID] [int] NOT NULL,
	[ProductID] [nchar](10) NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18, 0) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[Barcode] [nchar](50) NULL,
	[ReturnQty] [decimal](18, 2) NULL,
	[VATPer] [decimal](18, 0) NULL,
	[VAT] [decimal](18, 3) NULL,
	[DiscountPer] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
	[CostPrice] [decimal](18, 0) NULL,
	[Margin] [decimal](18, 0) NULL,
	[Unit] [nchar](20) NULL,
	[Qty1] [decimal](18, 2) NULL,
	[nunit] [decimal](18, 0) NULL,
	[size] [nvarchar](10) NULL,
 CONSTRAINT [PK_TSalesReturn_Join] PRIMARY KEY CLUSTERED 
(
	[SRJ_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Service]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[S_ID] [int] NOT NULL,
	[ServiceCode] [nchar](30) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[ServiceType] [nchar](150) NULL,
	[ServiceCreationDate] [datetime] NOT NULL,
	[ItemDescription] [nvarchar](max) NOT NULL,
	[ProblemDescription] [nvarchar](max) NULL,
	[ChargesQuote] [decimal](18,0) NOT NULL,
	[AdvanceDeposit] [decimal](18,0) NOT NULL,
	[EstimatedRepairDate] [datetime] NOT NULL,
	[Remarks] [nvarchar](max) NULL,
	[Status] [nchar](30) NOT NULL,
	[T1] [nvarchar](max) NULL,
	[T2] [nvarchar](max) NULL,
	[T3] [nvarchar](max) NULL,
	[T4] [nvarchar](max) NULL,
	[T5] [nvarchar](max) NULL,
	[T6] [nvarchar](max) NULL,
	[T7] [nvarchar](max) NULL,
	[T8] [nvarchar](max) NULL,
	[T9] [nvarchar](max) NULL,
	[T10] [nvarchar](max) NULL,
	[T11] [nvarchar](max) NULL,
	[T12] [nvarchar](max) NULL,
	[T13] [nvarchar](max) NULL,
	[T14] [nvarchar](max) NULL,
	[T15] [nvarchar](max) NULL,
	[T16] [nvarchar](max) NULL,
	[T17] [nvarchar](max) NULL,
	[T18] [nvarchar](max) NULL,
	[T19] [nvarchar](max) NULL,
	[T20] [nvarchar](max) NULL,
	[T21] [nvarchar](max) NULL,
	[SalesMan_ID] [int]  NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[S_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMS]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Date] [datetime] NOT NULL,
 CONSTRAINT [PK_SMS] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SMSSetting]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SMSSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[APIUrl] [nvarchar](max) NOT NULL,
	[IsDefault] [nchar](10) NOT NULL,
	[IsEnabled] [nchar](10) NOT NULL,
 CONSTRAINT [PK_SMSSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock](
	[ST_ID] [int] NOT NULL,
	[InvoiceNo] [nchar](30) NOT NULL,
	[Date] [datetime] NOT NULL,
	[PurchaseType] [nchar](20) NOT NULL,
	[SupplierID] [int] NOT NULL,
	[SubTotal] [decimal](18,0) NOT NULL,
	[DiscountPer] [decimal](18,0) NOT NULL,
	[Discount] [decimal](18,0) NOT NULL,
	[VATPer] [decimal](18,0) NOT NULL,
	[VATAmt] [decimal](18,0) NOT NULL,
	[PreviousDue] [decimal](18,0) NOT NULL,
	[FreightCharges] [decimal](18,0) NOT NULL,
	[OtherCharges] [decimal](18,0) NOT NULL,
	[Total] [decimal](18,0) NOT NULL,
	[RoundOff] [decimal](18,0) NOT NULL,
	[GrandTotal] [decimal](18,0) NOT NULL,
	[TotalPayment] [decimal](18,0) NOT NULL,
	[PaymentDue] [decimal](18,0) NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[ST_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Stock_Product]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock_Product](
	[SP_ID] [int] IDENTITY(1,1) NOT NULL,
	[StockID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Price] [decimal](18,0) NOT NULL,
	[TotalAmount] [decimal](18,0) NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[des] [INT]  NULL,
    [TotalAmount1] [DECIMAL] (18)  NULL,
    [TotalAmount2] [DECIMAL] (18)  NULL,
	[grossWeight] [decimal](18, 2)  NULL,
	[netWeight] [decimal](18, 2)  NULL,
	[pricePerQty] [decimal](18, 2)  NULL,
	[totalValue] [decimal](18, 2)  NULL,
	[finalTotalValue] [decimal](18, 2)  NULL,
	[totalLoadingFee] [decimal](18, 2)  NULL,
	[CostUsd] [decimal](18, 2)  NULL,
	[SellingUsd] [decimal](18, 2)  NULL,
	[QtyFree] [decimal](18, 2)  NULL,
 CONSTRAINT [PK_Stock_Product] PRIMARY KEY CLUSTERED 
(
	[SP_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SubCategory]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubCategory](
	[ID] [int] NOT NULL,
	[SubCategoryName] [nchar](150) NOT NULL,
	[Category] [nchar](150) NOT NULL,
 CONSTRAINT [PK_SubCategory] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[ID] [int] NOT NULL,
	[SupplierID] [nchar](30) NOT NULL,
	[Name] [nchar](200) NULL,
	[Address] [nvarchar](250) NULL,
	[City] [nchar](200) NULL,
	[State] [nchar](150) NULL,
	[ZipCode] [nchar](15) NULL,
	[ContactNo] [nchar](150) NULL,
	[EmailID] [nchar](200) NULL,
	[Remarks] [nvarchar](max) NULL,
	[AccountName] [nchar](150) NULL,
	[AccountNumber] [nchar](150) NULL,
	[Bank] [nchar](150) NULL,
	[Branch] [nchar](150) NULL,
	[IFSCCode] [nchar](50) NULL,
	[TIN] [nchar](100) NULL,
	[STNo] [nchar](100) NULL,
	[CST] [nchar](100) NULL,
	[PAN] [nchar](100) NULL,
	[OpeningBalance] [decimal](18,0) NULL,
	[OpeningBalanceType] [nchar](20) NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[SupplierLedgerBook]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SupplierLedgerBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime] NOT NULL,
	[Name] [nchar](200) NOT NULL,
	[LedgerNo] [nchar](50) NOT NULL,
	[Label] [nchar](200) NOT NULL,
	[Debit] [decimal](18,0) NOT NULL,
	[Credit] [decimal](18,0) NOT NULL,
	[PartyID] [nchar](20) NULL,
 CONSTRAINT [PK_SupplierLedgerBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Temp_Stock]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Stock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[Barcode2] [nvarchar](50) NULL,
	[Barcode3] [nvarchar](50) NULL,
 CONSTRAINT [PK_Temp_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Stock1]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Stock1](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[Barcode2] [nvarchar](50) NULL,
	[Barcode3] [nvarchar](50) NULL,
	[CakeId] [nvarchar](50) NULL,
 CONSTRAINT [PK_Temp_Stock1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Go
/****** Object:  Table [dbo].[Temp_Stock2]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Stock2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[Barcode2] [nvarchar](50) NULL,
	[Barcode3] [nvarchar](50) NULL,
 CONSTRAINT [PK_Temp_Stock2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Go
/****** Object:  Table [dbo].[Temp_Stock3]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Stock3](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[Barcode2] [nvarchar](50) NULL,
	[Barcode3] [nvarchar](50) NULL,
 CONSTRAINT [PK_Temp_Stock3] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Stock4]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Stock4](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[Barcode2] [nvarchar](50) NULL,
	[Barcode3] [nvarchar](50) NULL,
 CONSTRAINT [PK_Temp_Stock4] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Go
/****** Object:  Table [dbo].[Temp_Stock5]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Stock5](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[Barcode2] [nvarchar](50) NULL,
	[Barcode3] [nvarchar](50) NULL,
 CONSTRAINT [PK_Temp_Stock5] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Temp_Stock6]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Temp_Stock6](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[Qty] [decimal](18, 2) NOT NULL,
	[Barcode] [nvarchar](50) NULL,
	[Barcode2] [nvarchar](50) NULL,
	[Barcode3] [nvarchar](50) NULL,
 CONSTRAINT [PK_Temp_Stock6] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
Go
/****** Object:  Table [dbo].[Barcodes]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Barcodes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductCode1] [int] NULL,
	[Barcode1] [nvarchar](20) NULL,
	[Barcode2] [nvarchar](20) NULL,
 CONSTRAINT [PK_Barcodes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Sizes]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sizes](
    [Id] [int] IDENTITY(1,1) NOT NULL,
    [ProductCode1] [int] NULL,
    [qtysub] [int] NULL,
    [state] [nvarchar](50) NULL,
 CONSTRAINT [PK_Sizes] PRIMARY KEY CLUSTERED 
(
    [Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  Table [dbo].[Voucher]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher](
	[Id] [int] NOT NULL,
	[VoucherNo] [nchar](30) NOT NULL,
	[Name] [nchar](150) NULL,
	[Date] [datetime] NOT NULL,
	[Details] [nvarchar](250) NULL,
	[GrandTotal] [decimal](18,0) NOT NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Voucher_OtherDetails]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Voucher_OtherDetails](
	[VD_ID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherID] [int] NOT NULL,
	[Particulars] [nchar](200) NOT NULL,
	[Amount] [decimal](18,0) NOT NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Voucher_OtherDetails] PRIMARY KEY CLUSTERED 
(
	[VD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 12/14/2021 10:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccID] [smallint] NOT NULL,
	[AccCode] [bigint] NOT NULL,
	[AccName] [varchar](80) NOT NULL,
	[AccType] [tinyint] NULL,
	[AccParent] [decimal](18, 0) NULL,
	[AccDmType] [tinyint] NULL,
	[AccDmType1] [Date] NULL,
	[AccFinal] [tinyint] NULL,
	[AccPhone] [varchar](15) NULL,
	[AccPhone2] [varchar](15) NULL,
	[AccMail] [varchar](80) NULL,
	[AccAddress] [varchar](max) NULL,
	[AccNote] [varchar](max) NULL,
	[AccMaxLimt] [int] NULL,
	[AccMaxDuration] [smallint] NULL,
	[AccBranch] [tinyint] NULL,
	[AddUser] [nchar](100) NULL,
	[AddDate] [date] NULL,
	[EditUser] [nchar](100) NULL,
	[EditDate] [date] NULL,
	[NumOFEdit] [tinyint] NULL,
	[AccStopped] [bit] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Trigger [AddNumOFEdit]    Script Date: 12/14/2021 10:44:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Trigger [dbo].[AddNumOFEdit] on [dbo].[Accounts] for update
as
begin

declare @AccID  int 
declare @NumOfEdit tinyint


select @AccID = AccID ,@NumOfEdit=NumOfEdit  from inserted

if  (@NumOfEdit is null )  
set @NumOfEdit = 1
else
 set @NumOfEdit+=1


update Accounts set NumOfEdit = @NumOfEdit where AccID=@AccID

end
GO

/****** Object:  Table [dbo].[TaxSystem]    Script Date: 16/12/2022 11:11:31 Õ ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[TaxSystem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Taxtoken] [nvarchar](max) NULL,
	[TaxSystem] [nvarchar](max) NULL,
	[Investor] [varchar](max) NULL,
	[TaxfacilityName] [nvarchar](max) NULL,
	[TaxNum] [nvarchar](50) NULL,
	[TaxServerIpAddres] [nvarchar](max) NULL,
	[TaxUserName] [nvarchar](max) NULL,
	[TaxPassword] [nvarchar](50) NULL,
	[companyName] [nvarchar](max) NULL,
 CONSTRAINT [PK_TaxSystem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Hotel]    Script Date: 01/07/2023 06:35:28 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Hotel](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HotelName] [nchar](150) NOT NULL,
	[AddressLine1] [nvarchar](150) NOT NULL,
	[AddressLine2] [nvarchar](150) NULL,
	[AddressLine3] [nvarchar](150) NULL,
	[ContactNo] [nchar](150) NOT NULL,
	[EmailID] [nchar](150) NOT NULL,
	[Logo] [image] NOT NULL,
	[TIN] [nchar](150) NULL,
	[STNo] [nchar](150) NULL,
	[CIN] [nchar](150) NULL,
	[BaseCurrency] [nchar](10) NULL,
	[CurrencyCode] [nchar](10) NULL,
	[TicketFooterMessage] [nvarchar](150) NULL,
	[StartBillNo] [nchar](30) NULL,
 CONSTRAINT [PK_Hotel1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[InventoryType]    Script Date: 01/07/2023 06:36:31 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InventoryType](
	[Type] [nchar](50) NOT NULL,
 CONSTRAINT [PK_InventoryType] PRIMARY KEY CLUSTERED 
(
	[Type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[NotesMaster]    Script Date: 03/07/2023 04:57:09 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[NotesMaster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_NotesMaster_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[Kitchen]    Script Date: 01/07/2023 06:38:27 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Kitchen](
	[KitchenName] [nchar](150) NOT NULL,
	[Printer] [nchar](150) NULL,
	[IsEnabled] [nchar](10) NULL,
 CONSTRAINT [PK_Kitchen] PRIMARY KEY CLUSTERED 
(
	[KitchenName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[KOTGeneration]    Script Date: 01/07/2023 06:40:01 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KOTGeneration](
	[TicketID] [int] NOT NULL,
	[BillDate] [datetime] NOT NULL,
	[GroupName] [nchar](100) NULL,
	[GrandTotal] [decimal](18, 0) NULL,
	[BillNote] [nvarchar](150) NULL,
	[Status] [nchar](10) NULL,
	[TableNo] [nchar](50) NULL,
	[OperatorID] [nchar](100) NULL,
 CONSTRAINT [PK_KOTGeneration] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[KOTGenerationItems]    Script Date: 01/07/2023 06:41:22 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[KOTGenerationItems](
	[KOT_ID] [int] IDENTITY(1,1) NOT NULL,
	[Ticket_ID] [int] NULL,
	[Item_ID] [int] NULL,
	[Qty] [decimal](18, 2) NULL,
	[Rate] [decimal](18, 0) NULL,
	[Amount] [decimal](18, 0) NULL,
	[DiscPer] [decimal](18, 0) NULL,
	[Disc] [decimal](18, 0) NULL,
	[VATPer] [decimal](18, 0) NULL,
	[VATAmt] [decimal](18, 0) NULL,
	[STPer] [decimal](18, 0) NULL,
	[STAmt] [decimal](18, 0) NULL,
	[SCPer] [decimal](18, 0) NULL,
	[SCAmt] [decimal](18, 0) NULL,
	[TotalAmt] [decimal](18, 1) NULL,
	[ItemNote] [nvarchar](50) NULL,
	[ItemRemove] [nvarchar](10) NULL,
 CONSTRAINT [PK_KOTGenerationItems1] PRIMARY KEY CLUSTERED 
(
	[KOT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[POSGrouping]    Script Date: 01/07/2023 06:42:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[POSGrouping](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Col3] [decimal](18, 1) NULL,
	[Col4] [decimal](18, 0) NULL,
	[Col5] [decimal](18, 0) NULL,
	[Col6] [decimal](18, 0) NULL,
	[Col7] [decimal](18, 0) NULL,
	[Col8] [decimal](18, 0) NULL,
	[Col9] [decimal](18, 0) NULL,
	[Col10] [decimal](18, 0) NULL,
	[Col11] [decimal](18, 0) NULL,
	[Col12] [decimal](18, 0) NULL,
	[Col13] [decimal](18, 0) NULL,
	[Col14] [decimal](18, 0) NULL,
	[Col15] [nvarchar](150) NULL,
	[Col1] [int] NULL,
	[Col2] [nchar](150) NULL,
 CONSTRAINT [PK_POSGrouping_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[POSPrinterSetting]    Script Date: 01/07/2023 06:43:44 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[POSPrinterSetting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PrinterName] [nchar](50) NULL,
	[PrinterType] [nchar](50) NULL,
	[IsEnabled] [nchar](50) NULL,
 CONSTRAINT [PK_POSPrinterSetting_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[R_Table]    Script Date: 01/07/2023 06:44:24 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[R_Table](
	[TableNo] [nchar](50) NOT NULL,
	[Status] [nchar](50) NULL,
	[InventoryType] [nchar](50) NULL,
 CONSTRAINT [PK_R_Table] PRIMARY KEY CLUSTERED 
(
	[TableNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[RestaurantBillingInfo]    Script Date: 01/07/2023 06:45:38 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RestaurantBillingInfo](
	[BillId] [int] NOT NULL,
	[BillType] [nchar](50) NULL,
	[BillDate] [datetime] NULL,
	[CustomerName] [nchar](50) NULL,
	[AddressLine1] [nvarchar](150) NOT NULL,
	[AddressLine2] [nvarchar](150) NULL,
	[AddressLine3] [nvarchar](150) NULL,
	[ContactNo] [nchar](150) NULL,
	[PaymentMode] [nchar](50) NULL,
	[SubTotal] [decimal](18, 0) NULL,
	[ItemDiscount] [decimal](18, 0) NULL,
	[DiscountPer] [decimal](18, 0) NULL,
	[Discount] [decimal](18, 0) NULL,
	[VAT] [decimal](18, 0) NULL,
	[ServiceTax] [decimal](18, 0) NULL,
	[ServiceCharges] [decimal](18, 0) NULL,
	[TACharges] [decimal](18, 0) NULL,
	[HDCharges] [decimal](18, 0) NULL,
	[GrandTotal] [decimal](18, 0) NULL,
	[Cash] [decimal](18, 0) NULL,
	[Change] [decimal](18, 0) NULL,
	[OperatorID] [nchar](100) NULL,
	[BillNote] [nchar](150) NULL,
	[TaxGuid] [uniqueidentifier] NULL,
	[IsTaxed] [bit] NULL,
	[ApiTaxRandomNum] [nvarchar](max) NULL,
	[GrandSales] [decimal](18, 0) NULL,
	[TaxSales] [decimal](18, 0) NULL,
	[txt1] [decimal](18, 0) NULL,
	[txt2] [decimal](18, 0) NULL,
	[txt3] [decimal](18, 0) NULL,
 CONSTRAINT [PK_RestaurantBillingInfo] PRIMARY KEY CLUSTERED 
(
	[BillId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[RestaurantBillingItems]    Script Date: 01/07/2023 06:46:58 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RestaurantBillingItems](
	[P_ID] [int] IDENTITY(1,1) NOT NULL,
	[B_ID] [int] NULL,
	[Item_ID] [int] NULL,
	[Qty] [decimal](18, 2) NULL,
	[Rate] [decimal](18, 0) NULL,
	[Amount] [decimal](18, 0) NULL,
	[DiscPer] [decimal](18, 0) NULL,
	[Disc] [decimal](18, 0) NULL,
	[VATPer] [decimal](18, 0) NULL,
	[VATAmt] [decimal](18, 0) NULL,
	[STPer] [decimal](18, 0) NULL,
	[STAmt] [decimal](18, 0) NULL,
	[SCPer] [decimal](18, 0) NULL,
	[SCAmt] [decimal](18, 0) NULL,
	[TotalAmt] [decimal](18, 0) NULL,
	[ItemNote] [nchar](50) NULL,
	[TableNo] [nchar](50) NULL,
	[GroupName] [nchar](50) NULL,
 CONSTRAINT [PK_RestaurantBillingItems] PRIMARY KEY CLUSTERED 
(
	[P_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit]    Script Date: 09/02/2023 09:35:05 ã ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Unit](
	[UnitName] [nchar](20) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

/****** Object:  Table [dbo].[subdephM]    Script Date: 12/07/2023 03:24:58 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[subdephM](
	[ID] [int] NOT NULL,
	[SubdepName] [nvarchar](50) NOT NULL,
	[depname] [nvarchar](50) NOT NULL,
	[bad] [int] NULL,
	[rat] [nchar](10) NULL,
	[active] [nchar](10) NULL,
	[ItemsDescription] [nvarchar](max) NULL,
	[CustomerID] [int] NULL,
 CONSTRAINT [PK_subdephM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

/****** Object:  Table [dbo].[SubdepM]    Script Date: 12/07/2023 03:26:13 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[SubdepM](
	[ID] [int] NOT NULL,
	[SubdepName] [nvarchar](50) NOT NULL,
	[depname] [nvarchar](50) NOT NULL,
	[L] [nchar](10) NOT NULL,
 CONSTRAINT [PK_SubdepM] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[Debitors]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Debitors]
AS
SELECT        dbo.Customer.CustomerID, dbo.Customer.Name, SUM(dbo.LedgerBook.Debit) AS Debit, SUM(dbo.LedgerBook.Credit) AS Credit, SUM(dbo.LedgerBook.Debit) 
                         - SUM(dbo.LedgerBook.Credit) AS Balance
FROM            dbo.Customer INNER JOIN
                         dbo.LedgerBook ON dbo.Customer.CustomerID = dbo.LedgerBook.PartyID
GROUP BY dbo.Customer.CustomerID, dbo.Customer.Name


GO
/****** Object:  View [dbo].[SalesManComession]    Script Date: 23/09/2022 10:08:50 ã ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[SalesManComession]
AS
SELECT        dbo.SalesMan.SM_ID, dbo.SalesMan.SalesMan_ID, dbo.SalesMan.Name, dbo.SalesMan.Address, dbo.SalesMan.City, dbo.SalesMan.State, dbo.SalesMan.ZipCode, 
                         dbo.SalesMan.ContactNo, dbo.SalesMan.EmailID, dbo.SalesMan.Remarks, dbo.SalesMan.Photo, dbo.SalesMan.CommissionPer, dbo.Payment_2.Amount, 
                         dbo.Payment_2.SalesMan_Comession, dbo.Payment_2.Amount * dbo.Payment_2.SalesMan_Comession / 100 AS Comession, dbo.Payment_2.Date, 
                         dbo.Payment_2.TC_ID
FROM            dbo.SalesMan INNER JOIN
                         dbo.Payment_2 ON dbo.SalesMan.SM_ID = dbo.Payment_2.SalesMan_ID


GO
INSERT [dbo].[Registration] ([UserID], [UserType], [Password], [Name], [ContactNo], [EmailID], [JoiningDate], [Active]) VALUES (N'admin                                                                                               ', N'Admin                                                                                                                                                 ', N'MTIzNDU=                                                                                            ', N'admin                                                                                                                                                                                              ', N'0955617819                                                                                                                                            ', N'ali.khaddour@gmail.com                                                                                                                                                                                      ', CAST(N'2017-01-13 03:55:22.667' AS DateTime), N'Yes       ')
Go
INSERT INTO [dbo].[Accounts] ([AccID], [AccCode], [AccName], [AccType], [AccParent], [AccDmType], [AccFinal], [AccPhone], [AccPhone2], [AccMail], [AccAddress], [AccNote], [AccMaxLimt], [AccMaxDuration], [AccBranch], [AddUser], [AddDate], [EditUser], [EditDate], [NumOFEdit], [AccStopped]) VALUES (1, 1, N'Ossol', 0, CAST(0 AS Decimal(18, 0)), 0, 1, N'', N'', N'', N'', N'', 0, 0, 1, 1, N'2022-11-26', NULL, NULL, NULL, 0)
Go
ALTER TABLE [dbo].[accountprint] ADD  CONSTRAINT [DF_accountprint_Col6]  DEFAULT ((0)) FOR [Col6]
GO
ALTER TABLE [dbo].[accountprint] ADD  CONSTRAINT [DF_accountprint_Col7]  DEFAULT ((0)) FOR [Col7]
GO
ALTER TABLE [dbo].[accountprint] ADD  CONSTRAINT [DF_accountprint_Col8]  DEFAULT ((0)) FOR [Col8]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_SubTotal]  DEFAULT ((0.00)) FOR [SubTotal]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_DiscPer]  DEFAULT ((0.00)) FOR [DiscPer]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_Discount]  DEFAULT ((0.00)) FOR [Discount]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_VATPer]  DEFAULT ((0.00)) FOR [VATPer]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_VATAmt]  DEFAULT ((0.00)) FOR [VATAmt]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_Total]  DEFAULT ((0.00)) FOR [Total]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_RoundOff]  DEFAULT ((0.00)) FOR [RoundOff]
GO
ALTER TABLE [dbo].[PurchaseReturn] ADD  CONSTRAINT [DF_PurchaseReturn_GrandTotal]  DEFAULT ((0.00)) FOR [GrandTotal]
GO
ALTER TABLE [dbo].[SalesMan] ADD  CONSTRAINT [DF_SalesMan_Commission]  DEFAULT ((0.00)) FOR [CommissionPer]
GO
ALTER TABLE [dbo].[Salesman_Commission] ADD  CONSTRAINT [DF_Salesman_Commission_CommissionPer]  DEFAULT ((0.00)) FOR [CommissionPer]
GO
ALTER TABLE [dbo].[Salesman_Commission] ADD  CONSTRAINT [DF_Salesman_Commission_Commission]  DEFAULT ((0.00)) FOR [Commission]
GO
ALTER TABLE [dbo].[SalesReturn] ADD  CONSTRAINT [DF_SalesReturn_GrandTotal]  DEFAULT ((0.00)) FOR [GrandTotal]
GO
ALTER TABLE [dbo].[TSalesReturn] ADD  CONSTRAINT [DF_TSalesReturn_GrandTotal]  DEFAULT ((0.00)) FOR [GrandTotal]
GO
ALTER TABLE [dbo].[subdeph]  WITH CHECK ADD  CONSTRAINT [FK_subdeph_Departmenth_Tbl] FOREIGN KEY([depname])
REFERENCES [dbo].[Departmenth_Tbl] ([DepartmentName])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[subdeph] CHECK CONSTRAINT [FK_subdeph_Departmenth_Tbl]
GO
ALTER TABLE [dbo].[Invoice_Payment]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Payment_InvoiceInfo] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[InvoiceInfo] ([Inv_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoice_Payment] CHECK CONSTRAINT [FK_Invoice_Payment_InvoiceInfo]
GO
ALTER TABLE [dbo].[Invoice_Product]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Product_InvoiceInfo] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[InvoiceInfo] ([Inv_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoice_Product] CHECK CONSTRAINT [FK_Invoice_Product_InvoiceInfo]
GO
ALTER TABLE [dbo].[Invoice_Product]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Product_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Invoice_Product] CHECK CONSTRAINT [FK_Invoice_Product_Product]
GO

ALTER TABLE [dbo].[Invoice_Product2]  WITH CHECK ADD  CONSTRAINT [FK_Invoice_Product2_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Invoice_Product2] CHECK CONSTRAINT [FK_Invoice_Product2_Product]
GO
ALTER TABLE [dbo].[Invoice1_Payment]  WITH CHECK ADD  CONSTRAINT [FK_Invoice1_Payment_InvoiceInfo1] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[InvoiceInfo1] ([Inv_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoice1_Payment] CHECK CONSTRAINT [FK_Invoice1_Payment_InvoiceInfo1]
GO
ALTER TABLE [dbo].[Invoice1_Product]  WITH CHECK ADD  CONSTRAINT [FK_Invoice1_Product_InvoiceInfo1] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[InvoiceInfo1] ([Inv_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Invoice1_Product] CHECK CONSTRAINT [FK_Invoice1_Product_InvoiceInfo1]
GO
ALTER TABLE [dbo].[Invoice1_Product]  WITH CHECK ADD  CONSTRAINT [FK_Invoice1_Product_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Invoice1_Product] CHECK CONSTRAINT [FK_Invoice1_Product_Product]
GO
ALTER TABLE [dbo].[InvoiceInfo]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceInfo_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoiceInfo] CHECK CONSTRAINT [FK_InvoiceInfo_Customer]
GO
ALTER TABLE [dbo].[InvoiceInfo]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceInfo_SalesMan] FOREIGN KEY([SalesmanID])
REFERENCES [dbo].[SalesMan] ([SM_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoiceInfo] CHECK CONSTRAINT [FK_InvoiceInfo_SalesMan]
GO
ALTER TABLE [dbo].[InvoiceInfo1]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceInfo1_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([S_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[InvoiceInfo1] CHECK CONSTRAINT [FK_InvoiceInfo1_Service]
GO
ALTER TABLE [dbo].[Logs]  WITH CHECK ADD  CONSTRAINT [FK_Logs_Registration] FOREIGN KEY([UserID])
REFERENCES [dbo].[Registration] ([UserID])
GO
ALTER TABLE [dbo].[Logs] CHECK CONSTRAINT [FK_Logs_Registration]
GO

ALTER TABLE [dbo].[InventoryType]  WITH CHECK ADD  CONSTRAINT [FK_InventoryType_r_table] FOREIGN KEY([Type])
REFERENCES [dbo].[InventoryType] ([Type])
GO
ALTER TABLE [dbo].[InventoryType] CHECK CONSTRAINT [FK_InventoryType_r_table]
GO

ALTER TABLE [dbo].[Kitchen]  WITH CHECK ADD  CONSTRAINT [FK_Kitchen_Kitchen] FOREIGN KEY([KitchenName])
REFERENCES [dbo].[Kitchen] ([KitchenName])
GO

ALTER TABLE [dbo].[Kitchen] CHECK CONSTRAINT [FK_Kitchen_Kitchen]
GO

ALTER TABLE [dbo].[KOTGeneration]  WITH CHECK ADD  CONSTRAINT [FK_KOTGeneration_R_Table] FOREIGN KEY([TableNo])
REFERENCES [dbo].[R_Table] ([TableNo])
GO

ALTER TABLE [dbo].[KOTGeneration] CHECK CONSTRAINT [FK_KOTGeneration_R_Table]
GO

ALTER TABLE [dbo].[KOTGenerationItems]  WITH CHECK ADD  CONSTRAINT [FK_KOTGenerationItems_dish] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[dish] ([ItemID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[KOTGenerationItems] CHECK CONSTRAINT [FK_KOTGenerationItems_dish]
GO

ALTER TABLE [dbo].[KOTGenerationItems]  WITH CHECK ADD  CONSTRAINT [FK_KOTGenerationItems_KOTGeneration] FOREIGN KEY([Ticket_ID])
REFERENCES [dbo].[KOTGeneration] ([TicketID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[KOTGenerationItems] CHECK CONSTRAINT [FK_KOTGenerationItems_KOTGeneration]
GO

ALTER TABLE [dbo].[R_Table]  WITH CHECK ADD  CONSTRAINT [FK_R_Table_InventoryType] FOREIGN KEY([InventoryType])
REFERENCES [dbo].[InventoryType] ([Type])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[R_Table] CHECK CONSTRAINT [FK_R_Table_InventoryType]
GO

ALTER TABLE [dbo].[RestaurantBillingInfo]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantBillingInfo_Registration] FOREIGN KEY([OperatorID])
REFERENCES [dbo].[Registration] ([UserID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[RestaurantBillingInfo] CHECK CONSTRAINT [FK_RestaurantBillingInfo_Registration]
GO

ALTER TABLE [dbo].[RestaurantBillingItems]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantBillingItems_dish] FOREIGN KEY([Item_ID])
REFERENCES [dbo].[dish] ([ItemID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[RestaurantBillingItems] CHECK CONSTRAINT [FK_RestaurantBillingItems_dish]
GO

ALTER TABLE [dbo].[RestaurantBillingItems]  WITH CHECK ADD  CONSTRAINT [FK_RestaurantBillingItems_RestaurantBillingInfo] FOREIGN KEY([B_ID])
REFERENCES [dbo].[RestaurantBillingInfo] ([BillId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[RestaurantBillingItems] CHECK CONSTRAINT [FK_RestaurantBillingItems_RestaurantBillingInfo]
GO

ALTER TABLE [dbo].[Payment]  WITH CHECK ADD  CONSTRAINT [FK_Payment_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Payment] CHECK CONSTRAINT [FK_Payment_Supplier]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_SubCategory]
GO
ALTER TABLE [dbo].[Product_Join]  WITH CHECK ADD  CONSTRAINT [FK_Product_Join_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product_Join] CHECK CONSTRAINT [FK_Product_Join_Product]
GO
ALTER TABLE [dbo].[Barcodes]  WITH CHECK ADD  CONSTRAINT [FK_Barcodes_Product] FOREIGN KEY([ProductCode1])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Barcodes] CHECK CONSTRAINT [FK_Barcodes_Product]
GO
ALTER TABLE [dbo].[Sizes]  WITH CHECK ADD  CONSTRAINT [FK_Sizes_Product] FOREIGN KEY([ProductCode1])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Sizes] CHECK CONSTRAINT [FK_Sizes_Product]
GO
ALTER TABLE [dbo].[PurchaseReturn]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseReturn_Stock] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[Stock] ([ST_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[PurchaseReturn] CHECK CONSTRAINT [FK_PurchaseReturn_Stock]
GO
ALTER TABLE [dbo].[PurchaseReturn_Join]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseReturn_Join_PurchaseReturn] FOREIGN KEY([PurchaseReturnID])
REFERENCES [dbo].[PurchaseReturn] ([PR_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PurchaseReturn_Join] CHECK CONSTRAINT [FK_PurchaseReturn_Join_PurchaseReturn]
GO
ALTER TABLE [dbo].[Quotation]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Quotation] CHECK CONSTRAINT [FK_Quotation_Customer]
GO
ALTER TABLE [dbo].[Quotation_Join]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Join_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Quotation_Join] CHECK CONSTRAINT [FK_Quotation_Join_Product]
GO
ALTER TABLE [dbo].[Quotation_Join]  WITH CHECK ADD  CONSTRAINT [FK_Quotation_Join_Quotation] FOREIGN KEY([QuotationID])
REFERENCES [dbo].[Quotation] ([Q_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Quotation_Join] CHECK CONSTRAINT [FK_Quotation_Join_Quotation]
GO
ALTER TABLE [dbo].[Registration]  WITH CHECK ADD  CONSTRAINT [FK_Registration_Registration1] FOREIGN KEY([UserID])
REFERENCES [dbo].[Registration] ([UserID])
GO
ALTER TABLE [dbo].[Registration] CHECK CONSTRAINT [FK_Registration_Registration1]
GO
ALTER TABLE [dbo].[Salesman_Commission]  WITH CHECK ADD  CONSTRAINT [FK_Salesman_Commission_InvoiceInfo] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[InvoiceInfo] ([Inv_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Salesman_Commission] CHECK CONSTRAINT [FK_Salesman_Commission_InvoiceInfo]
GO
ALTER TABLE [dbo].[SalesReturn_Join]  WITH CHECK ADD  CONSTRAINT [FK_SalesReturn_Join_SalesReturn] FOREIGN KEY([SalesReturnID])
REFERENCES [dbo].[SalesReturn] ([SR_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SalesReturn_Join] CHECK CONSTRAINT [FK_SalesReturn_Join_SalesReturn]

GO

ALTER TABLE [dbo].[TSalesReturn_Join]  WITH CHECK ADD  CONSTRAINT [FK_TSalesReturn_Join_TSalesReturn] FOREIGN KEY([SalesReturnID])
REFERENCES [dbo].[TSalesReturn] ([SR_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[TSalesReturn_Join] CHECK CONSTRAINT [FK_TSalesReturn_Join_TSalesReturn]
GO

ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Customer]
GO
ALTER TABLE [dbo].[Service]  WITH CHECK ADD  CONSTRAINT [FK_Service_Salesman] FOREIGN KEY([Salesman_ID])
REFERENCES [dbo].[SalesMan] ([SM_ID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Service] CHECK CONSTRAINT [FK_Service_Salesman]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Supplier]
GO
ALTER TABLE [dbo].[Stock_Product]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Product_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Stock_Product] CHECK CONSTRAINT [FK_Stock_Product_Product]
GO
ALTER TABLE [dbo].[Stock_Product]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Product_Stock] FOREIGN KEY([StockID])
REFERENCES [dbo].[Stock] ([ST_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Stock_Product] CHECK CONSTRAINT [FK_Stock_Product_Stock]
GO
ALTER TABLE [dbo].[SubCategory]  WITH CHECK ADD  CONSTRAINT [FK_SubCategory_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([CategoryName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[SubCategory] CHECK CONSTRAINT [FK_SubCategory_Category]
GO
ALTER TABLE [dbo].[Temp_Stock]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Stock_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Temp_Stock] CHECK CONSTRAINT [FK_Temp_Stock_Product]
GO
ALTER TABLE [dbo].[Temp_Stock1]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Stock1_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Temp_Stock1] CHECK CONSTRAINT [FK_Temp_Stock1_Product]
GO
ALTER TABLE [dbo].[Temp_Stock2]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Stock2_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Temp_Stock2] CHECK CONSTRAINT [FK_Temp_Stock2_Product]
GO
ALTER TABLE [dbo].[Temp_Stock3]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Stock3_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Temp_Stock3] CHECK CONSTRAINT [FK_Temp_Stock3_Product]
GO
ALTER TABLE [dbo].[Temp_Stock4]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Stock4_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Temp_Stock4] CHECK CONSTRAINT [FK_Temp_Stock4_Product]
GO
ALTER TABLE [dbo].[Temp_Stock5]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Stock5_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Temp_Stock5] CHECK CONSTRAINT [FK_Temp_Stock5_Product]
GO
ALTER TABLE [dbo].[Temp_Stock6]  WITH CHECK ADD  CONSTRAINT [FK_Temp_Stock6_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([PID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Temp_Stock6] CHECK CONSTRAINT [FK_Temp_Stock6_Product]
GO
ALTER TABLE [dbo].[Voucher_OtherDetails]  WITH CHECK ADD  CONSTRAINT [FK_Voucher_OtherDetails_Voucher] FOREIGN KEY([VoucherID])
REFERENCES [dbo].[Voucher] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Accounts]   WITH CHECK ADD  CONSTRAINT [FK_Accounts _Accounts1] FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts]  ([AccID])
GO
ALTER TABLE [dbo].[Accounts]  CHECK CONSTRAINT [FK_Accounts _Accounts1]
go
ALTER TABLE [dbo].[TaxSystem]   WITH CHECK ADD  CONSTRAINT [FK_TaxSystem _TaxSystem1] FOREIGN KEY([ID])
REFERENCES [dbo].[TaxSystem]  ([ID])
GO
ALTER TABLE [dbo].[TaxSystem]  CHECK CONSTRAINT [FK_TaxSystem _TaxSystem1]
go
ALTER TABLE [dbo].[Voucher_OtherDetails] CHECK CONSTRAINT [FK_Voucher_OtherDetails_Voucher]
go
ALTER TABLE [dbo].[subdep]  WITH CHECK ADD  CONSTRAINT [FK_subdep_Department_Tbl] FOREIGN KEY([depname])
REFERENCES [dbo].[Department_Tbl] ([DepartmentName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[subdep] CHECK CONSTRAINT [FK_subdep_Department_Tbl]
go
ALTER TABLE [dbo].[Employee_Tbl]  WITH CHECK ADD  CONSTRAINT [FK_Employee_Tbl_subdep] FOREIGN KEY([SubdepID])
REFERENCES [dbo].[subdep] ([ID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Employee_Tbl] CHECK CONSTRAINT [FK_Employee_Tbl_subdep]

GO
ALTER TABLE [dbo].[dish]  WITH CHECK ADD  CONSTRAINT [FK_dish_Category] FOREIGN KEY([Category])
REFERENCES [dbo].[Category] ([CategoryName])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[dish] CHECK CONSTRAINT [FK_dish_Category]
GO

ALTER TABLE [dbo].[dish]  WITH CHECK ADD  CONSTRAINT [FK_dish_InventoryType] FOREIGN KEY([InventoryType])
REFERENCES [dbo].[InventoryType] ([Type])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[dish] CHECK CONSTRAINT [FK_dish_InventoryType]
GO

ALTER TABLE [dbo].[dish]  WITH CHECK ADD  CONSTRAINT [FK_dish_Kitchen] FOREIGN KEY([Kitchen])
REFERENCES [dbo].[Kitchen] ([KitchenName])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[dish] CHECK CONSTRAINT [FK_dish_Kitchen]
GO
ALTER TABLE [dbo].[subdephM]  WITH CHECK ADD  CONSTRAINT [FK_subdephM_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([ID])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[subdephM] CHECK CONSTRAINT [FK_subdephM_Customer]
GO
ALTER TABLE [dbo].[SubdepM]  WITH CHECK ADD  CONSTRAINT [FK_SubdepM_Departmenth_Tbl] FOREIGN KEY([depname])
REFERENCES [dbo].[Departmenth_Tbl] ([DepartmentName])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[SubdepM] CHECK CONSTRAINT [FK_SubdepM_Departmenth_Tbl]

GO
ALTER TABLE [dbo].[AdvanceEntry]  WITH CHECK ADD  CONSTRAINT [FK_AdvanceEntry_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([St_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AdvanceEntry] CHECK CONSTRAINT [FK_AdvanceEntry_Staff]
GO
ALTER TABLE [dbo].[Attendance]  WITH CHECK ADD  CONSTRAINT [FK_Attendance_AttendanceMaster] FOREIGN KEY([AttendanceID])
REFERENCES [dbo].[AttendanceMaster] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Attendance] CHECK CONSTRAINT [FK_Attendance_AttendanceMaster]
GO
ALTER TABLE [dbo].[AttendanceMaster]  WITH CHECK ADD  CONSTRAINT [FK_AttendanceMaster_AttendanceType] FOREIGN KEY([AttendanceType])
REFERENCES [dbo].[AttendanceType] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[AttendanceMaster] CHECK CONSTRAINT [FK_AttendanceMaster_AttendanceType]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_SubCategory] FOREIGN KEY([SubCategoryID])
REFERENCES [dbo].[SubCategory] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_SubCategory]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Supplier]
GO
ALTER TABLE [dbo].[Book_RI]  WITH CHECK ADD  CONSTRAINT [FK_Book_RI_BookReservation] FOREIGN KEY([ReservationID])
REFERENCES [dbo].[BookReservation] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Book_RI] CHECK CONSTRAINT [FK_Book_RI_BookReservation]
GO
ALTER TABLE [dbo].[BookIssue_Staff]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_Staff_Book] FOREIGN KEY([AccessionNo])
REFERENCES [dbo].[Book] ([AccessionNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookIssue_Staff] CHECK CONSTRAINT [FK_BookIssue_Staff_Book]
GO
ALTER TABLE [dbo].[BookIssue_Staff]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_Staff_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([St_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookIssue_Staff] CHECK CONSTRAINT [FK_BookIssue_Staff_Staff]
GO
ALTER TABLE [dbo].[BookIssue_Student]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_Student_Book] FOREIGN KEY([AccessionNo])
REFERENCES [dbo].[Book] ([AccessionNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookIssue_Student] CHECK CONSTRAINT [FK_BookIssue_Student_Book]
GO
ALTER TABLE [dbo].[BookIssue_Student]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_Student_Student] FOREIGN KEY([AdmissionNo])
REFERENCES [dbo].[Student] ([AdmissionNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookIssue_Student] CHECK CONSTRAINT [FK_BookIssue_Student_Student]
GO
ALTER TABLE [dbo].[BookReservation]  WITH CHECK ADD  CONSTRAINT [FK_BookReservation_Book] FOREIGN KEY([AccessionNo])
REFERENCES [dbo].[Book] ([AccessionNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookReservation] CHECK CONSTRAINT [FK_BookReservation_Book]
GO
ALTER TABLE [dbo].[BookReservation]  WITH CHECK ADD  CONSTRAINT [FK_BookReservation_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([St_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BookReservation] CHECK CONSTRAINT [FK_BookReservation_Staff]
GO
ALTER TABLE [dbo].[BusCardHolder_Staff]  WITH CHECK ADD  CONSTRAINT [FK_BusCardHolder_Staff_BusInfo] FOREIGN KEY([BusNo])
REFERENCES [dbo].[BusInfo] ([BusNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BusCardHolder_Staff] CHECK CONSTRAINT [FK_BusCardHolder_Staff_BusInfo]
GO
ALTER TABLE [dbo].[BusCardHolder_Staff]  WITH CHECK ADD  CONSTRAINT [FK_BusCardHolder_Staff_Location] FOREIGN KEY([Location])
REFERENCES [dbo].[Location] ([LocationName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BusCardHolder_Staff] CHECK CONSTRAINT [FK_BusCardHolder_Staff_Location]
GO
ALTER TABLE [dbo].[BusCardHolder_Staff]  WITH CHECK ADD  CONSTRAINT [FK_BusCardHolder_Staff_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([St_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BusCardHolder_Staff] CHECK CONSTRAINT [FK_BusCardHolder_Staff_Staff]
GO
ALTER TABLE [dbo].[BusCardHolder_Student]  WITH CHECK ADD  CONSTRAINT [FK_BusCardHolder_Student_BusInfo] FOREIGN KEY([BusNo])
REFERENCES [dbo].[BusInfo] ([BusNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BusCardHolder_Student] CHECK CONSTRAINT [FK_BusCardHolder_Student_BusInfo]
GO
ALTER TABLE [dbo].[BusCardHolder_Student]  WITH CHECK ADD  CONSTRAINT [FK_BusCardHolder_Student_Location] FOREIGN KEY([Location])
REFERENCES [dbo].[Location] ([LocationName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BusCardHolder_Student] CHECK CONSTRAINT [FK_BusCardHolder_Student_Location]
GO
ALTER TABLE [dbo].[BusCardHolder_Student]  WITH CHECK ADD  CONSTRAINT [FK_BusHolder_Student] FOREIGN KEY([AdmissionNo])
REFERENCES [dbo].[Student] ([AdmissionNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BusCardHolder_Student] CHECK CONSTRAINT [FK_BusHolder_Student]
GO
ALTER TABLE [dbo].[BusFeePayment_Staff]  WITH CHECK ADD  CONSTRAINT [FK_BusFeePayment_Staff_BusCardHolder_Staff] FOREIGN KEY([BusHolderID])
REFERENCES [dbo].[BusCardHolder_Staff] ([BCH_ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BusFeePayment_Staff] CHECK CONSTRAINT [FK_BusFeePayment_Staff_BusCardHolder_Staff]
GO
ALTER TABLE [dbo].[BusFeePayment_Student]  WITH CHECK ADD  CONSTRAINT [FK_BusFeePayment_Student_BusCardHolder_Student] FOREIGN KEY([BusHolderID])
REFERENCES [dbo].[BusCardHolder_Student] ([BCH_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[BusFeePayment_Student] CHECK CONSTRAINT [FK_BusFeePayment_Student_BusCardHolder_Student]
GO

ALTER TABLE [dbo].[Class]  WITH CHECK ADD  CONSTRAINT [FK_Class_ClassType] FOREIGN KEY([ClassType])
REFERENCES [dbo].[ClassType] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Class] CHECK CONSTRAINT [FK_Class_ClassType]
GO
ALTER TABLE [dbo].[CourseFee]  WITH CHECK ADD  CONSTRAINT [FK_CourseFee_CourseFee] FOREIGN KEY([Class])
REFERENCES [dbo].[Class] ([ClassName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CourseFee] CHECK CONSTRAINT [FK_CourseFee_CourseFee]
GO
ALTER TABLE [dbo].[CourseFee]  WITH CHECK ADD  CONSTRAINT [FK_CourseFee_Fee] FOREIGN KEY([FeeName])
REFERENCES [dbo].[Fee] ([Feename])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CourseFee] CHECK CONSTRAINT [FK_CourseFee_Fee]
GO
ALTER TABLE [dbo].[CourseFee]  WITH CHECK ADD  CONSTRAINT [FK_CourseFee_SchoolInfo] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[SchoolInfo] ([S_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CourseFee] CHECK CONSTRAINT [FK_CourseFee_SchoolInfo]
GO
ALTER TABLE [dbo].[CourseFeePayment]  WITH CHECK ADD  CONSTRAINT [FK_CourseFeePayment_Student] FOREIGN KEY([AdmissionNo])
REFERENCES [dbo].[Student] ([AdmissionNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[CourseFeePayment] CHECK CONSTRAINT [FK_CourseFeePayment_Student]
GO
ALTER TABLE [dbo].[CourseFeePayment_Join]  WITH CHECK ADD  CONSTRAINT [FK_CourseFeePayment_Join_CourseFeePayment] FOREIGN KEY([C_PaymentID])
REFERENCES [dbo].[CourseFeePayment] ([CFP_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CourseFeePayment_Join] CHECK CONSTRAINT [FK_CourseFeePayment_Join_CourseFeePayment]
GO
ALTER TABLE [dbo].[Discount]  WITH CHECK ADD  CONSTRAINT [FK_Discount_Student] FOREIGN KEY([AdmissionNo])
REFERENCES [dbo].[Student] ([AdmissionNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Discount] CHECK CONSTRAINT [FK_Discount_Student]
GO
ALTER TABLE [dbo].[Discount_Staff]  WITH CHECK ADD  CONSTRAINT [FK_Discount_Staff_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([St_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Discount_Staff] CHECK CONSTRAINT [FK_Discount_Staff_Staff]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_ExamType] FOREIGN KEY([ExamType])
REFERENCES [dbo].[ExamType] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_ExamType]
GO
ALTER TABLE [dbo].[Exam]  WITH CHECK ADD  CONSTRAINT [FK_Exam_SchoolInfo] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[SchoolInfo] ([S_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Exam] CHECK CONSTRAINT [FK_Exam_SchoolInfo]
GO
ALTER TABLE [dbo].[Exam_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Subject_Exam] FOREIGN KEY([ExamID])
REFERENCES [dbo].[Exam] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Exam_Subject] CHECK CONSTRAINT [FK_Exam_Subject_Exam]
GO
ALTER TABLE [dbo].[Exam_Subject]  WITH CHECK ADD  CONSTRAINT [FK_Exam_Subject_Subject] FOREIGN KEY([SubjectCode])
REFERENCES [dbo].[Subject] ([SubjectCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Exam_Subject] CHECK CONSTRAINT [FK_Exam_Subject_Subject]
GO
ALTER TABLE [dbo].[Expense]  WITH CHECK ADD  CONSTRAINT [FK_Expense_ExpenseType] FOREIGN KEY([ExpenseType])
REFERENCES [dbo].[ExpenseType] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Expense] CHECK CONSTRAINT [FK_Expense_ExpenseType]
GO
ALTER TABLE [dbo].[Hosteler]  WITH CHECK ADD  CONSTRAINT [FK_Hosteler_HostelInfo] FOREIGN KEY([HostelID])
REFERENCES [dbo].[HostelInfo] ([HI_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Hosteler] CHECK CONSTRAINT [FK_Hosteler_HostelInfo]
GO
ALTER TABLE [dbo].[Hosteler]  WITH CHECK ADD  CONSTRAINT [FK_Hosteler_Student] FOREIGN KEY([AdmissionNo])
REFERENCES [dbo].[Student] ([AdmissionNo])
GO
ALTER TABLE [dbo].[Hosteler] CHECK CONSTRAINT [FK_Hosteler_Student]
GO
ALTER TABLE [dbo].[HostelFeePayment]  WITH CHECK ADD  CONSTRAINT [FK_HostelFeePayment_Hosteler] FOREIGN KEY([HostelerID])
REFERENCES [dbo].[Hosteler] ([H_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[HostelFeePayment] CHECK CONSTRAINT [FK_HostelFeePayment_Hosteler]
GO
ALTER TABLE [dbo].[Installment_Bus]  WITH CHECK ADD  CONSTRAINT [FK_Installment_Bus_Location] FOREIGN KEY([Location])
REFERENCES [dbo].[Location] ([LocationName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Installment_Bus] CHECK CONSTRAINT [FK_Installment_Bus_Location]
GO
ALTER TABLE [dbo].[Installment_Hostel]  WITH CHECK ADD  CONSTRAINT [FK_Installment_Hostel_Class] FOREIGN KEY([Class])
REFERENCES [dbo].[Class] ([ClassName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Installment_Hostel] CHECK CONSTRAINT [FK_Installment_Hostel_Class]
GO
ALTER TABLE [dbo].[Installment_Hostel]  WITH CHECK ADD  CONSTRAINT [FK_Installment_Hostel_HostelInfo] FOREIGN KEY([HostelID])
REFERENCES [dbo].[HostelInfo] ([HI_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Installment_Hostel] CHECK CONSTRAINT [FK_Installment_Hostel_HostelInfo]
GO
ALTER TABLE [dbo].[Installment_Hostel]  WITH CHECK ADD  CONSTRAINT [FK_Installment_Hostel_SchoolInfo] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[SchoolInfo] ([S_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Installment_Hostel] CHECK CONSTRAINT [FK_Installment_Hostel_SchoolInfo]
GO
ALTER TABLE [dbo].[JournalAndMagazines]  WITH CHECK ADD  CONSTRAINT [FK_JournalAndMagazines_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[JournalAndMagazines] CHECK CONSTRAINT [FK_JournalAndMagazines_Department]
GO
ALTER TABLE [dbo].[JournalAndMagazines]  WITH CHECK ADD  CONSTRAINT [FK_JournalAndMagazines_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[JournalAndMagazines] CHECK CONSTRAINT [FK_JournalAndMagazines_Supplier]
GO

ALTER TABLE [dbo].[MarksEntry]  WITH CHECK ADD  CONSTRAINT [FK_MarksEntry_Student] FOREIGN KEY([AdmissionNo])
REFERENCES [dbo].[Student] ([AdmissionNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MarksEntry] CHECK CONSTRAINT [FK_MarksEntry_Student]
GO
ALTER TABLE [dbo].[MarksEntry_Join]  WITH CHECK ADD  CONSTRAINT [FK_MarksEntry_Join_GradeMaster] FOREIGN KEY([FinalGrade])
REFERENCES [dbo].[GradeMaster] ([Grade])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MarksEntry_Join] CHECK CONSTRAINT [FK_MarksEntry_Join_GradeMaster]
GO
ALTER TABLE [dbo].[MarksEntry_Join]  WITH CHECK ADD  CONSTRAINT [FK_MarksEntry_Join_MarksEntry] FOREIGN KEY([MarksID])
REFERENCES [dbo].[MarksEntry] ([M_Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MarksEntry_Join] CHECK CONSTRAINT [FK_MarksEntry_Join_MarksEntry]
GO
ALTER TABLE [dbo].[MarksEntry_Join]  WITH CHECK ADD  CONSTRAINT [FK_MarksEntry_Join_Subject] FOREIGN KEY([SubCode])
REFERENCES [dbo].[Subject] ([SubjectCode])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[MarksEntry_Join] CHECK CONSTRAINT [FK_MarksEntry_Join_Subject]
GO
ALTER TABLE [dbo].[NewsPaper]  WITH CHECK ADD  CONSTRAINT [FK_NewsPaper_Newspaper_Master] FOREIGN KEY([Papername])
REFERENCES [dbo].[Newspaper_Master] ([NewsPaper])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[NewsPaper] CHECK CONSTRAINT [FK_NewsPaper_Newspaper_Master]
GO
ALTER TABLE [dbo].[Quotation1]  WITH CHECK ADD  CONSTRAINT [FK_Quotation1_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Quotation1] CHECK CONSTRAINT [FK_Quotation1_Department]
GO
ALTER TABLE [dbo].[Quotation1_Join]  WITH CHECK ADD  CONSTRAINT [FK_Quotation1_Join_Book] FOREIGN KEY([AccessionNo])
REFERENCES [dbo].[Book] ([AccessionNo])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Quotation1_Join] CHECK CONSTRAINT [FK_Quotation1_Join_Book]
GO
ALTER TABLE [dbo].[Quotation1_Join]  WITH CHECK ADD  CONSTRAINT [FK_Quotation1_Join_Quotation] FOREIGN KEY([QJ_OrderID])
REFERENCES [dbo].[Quotation1] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Quotation1_Join] CHECK CONSTRAINT [FK_Quotation1_Join_Quotation]
GO
ALTER TABLE [dbo].[Return_Staff]  WITH CHECK ADD  CONSTRAINT [FK_Return_Staff_BookIssue_Staff] FOREIGN KEY([IssueID])
REFERENCES [dbo].[BookIssue_Staff] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Return_Staff] CHECK CONSTRAINT [FK_Return_Staff_BookIssue_Staff]
GO
ALTER TABLE [dbo].[Return_Student]  WITH CHECK ADD  CONSTRAINT [FK_Return_Student_BookIssue_Student] FOREIGN KEY([IssueID])
REFERENCES [dbo].[BookIssue_Student] ([ID])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Return_Student] CHECK CONSTRAINT [FK_Return_Student_BookIssue_Student]
GO

ALTER TABLE [dbo].[Section]  WITH CHECK ADD  CONSTRAINT [FK_Section_Class] FOREIGN KEY([Class])
REFERENCES [dbo].[Class] ([ClassName])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Section] CHECK CONSTRAINT [FK_Section_Class]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_ClassType] FOREIGN KEY([ClassType])
REFERENCES [dbo].[ClassType] ([Type])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_ClassType]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Designation] FOREIGN KEY([Designation])
REFERENCES [dbo].[Designation] ([Designation])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_Designation]
GO
ALTER TABLE [dbo].[Staff]  WITH CHECK ADD  CONSTRAINT [FK_Staff_SchoolInfo] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[SchoolInfo] ([S_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Staff] CHECK CONSTRAINT [FK_Staff_SchoolInfo]
GO
ALTER TABLE [dbo].[Staff_Department]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Department_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Staff_Department] CHECK CONSTRAINT [FK_Staff_Department_Department]
GO
ALTER TABLE [dbo].[Staff_Department]  WITH CHECK ADD  CONSTRAINT [FK_Staff_Department_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([St_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Staff_Department] CHECK CONSTRAINT [FK_Staff_Department_Staff]
GO
ALTER TABLE [dbo].[StaffAttendance]  WITH CHECK ADD  CONSTRAINT [FK_StaffAttendance_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([St_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StaffAttendance] CHECK CONSTRAINT [FK_StaffAttendance_Staff]
GO
ALTER TABLE [dbo].[StaffPayment]  WITH CHECK ADD  CONSTRAINT [FK_StaffPayment_Staff] FOREIGN KEY([StaffID])
REFERENCES [dbo].[Staff] ([St_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StaffPayment] CHECK CONSTRAINT [FK_StaffPayment_Staff]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_SchoolInfo] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[SchoolInfo] ([S_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_SchoolInfo]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Section] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Section]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Session_Master] FOREIGN KEY([Session])
REFERENCES [dbo].[Session_Master] ([Session])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Session_Master]
GO
ALTER TABLE [dbo].[StudentDocSubmitted]  WITH CHECK ADD  CONSTRAINT [FK_StudentDocSubmitted_Document] FOREIGN KEY([DocId])
REFERENCES [dbo].[Document] ([Doc_Id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[StudentDocSubmitted] CHECK CONSTRAINT [FK_StudentDocSubmitted_Document]
GO
ALTER TABLE [dbo].[StudentDocSubmitted]  WITH CHECK ADD  CONSTRAINT [FK_StudentDocSubmitted_Student] FOREIGN KEY([AdmissionNo])
REFERENCES [dbo].[Student] ([AdmissionNo])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[StudentDocSubmitted] CHECK CONSTRAINT [FK_StudentDocSubmitted_Student]
Go
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_SchoolInfo] FOREIGN KEY([SchoolID])
REFERENCES [dbo].[SchoolInfo] ([S_Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_SchoolInfo]
GO

ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Section] FOREIGN KEY([SectionID])
REFERENCES [dbo].[Section] ([Id])
ON UPDATE CASCADE
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Section]
GO

ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Session_Master] FOREIGN KEY([Session])
REFERENCES [dbo].[Session_Master] ([Session])
ON UPDATE CASCADE

GO
/****** Object:  Foreign Key [FK_Invoice11_Payment]    Script Date: 17/07/2025 05:11:30 PM ******/
ALTER TABLE [dbo].[Invoice11_Payment]  WITH CHECK 
ADD CONSTRAINT [FK_Invoice11_Payment] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[InvoiceInfo11] ([Inv_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

/****** Object:  Foreign Key [FK_Invoice11_Product]    Script Date: 17/07/2025 05:11:45 PM ******/
ALTER TABLE [dbo].[Invoice11_Product]  WITH CHECK 
ADD CONSTRAINT [FK_Invoice11_Product] FOREIGN KEY([InvoiceID])
REFERENCES [dbo].[InvoiceInfo11] ([Inv_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Session_Master]
GO
CREATE VIEW [dbo].[View_Stock_IN]
AS
SELECT        dbo.Stock_IN_Tbl.Stock_IN_ID, dbo.Stock_Tbl.Stock_Name, dbo.Stock_IN_Tbl.Money, dbo.Stock_IN_Tbl.Date_In, dbo.Stock_IN_Tbl.EmpName, dbo.Stock_IN_Tbl.Reason
FROM            dbo.Stock_IN_Tbl INNER JOIN
                         dbo.Stock_Tbl ON dbo.Stock_IN_Tbl.Stock_ID = dbo.Stock_Tbl.Stock_ID


GO
/****** Object:  View [dbo].[View_Stock_Out]    Script Date: 27/06/2020 10:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Stock_Out]
AS
SELECT        dbo.Stock_Out_Tbl.Stock_Out_ID, dbo.Stock_Tbl.Stock_Name, dbo.Stock_Out_Tbl.Money, dbo.Stock_Out_Tbl.DateOut, dbo.Stock_Out_Tbl.EmpName, dbo.Stock_Out_Tbl.Reason
FROM            dbo.Stock_Out_Tbl INNER JOIN
                         dbo.Stock_Tbl ON dbo.Stock_Out_Tbl.Stock_ID = dbo.Stock_Tbl.Stock_ID


GO
/****** Object:  View [dbo].[View_Stock_To_Stock]    Script Date: 27/06/2020 10:53:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_Stock_To_Stock]
AS
SELECT        dbo.Stock_To_Stock_Tbl.Stock_Transfer_ID, dbo.Stock_To_Stock_Tbl.Money, dbo.Stock_To_Stock_Tbl.TransferDate, dbo.Stock_Tbl.Stock_Name, dbo.Stock_To_Stock_Tbl.EmpName, dbo.Stock_To_Stock_Tbl.Reason
FROM            dbo.Stock_Tbl CROSS JOIN
                         dbo.Stock_To_Stock_Tbl


GO

