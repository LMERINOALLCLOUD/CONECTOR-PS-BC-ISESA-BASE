pageextension 60001 "PSC Tallas Ext" extends Tallas
{
    layout
    {
        addafter("Generar EAN13")
        {
            field("Id Atributo PS"; Rec."Id Atributo PS")
            {
                ApplicationArea = All;
            }
        }
    }
}