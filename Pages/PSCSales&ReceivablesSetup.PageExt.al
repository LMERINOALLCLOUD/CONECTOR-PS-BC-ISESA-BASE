//7227682
pageextension 60019 P459_SalesAndReceivablesSetExt extends "Sales & Receivables Setup"
{
    layout
    {
        addafter("Number Series")
        {
            group("PS Sincro")
            {
                field("Cliente tarifa web"; Rec."Cliente tarifa web")
                {
                    ApplicationArea = All;
                }
                field("Numeracion Cliente PS"; Rec."Numeracion Clientes PS")
                {
                    ApplicationArea = All;
                }
                field("Cod. Vendedor PS"; Rec."Cod. Vendedor PS")
                {
                    ApplicationArea = All;
                }
                field("Forma pago cliente PS"; Rec."Forma pago cliente PS")
                {
                    ApplicationArea = All;
                }
                field("Term. pago cliente PS"; Rec."Term. pago cliente PS")
                {
                    ApplicationArea = All;
                }
                field(SincronizacionProductos; Rec.SincronizacionProductos)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(UltimaSincroProductos; Rec.UltimaSincroProductos)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(SincronizacionTarifa; Rec.SincronizacionTarifa)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(UltimaSincroTarifa; Rec.UltimaSincroTarifa)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Sincronizar imagenes FTP"; Rec."Sincronizar imagenes FTP")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Last FTP update"; Rec."Last FTP update")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Cuenta ventas PS"; Rec."Cuenta ventas PS")
                {
                    ApplicationArea = All;
                    ToolTipML = ESP = 'Cuenta contable que se va a utilizar para las líneas del pedido en caso de que el producto vendido en PS no se encuentre en NAV',
                        ENU = 'Cuenta contable que se va a utilizar para las líneas del pedido en caso de que el producto vendido en PS no se encuentre en NAV';
                }
                field("Tipo cuenta envios"; Rec."Tipo cuenta envios")
                {
                    ApplicationArea = All;
                }
                field("Cuenta ventas envios"; Rec."Cuenta ventas envios")
                {
                    ApplicationArea = All;
                    ToolTipML = ESP = 'Cuenta contable, producto o Cargo producto que se va a utilizar para la línea de gastos de envío del pedido',
                        ENU = 'Cuenta contable, producto o Cargo producto que se va a utilizar para la línea de gastos de envío del pedido';
                }
                field("Filtro almacen inventario PS"; Rec."Filtro almacen inventario PS")
                {
                    ApplicationArea = All;
                    ToolTipML = ESP = 'Filtro tipo NAV con los almacenes que se van a utilizar para el cálculo de inventario que se va a sincronizar con PS',
                        ENU = 'Filtro tipo NAV con los almacenes que se van a utilizar para el cálculo de inventario que se va a sincronizar con PS';
                }
                field("Incluir movs. sin almacen PS"; Rec."Incluir movs. sin almacen PS")
                {
                    ApplicationArea = All;
                }
                field("Almacén pedidos PS"; Rec."Almacén pedidos PS")
                {
                    ApplicationArea = All;
                }

                field("Sincro Tarifas Automat."; Rec."Sincro Tarifas Automat.")
                {
                    ApplicationArea = All;
                }
                field("Texto linea descuento"; Rec."Texto linea descuento")
                {
                    ApplicationArea = All;
                }
                field("Serie Pedidos c.factura"; Rec."Serie Pedidos c.factura")
                {
                    ApplicationArea = All;
                }
                field("Sincronizar atributos"; Rec."Sincronizar atributos")
                {
                    ApplicationArea = All;
                }
                field("Sincronizar categorias"; Rec."Sincronizar categorias")
                {
                    ApplicationArea = All;
                }
                field("Activar productos PS"; Rec."Activar productos PS")
                {
                    ApplicationArea = All;
                    ToolTipML = ESP = 'Si se habilita esta opción los productos se activaran al crearse en PS, en caso contrario apareceran como inactivos hasta que se activen manualmente en PS',
                        ENU = 'Si se habilita esta opción los productos se activaran al crearse en PS, en caso contrario apareceran como inactivos hasta que se activen manualmente en PS';
                }
                //PERSO ELALMACENPROFESIONAL
                /*
                field("Ud Medida productos"; "Ud Medida productos")
                {
                    ApplicationArea = All;
                }
                field("Id feature Caja"; "Id feature Caja")
                {
                    ApplicationArea = All;
                }
                */

                field(licenseKey; licenseKey)
                {
                    ApplicationArea = All;
                    //MultiLine = true;
                    Editable = false;
                    CaptionML = ESP = 'License Key PS', ENU = 'License Key PS';

                    trigger OnAssistEdit()
                    var
                    begin
                        PAGE.RunModal(60103);
                        CurrPage.Update();
                    end;
                    /*
                    trigger OnValidate()
                    var
                    begin
                        CUPs.splitLicenseKey(LicenseKey, "License Key 1", "License Key 2");
                        VALIDATE("License Key 1");
                        VALIDATE("License Key 2");
                        MODIFY(TRUE);
                    end;
                    */
                }

            }

            group("PS Sincro 2")
            {
                group("Clientes Nacionales")
                {
                    CaptionML = ESP = 'Clientes nacionales', ENU = 'Clientes nacionales';

                    /*//PERSONALIZACIÓN NEOVITAL- PLANTILLAS SEGÚN ZONA
                    field("Grupo contable cl. PS"; "Grupo contable cl. PS")
                    {
                        ApplicationArea = All;
                    }
                    field("Grupo contable neg. PS"; "Grupo contable neg. PS")
                    {
                        ApplicationArea = All;
                    }
                    field("Grupo contable IVA PS"; "Grupo contable IVA PS")
                    {
                        ApplicationArea = All;
                    }
                    */
                    field("Plantilla clientes NAC"; Rec."Plantilla clientes NAC")
                    {
                        ApplicationArea = All;
                    }
                    field("Zonas PS nacional"; Rec."Zonas PS nacional")
                    {
                        ApplicationArea = All;
                        ToolTipML = ESP = 'Ids de las zonas PS separados por comas', ENU = 'Ids de las zonas PS separados por comas';
                    }
                }

                group("Clientes Nacionales esp.")
                {
                    CaptionML = ESP = 'Clientes nacionales especiales', ENU = 'Clientes nacionales especiales';

                    /*//PERSONALIZACIÓN NEOVITAL- PLANTILLAS SEGÚN ZONA
                    field("Grupo contable cl. PS nac esp"; "Grupo contable cl. PS nac esp")
                    {
                        ApplicationArea = All;
                    }
                    field("Grupo contable neg. PS nac esp"; "Grupo contable neg. PS nac esp")
                    {
                        ApplicationArea = All;
                    }
                    field("Grupo contable IVA PS nac esp"; "Grupo contable IVA PS nac esp")
                    {
                        ApplicationArea = All;
                    }
                    */
                    field("Plantilla clientes NAC esp"; Rec."Plantilla clientes NAC esp")
                    {
                        ApplicationArea = All;
                    }
                    field("Zonas PS nacional esp."; Rec."Zonas PS nacional esp.")
                    {
                        ApplicationArea = All;
                        ToolTipML = ESP = 'Ids de las zonas PS separados por comas', ENU = 'Ids de las zonas PS separados por comas';
                    }
                }

                group("Clientes UE")
                {
                    CaptionML = ESP = 'Clientes UE', ENU = 'Clientes UE';

                    /*//PERSONALIZACIÓN NEOVITAL- PLANTILLAS SEGÚN ZONA
                    field("Grupo contable cl. PS UE"; "Grupo contable cl. PS UE")
                    {
                        ApplicationArea = All;
                    }
                    field("Grupo contable neg. PS UE"; "Grupo contable neg. PS UE")
                    {
                        ApplicationArea = All;
                    }
                    field("Grupo contable IVA PS UE"; "Grupo contable IVA PS UE")
                    {
                        ApplicationArea = All;
                    }
                    */
                    field("Plantilla clientes UE"; Rec."Plantilla clientes UE")
                    {
                        ApplicationArea = All;
                    }
                    field("Zonas PS UE"; Rec."Zonas PS UE")
                    {
                        ApplicationArea = All;
                        ToolTipML = ESP = 'Ids de las zonas PS separados por comas', ENU = 'Ids de las zonas PS separados por comas';
                    }
                }

                group("Clientes No UE")
                {
                    CaptionML = ESP = 'Clientes No UE', ENU = 'Clientes No UE';

                    /*//PERSONALIZACIÓN NEOVITAL- PLANTILLAS SEGÚN ZONA
                    field("Grupo contable cl. PS no UE"; "Grupo contable cl. PS no UE")
                    {
                        ApplicationArea = All;
                    }
                    field("Grupo contable neg. PS no UE"; "Grupo contable neg. PS no UE")
                    {
                        ApplicationArea = All;
                    }
                    field("Grupo contable IVA PS no UE"; "Grupo contable IVA PS no UE")
                    {
                        ApplicationArea = All;
                    }
                    */
                    field("Plantilla clientes no UE"; Rec."Plantilla clientes no UE")
                    {
                        ApplicationArea = All;
                    }
                    field("Zonas PS no UE"; Rec."Zonas PS no UE")
                    {
                        ApplicationArea = All;
                        ToolTipML = ESP = 'Ids de las zonas PS separados por comas', ENU = 'Ids de las zonas PS separados por comas';
                    }
                }
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

                action("Marcar sinc.productos")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Marcar sincronizacion de productos', ENU = 'Marcar sincronizacion de productos';
                    Image = Reuse;

                    trigger OnAction();
                    var
                    begin
                        IF CONFIRM(Text001) THEN BEGIN
                            Rec.SincronizacionProductos := TRUE;
                            Rec.MODIFY();
                        END;
                    end;
                }

                action("Marcar sinc.tarifas")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Marcar sincronizacion de tarifas', ENU = 'Marcar sincronizacion de tarifas';
                    Image = PriceAdjustment;

                    trigger OnAction();
                    var
                    begin
                        IF CONFIRM(Text002) THEN BEGIN
                            Rec.SincronizacionTarifa := TRUE;
                            Rec.MODIFY();
                        END;
                    end;
                }

                action("EstadosPedido")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Editar estados pedido PS', ENU = 'Editar estados pedido PS';
                    Image = Status;
                    RunObject = page "Lista Estados Pedido PS";

                }

                action("Act.Inventario")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Actualizar inventario productos', ENU = 'Actualizar inventario productos';
                    Image = UpdateShipment;

                    trigger OnAction();
                    var
                        cuPS: Codeunit PSSincro;
                    begin
                        IF CONFIRM(Text003) THEN BEGIN
                            cuPS.sincronizarStockTodosProductos();
                        END;
                    end;
                }

                action("Act.Categorias")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Actualizar categorias productos', ENU = 'Actualizar categorias productos';
                    Image = Route;

                    trigger OnAction();
                    var
                        cuPS: Codeunit PSSincro;
                        rSalesSetup: Record "Sales & Receivables Setup";
                    begin
                        rSalesSetup.get();
                        if rSalesSetup."Sincronizar categorias" = rSalesSetup."Sincronizar categorias"::No then
                            Error(Text006);

                        IF CONFIRM(Text004) THEN BEGIN
                            cuPS.sincronizarCategoriasTodosProductos();
                        END;
                    end;
                }

                action("Act.Atributos")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Actualizar características productos', ENU = 'Actualizar características productos';
                    Image = Category;

                    trigger OnAction();
                    var
                        cuPS: Codeunit PSSincro;
                        rSalesSetup: Record "Sales & Receivables Setup";
                    begin
                        rSalesSetup.Get();
                        if rSalesSetup."Sincronizar atributos" = rSalesSetup."Sincronizar atributos"::No then
                            Error(Text006);

                        IF CONFIRM(Text005) THEN BEGIN
                            cuPS.sincronizarCaracteristicasTodosProductos();
                        END;
                    end;
                }

                action("Act.Imagenes")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Actualizar imágenes productos', ENU = 'Actualizar imágenes productos';
                    Image = AbsenceCategory;

                    trigger OnAction();
                    var
                        cuPS: Codeunit PSSincro;
                    begin
                        IF CONFIRM(Text008) THEN BEGIN
                            cuPS.sincronizarImagenesTodosProductos();
                        END;
                    end;
                }

                /*
                action("Act.Feature.Cajas")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Actualizar cajas productos', ENU = 'Actualizar cajas productos';
                    Image = Route;

                    trigger OnAction();
                    var
                        cuPS: Codeunit PSSincro;
                    begin
                        IF CONFIRM(Text009) THEN BEGIN
                            cuPS.sincronizaFeatureCajasTodosPr();
                        END;
                    end;
                }
                

                action("Act.GrCl")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Actualizar grupos cliente', ENU = 'Actualizar grupos cliente';
                    Image = CustomerGroup;

                    trigger OnAction();
                    var
                        cuPS: Codeunit PSSincro;
                    begin
                        IF CONFIRM(Text011) THEN BEGIN
                            cuPS.sincronizarGruposTodosClientes();
                        END;
                    end;
                }
                */

                action("Resincronizar pedido PS")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Resincronizar pedido PS', ENU = 'PS Order Resync';
                    Image = RefreshVATExemption;
                    RunObject = report "Resincronizar pedidoPS";
                }

                action("Modificar ultimo pedido PS")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Modificar ultimo id pedido PS sincronizaro', ENU = 'Modify last psId Order sync.';
                    Image = LinkAccount;
                    RunObject = report "Modificar ultimo id pedido PS";
                }
                action("Restablecer productos")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'Restablecer productos PS', ENU = 'Restablecer productos PS';
                    Image = UnLinkAccount;

                    trigger OnAction()
                    var
                        rItem: Record Item;
                    begin
                        if not Confirm('ATENCIÓN!!!! Esta acción restablecerá los IDs de producto para que se sincronicen automáticamente desde el conector PS.\TODOS LOS PRODUCTOS DEBEN ESTAR ACTIVOS EN PS PARA QUE SE SINCRONICEN DE NUEVO CORRECTAMENTE \¿Está seguro de que quiere realizar la acción?', false) then
                            exit;

                        rItem.Reset();
                        rItem.SetRange("Producto web", true);
                        if rItem.FindSet() then begin
                            rItem.ModifyAll("Producto web", false);
                        end;

                        rItem.Reset();
                        rItem.SetFilter(IdPS, '>0');
                        if rItem.FindSet() then begin
                            rItem.ModifyAll(IdPS, 0);
                        end;
                    end;
                }

                action("DESARROLLO")
                {
                    ApplicationArea = all;
                    CaptionML = ESP = 'DESARROLLO', ENU = 'DESARROLLO';
                    Image = UnLinkAccount;

                    trigger OnAction()
                    var
                        cups: codeunit PSSincro;
                    begin
                        if not Confirm('ATENCIÓN!!!! EN DESARROLLO ¿Está seguro de que quiere realizar la acción?', false) then
                            exit;

                        cups.insertCabeceraPedidoPS(6, 3, 7, 7, 'Pagos por transferencia bancar', 42, 49.35, 7, '10', 'PGTJUAHQL', Today, today);
                    end;
                }
                /* action("Refrescar datos PS")
                {
                    ApplicationArea = All;

                    trigger OnAction()
                    var
                        rItemCat: Record "Item Category";
                        rItemAtt: Record "Item Attribute";
                        rItemAttValue: Record "Item Attribute Value";
                        rCustomer: Record Customer;
                        rItem: Record Item;
                    begin
                        rItemCat.Reset();
                        if rItemCat.FindSet() then
                            rItemCat.ModifyAll(IdPs, 0);

                        if rItemAtt.FindSet() then
                            rItemAtt.ModifyAll(IdPS, 0);

                        if rItemAttValue.FindSet() then
                            rItemAttValue.ModifyAll(IdPS, 0);

                        if rCustomer.FindSet() then begin
                            rCustomer.ModifyAll(EsClientePS, false);
                            rCustomer.ModifyAll(IdClientePS, 0);
                        end;

                        if rItem.FindSet() then begin
                            rItem.ModifyAll(IdPS, 0);
                            rItem.ModifyAll("Producto web", false);
                        end;

                    end;
                } */
            }
        }
    }

    var
        Text001: TextConst ESP = 'Va a marcar la sincronizacion de productos NAV->PS durante el siguiente ciclo de sincronización, ¿ Desea continuar ?',
            ENU = 'Va a marcar la sincronizacion de productos NAV->PS durante el siguiente ciclo de sincronización, ¿ Desea continuar ?';

        Text002: TextConst ESP = 'Va a marcar la sincronizacion de tarifas NAV->PS durante el siguiente ciclo de sincronización, ¿ Desea continuar ?',
            ENU = 'Va a marcar la sincronizacion de tarifas NAV->PS durante el siguiente ciclo de sincronización, ¿ Desea continuar ?';

        Text003: TextConst ESP = 'La siguiente acción marcará sincronización de stock para todos los productos marcados como "producto web" ¿ Desea continuar ?',
            ENU = 'La siguiente acción marcará sincronización de stock para todos los productos marcados como "producto web" ¿ Desea continuar ?';
        Text004: TextConst ESP = 'La siguiente acción marcará sincronización de categorías para todos los productos marcados como "producto web" ¿ Desea continuar ?',
            ENU = 'La siguiente acción marcará sincronización de categorías para todos los productos marcados como "producto web" ¿ Desea continuar ?';
        Text005: TextConst ESP = 'La siguiente acción marcará sincronización de características para todos los productos marcados como "producto web" ¿ Desea continuar ?',
            ENU = 'La siguiente acción marcará sincronización de características para todos los productos marcados como "producto web" ¿ Desea continuar ?';
        Text006: TextConst ESP = 'La sincronización de categorías está desactivada, no se puede ejecutar la acción',
            ENU = 'La sincronización de categorías está desactivada, no se puede ejecutar la acción';
        Text007: TextConst ESP = 'La sincronización de características está desactivada, no se puede ejecutar la acción',
            ENU = 'La sincronización de características está desactivada, no se puede ejecutar la acción';
        Text008: TextConst ESP = 'La siguiente acción marcará sincronización de imágenes para todos los productos marcados como "producto web" ¿ Desea continuar ?',
            ENU = 'La siguiente acción marcará sincronización de imágenes para todos los productos marcados como "producto web" ¿ Desea continuar ?';
        Text009: TextConst ESP = 'La siguiente acción marcará sincronización de cajas para todos los productos marcados como "producto web" ¿ Desea continuar ?',
            ENU = 'La siguiente acción marcará sincronización de cajas para todos los productos marcados como "producto web" ¿ Desea continuar ?';
        Text011: TextConst ESP = 'La siguiente acción marcará sincronización de todos los grupos de precios para los clientes ¿ Desea continuar ?',
            ENU = 'La siguiente acción marcará sincronización de todos los grupos de precios para los clientes ¿ Desea continuar ?';
        licenseKey: Text;
        cuPS: Codeunit PSSincro;


    trigger OnAfterGetCurrRecord()
    var
    begin
        cuPS.combineLicenseKey(rec."License key 1", rec."License key 2", licenseKey);
    end;
}