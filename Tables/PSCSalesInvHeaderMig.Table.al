table 60000 "PSC Sales Inv. Header Mig"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Sales Inv. No."; Code[20])
        {
            Caption = 'Sales Inv. No.';
            DataClassification = ToBeClassified;
        }
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
            CaptionML = ESP = 'Estado Pedido PS', ENU = 'PS Order Status';
        }

        field(60006; "Desc. Estado Pedido PS"; Text[50])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Desc. Estado Pedido PS', ENU = 'PS Order Status Desc.';
            //falta calcformula tabla de estados pedidos

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

    keys
    {
        key(PK; "Sales Inv. No.")
        {
            Clustered = true;
        }
    }
}