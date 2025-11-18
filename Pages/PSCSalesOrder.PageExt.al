//7227681
pageextension 60020 T42SalesOrderExtension extends "Sales Order"
{
    layout
    {
        addbefore(SalesLines)
        {
            group("PS Sincro")
            {
                field(EsPedidoPS; Rec.EsPedidoPS)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(IdPedidoPS; Rec.IdPedidoPS)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Ref. pedido PS"; Rec."Ref. pedido PS")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Estado Pedido PS"; Rec."Estado Pedido PS")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.Update();
                    end;
                }
                field("Desc. Estado Pedido PS"; Rec."Desc. Estado Pedido PS")
                {
                    ApplicationArea = All;
                }
                field("Nº seguimiento PS"; Rec."Nº seguimiento PS")
                {
                    Editable = false;
                    ApplicationArea = All;
                    //v.1.0.0.19
                    ExtendedDatatype = URL;
                    //lo movemos a un action porque sino no funciona la url
                    /*trigger OnAssistEdit()
                    begin
                        RunModal(60104, Rec);
                        CurrPage.Update();
                    end;
                    */
                }
                group("Informacion importes pedido")
                {
                    CaptionML = ESP = 'Importes del pedido PS', ENU = 'PS Order Amounts';
                    field(TotalPSIva; Rec.TotalPSIva)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(TotalEnvioPSiva; Rec.TotalEnvioPSiva)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                    field(TotalPCIva; Rec.TotalPCIva)
                    {
                        ApplicationArea = All;
                        Editable = false;
                    }
                }
            }
        }
    }

    actions
    {
        //el numero de seguimiento se actualize en el onValidate de la tabla
        addafter(Action21)
        {
            group("PS sincro actions")
            {
                CaptionML = ESP = 'PS Sincro', ENU = 'PS Sync.';
                Visible = true;
                action("Actualizar seguimiento")
                {
                    ApplicationArea = All;
                    Image = Track;

                    trigger OnAction()
                    begin
                        RunModal(page::"Edit Tracking No.", Rec);
                        CurrPage.Update();
                    end;
                }
            }
        }
    }
}