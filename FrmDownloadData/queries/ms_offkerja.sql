





IF EXISTS(SELECT * FROM sys.objects WHERE type = 'P' AND name = 'ins_switchoff')
DROP PROCEDURE ins_switchoff
GO


/*
	Created By 	:	Chandra Arifin
	Date		:	
	Stored Proc	:	
	Description	:	
*/
create procedure ins_switchoff
	@nik int,
	@nik2 int,
	@PeriodeAwal datetime,
	@PeriodeAkhir datetime
WITH ENCRYPTION
as
set nocount on

	SET @PeriodeAwal = convert(date, convert(varchar(10), @periodeawal, 105), 105)
	SET @PeriodeAkhir = convert(date, convert(varchar(10), @PeriodeAkhir, 105), 105)

	update ms_offkerja 
	set
		tgloff = @PeriodeAwal
	where 
		nik = @nik and tgloff = @PeriodeAkhir


	update ms_offkerja 
	set
		tgloff = @PeriodeAkhir
	where 
		nik = @nik2 and tgloff = @PeriodeAwal

GO



