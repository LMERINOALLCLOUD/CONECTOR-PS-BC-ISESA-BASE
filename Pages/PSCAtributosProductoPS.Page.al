//7227685
page 60000 "Atributos producto PS"
{
    Caption = 'Atributos de producto PS';
    PageType = List;
    UsageCategory = None;
    SourceTable = "Item Attribute Value Mapping";
    SourceTableView = sorting("Table ID", "No.", "Item Attribute ID") where("Table ID" = const(27));

    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Item Attribute ID"; Rec."Item Attribute ID")
                {
                    ApplicationArea = All;
                }
                field("Item Attribute Value ID"; Rec."Item Attribute Value ID")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}