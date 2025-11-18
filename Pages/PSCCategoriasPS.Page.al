//7227682
page 60003 "Categorias PS"
{
    Caption = 'Categorias PS';
    PageType = List;
    UsageCategory = None;
    SourceTable = "Item Category";

    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = true;

    layout
    {
        area(Content)
        {
            repeater(general)
            {
                field(Code; Rec.Code)
                {
                    ApplicationArea = All;
                }
                field("Parent Category"; Rec."Parent Category")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Indentation; Rec.Indentation)
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