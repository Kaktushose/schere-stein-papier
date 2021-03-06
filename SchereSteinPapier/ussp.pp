unit ussp;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
	ExtCtrls, uspiel;

type

	{ TFSSP }

  TFSSP = class(TForm)
		BSpielen : TButton;
		BNeu : TButton;
		LEGesamtG : TLabeledEdit;
		LEGewinner : TLabeledEdit;
		LEPunkteC : TLabeledEdit;
		LEPunkteS : TLabeledEdit;
		RGComputer : TRadioGroup;
		RGSpieler : TRadioGroup;
	procedure BNeuClick(Sender : TObject);
 procedure BSpielenClick(Sender : TObject);
  procedure FormCreate(Sender : TObject);
		procedure FormDestroy(Sender : TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  FSSP : TFSSP;
  oSpiel : TSpiel;

implementation

{$R *.lfm}

{ TFSSP }

procedure TFSSP.FormCreate(Sender : TObject);
begin
  oSpiel := TSpiel.Create;
end;

procedure TFSSP.BSpielenClick(Sender : TObject);
begin
	if oSpiel.sGibGewnnierG = '' then
	begin
	  if RGSpieler.ItemIndex =-1 then
	  begin
	    LEGewinner.Text := 'Bitte Auswählen';
		end
	  else
	  begin
	    //Eingabe
	    oSpiel.SetzeSpielerzug(RGSpieler.ItemIndex);
	    //Ausgabe
	    RGComputer.ItemIndex := oSpiel.iGibComputerzug;
	    LEPunkteS.Text := IntToStr(oSpiel.iGibSpielerpunkte);
	    LEPunkteC.Text := IntToStr(oSpiel.iGibComputerpunkte);
	    LEGewinner.Text := oSpiel.sGibGewinnerE;
	    LEGesamtG.Text := oSpiel.sGibGewnnierG;
		end;
	end;
end;

procedure TFSSP.BNeuClick(Sender : TObject);
begin
  oSpiel.NeuesSpiel;
  LEGewinner.Text := '';
  LEGesamtG.Text := '';
  LEPunkteS.Text := '';
  LEPunkteC.Text := '';
  RGComputer.ItemIndex := -1;
  RGSpieler.ItemIndex := -1;
end;

procedure TFSSP.FormDestroy(Sender : TObject);
begin
  oSpiel.Destroy;
  oSpiel:=nil;
  oSpiel.free;
end;

end.

