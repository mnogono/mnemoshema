[Code]
const
  //constancts of indexes of TStringLinst returned by function GetVDBRegInfo
  VDB_REG_VDB_SERVER_IP = 0;
  VDB_REG_VDB_SERVER_PORT = 1;
  VDB_REG_VDB_SERVER_REMOTE_PORT = 2;
  VDB_REG_VDB_SERVER_PATH = 3;
  VDB_REG_VDB_SERVICE_NAME = 4;
  VDB_REG_SQL_DATABASE_NAME = 5;
  VDB_REG_SQL_SERVER_NAME = 6;
  VDB_REG_SQL_UID = 7;
  VDB_REG_SQL_PWD = 8;
  VDB_REG_VDB_CLIENT_PATH = 9;

//each system module has function Initialize[module name]
//each Initialize function must be invoked in function InitializeWizard
procedure InitializeSysReg();
begin
end;

//return REG info common vdb properties
//using macro '{#HKLM_SERVER}'
function GetVDBRegInfo() : TStringList;
var
  RegInfo : TStringList;
  VDBServerIP, VDBServerPort, VDBServerRemotePort, VDBServiceName, VDBServerPath : String;
  SQLServerName, SQLDatabaseName, SQLUID, SQLPWD : String;
  VDBClientPath : String;
  RegPath : String;
  RegProperty : Integer;
begin
  RegInfo := TStringList.Create;
  for RegProperty := 0 to 10 do
  begin
    RegInfo.Add('');
  end;

  if Is64BitInstallMode then
    begin 
      RegPath := 'SOFTWARE\Wow6432Node\'+ExpandConstant('{#HKLM_SERVER}'); 
    end
  else 
    begin
      RegPath := 'SOFTWARE\'+ExpandConstant('{#HKLM_SERVER}');
    end

  RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'DataNase_workPort', VDBServerPort);
  RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'ServerAppPath', VDBServerPath);
  RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'ServiceName', VDBServiceName);
  RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'VDBServer_controlPort', VDBServerRemotePort);
  RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'DataBase_workPort', VDBServerPort);

  RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'SQL_DatabaseName', SQLDatabaseName);
  RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'SQL_UID', SQLUID);
  RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'SQL_PWD', SQLPWD);
  RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'SQL_ServerName', SQLServerName);

  RegQueryStringValue(HKEY_LOCAL_MACHINE, RegPath, 'ClientAppPath', VDBClientPath);

  RegInfo[VDB_REG_VDB_SERVER_IP] := VDBServerIP;
  RegInfo[VDB_REG_VDB_SERVER_PORT] := VDBServerPort;
  RegInfo[VDB_REG_VDB_SERVER_REMOTE_PORT] := VDBServerRemotePort;
  RegInfo[VDB_REG_VDB_SERVER_PATH] := VDBServerPath;
  RegInfo[VDB_REG_VDB_SERVICE_NAME] := VDBServiceName;

  RegInfo[VDB_REG_SQL_DATABASE_NAME] := SQLDatabaseName;
  RegInfo[VDB_REG_SQL_SERVER_NAME] := SQLServerName;
  RegInfo[VDB_REG_SQL_UID] := SQLUID;
  RegInfo[VDB_REG_SQL_PWD] := SQLPWD;

  RegInfo[VDB_REG_VDB_CLIENT_PATH] := VDBClientPath;

  Result := RegInfo;
end;
