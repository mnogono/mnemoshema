[Code]

procedure InitializeSysConn();
begin
end;

// Return opened ADOConnection object
function OpenConnectionMSSQL(server : String; user : String; pass : String; var err : String) : Variant;
var
  ADOConnection : Variant;
begin
  ADOConnection := CreateOleObject('ADODB.Connection');

  err := '';
  ADOConnection.ConnectionString := 'Provider=SQLNCLI10.1'+
    ';Integrated Security=""'+
    ';Persist Security Info=False'+
    ';Uid='+user+
    ';Pwd='+pass+
    ';Initial Catalog=master'+
    ';Data Source='+server;

  try
    ADOConnection.Open;
  except
    err := GetExceptionMessage;
    ADOConnection := Null;
  end;

  Result := ADOConnection;
end;

const
  adCmdText = $00000001;
  adExecuteNoRecords = $00000080;

procedure ExecuteSQL(ADOConnection : Variant; SQLQuery : String);
var
  ADOCommand : Variant;
  SQLLogFile : String;
begin
  //log sql query
  SQLLogFile := ExpandConstant('{app}') + '\sql.log';
  //just for Trace log
  //SaveStringToFile(SQLLogFile, SQLQuery, True);

  try 
    ADOCommand := CreateOleObject('ADODB.Command');
    ADOCommand.ActiveConnection := ADOConnection;
    ADOCommand.CommandText := SQLQuery;
    // this will execute the script; the adCmdText flag here means
    // you're going to execute the CommandText text command, while
    // the adExecuteNoRecords flag ensures no data row will be get
    // from a provider, what should improve performance
    ADOCommand.Execute(NULL, NULL, adCmdText or adExecuteNoRecords);
  except
    SaveStringToFile(SQLLogFile, SQLQuery + #13#10, True);
    SaveStringToFile(SQLLogFile, GetExceptionMessage + #13#10, True);  
  end;
end;

{
procedure ExecuteSQLFile(ADOConnection : Variant; SQLFile : String);
var
  SQLQuery   : String;
begin
  if LoadStringFromFile(SQLFile, SQLQuery) then
  begin
    ExecuteSQL(ADOConnection, SQLQuery);
  end;                                        
end; }

procedure AttachDataBaseMSSQL(ADOConnection : Variant; SQLDataBase : String; MDFFile : String; LDFFile : String);
var
  SQLQuery : String;
begin
  SQLQuery := Format('create database %s on (filename=N''%s''), (filename=N''%s'') for attach', [SQLDataBase, MDFFile, LDFFile]);
  //MsgBox(SQLQuery, mbInformation, MB_OK);
  //InputBox('SQLQuery', '', SQLQuery);
  ExecuteSQL(ADOConnection, SQLQuery);
end;


