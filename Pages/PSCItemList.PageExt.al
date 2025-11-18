//7227680
pageextension 60012 P31ItemListExtension extends "Item List"
{
    layout
    {
        addlast(Control1)
        {
            field(IdPS; Rec.IdPS)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field("Producto web"; Rec."Producto web")
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
    }
}