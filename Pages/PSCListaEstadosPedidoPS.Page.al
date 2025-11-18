//7227679
page 60015 "Lista Estados Pedido PS"
{
    CaptionML = ESP = 'Lista Estados Pedido PS', ENU = 'PS Order State List';
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "Relacion de estados pedido PS";
    SourceTableView = WHERE("Tienda PS"=filter("PSC Tienda PS"::FYR));
    DeleteAllowed = false;
    InsertAllowed = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idEstadoPS; Rec.idEstadoPS)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(nombreEstadoPS; Rec.nombreEstadoPS)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(moduloPagoPS; Rec.moduloPagoPS)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(formaPagoNAV; Rec.formaPagoNAV)
                {
                    ApplicationArea = All;
                }
                field("Error Pago"; Rec."Error Pago")
                {
                    ApplicationArea = All;
                }
                field("Pte Pago"; Rec."Pte Pago")
                {
                    ApplicationArea = All;
                }
                field(Lanzado; Rec.Lanzado)
                {
                    ApplicationArea = All;
                }
                field(Registrado; Rec.Registrado)
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