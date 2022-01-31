Program Lab_8;
{The program for calculating boolean expressions.}

//Console application
{$APPTYPE CONSOLE}

Uses
  SysUtils;

//Declaration of varibles
Var
  S,SCopy:String;
  {S - Variable for entering a string
  SCopy - Variable for copying a string}

//Subprogram for finding operation
Procedure FindOperat (Expr:String; Var Operat:String; Var FirstOper:Integer);
Var
  Count,i:Integer;
  {Expr - Expression
  Operat - Operation
  FirstOper - First operation
  Count - Count of brackets
  i - Cycle parameter}
  
Begin
  Count:=0;
  For i:=1 to Length(Expr) do
    Case Expr[i] of
      '(': Inc(Count);
      ')': Dec(Count);
      'O':
        If Count = 0 then
        Begin
          Operat:='Or';
          FirstOper:=i;
        End;
      'A':
        If Count = 0 then
        Begin
          Operat:='And';
          FirstOper:=i;
        End;
    End;
End;

//Subprogram for calculation expression
Function Calculate (Expr:String):Boolean;
Var
  Expr1,Expr2,Operat:String;
  FirstOper:Integer;
  Temp: Boolean;
  {Expr - Expression
  Result - Result of function
  Expr1,Expr2 - Strings for calculation
  Operat - Operation
  FirstOper - First operation
  Temp - Buffer varible}

Begin
  Case Expr[1] of
    'T': Result:=True;
    'F': Result:=False;
    '(':
      Begin
        Delete(Expr,1,1);
        Delete(Expr,Length(Expr),1);
        If Pos('N',Expr) = 1 then
        Begin
          Delete(Expr,1,1);
          Temp:=Calculate(Expr);
          Result:= Not Temp;
        End
        Else
        Begin
          FindOperat(Expr, Operat, FirstOper);
          Expr1:=Copy(Expr,1,FirstOper-1);
          Expr2:=Copy(Expr,FirstOper+1,Length(Expr)-FirstOper+1);
          If Operat = 'Or' then
            Result:=Calculate(Expr1) or Calculate(Expr2)
          Else
            Result:=Calculate(Expr1) and Calculate(Expr2);
        End;
        End;
      End;
End;

//Subprogram for to verify that the string is correct
Function isValid (Var S:String):Boolean;
Var
  i,Count:Integer;
  F:Boolean;
  {S - The string to be validated
  Result - Result of function
  i - Cycle parameter
  Count - Count of brackets
  F - Flag}

Begin
  S:=StringReplace(S, ' ', '', [rfReplaceAll, rfIgnoreCase]);
  S:=StringReplace(S, 'False', 'F', [rfReplaceAll, rfIgnoreCase]);
  S:=StringReplace(S, 'True', 'T', [rfReplaceAll, rfIgnoreCase]);
  S:=StringReplace(S, 'Not', 'N', [rfReplaceAll, rfIgnoreCase]);
  S:=StringReplace(S, 'And', 'A', [rfReplaceAll, rfIgnoreCase]);
  S:=StringReplace(S, 'Or', 'O', [rfReplaceAll, rfIgnoreCase]);

  Count:=0;
  F:=True;
  For i:=1 to Length(S) do
    If S[i]='(' then
      Inc(Count)
    Else
      If S[i]=')' then
      Begin
        Dec(Count);
        If Count<0 then
          F:=False;
      End;
      Result:=F and (Count=0);
End;

Begin
  Writeln('Enter expression:');
  Readln(S);
  SCopy:=S;
  If IsValid(S) then
    Writeln(SCopy,'=',Calculate(S))
  Else
    Writeln('Invalid expression!');
  Readln
End.
 