IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'get_validate_karyawan')
DROP PROCEDURE get_validate_karyawan
GO


/*
	Created By 	:	Chandra Arifin
	Date		:	Tuesday; 7 Jan 2014; 09:20 AM
	Stored Proc	:	get_validate_karyawan
	Description	:	validate 2x save record
*/
create procedure get_validate_karyawan
WITH ENCRYPTION
as
set nocount on


delete from tmp_karyawan_fromdb

insert into tmp_karyawan_fromdb
(nik, nama)
select nik, nama from ms_karyawan 


select 
	a.nik, a.nama 
from 
	tmp_karyawan a
left join
	tmp_karyawan_fromdb b
	on a.nik = b.nik
where 
	b.nik is null


GO



IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'get_tmpkaryawan')
DROP PROCEDURE get_tmpkaryawan
GO



/*
	Created By 	:	Chandra Arifin
	Date		:	Tuesday; 7 Jan 2014; 09:39 AM
	Stored Proc	:	get_tmpkaryawan
	Description	:	Mendapatkan Info Ttg karywan
*/
create procedure get_tmpkaryawan
WITH ENCRYPTION
as
set nocount on

select
	nik,
	nama
from
	tmp_karyawan
order by
	nik
GO








IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ins_tmpkaryawan')
DROP PROCEDURE ins_tmpkaryawan
GO


/*
	Created By 	:	Chandra Arifin
	Date		:	Tuesday; 7 Jan 2014; 09:39 AM
	Stored Proc	:	ins_tmpkaryawan
	Description	:	Insert karyawan
*/
create procedure ins_tmpkaryawan
	@nik int,
	@nama nvarchar(255)
WITH ENCRYPTION
as
set nocount on

insert into
	tmp_karyawan
	(
		nik,
		nama
	)
values
	(
		@nik, @nama
	)
GO





