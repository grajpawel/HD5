DECLARE @Start as Time(0) = CAST('00:00' as time)

;WITH e1(n) AS
(
    SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL 
    SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL 
    SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1 UNION ALL SELECT 1
), -- 10
e2(n) AS (SELECT 1 FROM e1 CROSS JOIN e1 AS b), -- 10*10
e3(n) AS (SELECT 1 FROM e1 CROSS JOIN e2), -- 10*100
e4(n) AS (SELECT 1 FROM e1 CROSS JOIN e3), 
tally (n) as ( SELECT n = ROW_NUMBER() OVER (ORDER BY n) FROM e4 )
SELECT Dateadd(minute, n - 1, @Start) as Czas, DATEPART(hour, Dateadd(minute, n - 1, @Start)) as Godzina, DATEPART(minute, Dateadd(minute, n - 1, @Start)) as Minuta
FROM   tally
WHERE  n <= 1440 