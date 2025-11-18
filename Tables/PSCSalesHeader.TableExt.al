//7227679
tableextension 60007 T36_SalesHeaderExtension extends "Sales Header"
{
    fields
    {
        field(60000; "IdPedidoPS"; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Id Pedido PS', ENU = 'PS Order Id';
        }

        field(60001; "EsPedidoPS"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Pedido PS', ENU = 'PS Order';
        }

        field(60002; "TotalPSIva"; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Total pedido s/iva', ENU = 'Order total wo/taxes';
        }

        field(60003; "TotalPCIva"; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Total pedido c/iva', ENU = 'Order total w/taxes';
        }

        field(60004; "TotalEnvioPSiva"; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Total envío s/iva', ENU = 'Shipping total wo/taxes';
        }

        field(60005; "Estado Pedido PS"; Code[10])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Relacion de estados pedido PS" where("Tienda PS" = field("Tienda PS"));

            //IF (Type=CONST(" ")) "Standard Text" ELSE IF (Type=CONST(G/L Account),System-Created Entry=CONST(No)) "G/L Account" WHERE (Direct Posting=CONST(Yes),Account Type=CONST(Posting),Blocked=CONST(No)) ELSE IF (Type=CONST(G/L Account),System-Created Entry=CONST(Yes)) "G/L Account" ELSE IF (Type=CONST(Resource)) Resource ELSE IF (Type=CONST(Fixed Asset)) "Fixed Asset" ELSE IF (Type=CONST("Charge (Item)")) "Item Charge" ELSE IF (Type=CONST(Item)) Item
            CaptionML = ESP = 'Estado Pedido PS', ENU = 'PS Order Status';
            trigger OnValidate()
            var
                CUPs: Codeunit PSSincro;
            begin
                //aquí codigo para insertar la operación asíncrona
                CUPs.insertarOperacionActEstPedido(IdPedidoPS, "Estado Pedido PS");
            end;
        }
        field(60006; "Desc. Estado Pedido PS"; Text[50])
        {
            CaptionML = ESP = 'Desc. Estado Pedido PS', ENU = 'PS Order Status Desc.';
            FieldClass = FlowField;
            CalcFormula = lookup("Relacion de estados pedido PS".nombreEstadoPS where(idEstadoPS = field("Estado Pedido PS"), "Tienda PS" = field("Tienda PS")));
        }

        field(60007; "Ref. pedido PS"; Text[30])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Ref. pedido PS', ENU = 'PS Order Reference';
        }

        field(60008; "Nº seguimiento PS"; Text[30])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Nº seguimiento PS', ENU = 'PS Tracking No.';

            trigger OnValidate()
            var
                CUPs: Codeunit PSSincro;
            begin
                IF IdPedidoPS <> 0 THEN
                    IF "Nº seguimiento PS" <> xRec."Nº seguimiento PS" THEN BEGIN
                        //INNSincro QUITAMOS EL INICIO DE LA URL ANTES DE PASAR A PRESTASHOP
                        //v1.0.0.19
                        CUPs.insertarOperacionActSegPedido(IdPedidoPS, CUPs.quitarInicioURL("Nº seguimiento PS"));
                    END;
            end;
        }

        field(60009; "TotalDescuentos"; Decimal)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Total descuentos pedido PS', ENU = 'PS Order total discounts';
        }
        field(60010; "Tienda PS"; Enum "PSC Tienda PS")
        {
            Caption = 'Tienda PS';
            DataClassification = ToBeClassified;
        }
    }
}