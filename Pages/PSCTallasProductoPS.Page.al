page 60007 "PSC Tallas Producto PS"
{
    Caption = 'Tallas Producto PS';
    PageType = List;
    UsageCategory = None;
    SourceTable = "Talla producto";

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
                field(IdAtributoPS; IdAtributoPS)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    var
        rTalla: Record Talla;
    begin
        IdAtributoPS := 0;
        IF rTalla.GET(Rec."Cod. talla") THEN
            IdAtributoPS := rTalla."Id atributo PS";
    end;

    var
        IdAtributoPS: Integer;
}