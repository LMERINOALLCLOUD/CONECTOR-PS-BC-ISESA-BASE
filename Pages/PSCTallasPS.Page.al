page 60004 "PSC Tallas PS"
{
    Caption = 'Tallas PS';
    PageType = List;
    UsageCategory = None;
    SourceTable = Talla;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Cod. talla"; Rec."Cod. talla")
                {
                    ApplicationArea = All;
                }
                field(Descripcion; Rec.Descripcion)
                {
                    ApplicationArea = All;
                }
                field(Orden; Rec.Orden)
                {
                    ApplicationArea = All;
                }
                field("Id Atributo PS"; Rec."Id Atributo PS")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}