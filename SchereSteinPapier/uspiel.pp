unit uspiel;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type

 { TSpiel }

 TSpiel = class(TObject)
   private
     iSpielerzug, iComputerzug, iSpielerpunkte, iComputerpunkte : Integer;
     sGewinnerE, sGewinnerG : string;
     procedure Auswerten;
   public
     procedure SetzeSpielerzug(iAuswahl : Integer);
     procedure NeuesSpiel;
     function iGibComputerzug : Integer;
     function iGibComputerpunkte : Integer;
     function iGibSpielerpunkte : Integer;
     function sGibGewinnerE : string;
     function sGibGewnnierG : string;
     constructor Create;
     destructor Destroy; reintroduce;
 end;

implementation

{ TSpiel }

procedure TSpiel.Auswerten;
begin
  Randomize;
  iComputerzug := random(3);

  case (iSpielerzug - (iComputerzug) + 1) of
    -2: sGewinnerE := 'Spieler';
    -1: sGewinnerE := 'Computer';
    0: sGewinnerE := 'Unentschieden';
    1: sGewinnerE := 'Spieler';
    2: sGewinnerE := 'Computer';
  end;

  if (sGewinnerE = 'Spieler') then
    begin
      iSpielerpunkte := iSpielerpunkte + 1;
	  end;
  if (sGewinnerE = 'Computer') then
    begin
      iComputerpunkte := iComputerpunkte + 1
		end;

  if iComputerpunkte = 10 then
    begin
      sGewinnerG := 'Computer';
		end;
  if iSpielerpunkte = 10 then
    begin
      sGewinnerG := 'Spieler';
		end;

end;

procedure TSpiel.SetzeSpielerzug(iAuswahl : Integer);
begin
  iSpielerzug := iAuswahl + 1;
  Auswerten;
end;

procedure TSpiel.NeuesSpiel;
begin
  iSpielerpunkte := 0;
  iComputerpunkte := 0;
  SGewinnerE := '';
  SGewinnerG := '';

end;

function TSpiel.iGibComputerzug : Integer;
begin
  Result := iComputerzug;
end;

function TSpiel.iGibComputerpunkte : Integer;
begin
  Result := iComputerPunkte;
end;

function TSpiel.iGibSpielerpunkte : Integer;
begin
  Result := iSpielerpunkte;
end;

function TSpiel.sGibGewinnerE : string;
begin
  Result := sGewinnerE;
end;

function TSpiel.sGibGewnnierG : string;
begin
  Result := sGewinnerG;
end;

constructor TSpiel.Create;
begin
  inherited Create;
end;

destructor TSpiel.Destroy;
begin
  inherited Destroy;
end;

end.

