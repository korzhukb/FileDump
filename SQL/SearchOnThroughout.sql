--search on throughout the database

SELECT SCHEMA_NAME(o.schema_id) [schema]
, OBJECT_NAME(o.object_id) [object]
, o.[type] [type]
FROM syscomments c 
INNER JOIN sys.objects o ON c.id = o.object_id
WHERE c.text like '%SetRecipt7days%'
ORDER BY [schema], [type], [object]

