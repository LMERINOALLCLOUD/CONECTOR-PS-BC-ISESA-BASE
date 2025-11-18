//7227679
pageextension 60011 T30ItemCardExtension extends "Item Card"
{
    layout
    {
        addafter(ItemTracking)
        {
            group("PS Sincro")
            {
                field("Producto web"; Rec."Producto web")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(IdPS; Rec.IdPS)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                /*
                field("Descripcion larga PS"; Rec."Descripcion larga PS")
                {
                    ApplicationArea = All;
                    MultiLine = true;
                }
                */
                /*no los usa isesa
                field(Combinacion; Rec.Combinacion)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Id Combinacion"; Rec."Id Combinacion")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                */
                /*
                field("Uds. Por Caja"; "Uds. Por Caja")
                {
                    ApplicationArea = All;
                }
                */
            }

        }
    }

    actions
    {
        addlast(navigation)
        {
            group("PS Sincro actions")
            {
                CaptionML = ESP = 'PS Sincro', ENU = 'PS Sync.';
                Visible = true;

                action("MarcaPS")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Marcar para la venta Web', ENU = 'Marcar para la venta Web';
                    Image = Registered;

                    trigger OnAction();
                    var
                    begin
                        IF CONFIRM(Text001) THEN BEGIN
                            Rec."Producto web" := TRUE;
                            Rec.MODIFY();
                        END;
                    end;
                }

                action("DesmarcaPS")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Desmarcar para la venta Web', ENU = 'Desmarcar para la venta Web';
                    Image = Reject;

                    trigger OnAction();
                    var
                        CuPS: Codeunit PSSincro;
                    begin
                        IF CONFIRM(Text002) THEN BEGIN
                            CuPS.insertarOperacionBajaProducto(rec."No.");
                            Rec.IdPs := 0;
                            Rec."Producto web" := FALSE;
                            Rec.MODIFY();
                        END;
                    end;
                }
                action("SincroStock")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Resincronizar stock para producto', ENU = 'Resincronizar stock para producto';
                    Image = UpdateShipment;

                    trigger OnAction();
                    var
                        CuPS: Codeunit PSSincro;
                    begin
                        IF CONFIRM(Text003) THEN
                            IF Rec.IdPs > 0 THEN
                                CuPS.insertarOperacionActStock(Rec."No.")

                            ELSE
                                ERROR(Text004);
                    end;
                }

                action("SincroCategorias")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Resincronizar categorias producto', ENU = 'Resincronizar categorias producto';
                    Image = Route;

                    trigger OnAction();
                    var
                        CuPS: Codeunit PSSincro;
                        rSalesSetup: Record "Sales & Receivables Setup";
                    begin
                        rSalesSetup.Get();
                        if rSalesSetup."Sincronizar categorias" = rSalesSetup."Sincronizar categorias"::No then
                            Error(Text007);

                        IF CONFIRM(Text005) THEN
                            IF Rec.IdPs > 0 THEN
                                CuPS.insertarOperacionActualizacionCategoria(Rec."No.", Rec."Item Category Code")
                            ELSE
                                ERROR(Text004);
                    end;
                }

                action("SincroCaracteristicas")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Resincronizar características producto', ENU = 'Resincronizar características producto';
                    Image = Category;

                    trigger OnAction();
                    var
                        CuPS: Codeunit PSSincro;
                        rSalesSetup: Record "Sales & Receivables Setup";
                    begin
                        rSalesSetup.Get();
                        if rSalesSetup."Sincronizar atributos" = rSalesSetup."Sincronizar atributos"::No then
                            Error(Text008);

                        IF CONFIRM(Text006) THEN
                            IF Rec.IdPs > 0 THEN
                                CuPS.insertarOperacionActualizacionAtributos(Rec."No.")
                            ELSE
                                ERROR(Text004);
                    end;
                }

                action("Sincroimagenes")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Resincronizar imágenes producto', ENU = 'Resincronizar imágenes producto';
                    Image = AbsenceCategory;

                    trigger OnAction();
                    var
                        CuPS: Codeunit PSSincro;
                    begin

                        IF CONFIRM(Text009) THEN
                            IF Rec.IdPs > 0 THEN
                                CuPS.insertarOperacionActImagenesProducto(Rec."No.")
                            ELSE
                                ERROR(Text004);
                    end;
                }
                action("SincroAtributos")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Resincronizar atributos producto', ENU = 'Resincronizar atributos producto';
                    Image = Route;

                    trigger OnAction();
                    var
                        CuPS: Codeunit PSSincro;
                        rSalesSetup: Record "Sales & Receivables Setup";
                    begin
                        rSalesSetup.Get();

                        IF CONFIRM(Text011) THEN
                            IF Rec.IdPs > 0 THEN
                                CuPS.insertarOperacionActAttributos(Rec."No.")
                            ELSE
                                ERROR(Text004);
                    end;
                }
                /*
                action("Act.Feature.Cajas")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Actualizar cajas', ENU = 'Actualizar cajas';
                    Image = Route;

                    trigger OnAction();
                    var
                        cuPS: Codeunit PSSincro;
                    begin
                        IF CONFIRM(Text010) THEN BEGIN
                            IF IdPs > 0 THEN begin
                                cuPS.insertarOperacionActFeatureCajas(Rec."No.");
                                cuPS.insertarOperacionActBUnitOfMeasure(Rec."No.");
                            end else
                                Error(Text004);
                        END;
                    end;
                }
                */
            }
        }
    }

    var
        Text001: TextConst ESP = '¿ Está seguro de marcar el producto como venta Web ?', ENU = '¿ Está seguro de marcar el producto como venta Web ?';
        Text002: TextConst ESP = '¿ Esta segunro de desmarcar el producto como venta Web ? En caso afirmativo el producto se volverá a sincronizar en el próximo ciclo de forna automática si el mismo ha sido dado de alta en PS',
            ENU = '¿ Esta segunro de desmarcar el producto como venta Web ? En caso afirmativo el producto se volverá a sincronizar en el próximo ciclo de forna automática si el mismo ha sido dado de alta en PS';
        Text003: TextConst ESP = 'Esta acción va a forzar la sincronización de stock en el siguiente ciclo ¿Desea continuar con la operación ?',
            ENU = 'Esta acción va a forzar la sincronización de stock en el siguiente ciclo ¿Desea continuar con la operación ?';
        Text004: TextConst ESP = 'El producto no está sincronizado con Prestashop, debe sincronizar el producto antes de realizar una resincronización',
            ENU = 'El producto no está sincronizado con Prestashop, debe sincronizar el producto antes de realizar una sincronización de stock';
        Text005: TextConst ESP = 'Esta acción va a forzar la sincronización de categorías para el producto en el siguiente ciclo ¿Desea continuar con la operación ?',
            ENU = 'Esta acción va a forzar la sincronización de categorías para el producto en el siguiente ciclo ¿Desea continuar con la operación ?';
        Text006: TextConst ESP = 'Esta acción va a forzar la sincronización de características (atributos) para el producto en el siguiente ciclo ¿Desea continuar con la operación ?',
            ENU = 'Esta acción va a forzar la sincronización de categorías características (atributos) para el producto en el siguiente ciclo ¿Desea continuar con la operación ?';
        Text007: TextConst ESP = 'La sincronización de categorías está desactivada, no se puede ejecutar la acción',
            ENU = 'La sincronización de categorías está desactivada, no se puede ejecutar la acción';
        Text008: TextConst ESP = 'La sincronización de características está desactivada, no se puede ejecutar la acción',
            ENU = 'La sincronización de características está desactivada, no se puede ejecutar la acción';
        Text009: TextConst ESP = 'Esta acción va a forzar la sincronización de imágenes por FTP para el producto en el siguiente ciclo ¿Desea continuar con la operación ?',
            ENU = 'Esta acción va a forzar la sincronización de imágenes por FTP para el producto en el siguiente ciclo ¿Desea continuar con la operación ?';
        Text010: TextConst ESP = 'Esta acción va a forzar la sincronización de cajas para el producto en el siguiente ciclo ¿Desea continuar con la operación ?',
            ENU = 'Esta acción va a forzar la sincronización de cajas para el producto en el siguiente ciclo ¿Desea continuar con la operación ?';
        Text011: TextConst ESP = 'Esta acción va a forzar la sincronización de atributos (combinaciones) para el producto en el siguiente ciclo ¿Desea continuar con la operación ?',
            ENU = 'Esta acción va a forzar la sincronización de atributos (combinaciones) para el producto en el siguiente ciclo ¿Desea continuar con la operación ?';
}