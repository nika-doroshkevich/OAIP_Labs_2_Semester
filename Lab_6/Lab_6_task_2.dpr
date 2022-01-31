Program Lab_6_ppp;
{This program compare two sorts (Selected
and binary inserts) by rewrites}

//Console application
{$APPTYPE CONSOLE}

//Declaration of types
Type
  TArray = Array [1..3000] of Integer;
  TSize = Array [1..6] of Integer;
  TResult = Array [1..6, 1..6] of Integer;
  TMode = (Rand, Sorted, Reverse);
  {TArray - Type of array that will be sorted
  TSize - Type to write in bodrs of sortings
  TMode - Type how set array
  TResult - Type of array, that contain result of sotrings}

//Declaration of varibles
Var
  MainArr: TArray;
  SizeArr: TSize = (100,250,500,1000,2000,3000);
  ResultTable: TResult;
  i: Integer;
  {MainArr - array, that will be set and sort
  SizeArr - Array with bodrs
  ResultTable - Array with results of sortings
  i - Cycle's parameter}

//Subprogram for setting array sorted to the border
Procedure Init (Var Arr: TArray; Size: Integer; Mode: TMode);
Var
  i: Integer;
  {Arr - Array that will set sorted
  Size - Bord of setting array
  Mode - According this parameters procedure set array
  i - Cycle's parameter}

Begin
  If Mode = Rand then
    For i:=1 to Size do
      Arr[i]:=Random(Size)
  Else
    If Mode = Sorted then
      For i:=1 to Size do
        Arr[i]:=i
    Else
      For i:=1 to Size do
        Arr[i]:=Size-i+1;
End;

//Subprogram for sorting array by Selected sort
Procedure SelectedSort(Var Arr; Size: Integer; Var Count: Integer);
Type
  TArray = Array [1..3000] of Integer;
Var
  i,j,Temp,Ind: Integer;
  {Arr - Array that will set sorted
  Size - Bord of setting array
  Count - Amount of rewrites
  i, j - Cycle's parameters
  Temp - Variable to save element to change
  Ind - Variable to help sorting}

Begin
  Count:=0;
  For i:=1 to Size-1 do
  Begin
    Ind:=i;
    For j:=i+1 to Size do
      If TArray(Arr)[ind] > TArray(Arr)[j] then
        Ind:=j;
    Inc(Count);
    Temp:=TArray(Arr)[i];
    TArray(Arr)[i]:=TArray(Arr)[Ind];
    TArray(Arr)[Ind]:=Temp;
  End;
End;

//Subprogram for sorting array by Binary inserts sort
Procedure BinaryInsertsSort (Var Arr: TArray; Size: Integer; Var Count: Integer);
Var
  i,j,Left,Right,Elem,Mid: Integer;
  {Arr - Array that will set sorted
  Size - Bord of setting array
  Count - Amount of rewrites
  i, j - Cycle's parameters
  Left - Left bord
  Right - Right bord
  Elem - Variable to help sorting
  Mid - Middle element}

Begin
  Count:=0;
  For i:=2 to Size do
  Begin
    Elem:=Arr[i];
    Left:=1;
    Right:=i;
    While Left < Right do
    Begin
      Mid:=(Left+Right) div 2;
      If Arr[Mid]<Elem then
        Left:=Mid+1
      Else
        Right:=Mid;
    End;

    For j:=i downto Right+1 do
    Begin
      Arr[j]:=Arr[j-1];
      Inc(Count);
    End;
    Arr[Right]:=Elem;
    Inc(Count, 2);
  End;
End;

//Subprogram for filling results
Procedure Output (Arr: TResult; Size: TSize);
Var
  i,j: Integer;
  {Arr - Array to output
  Size - Bord to sort arrays
  i, j - Cycle's parameters}

Begin
  Writeln('Size | Type    | Selected Sort | Binary Inserts Sort');
  For j:= 1 to 52 do
    Write('-');
  Writeln;
  For i:= 1 to 6 do
  Begin
    Writeln(Size[i]:4,' | Rand    | ',Arr[i,1]:13,' | ',Arr[i,4]:19);
    Writeln(Size[i]:4,' | Sorted  | ',Arr[i,2]:13,' | ',Arr[i,5]:19);
    Writeln(Size[i]:4,' | Reverse | ',Arr[i,3]:13,' | ',Arr[i,6]:19);
    For j:= 1 to 52 do
      Write('-');
    Writeln;
  End;
End;

Begin
  Randomize;
  For i:=1 to 6 do
  Begin
    Init(MainArr, SizeArr[i], Rand);
    SelectedSort(MainArr, SizeArr[i], ResultTable[i,1]);

    Init(MainArr, SizeArr[i], Sorted);
    SelectedSort(MainArr, SizeArr[i], ResultTable[i,2]);

    Init(MainArr, SizeArr[i], Reverse);
    SelectedSort(MainArr, SizeArr[i], ResultTable[i,3]);

    Init(MainArr, SizeArr[i], Rand);
    BinaryInsertsSort(MainArr, SizeArr[i], ResultTable[i,4]);

    Init(MainArr, SizeArr[i], Sorted);
    BinaryInsertsSort(MainArr, SizeArr[i], ResultTable[i,5]);
    
    Init(MainArr, SizeArr[i], Reverse);
    BinaryInsertsSort(MainArr, SizeArr[i], ResultTable[i,6]);
  End;
  Output(ResultTable, SizeArr);
  Readln
End.
