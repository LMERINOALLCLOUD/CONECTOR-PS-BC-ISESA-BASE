codeunit 60002 "PSC Migration"
{
    Permissions = tabledata 112 = rmid;
    trigger OnRun()
    begin
        migrarDatosSalesInvHeader();
        Message('Proceso finalizado');
    end;

    procedure migrarDatosSalesInvHeader()
    var
        rSalesInvHeaderMig: Record "PSC Sales Inv. Header Mig";
        rSalesInvHeader: Record "Sales Invoice Header";
        window: Dialog;
    begin
        rSalesInvHeaderMig.Reset();

        if rSalesInvHeaderMig.FindSet() then begin
            window.OPEN('Procesando factura: ############1##');
            repeat
                if rSalesInvHeader.Get(rSalesInvHeaderMig."Sales Inv. No.") then begin
                    window.UPDATE(1, rSalesInvHeader."No.");
                    rSalesInvHeader.IdPedidoPS := rSalesInvHeaderMig.IdPedidoPS;
                    rSalesInvHeader.EsPedidoPS := rSalesInvHeaderMig.EsPedidoPS;
                    rSalesInvHeader.TotalPSIva := rSalesInvHeaderMig.TotalPSIva;
                    rSalesInvHeader.TotalPCIva := rSalesInvHeaderMig.TotalPCIva;
                    rSalesInvHeader.TotalEnvioPSiva := rSalesInvHeaderMig.TotalEnvioPSiva;
                    rSalesInvHeader."Estado Pedido PS" := rSalesInvHeaderMig."Estado Pedido PS";
                    rSalesInvHeader."Desc. Estado Pedido PS" := rSalesInvHeaderMig."Desc. Estado Pedido PS";
                    rSalesInvHeader."Ref. pedido PS" := rSalesInvHeaderMig."Ref. pedido PS";
                    rSalesInvHeader."Nº seguimiento PS" := rSalesInvHeaderMig."Nº seguimiento PS";
                    rSalesInvHeader."Tienda PS" := rSalesInvHeaderMig."Tienda PS";
                    rSalesInvHeader.TotalDescuentos := rSalesInvHeaderMig.TotalDescuentos;
                    rSalesInvHeader.Modify();
                end;
            until rSalesInvHeaderMig.Next() = 0;
            window.Close();
        end;
    end;
}