[Code]
const
  //constancts of indexes of TStringLinst returned by function GetSvnRevisionInfo
  SVN_INFO_PATH = 0;
  SVN_INFO_URL = 1;
  SVN_INFO_REPOSITORY_ROOT = 2;
  SVN_INFO_REPOSITORY_UUID = 3;
  SVN_INFO_REVISION = 4;
  SVN_INFO_NODE_KIND = 5;
  SVN_INFO_LAST_CHANGED_AUTHOR = 6;
  SVN_INFO_LAST_CHANGED_REV = 7;
  SVN_INFO_LAST_CHANGED_DATE = 8;

var
  //global variable for svn folder
  SVN_HOME : String;

//each system module has function Initialize[module name]
//each Initialize function must be invoked in function InitializeWizard
procedure InitializeSysSvn();
begin
  SVN_HOME := ExpandConstant('{src}') + '\Subversion\bin';  
end;

function GetSvnRevisionInfo(SVNUrl, User, Pass : String) : TStringList;
var
  FileStringList : TStringList;
  List : String;
  CmdParam : String;
  ErrorCode : Integer;
  ErrorMsg : String;
  Line : Integer;
  LineParams : TStringList;
  SVNInfoList : TStringList;
  SRCFolder : String;
  SVNInfoFile : String;
begin
  SRCFolder := ExpandConstant('{src}');
  SVNInfoFile := SRCFolder + '\svn_info.txt';
  SVNInfoList := TStringList.Create;
  for Line := 0 to 9 do
  begin
    SVNInfoList.Add('');
  end;
  
  CmdParam :=  '/C '+SVN_HOME+'\svn.exe --username ' + User + ' --password ' + Pass + ' --trust-server-cert --non-interactive --no-auth-cache info ' + SVNUrl + ' > "'+SVNInfoFile+'"';
  if (DEBUG_CMD > 0) then MsgBox(CmdParam, mbInformation, MB_OK);

  if not ShellExec('', ExpandConstant('{cmd}'), CmdParam, SRCFolder, SW_HIDE, ewWaitUntilTerminated, ErrorCode) then
  begin
    ErrorMsg := SysErrorMessage(ErrorCode);
    MsgBox(ErrorMsg, mbError, MB_OK);
  end;

  FileStringList := TStringList.Create;
  LineParams := TStringList.Create;
  FileStringList.LoadFromFile(SVNInfoFile);
  for Line := 0 to FileStringList.Count - 1 do
  begin
    LineParams.Clear;
    Split(FileStringList[Line], ':', LineParams);
    if (Trim(LineParams[0]) = 'Path') then
    begin
      SVNInfoList[SVN_INFO_PATH] := Trim(LineParams[1]);
    end;
    if (Trim(LineParams[0]) = 'URL') then
    begin
      SVNInfoList[SVN_INFO_URL] := Join(LineParams, ':', 1, LineParams.Count);
    end;
    if (Trim(LineParams[0]) = 'Repository Root') then
    begin
      SVNInfoList[SVN_INFO_REPOSITORY_ROOT] := Join(LineParams, ':', 1, LineParams.Count);
    end;
    if (Trim(LineParams[0]) = 'Repository UUID') then
    begin
      SVNInfoList[SVN_INFO_REPOSITORY_UUID] := Trim(LineParams[1]);
    end;
    if (Trim(LineParams[0]) = 'Revision') then
    begin
      SVNInfoList[SVN_INFO_REVISION] := Trim(LineParams[1]);
    end;
    if (Trim(LineParams[0]) = 'Node Kind') then
    begin
      SVNInfoList[SVN_INFO_NODE_KIND] := Trim(LineParams[1]);
    end;
    if (Trim(LineParams[0]) = 'Last Changed Author') then
    begin
      SVNInfoList[SVN_INFO_LAST_CHANGED_AUTHOR] := Trim(LineParams[1]);
    end;    
    if (Trim(LineParams[0]) = 'Last Changed Rev') then
    begin
      SVNInfoList[SVN_INFO_LAST_CHANGED_REV] := Trim(LineParams[1]);
    end;    
    if (Trim(LineParams[0]) = 'Last Changed Date') then
    begin
      SVNInfoList[SVN_INFO_LAST_CHANGED_DATE] := Join(LineParams, ':', 1, LineParams.Count);
    end;    
  end;

  LineParams.Free;

  DeleteFile(SVNInfoFile);

  Result := SVNInfoList;
end;

procedure SVNExport(SVNUrl, Revision, Folder, User, Pass: String);
var
  CmdParam : String;
  ErrorCode : Integer;
  ErrorMsg : String;
  SRCFolder : String;
begin
  SRCFolder := ExpandConstant('{src}');
  if ((User <> '') and (Pass <> '')) then
    CmdParam := '/C '+SVN_HOME+'\svn.exe --username '+User+' --password '+Pass + ' --trust-server-cert --non-interactive --no-auth-cache'
  else CmdParam := '/C '+SVN_HOME+'\svn.exe --trust-server-cert --non-interactive --no-auth-cache';
  if ((Revision = '') or (Revision = '0')) then 
    begin
      CmdParam := CmdParam + ' export '+SVNUrl;
    end
  else 
    begin
      CmdParam := CmdParam + ' export -r '+Revision+' '+SVNUrl;
    end

  if (Folder <> '') then CmdParam := CmdParam+' '+Folder;

  if (DEBUG_CMD > 0) then MsgBox(CmdParam, mbInformation, MB_OK);

  if not ShellExec('', ExpandConstant('{cmd}'), CmdParam, SRCFolder, SW_SHOW, ewWaitUntilTerminated, ErrorCode) then
  begin
    ErrorMsg := SysErrorMessage(ErrorCode);
    MsgBox(ErrorMsg, mbError, MB_OK);
  end;  
end;