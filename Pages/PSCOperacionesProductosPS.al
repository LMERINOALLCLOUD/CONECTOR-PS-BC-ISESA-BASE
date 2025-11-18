page 60017 "Operaciones Productos PS"
{
    Caption = 'Operaciones Masivas Productos PS';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = Item;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("Item Category Code"; Rec."Item Category Code")
                {
                    ApplicationArea = All;
                }
                field("Vendor No."; Rec."Vendor No.")
                {
                    ApplicationArea = All;
                }
                field("Vendor Item No."; Rec."Vendor Item No.")
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field("Item Disc. Group"; Rec."Item Disc. Group")
                {
                    ApplicationArea = All;
                }
                field(Inventory; Rec.Inventory)
                {
                    ApplicationArea = All;
                }

                field("Base Unit of Measure"; Rec."Base Unit of Measure")
                {
                    ApplicationArea = All;
                }
                field("Unit Cost"; Rec."Unit Cost")
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
                field("Search Description"; Rec."Search Description")
                {
                    ApplicationArea = All;
                }
                field(IdPS; Rec.IdPS)
                {
                    ApplicationArea = All;
                }
                field("Producto web"; Rec."Producto web")
                {
                    ApplicationArea = All;
                }
                field(Combinacion; Rec.Combinacion)
                {
                    ApplicationArea = All;
                }
                field("Id Combinacion"; Rec."Id Combinacion")
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {

        }
    }

    actions
    {
        area(Processing)
        {
            action(MarcarPS)
            {
                ApplicationArea = All;
                Caption = 'Marcar para la venta web';
                Image = Registered;

                trigger OnAction();
                begin
                    IF CONFIRM(Text001) THEN BEGIN
                        CurrPage.SETSELECTIONFILTER(rItem);
                        IF rItem.FINDSET THEN
                            rItem.MODIFYALL("Producto web", TRUE);
                    END;
                end;
            }
            action(DesmarcarPS)
            {
                ApplicationArea = All;
                Caption = 'Desmarcar para la venta web';
                Image = Reject;

                trigger OnAction();
                begin
                    IF CONFIRM(Text002) THEN BEGIN
                        window.OPEN(TextWindow);
                        CurrPage.SETSELECTIONFILTER(rItem);
                        IF rItem.FINDSET THEN
                            REPEAT
                                rItem."Producto web" := FALSE;
                                rItem.MODIFY;
                                cuPS.insertarOperacionBajaProducto(rItem."No.");
                                window.UPDATE(1, rItem."No.");
                            UNTIL rItem.NEXT = 0;
                        window.CLOSE;
                    END;
                end;
            }
            action(SincroStock)
            {
                ApplicationArea = All;
                Caption = 'Resincronizar stock para producto';
                Image = UpdateShipment;

                trigger OnAction();
                begin
                    IF CONFIRM(Text002) THEN BEGIN
                        window.OPEN(TextWindow);
                        CurrPage.SETSELECTIONFILTER(rItem);
                        IF rItem.FINDSET THEN
                            REPEAT
                                cuPS.insertarOperacionActStock(rItem."No.");
                                window.UPDATE(1, rItem."No.");
                            UNTIL rItem.NEXT = 0;
                        window.CLOSE;
                    END;
                end;
            }
            action(SincroTarifa)
            {
                ApplicationArea = All;
                Caption = 'Resincronizar tarifas para producto';
                Image = PriceAdjustment;

                trigger OnAction();
                begin
                    IF CONFIRM(Text005) THEN BEGIN
                        window.OPEN(TextWindow);
                        CurrPage.SETSELECTIONFILTER(rItem);
                        IF rItem.FINDSET THEN
                            REPEAT
                                cuPS.insertarOperacionActTarifaNAut(rItem.IdPS);
                                window.UPDATE(1, rItem."No.");
                            UNTIL rItem.NEXT = 0;
                        window.CLOSE;
                    END;
                end;
            }
            action(SincroImg)
            {
                ApplicationArea = All;
                Caption = 'Sincronizar Imágenes';
                Image = AbsenceCategory;

                trigger OnAction();
                begin
                    IF CONFIRM(Text009) THEN BEGIN
                        window.OPEN(TextWindow);
                        CurrPage.SETSELECTIONFILTER(rItem);
                        IF rItem.FINDSET THEN
                            REPEAT
                                cuPS.insertarOperacionActImagenesProducto(rItem."No.");
                                window.UPDATE(1, rItem."No.");
                            UNTIL rItem.NEXT = 0;
                        window.CLOSE;
                    END;
                end;
            }
            action(SincroAtr)
            {
                ApplicationArea = All;
                Caption = 'Sincronizar Atributos';
                Image = Category;

                trigger OnAction();
                begin
                    rSalesSetup.Get();
                    if rSalesSetup."Sincronizar atributos" = rSalesSetup."Sincronizar atributos"::No then
                        Error(Text006);

                    IF CONFIRM(Text007) THEN BEGIN
                        window.OPEN(TextWindow);
                        CurrPage.SETSELECTIONFILTER(rItem);
                        IF rItem.FINDSET THEN
                            REPEAT
                                cuPS.insertarOperacionActualizacionAtributos(rItem."No.");
                                window.UPDATE(1, rItem."No.");
                            UNTIL rItem.NEXT = 0;
                        window.CLOSE;
                    END;
                end;
            }
            action(SincroCat)
            {
                ApplicationArea = All;
                Caption = 'Sincronizar Categorías';
                Image = Route;

                trigger OnAction();
                begin
                    rSalesSetup.Get();
                    if rSalesSetup."Sincronizar atributos" = rSalesSetup."Sincronizar categorias"::No then
                        Error(Text010);

                    IF CONFIRM(Text008) THEN BEGIN
                        window.OPEN(TextWindow);
                        CurrPage.SETSELECTIONFILTER(rItem);
                        IF rItem.FINDSET THEN
                            REPEAT
                                cuPS.insertarOperacionActualizacionCategoria(rItem."No.", rItem."Item Category Code");
                                window.UPDATE(1, rItem."No.");
                            UNTIL rItem.NEXT = 0;
                        window.CLOSE;
                    END;
                end;
            }
        }
    }

    var
        rItem: Record Item;
        rSalesSetup: Record "Sales & Receivables Setup";
        Window: Dialog;
        cuPS: Codeunit PSSincro;
        Text001: Label '¿ Está seguro de marcar el producto como venta Web ?';
        Text002: Label '¿ Esta segunro de desmarcar el producto como venta Web ? En caso afirmativo el producto se volverá a sincronizar en el próximo ciclo de forna automática si el mismo ha sido dado de alta en PS';
        Text003: Label 'Esta acción va a forzar la sincronización de stock en el siguiente ciclo ¿Desea continuar con la operación ?';
        Text004: Label 'El producto no está sincronizado con Prestashop, debe sincronizar el producto antes de realizar una resincronización';
        Text005: Label 'Esta acción va a forzar la sincronización de tarifas en el siguiente ciclo ¿Desea continuar con la operación ?';
        Text009: Label 'Esta acción va a forzar la sincronización de imágenes por FTP para el producto en el siguiente ciclo ¿Desea continuar con la operación ?';
        TextWindow: Label 'Procesando producto ############1##';
        Text006: Label 'La sincronización de atributos está desactivada, no se puede ejecutar la acción';
        Text007: Label 'Esta acción va a forzar la sincronización de características para el producto en el siguiente ciclo ¿Desea continuar con la operación ?';
        Text008: Label 'Esta acción va a forzar la sincronización de categorías para el producto en el siguiente ciclo ¿Desea continuar con la operación ?';
        Text010: Label 'La sincronización de categorías está desactivada, no se puede ejecutar la acción';


}