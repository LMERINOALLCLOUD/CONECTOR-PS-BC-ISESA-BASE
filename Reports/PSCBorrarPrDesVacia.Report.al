//7227678
report 60000 "Borrar Pr. Des. vacia"
{
    Caption = 'Borrar productos descripción vacía tmp';
    UsageCategory = None;
    ProcessingOnly = true;
    UseRequestPage = false;

    var
        rItem: Record Item;

    trigger OnPostReport()
    var
    begin
        rItem.Reset();
        rItem.SetFilter("Search Description", '%1', '');
        rItem.SetRange("Producto web", true);
        rItem.SetRange(IdPS, 0);
        if rItem.FindSet() then
            rItem.deleteall(false);
    end;
}