//7227679
report 60001 "Ejec. Sincronizacion FTP img"
{
    Caption = 'Ejecutar sincronización imágenes desde el FTP';
    UsageCategory = None;
    ProcessingOnly = true;
    UseRequestPage = false;

    var
        rSalesSetup: Record "Sales & Receivables Setup";

    trigger OnPostReport()
    var
    begin
        rSalesSetup.Get();
        rSalesSetup."Sincronizar imagenes FTP" := true;
        //NUEVA FUNCIONALIDAD DE CHEQUEO DE REFERENCIAS PS
        rSalesSetup."Check referencias PS" := true;
        rSalesSetup.Modify();
    end;
}