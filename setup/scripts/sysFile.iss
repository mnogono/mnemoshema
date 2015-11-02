[Code]

procedure InitializeSysFile();
begin
end;

//  Replace all SearchFor into ReplaceWith in FileName file
procedure FindAndReplaceInFile(SearchFor : String; ReplaceWith : String; FileName: String);
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


procedure ListFolders(const Directory: string; Folders: TStrings);
var
  FindRec: TFindRec;
begin
  Folders.Clear;
  if FindFirst(ExpandConstant(Directory + '*'), FindRec) then
  try
    repeat
      if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY > 0 then
        begin
          if (FindRec.Name = '.') then continue;
          if (FindRec.Name = '..') then continue;
          if (Pos('.', FindRec.Name) = 1) then continue;
          Folders.Add(FindRec.Name);
        end;
    until
      not FindNext(FindRec);
  finally
    FindClose(FindRec);
  end;
end;

procedure ListFiles(const Directory: string; Files: TStrings);
var
  FindRec: TFindRec;
begin
  Files.Clear;
  if FindFirst(ExpandConstant(Directory + '*'), FindRec) then
  try
    repeat
      if FindRec.Attributes and FILE_ATTRIBUTE_DIRECTORY = 0 then
        begin
          Files.Add(FindRec.Name);
        end;
    until
      not FindNext(FindRec);
  finally
    FindClose(FindRec);
  end;
end;


