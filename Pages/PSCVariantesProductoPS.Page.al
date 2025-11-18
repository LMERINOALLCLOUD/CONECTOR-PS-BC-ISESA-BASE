page 60006 "PSC Variantes producto PS"
{
    Caption = 'Variantes producto PS';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Item Variant";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}