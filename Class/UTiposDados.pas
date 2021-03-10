unit UTiposDados; // Class para tratar tipos de dados //

interface

Uses
  StrUtils, System.SysUtils, System.Classes;

var
  FAssigned: Boolean;

Type
  TInteger = Class // Integer
  private
    vInteger: Integer;
    Procedure SETvInteger(const Value: Integer);
  Public
    Property Number: Integer read vInteger write SETvInteger;
  end;

Type
  TString = Class // String
  Private
    vString: String;
    Procedure SETvString(const Value: String);
  Public
    Property Word: String read vString write SETvString;
  end;

Type
  TDateTime = class // DateTime
  private
    vDateTime: Double;
    Procedure SETvDateTime(const Value: Double);
  Public
    Property DateTime: Double read vDateTime write SETvDateTime;
  end;

Type
  TDate = Class // Date
  private
    vDate: Double;
    procedure SETvDate(const Value: Double);
  public
    Property Date: Double read vDate write SETvDate;
  End;

Type
  TBoolean = Class //Boolean
  private
    vBoolean: Boolean;
    procedure SETvBoolean(const Value: Boolean);
  public
    property Boolean: Boolean read vBoolean write SETvBoolean;
  end;

implementation

{ TInteger }

procedure TInteger.SETvInteger(const Value: Integer);
begin
  if (vInteger <> Value) then
  begin
    vInteger := Value;
    FAssigned := True;
  end;
end;

{ TString }

procedure TString.SETvString(const Value: String);
begin
  if (vString <> Value) then
  begin
    vString := Value;
    FAssigned := True;
  end;
end;

{ TDateTime }

procedure TDateTime.SETvDateTime(const Value: Double);
begin
  if (vDateTime <> Value) then
  begin
    vDateTime := Value;
    FAssigned := True;
  end;
end;

{ TDate }

procedure TDate.SETvDate(const Value: Double);
begin
  if (vDate <> Value) then
  begin
    vDate := Value;
    FAssigned := True;
  end;
end;

{ TBoolean }

procedure TBoolean.SETvBoolean(const Value: Boolean);
begin
  if (vBoolean <> Value) then
  begin
    vBoolean := Value;
    FAssigned := True;
  end;

end;

end.
