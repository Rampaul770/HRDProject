





IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ins_trxabsensi')
DROP PROCEDURE ins_trxabsensi
GO


/*
	Created By 	:	Chandra Arifin
	Date		:	Tuesday; 31 Dec 2013; 20:09 PM
	Stored Proc	:	ins_trxabsensi
	Description	:	Insert absensi karyawan
*/
create procedure ins_trxabsensi
	@nik int,
	@clock_date date,
	@clock_time time
WITH ENCRYPTION
as
set nocount on

insert into
	trx_absensi
	(
		nik,
		clock_date,
		clock_time	
	)
values
	(
		@nik, @clock_date, @clock_time
	)
GO



