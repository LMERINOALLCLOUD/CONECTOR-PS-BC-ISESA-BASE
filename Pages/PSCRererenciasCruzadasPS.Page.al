page 60005 "PSC Referencias cruzadas PS"
{
    Caption = 'Referencias cruzadas PS';
    PageType = List;
    UsageCategory = None;
    SourceTable = "Item Reference";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Variant Code"; Rec."Variant Code")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure"; Rec."Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field("Reference Type"; Rec."Reference Type")
                {
                    ApplicationArea = All;
                }
                field("Reference Type No."; Rec."Reference Type No.")
                {
                    ApplicationArea = All;
                }
                field("Reference No."; Rec."Reference No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("EAN13 Text"; Rec."EAN13 Text")
                {
                    ApplicationArea = All;
                }
                field("Cod. talla"; Rec."Cod. talla")
                {
                    ApplicationArea = All;
                }
                field("Habilitar en PS"; Rec."Habilitar en PS")
                {
                    ApplicationArea = All;
                }
                /*no existe este campo
                field("Price impact"; Rec."Price impact")
                {
                    ApplicationArea = All;
                }
                */
            }
        }
    }
}