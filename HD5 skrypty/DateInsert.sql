DECLARE  @Start datetime
		 ,@End  datetime
DECLARE @AllDates table
		(Date datetime)

SELECT @Start = '2000-01-01', @End = '2021-12-31';

WITH Nbrs_3( n ) AS ( SELECT 1 UNION SELECT 0 ),
     Nbrs_2( n ) AS ( SELECT 1 FROM Nbrs_3 n1 CROSS JOIN Nbrs_3 n2 ),
     Nbrs_1( n ) AS ( SELECT 1 FROM Nbrs_2 n1 CROSS JOIN Nbrs_2 n2 ),
     Nbrs_0( n ) AS ( SELECT 1 FROM Nbrs_1 n1 CROSS JOIN Nbrs_1 n2 ),
     Nbrs  ( n ) AS ( SELECT 1 FROM Nbrs_0 n1 CROSS JOIN Nbrs_0 n2 )

	SELECT  CONVERT(date, @Start+n-1) as Data, day(@Start+n-1) as DzienMiesiaca, DATEPART("dw", @Start+n-1) as DzienNumer, CASE DATEPART("dw", @Start+n-1)
WHEN 1 THEN 'Niedziela'
WHEN 2 THEN 'Poniedzia³ek'
WHEN 3 THEN 'Wtorek'
WHEN 4 THEN 'Œroda'
WHEN 5 THEN 'Czwartek'
WHEN 6 THEN 'Pi¹tek'
WHEN 7 THEN  'Sobota'
END as DzienNazwa, month(@Start+n-1) as MiesiacNumer, case month(@Start+n-1)
WHEN 1 THEN 'Styczeñ'
WHEN 2 THEN 'Luty'
WHEN 3 THEN 'Marzec'
WHEN 4 THEN 'Kwiecieñ'
WHEN 5 THEN 'Maj'
WHEN 6 THEN 'Czerwiec'
WHEN 7 THEN 'Lipiec'
WHEN 8 THEN 'Sierpieñ'
WHEN 9 THEN 'Wrzesieñ'
WHEN 10 THEN 'PaŸdziernik'
WHEN 11 THEN 'Listopad'
WHEN 12 THEN 'Grudzieñ'
END as "MiesiacNazwa",
CAST(YEAR(@Start+n-1) AS VARCHAR(4)) as Rok
		FROM ( SELECT ROW_NUMBER() OVER (ORDER BY n)
			FROM Nbrs ) D ( n )
	WHERE n <= DATEDIFF(day,@Start,@End)+1 ;