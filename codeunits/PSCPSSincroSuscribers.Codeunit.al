//numeración licencia allcloud 7227677
codeunit 60001 "PS Sincro Suscribers"
{
    [EventSubscriber(ObjectType::Codeunit, 22, 'OnAfterPostItem', '', true, true)]
    local procedure OnAfterPostItemLedgerEntry(var ItemJournalLine: Record "Item Journal Line")
    var
        cuPSSincro: Codeunit PSSincro;
    begin
        IF ItemJournalLine.IsTemporary then
            exit;
        cuPSSincro.insertarOperacionActStock(ItemJournalLine."Item No.");
    end;

    [EventSubscriber(ObjectType::Codeunit, 80, 'OnAfterPostSalesDoc', '', true, true)]
    LOCAL procedure OnAfterPostSalesDoc(var SalesHeader: Record "Sales Header"; var GenJnlPostLine: Codeunit "Gen. Jnl.-Post Line"; SalesShptHdrNo: Code[20]; RetRcpHdrNo: Code[20];
        SalesInvHdrNo: Code[20]; SalesCrMemoHdrNo: Code[20]; CommitIsSuppressed: Boolean; InvtPickPutaway: Boolean)
    var
        rEstadosPS: Record "Relacion de estados pedido PS";
        cuPSSincro: Codeunit PSSincro;
    begin
        IF (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) AND (SalesHeader.IdPedidoPS > 0) THEN BEGIN
            rEstadosPS.RESET();
            rEstadosPS.SETRANGE(Registrado, TRUE);
            rEstadosPS.SETRANGE("Tienda PS", rEstadosPS."Tienda PS"::FYR);
            IF rEstadosPS.FINDFIRST() THEN begin
                cuPSSincro.insertarOperacionActEstPedido(SalesHeader.IdPedidoPS, rEstadosPS.idEstadoPS);
                SalesHeader."Estado Pedido PS" := rEstadosPS.idEstadoPS;
                SalesHeader.MODIFY();
            end;
        END;
    end;

    [EventSubscriber(ObjectType::Codeunit, 414, 'OnAfterReleaseSalesDoc', '', true, true)]
    local procedure OnAfterReleaseSalesDoc(var SalesHeader: Record "Sales Header"; PreviewMode: Boolean; var LinesWereModified: Boolean)
    var
        rEstadosPS: Record "Relacion de estados pedido PS";
        cuPSSincro: Codeunit PSSincro;
    begin
        IF (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) AND (SalesHeader.IdPedidoPS > 0) THEN BEGIN
            rEstadosPS.RESET();
            rEstadosPS.SETRANGE(rEstadosPS.Lanzado, TRUE);
            rEstadosPS.SETRANGE("Tienda PS", rEstadosPS."Tienda PS"::FYR);
            IF rEstadosPS.FINDFIRST() THEN BEGIN
                cuPSSincro.insertarOperacionActEstPedido(SalesHeader.IdPedidoPS, rEstadosPS.idEstadoPS);
                //ACTUALIZAMOS EL ESTADO DEL PEDIDO
                SalesHeader."Estado Pedido PS" := rEstadosPS.idEstadoPS;
                SalesHeader.Modify();
            END;
        END;
    end;

    [EventSubscriber(ObjectType::Table, 27, 'OnAfterValidateEvent', 'Unit Price', true, true)]
    local procedure OnAfterValidateItemTable(var Rec: Record Item; var xRec: Record Item; CurrFieldNo: Integer)
    var
        cuPS: Codeunit PSSincro;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.Get();
        if not rec.IsTemporary then begin
            if rSalesSetup."Sincro Tarifas Automat." then begin
                if Rec.IdPS > 0 then begin
                    if xRec."Unit Price" <> Rec."Unit Price" then
                        cups.insertarOperacionActTarifa(rec.IdPS);
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 27, 'OnAfterValidateEvent', 'Item Category Code', true, true)]
    local procedure OnAfterValidateItemTableCategoryCode(var Rec: Record Item; var xRec: Record Item; CurrFieldNo: Integer)
    var
        cuPS: Codeunit PSSincro;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.get();
        if rSalesSetup."Sincronizar categorias" = rSalesSetup."Sincronizar categorias"::Automatica then begin
            if Rec.IdPS > 0 then begin
                if xRec."Item Category Code" <> Rec."Item Category Code" then
                    cups.insertarOperacionActualizacionCategoria(rec."No.", Rec."Item Category Code");
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 7505, 'OnAfterInsertEvent', '', true, true)]
    local procedure OnAfterInsertEventItemAttributeValueMaping(var Rec: Record "Item Attribute Value Mapping"; RunTrigger: Boolean)
    var
        cuPS: Codeunit PSSincro;
        rItem: Record Item;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.get();
        if rSalesSetup."Sincronizar atributos" = rSalesSetup."Sincronizar atributos"::Automatica then begin
            if rec."Table ID" = 27 then begin
                rItem.Get(rec."No.");
                if rItem.IdPS > 0 then begin
                    cups.insertarOperacionActualizacionAtributos(rItem."No.");
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 7505, 'OnAfterModifyEvent', '', true, true)]
    local procedure OnAfterModifyEventItemAttributeValueMaping(var Rec: Record "Item Attribute Value Mapping"; var xRec: Record "Item Attribute Value Mapping"; RunTrigger: Boolean)
    var
        cuPS: Codeunit PSSincro;
        rItem: Record Item;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.get();
        if rSalesSetup."Sincronizar atributos" = rSalesSetup."Sincronizar atributos"::Automatica then begin
            if rec."Table ID" = 27 then begin
                if rec."Item Attribute Value ID" <> xRec."Item Attribute Value ID" then begin
                    rItem.Get(rec."No.");
                    if rItem.IdPS > 0 then begin
                        cups.insertarOperacionActualizacionAtributos(rItem."No.");
                    end;
                end;
            end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, 7505, 'OnBeforeDeleteEvent', '', true, true)]
    local procedure OnBeforeDeleteEventItemAttributeValueMaping(var Rec: Record "Item Attribute Value Mapping"; RunTrigger: Boolean)
    var
        cuPS: Codeunit PSSincro;
        rItem: Record Item;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.get();
        if rSalesSetup."Sincronizar atributos" = rSalesSetup."Sincronizar atributos"::Automatica then begin
            if rec."Table ID" = 27 then begin
                rItem.Get(rec."No.");
                if rItem.IdPS > 0 then begin
                    cups.insertarOperacionActualizacionAtributos(rItem."No.");
                end;
            end;
        end;
    end;

    //price calculation
    [EventSubscriber(ObjectType::Table, 7002, 'OnAfterInsertEvent', '', true, true)]
    local procedure OnAfterInsertEventSalesPrice(var Rec: Record "Sales Price"; RunTrigger: Boolean)
    var
        cuPS: Codeunit PSSincro;
        rItem: Record Item;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.get();
        if not rec.IsTemporary then begin
            if rSalesSetup."Sincro Tarifas Automat." then begin
                rItem.get(Rec."Item No.");
                if rItem.IdPS > 0 then begin
                    cups.insertarOperacionActTarifa(rItem.IdPS);
                end;
            end;
        end;
    end;

    /*SE ELIMINA ESTE EVENTO Y SE SUSTITUYE POR EL ONAFTERVALIDATE YA QUE ESTE A VECES NO SE LANZA AL IMPORTAR TARIFAS DESDE RAPID-START
    [EventSubscriber(ObjectType::Table, 7002, 'OnAfterModifyEvent', '', true, true)]
    local procedure OnAfterModifyEventSalesPrice(var Rec: Record "Sales Price"; var xRec: Record "Sales Price"; RunTrigger: Boolean)
    var
        cuPS: Codeunit PSSincro;
        rItem: Record Item;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.get();
        if not rec.IsTemporary then begin
            if rSalesSetup."Sincro Tarifas Automat." then begin
                rItem.get(Rec."Item No.");
                if rItem.IdPS > 0 then begin
                    if (rec."Unit Price" <> xRec."Unit Price") then
                        cups.insertarOperacionActTarifa(rItem.IdPS);
                end;
            end;
        end;
    end;
    */

    [EventSubscriber(ObjectType::Table, Database::"Sales Price", 'OnAfterValidateEvent', 'Unit Price', true, true)]
    local procedure "Sales Price_OnAfterValidateEvent_Unit Price"
    (
        var Rec: Record "Sales Price";
        var xRec: Record "Sales Price";
        CurrFieldNo: Integer
    )
    var
        cuPS: Codeunit PSSincro;
        rItem: Record Item;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.get();
        if not rec.IsTemporary then begin
            if rSalesSetup."Sincro Tarifas Automat." then begin
                rItem.get(Rec."Item No.");
                if rItem.IdPS > 0 then begin
                    if (rec."Unit Price" <> xRec."Unit Price") then
                        cups.insertarOperacionActTarifa(rItem.IdPS);
                end;
            end;
        end;
    end;


    [EventSubscriber(ObjectType::Table, 7002, 'OnBeforeDeleteEvent', '', true, true)]
    local procedure OnBeforeDeleteEventItemSalesPrice(var Rec: Record "Sales Price"; RunTrigger: Boolean)
    var
        cuPS: Codeunit PSSincro;
        rItem: Record Item;
        rSalesSetup: Record "Sales & Receivables Setup";
    begin
        rSalesSetup.get();
        if not rec.IsTemporary then begin
            if rSalesSetup."Sincro Tarifas Automat." then begin
                rItem.get(Rec."Item No.");
                if rItem.IdPS > 0 then begin
                    cups.insertarOperacionActTarifa(rItem.IdPS);
                end;
            end;
        end;
    end;

}