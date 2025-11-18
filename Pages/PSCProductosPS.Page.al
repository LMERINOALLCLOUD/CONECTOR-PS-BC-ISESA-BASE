//7227677
page 60018 "ProductosPS"
{
    Caption = 'Productos PS';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = Item;

    InsertAllowed = false;
    DeleteAllowed = false;
    ModifyAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(general)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("No. 2"; Rec."No. 2")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Description 2"; Rec."Description 2")
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field(IdPS; Rec.IdPS)
                {
                    ApplicationArea = All;
                }
                field("Producto web"; Rec."Producto web")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                }
                field(Combinacion; Rec.Combinacion)
                {
                    ApplicationArea = All;
                }
                field("Id Combinacion"; Rec."Id Combinacion")
                {
                    ApplicationArea = All;
                }
                field(Variantes; Rec.Variantes)
                {
                    ApplicationArea = All;
                }
                field(Tallas; Rec.Tallas)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {

    }
}