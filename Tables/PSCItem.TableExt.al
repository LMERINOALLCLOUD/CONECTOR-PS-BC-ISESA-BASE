//7227678
tableextension 60002 T27ItemExtension extends Item
{
    fields
    {
        field(60000; "Producto web"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Producto web', ENU = 'Web Item';
        }
        field(60001; IdPS; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Id PS', ENU = 'PS Id';
        }
        field(60002; "Descripcion larga PS"; text[250])
        {
            CaptionML = ESP = 'Descripción larga PS', ENU = 'PS description';
            DataClassification = ToBeClassified;
        }

        field(60003; "Combinacion"; Boolean)
        {
            Caption = 'Producto combinado PS';
            DataClassification = ToBeClassified;
        }
        field(60004; "Id Combinacion"; Integer)
        {
            Caption = 'Id Combinación PS';
            DataClassification = ToBeClassified;
        }        


        //perso MEP
        /*
        field(60005; "Uds. Por Caja"; Integer)
        {
            Caption = 'Unidades por caja';
            DataClassification = ToBeClassified;
            trigger OnValidate()
            var
                cups: Codeunit PSSincro;
            begin
                if Rec.IdPS > 0 then begin
                    cups.insertarOperacionActBUnitOfMeasure(Rec."No.");
                    cups.insertarOperacionActFeatureCajas(Rec."No.");
                end;
            end;
        }
        */

    }

}
