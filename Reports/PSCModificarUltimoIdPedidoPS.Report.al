//7227681
report 60003 "Modificar ultimo id pedido PS"
{
    Caption = 'Modificar ultimo id pedido PS sincronizado"';
    UsageCategory = None;
    ProcessingOnly = true;
    UseRequestPage = true;

    requestpage
    {
        SaveValues = false;
        layout
        {
            area(Content)
            {
                group(Options)
                {
                    Caption = 'Opciones';
                    field(idPedidoSincronizar; ultimoIdPedidoSincronizado)
                    {
                        ApplicationArea = All;
                        Caption = 'Ultimo Id Pedido PS';
                    }
                }
            }
        }
    }

    var
        rSalesSetup: Record "Sales & Receivables Setup";
        ultimoIdPedidoSincronizado: Integer;

    trigger OnPostReport()
    var
    begin
        if Confirm('Esto puede afectar a la sincronización de pedidos de PS, ¿Desea continuar?') then begin
            rSalesSetup.Get();
            rSalesSetup."Id pedido PS ultimo" := ultimoIdPedidoSincronizado;
            rSalesSetup.Modify();
        end;
    end;
}