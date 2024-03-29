Program Lab_9;
{The program for formatting a file so
that each line ends with a dot or contains
exactly 60 letters, if there is no dot among them}

//Console application
{$APPTYPE CONSOLE}

//Connecting modules
Uses
  SysUtils;

//Declaration of varibles
Var
  Str: String;
  FMain: Text;
  {Str - String
  FMain - File}

//Subprogram for transfer text of file to string
Function FileToStr (Var F: Text): String;
Var
  TextS, TempS: String;
  {F - File
  FileToStr - Parameter that returns the contents of the file
  TextS - Variable for writing text from a file
  TempS - Auxiliary variable for writing text from a file}

Begin
  TextS := '';
  Reset(F); // �������� ����� �� ������

  While Not EOF(F) do
  Begin
    Readln(F, TempS); //�������� �� ����� � ���������� TempS
    TextS := TextS + TempS;
  End;
  Close(F); //������� ����
  FileToStr := TextS;
End;

Procedure ChangeStr (Var F: Text; TextS: String);
Var
  i, CountLet: Integer;
  {F - File
  TextS -  The string that will be modified
  i - Loop parameter
  CountLet - Letter count}

Begin

  Rewrite(F); //������� ���� �� ������
  CountLet := 0;
  For i:=1 to Length(TextS) do
    If TextS[i] = '.' then
    Begin
      Writeln(F, TextS[i]);
      If TextS[i+1] = ' ' then
        Delete(TextS,i,1);
      CountLet:=0
    End
    Else
    Begin
      If  CountLet = 60 then
      Begin
        Writeln(F);
        CountLet := 0;
      End;
      Write(F, TextS[i]);
      Inc(CountLet);
    End;
  Close(F); //������� ����
End;

Begin
  Assign(FMain, 'Main.txt');
  Str:= FileToStr(FMain);
  ChangeStr(FMain,Str);
End.
