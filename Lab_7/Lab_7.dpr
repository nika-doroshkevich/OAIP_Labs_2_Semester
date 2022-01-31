Program Lab_7;
{The program to search for all breath consonants
that are not included in only one word.}

//Console application
{$APPTYPE CONSOLE}

//Connecting modules
Uses
  SysUtils, Windows;

//Declaration of types
Type
  TLetters = Set of Char;

//Declaration of varibles
Var
  InputS: String;
  //Variable for entering a string

//Subprogram for to verify that the string is correct
Function IsValid(S:String): Boolean;
Var
  i, CountZap: Integer;
  {S - The string to be validated
  i - Cycle parameter
  CountZap - Count of commas}
Begin
  CountZap:=0;
  For i:=1 to Length(S) do
    If S[i]=',' then
      Inc(CountZap);
  Result:=(CountZap>0) and (S[Length(S)]='.');
End;

//Subprogram for finding all breath consonants
//that are not included in only one word
Function Search(S:String): TLetters;
Var
  A, B: TLetters;
  Temp: TLetters;
  First, i: Integer;
  Word: String;
  {S - The string that will be searched
  A - Main set
  B - Set that have a result
  Temp - Auxiliary set
  First - First word
  i - Cycle parameter
  Word - Auxiliary string}
Begin
  A:=['ê','ï','ñ','ò','ô','õ','ö','÷','ø','ù'];
  B:=[];
  S[Length(S)]:=',';

  First:=Pos(',', S);
  While First<>0 do
  Begin
    Word:=Copy(S, 1, First-1);
    Delete(S,1,First);
    Temp:=[];
    For i:=1 to First do
      Temp:=Temp + [Word[i]];

    B:=B*Temp+(A-Temp);
    A:=A*Temp;
    First:=Pos(',', S);
  End;
  Result:=B;
End;

//Subprogram for outputing the set
Procedure Print(Mnoz:TLetters);
Var
  i: Integer;
  {Mnoz - Set for outputing
  i - Cycle parameter}
Begin
  Writeln('All breath consonants that are not included in only one word:');
  Write('[ ');
  For i:=Ord('à') to Ord('ÿ') do
    If(Chr(i) in Mnoz) then
      Write(Chr(i),' ');
  Writeln(']');
End;

Begin
  //Cyrillic connection
  SetConsoleCP(1251);
  SetConsoleOutPutCP(1251);

  //Input a string
  Repeat
    Writeln('Input string:');
    Readln(InputS);
  Until IsValid(InputS);

  Print(Search(InputS));
  Readln
End.
