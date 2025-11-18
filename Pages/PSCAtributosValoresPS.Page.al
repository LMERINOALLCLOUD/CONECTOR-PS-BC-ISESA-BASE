//7227684
page 60002 "Atributos valores PS"
{
    Caption = 'Atributos valores PS';
    PageType = List;
    UsageCategory = None;
    SourceTable = "Item Attribute Value";

    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field("Attribute ID"; Rec."Attribute ID")
                {
                    ApplicationArea = All;
                }
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                }
                field(Value; Rec.Value)
                {
                    ApplicationArea = All;
                }
                field(IdPs; Rec.IdPs)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}