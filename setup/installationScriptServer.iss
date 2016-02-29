#define MyAppNameUninst "Удалить"
#define MyAppName "MySQL Server 5.0"
#define MyAppVersion "5.0"
#define MySQLServiceName "MySQL 5.0"
#define MyAppRegName "Mnemoshema Server"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{204A6117-CFD3-4B59-97A7-5656FD3E24DC}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
DefaultDirName={pf}\MySQL\{#MyAppName}
DefaultGroupName=Mnemoshema Server
OutputDir=.\out
OutputBaseFilename=setupMnemoshemaServer
Compression=lzma
SolidCompression=no

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "sysUtils.dll"; DestDir: "{tmp}"; Flags: dontcopy;
Source: "MySQL Server 5.0\*"; DestDir: "{app}"; Flags: recursesubdirs;
Source: "sql\*"; DestDir: "{app}\mnemoshema";
Source: "cmd\*"; DestDir: "{app}\mnemoshema";
Source: "doc\Руководство пользователя. Мнемосхема.files\*"; DestDir: "{app}\doc\Руководство пользователя. Мнемосхема.files";
Source: "doc\Руководство пользователя. Мнемосхема.htm"; DestDir: "{app}\doc";

[Icons]
Name: "{group}\Удалить"; Filename: "{app}\unins000.exe"
Name: "{group}\Тест базы данных"; Filename: "{app}\mnemoshema\show_mnemoshema_tables.cmd";
Name: "{group}\Руководство"; Filename: "{app}\doc\Руководство пользователя. Мнемосхема.htm";

[Registry]
Root: "HKLM32"; Subkey: "SOFTWARE\{#MyAppRegName}"; ValueType: string; ValueData: "{app}"; Flags: createvalueifdoesntexist uninsdeletekey;
Root: "HKLM32"; Subkey: "SOFTWARE\{#MyAppRegName}"; ValueType: string; ValueName: "user"; ValueData: "root"; Flags: createvalueifdoesntexist uninsdeletekey;
Root: "HKLM32"; Subkey: "SOFTWARE\{#MyAppRegName}"; ValueType: string; ValueName: "password"; ValueData: {code:GetRootPassword}; Flags: createvalueifdoesntexist uninsdeletekey;
Root: "HKLM32"; Subkey: "SOFTWARE\{#MyAppRegName}"; ValueType: string; ValueName: "port"; ValueData: {code:GetMySQLPort}; Flags: createvalueifdoesntexist uninsdeletekey;

#include "scripts\sysLog.iss"
#include "scripts\sysCmd.iss"
#include "scripts\sysConn.iss"
#include "scripts\sysFile.iss"
#include "scripts\sysStr.iss"
#include "scripts\sysSvn.iss"

[Code]
function IsLocalPortAvailable(port : Integer): Integer;
external 'IsLocalPortAvailable@files:sysUtils.dll stdcall delayload setuponly';

var
  MySQLSettings: TInputQueryWizardPage;
  IsMnemoshemaServerAlreadyInstalled : Boolean;
  ButtonGetDataCollectionPath : TNewButton;
  ButtonCheckAvailablePort : TNewButton;

function IsMnemoshemaServerInstalled() : Boolean;
begin
  Result := RegKeyExists(HKEY_LOCAL_MACHINE, 'Software\' + ExpandConstant('{#MyAppRegName}'));
end;

function InitializeSetup: Boolean;
var
  ErrorCode: Integer;
begin
  {Exec('.\bin\mysql.exe', '-u root < mnemoshema\register_root_user.sql', 'C:\Program Files (x86)\MySQL\MySQL Server 5.0\', SW_SHOW, ewWaitUntilTerminated, ErrorCode)}
  {Exec('bin\mysql.exe', '-D mysql -u root -e "source mnemoshema/generate_db.sql"', 'C:\Program Files (x86)\MySQL\MySQL Server 5.0', SW_SHOW, ewWaitUntilTerminated, ErrorCode)}
  {Exec('C:\Program Files (x86)\MySQL\MySQL Server 5.0\bin\mysql.exe', '-D mysql -u root -e "source C:/Program Files (x86)/MySQL/MySQL Server 5.0/mnemoshema/register_root_user.sql"', '', SW_SHOW, ewWaitUntilTerminated, ErrorCode)}
  {Exec('C:\Program Files (x86)\MySQL\MySQL Server 5.0\bin\mysql.exe', '-D mysql -u root -p1234567890 -e "source C:/Program Files (x86)/MySQL/MySQL Server 5.0/mnemoshema/generate_db.sql"', '', SW_SHOW, ewWaitUntilTerminated, ErrorCode)}
  {Exec('bin\mysql.exe', '-D mysql -u root -p123456789 -e "source mnemoshema/generate_db.sql"', MySQLPath, SW_SHOW, ewWaitUntilTerminated, ErrorCode)}

  IsMnemoshemaServerAlreadyInstalled := IsMnemoshemaServerInstalled();

  Result := True;
end;

procedure GetDataCollectionPath(Sender : TObject);
var
  directory : String;
begin
  if BrowseForFolder('Укажите сетевой путь до центрального хранилища', directory, False) then
  begin
    MySQLSettings.Values[1] := directory;
  end;
end;

procedure CheckAvailablePort(Sender : TObject);
var
  port : Integer;
begin
  port := StrToInt(MySQLSettings.Values[2]);
  try
    if IsLocalPortAvailable(port) = 1 then begin
      MsgBox('Порт: ' +MySQLSettings.Values[2]+' занят!', mbInformation, MB_OK);
    end
    else begin
      MsgBox('Порт: ' +MySQLSettings.Values[2]+' свободен!', mbInformation, MB_OK);
    end;
  except
  end;

end;

procedure StopMnemoshemaServer();
var
  CmdParam : String;
  ErrorCode : Integer;
  Msg : String;
begin
  CmdParam := '/C sc stop "' +ExpandConstant('{#MySQLServiceName}')+'"';

  if not ShellExec('', ExpandConstant('{cmd}'), CmdParam, '', SW_HIDE, ewWaitUntilTerminated, ErrorCode) then
  begin
    Msg := SysErrorMessage(ErrorCode);
    MsgBox(msg, mbInformation, MB_OK);
  end;
end;

procedure StartMnemoshemaServer();
var
  CmdParam : String;
  ErrorCode : Integer;
  Msg : String;
begin
  CmdParam := '/C sc start "' +ExpandConstant('{#MySQLServiceName}')+'"';

  if not ShellExec('', ExpandConstant('{cmd}'), CmdParam, '', SW_HIDE, ewWaitUntilTerminated, ErrorCode) then
  begin
    Msg := SysErrorMessage(ErrorCode);
    MsgBox(msg, mbInformation, MB_OK);
  end;
end;

procedure FindAndReplace(SearchFor : String; ReplaceWith : String; FileName: String);
var
  FileContents: TStringList;
  FileContent : String;
begin
  FileContents:=TStringList.Create;

    FileContents.LoadFromFile(FileName);
    FileContent := FileContents.Text;
    StringChangeEx(FileContent, SearchFor, ReplaceWith, True);
    FileContents.Text := FileContent;
    FileContents.SaveToFile(FileName);
end;

procedure PrepereMySQLIni(IsFirstInstall : Boolean);
var
  FileMySQLINIPath : String;
  BaseDir : String;
  port : String;
begin
    BaseDir := ExpandConstant('{app}');
    StringChangeEx(BaseDir, '\', '/', True);
    FileMySQLINIPath := BaseDir + '\my.ini';

    if IsFirstInstall then begin
      port := MySQLSettings.Values[2];
    end
    else begin
      if not RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\'+ExpandConstant('{#MyAppRegName}'), 'port', port) then
      begin
        port := '3306';
      end;
      
    end;

    FindAndReplace('{{basedir}}', BaseDir, FileMySQLINIPath);
    FindAndReplace('{{port}}', port, FileMySQLINIPath);
end;

procedure CreateSQLService();
var
  BinPath : String;
  CmdParam : String;
  ErrorCode: Integer;
  Msg : String;
begin
  BinPath := ExpandConstant('{app}') + '\bin';
  CmdParam :=  '/C mysqld-nt.exe --install "'+ExpandConstant('{#MySQLServiceName}')+'" --defaults-file="' + ExpandConstant('{app}') + '\my.ini"';

  {MsgBox(CmdParam, mbInformation, MB_OK);}
  if not ShellExec('', ExpandConstant('{cmd}'), CmdParam, BinPath, SW_HIDE, ewWaitUntilTerminated, ErrorCode) then
  begin
    Msg := SysErrorMessage(ErrorCode);
    MsgBox(msg, mbInformation, MB_OK);
  end;

  (*ShellExec('', ExpandConstant('{cmd}'), '/C net start "'+ExpandConstant('{#MySQLServiceName}')+'"', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);}*)
end;

procedure ExecuteSQLScript(SQLFile, User, Password : String);
var
  BinPath : String;
  CmdParam : String;
  ErrorCode: Integer;
  Msg : String;
  CMDPath : String;
begin
  BinPath := ExpandConstant('{app}') + '\bin';

  CmdParam :=  '-u ' +User;
  if Password <> '' then begin
    CmdParam := CmdParam + ' -p' + Password; 
  end;
  CmdParam := CmdParam + ' < "' + SQLFile + '"';

  {MsgBox(CmdParam, mbInformation, MB_OK);}

  CMDPath := ExpandConstant('{cmd}');

  {if not Exec(CMDPath, CmdParam, '', SW_SHOW, ewWaitUntilTerminated, ErrorCode) then}
  if not Exec(BinPath + '\mysql.exe', CmdParam, '', SW_SHOW, ewWaitUntilTerminated, ErrorCode) then
  begin
    Msg := SysErrorMessage(ErrorCode);
    MsgBox(msg, mbInformation, MB_OK);
  end;
end;

function BackButtonClick(pageID: Integer): Boolean;
begin
  if ButtonGetDataCollectionPath <> nil then
  begin
    if pageID = 8 then begin
      ButtonGetDataCollectionPath.Visible := True;
      ButtonCheckAvailablePort.Visible := true;
    end
    else begin
      ButtonGetDataCollectionPath.Visible := False;
      ButtonCheckAvailablePort.Visible := False;
    end;
  end;

  Result := True;
end;

function NextButtonClick(pageID: Integer): Boolean;
var
  port : Integer;
begin
  Result := True;
  (*
  if pageID = wpWelcome then
  begin
    if IsMnemoshemaServerInstalled() = True then begin
      MsgBox('Сервер уже установлен, обновить?', mbInformation, MB_OK);
    end;
  end;
  *)

  if ButtonGetDataCollectionPath <> nil then
  begin
    if pageID = MySQLSettings.ID then begin
      port := StrToInt(MySQLSettings.Values[2]);
      try 
        if IsLocalPortAvailable(port) = 1 then begin
          MsgBox('Порт: ' +MySQLSettings.Values[2]+' занят!', mbInformation, MB_OK);
          Result := False;
        end
      except
      end;
    end;

    if Result = True then begin
      if pageID = wpSelectDir then begin
        ButtonGetDataCollectionPath.Visible := True;
        ButtonCheckAvailablePort.Visible := True;
      end
      else begin
        ButtonGetDataCollectionPath.Visible := False;
        ButtonCheckAvailablePort.Visible := False;
      end;
    end;
  end;
end;

function GetMySQLPort(Value : String) : String;
begin
  Result := MySQLSettings.Values[2]
end;

function GetRootPassword(Value : String) : String;
begin
  Result := MySQLSettings.Values[0];
end;

procedure UpdateServerApplications(MySQLPath, User, Password : String);
var
  MySQLPathEx : String;
  ErrorCode : Integer;
begin
  MySQLPathEx := MySQLPath;
  StringChangeEx(MySQLPathEx, '\', '/', True);

  Exec(MySQLPath+'\bin\mysql.exe', '-D mysql -u '+User+' -p'+Password+' -e "source '+MySQLPathEx+'/mnemoshema/update_device_refresher.sql"', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
  Exec(MySQLPath+'\bin\mysql.exe', '-D mysql -u '+User+' -p'+Password+' -e "source '+MySQLPathEx+'/mnemoshema/update_mnemoshema_kso_control.sql"', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
  Exec(MySQLPath+'\bin\mysql.exe', '-D mysql -u '+User+' -p'+Password+' -e "source '+MySQLPathEx+'/mnemoshema/update_project_mp.sql"', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
  Exec(MySQLPath+'\bin\mysql.exe', '-D mysql -u '+User+' -p'+Password+' -e "source '+MySQLPathEx+'/mnemoshema/update_project_mpd.sql"', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
end;

procedure PrepareShowMnemoshemaTablesCMD(MySQLPath, User, Password : String);
var 
  ShowMnemoshemaTablesCMD : String;
begin
  ShowMnemoshemaTablesCMD := MySQLPath + '\mnemoshema\show_mnemoshema_tables.cmd';

  FindAndReplace('{{MySQLPath}}',     MySQLPath,  ShowMnemoshemaTablesCMD);
  FindAndReplace('{{user}}',          User,       ShowMnemoshemaTablesCMD);
  FindAndReplace('{{password}}',      Password,   ShowMnemoshemaTablesCMD);
end;

procedure PrepareCreateArchiverShedulerTaskCMD();
var
  MnemoshemaArchiverPath : String;
  CreateArchiverShedulerTaskCMD : String;
begin
  MnemoshemaArchiverPath := ExpandConstant('{app}') + '\mnemoshema\ProjectArchiver.exe';
  CreateArchiverShedulerTaskCMD := ExpandConstant('{app}') + '\mnemoshema\create_archive_scheduler_task.cmd';

  FindAndReplace('{{ProjectArchiverPath}}', MnemoshemaArchiverPath, CreateArchiverShedulerTaskCMD);
end;

procedure CreateArchiverSheduler();
var
  CreateArchiverShedulerTaskCMD : String;
  ErrorCode : Integer;
begin
  CreateArchiverShedulerTaskCMD := ExpandConstant('{app}') + '\mnemoshema\create_archive_scheduler_task.cmd';

  //convert cmd file
  FindAndReplaceInFile('{{app}}', ExpandConstant('{app}'), CreateArchiverShedulerTaskCMD);

  Exec(CreateArchiverShedulerTaskCMD, '', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
end;

procedure SetDefaultSettings(MySQLPath, User, Password: String);
var 
  DefaultSettingSQL : String;
  MySQLPathEx : String;
  ErrorCode : Integer;
begin
  MySQLPathEx := MySQLPath;
  StringChangeEx(MySQLPathEx, '\', '/', True);

  Exec(MySQLPath+'\bin\mysql.exe', '-D mysql -u '+User+' -p'+Password+' -e "source '+MySQLPathEx+'/mnemoshema/default_settings.sql"', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
end;

procedure RegisterRootUser(MySQLPath, User : String);
var 
  DefaultSettingSQL : String;
  MySQLPathEx : String;
  ErrorCode : Integer;
begin
  MySQLPathEx := MySQLPath;
  StringChangeEx(MySQLPathEx, '\', '/', True);

  Exec(MySQLPath+'\bin\mysql.exe', '-D mysql -u '+User+' -e "source '+MySQLPathEx+'/mnemoshema/register_root_user.sql"', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
end;

procedure GenerateDB(MySQLPath, User, Password : String);
var 
  DefaultSettingSQL : String;
  MySQLPathEx : String;
  ErrorCode : Integer;
begin
  MySQLPathEx := MySQLPath;
  StringChangeEx(MySQLPathEx, '\', '/', True);

  Exec(MySQLPath+'\bin\mysql.exe', '-D mysql -u '+User+' -p'+Password+' -e "source '+MySQLPathEx+'/mnemoshema/generate_db.sql"', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
end;

procedure UpdateDefaultPathCentralDB(MySQLPath, User, Password, PathCentralDB: String);
var 
  DefaultSettingSQL : String;
  MySQLPathEx : String;
  ErrorCode : Integer;
begin
  MySQLPathEx := MySQLPath;
  StringChangeEx(MySQLPathEx, '\', '/', True);

  DefaultSettingSQL := MySQLPath +'\mnemoshema\update_default_path_central_db.sql';

  FindAndReplace('{{PathCentralDB}}', PathCentralDB, DefaultSettingSQL);

  Exec(MySQLPath+'\bin\mysql.exe', '-D mysql -u '+User+' -p'+Password+' -e "source '+MySQLPathEx+'/mnemoshema/update_default_path_central_db.sql"', '', SW_HIDE, ewWaitUntilTerminated, ErrorCode);
end;

procedure PostInstall(MySQLPath, User, Password : String; IsFirstInstall : Boolean);
begin
  PrepereMySQLIni(IsFirstInstall);

  StartMnemoshemaServer();
  Sleep(10000);

  RegisterRootUser(MySQLPath, User);

  GenerateDB(MySQLPath, User, Password);

  PrepareShowMnemoshemaTablesCMD(MySQLPath, User, Password);

  PrepareCreateArchiverShedulerTaskCMD();

  SetDefaultSettings(MySQLPath, User, Password);

  if IsFirstInstall = True then begin
    UpdateDefaultPathCentralDB(MySQLPath, User, Password, MySQLSettings.Values[1]);
  end

  UpdateServerApplications(MySQLPath, User, Password);

  CreateArchiverSheduler();
end;

procedure PostInstallMnemoshemaServer();
var
  MnemoshemaPath : String;
  ShowMnemoshemaTablesCMD : String;
  User : String;
  Password : String;
  MySQLPath : String;
  DefaultSettingSQL : String;
  PathCentralDB : String;
  ErrorCode : Integer;
  MySQLPathEx : String;
begin
  {MsgBox('PostInstallMnemoshemaServer', mbInformation, MB_OK);}
  User := 'root';
  Password := MySQLSettings.Values[0];
  PathCentralDB := MySQLSettings.Values[1];
  StringChangeEx(PathCentralDB, '\', '\\', True);

  MySQLPath := ExpandConstant('{app}');

  CreateSQLService();

  PostInstall(MySQLPath, User, Password, True);
end;

procedure PostUpdateMnemoshemaServer();
var
  MnemoshemaPath : String;
  ShowMnemoshemaTablesCMD : String;
  User : String;
  Password : String;
  MySQLPath : String;
  DefaultSettingSQL : String;
  PathCentralDB : String;
begin
  {MsgBox('PostUpdateMnemoshemaServer', mbInformation, MB_OK);}

  MySQLPath := ExpandConstant('{app}');
  User := 'root';

  if Is64BitInstallMode then
    RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\Wow6432Node\' + ExpandConstant('{#MyAppRegName}'), 'password', Password)
  else
    RegQueryStringValue(HKEY_LOCAL_MACHINE, 'SOFTWARE\' + ExpandConstant('{#MyAppRegName}'), 'password', Password)

  PostInstall(MySQLPath, User, Password, False);
end;

procedure CurStepChanged(CurStep: TSetupStep);
begin
  if CurStep = ssInstall then begin
    StopMnemoshemaServer();
  end;

  if CurStep = ssPostInstall then begin
    if not IsMnemoshemaServerAlreadyInstalled then begin
      PostInstallMnemoshemaServer();
    end
    else begin
      PostUpdateMnemoshemaServer();
    end;
  end;
end;

procedure RemoveSQLService();
var
  BinPath : String;
  CmdParam : String;
  ErrorCode: Integer;
  Msg : String;
begin
  BinPath := ExpandConstant('{app}') + '\bin';

  CmdParam :=  '/C sc stop "' +ExpandConstant('{#MySQLServiceName}')+'"';

  {MsgBox(CmdParam, mbInformation, MB_OK);}

  if not ShellExec('', ExpandConstant('{cmd}'), CmdParam, BinPath, SW_HIDE, ewWaitUntilTerminated, ErrorCode) then
  begin
    Msg := SysErrorMessage(ErrorCode);
    MsgBox(msg, mbInformation, MB_OK);
  end;

  CmdParam :=  '/C sc delete "' +ExpandConstant('{#MySQLServiceName}')+'"';

  {MsgBox(CmdParam, mbInformation, MB_OK);}

  if not ShellExec('', ExpandConstant('{cmd}'), CmdParam, BinPath, SW_HIDE, ewWaitUntilTerminated, ErrorCode) then
  begin
    Msg := SysErrorMessage(ErrorCode);
    MsgBox(msg, mbInformation, MB_OK);
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
begin
  if CurUninstallStep = usUninstall then begin
    RemoveSQLService();
  end;
end;

procedure InitializeWizard;
begin
  //Initialize system modules
  InitializeSysLog();
  InitializeSysCmd();
  InitializeSysSvn();  
  InitializeSysStr();
  InitializeSysFile();
  InitializeSysConn();

  if not IsMnemoshemaServerAlreadyInstalled then 
  begin
    MySQLSettings := CreateInputQueryPage(wpSelectDir,
      'Настройка сервера приложений', '',
      'Укажите параметры');
    
    MySQLSettings.Add('Пароль пользователя root:', True);
    MySQLSettings.Add('Сетевой путь до файловой БД:', False);
    MySQLSettings.Add('Порт MySQL сервера:', False);

    MySQLSettings.Values[0] := '1234567890';
    MySQLSettings.Values[1] := '';
    MySQLSettings.Values[2] := '3306';

    ButtonGetDataCollectionPath         := TNewButton.Create(WizardForm);
    ButtonGetDataCollectionPath.Left    := 460 ;
    ButtonGetDataCollectionPath.Top     := 163 ;
    ButtonGetDataCollectionPath.Width   := 20 ;
    ButtonGetDataCollectionPath.Height  := 22 ;
    ButtonGetDataCollectionPath.Caption := '...' ;
    ButtonGetDataCollectionPath.OnClick := @GetDataCollectionPath;
    ButtonGetDataCollectionPath.Parent  := WizardForm;
    ButtonGetDataCollectionPath.Visible := False;

    ButtonCheckAvailablePort            := TNewButton.Create(WizardForm);
    ButtonCheckAvailablePort.Left    := 460 ;
    ButtonCheckAvailablePort.Top     := 215 ;
    ButtonCheckAvailablePort.Width   := 20 ;
    ButtonCheckAvailablePort.Height  := 22 ;
    ButtonCheckAvailablePort.Caption := 'Т' ;
    ButtonCheckAvailablePort.OnClick := @CheckAvailablePort;
    ButtonCheckAvailablePort.Parent  := WizardForm;
    ButtonCheckAvailablePort.Visible := False;
  end;
end;