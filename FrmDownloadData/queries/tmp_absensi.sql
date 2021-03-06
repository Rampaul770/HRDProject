IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'get_validaterecord')
DROP PROCEDURE get_validaterecord
GO


/*6309
	Created By 	:	Chandra Arifin
	Date		:	Friday; 3 Jan 2014; 16:09 PM
	Stored Proc	:	get_validaterecord
	Description	:	validate 2x save record
*/
create procedure get_validaterecord
WITH ENCRYPTION
as
set nocount on

declare @maxdate datetime, @mindate datetime

select @mindate = MIN(cast(clock_date as DATE)) from tmp_absensi
select @maxdate = MAX(cast(clock_date as date)) from tmp_absensi

truncate table tmp_absensi_fromdb

insert into tmp_absensi_fromdb
(nik, clock_date, devid)
select nik, CAST(clock_date as datetime) + CAST(clock_time as datetime), devid  from trx_absensi 
where cast(clock_date as DATE) between @mindate and @maxdate


select 
	a.nik, a.clock_date, a.devID
from 
	tmp_absensi a
left join
	tmp_absensi_fromdb b
	on a.nik = b.nik and a.clock_date = b.clock_date
	--cast(a.clock_date as date) = cast(b.clock_date as date) and cast(a.clock_date as time) = cast(b.clock_date as time)
where 
	b.nik is null
order by a.nik, a.clock_date

GO





IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'get_tmpabsensi')
DROP PROCEDURE get_tmpabsensi
GO


/*
	Created By 	:	Chandra Arifin
	Date		:	Friday; 3 Jan 2014; 16:09 PM
	Stored Proc	:	get_tmpabsensi
	Description	:	Get temporary absensi karyawan
*/
create procedure get_tmpabsensi
WITH ENCRYPTION
as
set nocount on

select nik, clock_date, devid from tmp_absensi
order by nik, clock_date

GO







IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ins_tmpabsensi')
DROP PROCEDURE ins_tmpabsensi
GO


/*
	Created By 	:	Chandra Arifin
	Date		:	Friday; 3 Jan 2014; 16:09 PM
	Stored Proc	:	ins_tmpabsensi
	Description	:	Insert temporary absensi karyawan
*/
create procedure ins_tmpabsensi
	@nik int,
	@clock_date datetime,
	@devid int
WITH ENCRYPTION
as
set nocount on

insert into
	tmp_absensi
	(
		nik,
		clock_date,
		devid
	)
values
	(
		@nik, @clock_date, @devid
	)
GO



