BULK INSERT client
FROM 'C:\Users\grajp\OneDrive\Dokumenty\Git\HD5\HD 2\CSV\clients.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT worker
FROM 'C:\Users\grajp\OneDrive\Dokumenty\Git\HD5\HD 2\CSV\workers.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT salon
FROM 'C:\Users\grajp\OneDrive\Dokumenty\Git\HD5\HD 2\CSV\salons.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT device
FROM 'C:\Users\grajp\OneDrive\Dokumenty\Git\HD5\HD 2\CSV\devices.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT service
FROM 'C:\Users\grajp\OneDrive\Dokumenty\Git\HD5\HD 2\CSV\service.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)


BULK INSERT appointment
FROM 'C:\Users\grajp\OneDrive\Dokumenty\Git\HD5\HD 2\CSV\appointments.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)

BULK INSERT execution
FROM 'C:\Users\grajp\OneDrive\Dokumenty\Git\HD5\HD 2\CSV\executions.csv'
WITH
(
    FIRSTROW = 2, -- as 1st one is header
    FIELDTERMINATOR = ',',  --CSV field delimiter
    ROWTERMINATOR = '\n',   --Use to shift the control to next row
    TABLOCK
)




