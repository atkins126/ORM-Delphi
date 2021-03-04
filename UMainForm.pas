unit UMainForm;

interface

uses
  UORM,
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls;

type
  TFMain = class(TForm)
    DBGrid1: TDBGrid;
    FDConnection1: TFDConnection;
    FDQListagem: TFDQuery;
    DataSource: TDataSource;
    edtIdCurso: TEdit;
    edtCurso: TEdit;
    btAdd: TButton;
    FDQComandos: TFDQuery;
    btDelete: TButton;
    btUpdate: TButton;
    procedure btAddClick(Sender: TObject);
    Procedure BdCall;
    procedure DataSourceDataChange(Sender: TObject; Field: TField);
    procedure btDeleteClick(Sender: TObject);
    procedure btUpdateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    idcursobd, cursobd: String;
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}

procedure TFMain.BdCall;
begin
  idcursobd := FDQListagem.FieldByName('IDCURSO').AsString;
  cursobd := FDQListagem.FieldByName('CURSO').AsString;
  edtIdCurso.Text := idcursobd;
  edtCurso.Text := cursobd;

end;

procedure TFMain.btAddClick(Sender: TObject);
var
  Obj: TCursoSQL;
begin
  Obj := TCursoSQL.Create;
  Obj.Conexao := FDConnection1;
  Obj.IdCurso := strtoint(edtIdCurso.Text);
  Obj.Descricao := edtCurso.Text;
  Obj.Insert;
  FDQListagem.Close;
  FDQListagem.Open;
  Obj.Free;
end;

procedure TFMain.btDeleteClick(Sender: TObject);
var
  Obj: TCursoSQL;
begin
  Obj := TCursoSQL.Create;
  Obj.Conexao := FDConnection1;
  Obj.Delete(idcursobd.ToInteger());
  FDQListagem.Close;
  FDQListagem.Open;
  Obj.Free;
end;

procedure TFMain.btUpdateClick(Sender: TObject);
var
  Obj: TCursoSQL;
begin
  Obj := TCursoSQL.Create;
  Obj.Conexao := FDConnection1;
  Obj.Update(idcursobd.ToInteger(), edtCurso.Text);
  FDQListagem.Close;
  FDQListagem.Open;
  Obj.Free;
end;

procedure TFMain.DataSourceDataChange(Sender: TObject; Field: TField);
begin
  BdCall;
end;

end.
