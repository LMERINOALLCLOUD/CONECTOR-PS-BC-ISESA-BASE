//7227681
page 60010 "Edit Tracking No."
{
    Caption = 'Editar Nº de seguimiento';
    PageType = Card;
    UsageCategory = None;
    SourceTable = "Sales Header";
    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            group(licencia)
            {
                Caption = 'Seguimiento pedido PS';
                field(licenciaField; licenseKey)
                {
                    CaptionML = ESP = 'Introduzca el Nº de seguimiento', ENU = 'Enter the tracking No.';
                    ApplicationArea = All;
                    //si lo ponemos multiline no hace el validate ni modifica el valor de la variable

                    trigger OnValidate()
                    begin

                    end;
                }
            }
        }
    }

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    var
    begin
        rec.validate("Nº seguimiento PS", licenseKey);
        rec.Modify();
    end;

    trigger OnOpenPage()
    var
    begin
        licenseKey := rec."Nº seguimiento PS";
    end;

    var
        licenseKey: text;
}