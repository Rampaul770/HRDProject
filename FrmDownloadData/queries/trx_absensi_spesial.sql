



IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'del_absensi_spesial')
DROP PROCEDURE del_absensi_spesial
GO


/*
	Created By 	:	Chandra Arifin
	Date		:	
	Stored Proc	:	del_absensi_spesial
	Description	:	
*/
create procedure del_absensi_spesial
	@nik int,
	@Tahun	smallint,
	@Bulan	tinyint,	 	
	@userid nvarchar(10)
WITH ENCRYPTION
as
set nocount on

update
	trx_absensi_spesial
set
	stsrc = 'D',
	UserUpdated = @UserID,
	DateUpdated = getdate()
where
	nik = @nik and tahun = @Tahun and bulan = @Bulan
GO







IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ins_absensi_spesial')
DROP PROCEDURE ins_absensi_spesial
GO


/*
	Created By 	:	Chandra Arifin
	Date		:	Thursday, 10 July 2014, 11:03 AM
	Stored Proc	:	ins_absensi_spesial
	Description	:	
*/
create procedure ins_absensi_spesial	
	@nik				int,	 
	@clock_date			date,	 
	@id_absensi_spesial	char(1),
	@Tahun				smallint,
	@Bulan				tinyint,	 	 
	@keterangan			varchar(255),
	@userid nvarchar(10)
WITH ENCRYPTION
as
set nocount on

insert into
	trx_absensi_spesial
	(
		stsrc, nik, clock_date, id_absensi_spesial, 
		tahun, bulan, keterangan,
		DateCreated,
		UserCreated,
		DateUpdated,
		UserUpdated
	)
values
	(
		'A', @nik, @clock_date, @id_absensi_spesial, 
		@tahun, @bulan, @keterangan,
		getdate(), @UserID, getdate(), @UserID
	)
GO



