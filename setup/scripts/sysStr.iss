[Code]

//initialize system module sysStr
procedure InitializeSysStr();
begin
end;

//split Text into tokens using Delimeter, result is Strings
procedure Split(Text : String; Delimeter : String; var Strings : TStringList);
var
  DelimeterPos : Integer;
  StartPos : Integer;
  Str : String;
begin
  DelimeterPos := Pos(Delimeter, Text);
  if (DelimeterPos = 0) then
    begin
      Strings.Add(Text);
    end
  else
    begin
      while (DelimeterPos <> 0) do
        begin
            Str := Copy(Text, 1, DelimeterPos - 1);
            Strings.Add(Str);
            Delete(Text, 1, DelimeterPos);
            DelimeterPos := Pos(Delimeter, Text);
            if (DelimeterPos = 0) then
            begin
              Strings.Add(Text);
            end;
        end;
    end;
end;

//join several string into one string, Start and Stop indexes of Strings
function Join(Strings : TStringList; Delimeter : String; Start, Stop : Integer) : String;
var
  ItToken : Integer;
  Text : String;
begin
  Result := '';
  if (Strings.Count > 0) then
    begin
      if (Stop >= Strings.Count) then
        begin
          Stop := Strings.Count - 1;
        end;

      if ((Start >= 0) and (Start <= Stop)) then
        begin
          Text := Strings[Start];
          for ItToken := Start+1 to Stop do
          begin
            Text := Text+Delimeter+Strings[ItToken];
          end;
          Result := Text;
        end;
    end;
end;