pageextension 60003 "PSC Item References" extends "Item Reference Entries"
{
    layout
    {
        addafter("Item No.")
        {
            field("Habilitar en PS"; Rec."Habilitar en PS")
            {
                ApplicationArea = All;
            }
        }
    }
}