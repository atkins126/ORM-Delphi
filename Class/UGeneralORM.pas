unit UGeneralORM;

interface

uses
  UTypeDataFieldORM, System.SysUtils, System.Classes, System.UITypes;

Type
  Table = class // Table
  private
    FName: TStringFieldORM;
    function getTableName: TStringFieldORM;
    procedure setTableName(const Value: TStringFieldORM);
  public
    constructor Create(aName: TStringFieldORM);
    property Name: TStringFieldORM read getTableName write setTableName;
  end;

  Field = class // Field ( Table )
  private
    FName: TStringFieldORM;
  public
    function getFieldName: TStringFieldORM;
    procedure setFieldName(Const Value: TStringFieldORM);
    Constructor Create(aName: TStringFieldORM);
    property Name: TStringFieldORM read getFieldName write setFieldName;
  end;

implementation

{ Table }

constructor Table.Create(aName: TStringFieldORM);
begin
  FName := aName;
end;

function Table.getTableName: TStringFieldORM;
begin
  Result := FName;
end;

procedure Table.setTableName(const Value: TStringFieldORM);
begin
  FName := Value;
end;

{ Field }

constructor Field.Create(aName: TStringFieldORM);
begin
  FName := aName;
end;

function Field.getFieldName: TStringFieldORM;
begin
  Result := FName;
end;

procedure Field.setFieldName(const Value: TStringFieldORM);
begin
  FName := Value;
end;

end.
