program SimpleSourceDemo;

{$MODE Delphi}

{%File 'readme.txt'}

uses
  Forms, Interfaces,
  Main in 'Main.pas' {Form1};

{.$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'Simple Source Demo';
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.