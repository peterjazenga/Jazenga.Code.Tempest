unit mainform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, LResources, Forms, Controls, Graphics, Dialogs,
  StdCtrls, EditBtn, ExtCtrls,
  fpspreadsheetchart, fpspreadsheetgrid,
  TAGraph, TASeries;

type
  
  { TFPSChartForm }

  TFPSChartForm = class(TForm)
    Bevel1: TBevel;
    btnCreateGraphic: TButton;
    btnLoadSpreadsheet: TButton;
    editSourceFile: TFileNameEdit;
    Label1: TLabel;
    Label2: TLabel;
    editXAxis: TLabeledEdit;
    EditYAxis: TLabeledEdit;
    MyChart: TChart;
    FPSChartSource: TsWorksheetChartSource;
    MyChartBarSeries1: TBarSeries;
    WorksheetGrid: TsWorksheetGrid;
    procedure btnCreateGraphicClick(Sender: TObject);
    procedure btnLoadSpreadsheetClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end; 

var
  FPSChartForm: TFPSChartForm; 

implementation

uses
  // FPSpreadsheet and supported formats
  fpspreadsheet, xlsbiff8, xlsbiff5, xlsbiff2, xlsxooxml, fpsopendocument;

{$R *.lfm}

{ TFPSChartForm }

procedure TFPSChartForm.btnCreateGraphicClick(Sender: TObject);
begin
  FPSChartSource.LoadPropertiesFromStrings(editXAxis.Text, editYAxis.Text, '', '', '');
  FPSChartSource.LoadFromWorksheetGrid(WorksheetGrid);
end;

procedure TFPSChartForm.btnLoadSpreadsheetClick(Sender: TObject);
begin
  WorksheetGrid.LoadFromSpreadsheetFile(editSourceFile.Text);
end;

procedure TFPSChartForm.FormCreate(Sender: TObject);
begin
  editSourceFile.InitialDir := ExtractFilePath(ParamStr(0));
  // Property Text is not published in older versions of Lazarus
  editSourceFile.Text := 't1.xls';
end;

initialization
  // Property Text is not published in older versions of Lazarus
  RegisterPropertyToSkip(TFileNameEdit, 'Text', 'Not used in Laz 1.0', '');

end.

