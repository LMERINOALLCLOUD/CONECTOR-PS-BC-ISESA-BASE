//7227680
page 60009 "Edit PS License Key"
{
    Caption = 'Editar PS License Key';
    PageType = Card;
    UsageCategory = None;

    layout
    {
        area(Content)
        {
            group(licencia)
            {
                Caption = 'Licencia';
                field(licenciaField; licenseKey)
                {
                    CaptionML = ESP = 'Introduzca license key PS', ENU = 'Enter license key PS';
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
        CUPs: Codeunit PSSincro;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.get();
        CUPs.splitLicenseKey(licenseKey, rSalesSetup."License key 1", rSalesSetup."License key 2");
        rSalesSetup.Modify();
    end;

    trigger OnOpenPage()
    var
        CUPs: Codeunit PSSincro;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.get();
        CUPs.combineLicenseKey(rSalesSetup."License key 1", rSalesSetup."License key 2", licenseKey);
    end;

    var
        licenseKey: text;
}