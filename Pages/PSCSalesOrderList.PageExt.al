//7227683
pageextension 60021 P9305_SalesOrderListExtension extends "Sales Order List"
{
    layout
    {
        addafter("Campaign No.")
        {
            field(EsPedidoPS; Rec.EsPedidoPS)
            {
                ApplicationArea = All;
                StyleExpr = StyleText;
            }
            field(IdPedidoPS; Rec.IdPedidoPS)
            {
                ApplicationArea = All;
                StyleExpr = StyleText;
            }
            field("Estado Pedido PS"; Rec."Estado Pedido PS")
            {
                ApplicationArea = All;
                StyleExpr = StyleText;
            }
            field("Desc. Estado Pedido PS"; Rec."Desc. Estado Pedido PS")
            {
                ApplicationArea = All;
                StyleExpr = StyleText;
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetRecord()
    begin
        StyleText := CUPS.getStyleTextOrderStatus(Rec."Estado Pedido PS", Rec."Tienda PS");
    end;

    var
        StyleText: Text;
        CUPS: codeunit PSSincro;
}