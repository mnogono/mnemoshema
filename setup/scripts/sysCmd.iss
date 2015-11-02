[Code]
//each system module has function Initialize[module name]
//each Initialize function must be invoked in function InitializeWizard
procedure InitializeSysCmd();
begin

end;

//Execute cmd and display error if it happend
procedure ExecCmd(CmdParam : String; Folder : String; Show : Integer);
var
  ErrorCode: Integer;
  ErrorMsg : String;
begin
  if (DEBUG_CMD > 0) then MsgBox(CmdParam, mbInformation, MB_OK);

  if not ShellExec('', ExpandConstant('{cmd}'), CmdParam, Folder, Show, ewWaitUntilTerminated, ErrorCode) then
  begin
    ErrorMsg := SysErrorMessage(ErrorCode);
    MsgBox(ErrorMsg, mbError, MB_OK);
  end;
end;