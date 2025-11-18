//7227683
tableextension 60009 T7002SalesPriceExtension extends "Sales Price"
{
    fields
    {

    }

    trigger OnModify()
    var
        rItem: Record item;
        cuSincroPS: Codeunit PSSincro;
    begin
        if "Unit Price" <> xRec."Unit Price" then begin
            IF rItem.GET("Item No.") THEN BEGIN
                IF rItem.IdPs > 0 THEN BEGIN
                    cuSincroPS.insertarOperacionActTarifa(rItem.IdPs);
                END;
            END;
        end;
    end;

    trigger OnDelete()
    var
        rItem: Record item;
        cuSincroPS: Codeunit PSSincro;
    begin

        IF rItem.GET("Item No.") THEN BEGIN
            IF rItem.IdPs > 0 THEN BEGIN
                cuSincroPS.insertarOperacionActTarifa(rItem.IdPs);
            END;
        END;
    end;

}