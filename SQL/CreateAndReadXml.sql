	--Send XML data. XML data type is not supported as a parameter to remote calls(linked server).You need change XML data type to VARCHAR.
	
	--create xml data and insert to VARCHAR type
	DECLARE @Tbl VARCHAR(MAX)
	SET @Tbl = (SELECT * FROM [dbo].[Table] where [Id] = @Id FOR XML RAW, ROOT('Tbl') )
	
	--read xml data
	DECLARE @Tbl_xml xml = CONVERT(XML, @Tbl)
	
	SELECT 
		T.m.value('@Param1','data type(char, int, varchar etc)')   AS   Param1 ,
		T.m.value('@Param2','data type(char, int, varchar ...)')   AS   Param2       
	INTO #Tbl
	FROM @Tbl_xml.nodes('Tbl/row') AS T(m)

	--data view
	SELECT * FROM #Tbl

