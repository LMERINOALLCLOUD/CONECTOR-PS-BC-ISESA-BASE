//7227682
tableextension 60006 T311SalesReceivablesSetExt extends "Sales & Receivables Setup"
{
    fields
    {
        field(60000; "Cliente tarifa web"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Cliente para web', ENU = 'PS Web customer';
            TableRelation = Customer;
        }

        field(60001; "Numeracion Clientes PS"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Numeración para clientes web', ENU = 'Web cust. series No.';
            TableRelation = "No. Series";
        }

        field(60002; "Cod. Vendedor PS"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Cód. vendedor PS', ENU = 'PS Salesman Code';
            TableRelation = "Salesperson/Purchaser";
        }
        //NO SE USA
        field(60003; "Grupo contable cliente PS"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Grupo contable cliente PS', ENU = 'Cust. posting group PS';
            TableRelation = "Customer Posting Group";
        }
        //NO SE USA
        field(60004; "Grupo contable negocio PS"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Id dirección PS', ENU = 'PS address Id';
            TableRelation = "Gen. Business Posting Group";
        }

        field(60005; "Forma pago cliente PS"; Code[10])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Forma pago cliente PS', ENU = 'PS customer payment method';
            TableRelation = "Payment Method";
        }

        field(60006; "Term. pago cliente PS"; Code[10])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Term. pago cliente PS', ENU = 'PS customer payment terms';
            TableRelation = "Payment Terms";
        }

        field(60007; "SincronizacionTarifa"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Sincronización tarifas', ENU = 'Sales price sync.';
        }

        field(60008; "SincronizacionProductos"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Sincronización productos', ENU = 'Item sync.';
        }

        field(60009; "UltimaSincroTarifa"; DateTime)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Últ. sincro tarifas', ENU = 'Sales price last sync.';
        }

        field(60010; "UltimaSincroProductos"; DateTime)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Últ. sincro productos', ENU = 'Items last sync.';
        }

        field(60011; "Cuenta ventas PS"; Code[20])
        {
            //PSSINCRO para los productos que no estén sincronizados
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Cuenta ventas PS', ENU = 'PS Sales g/l account';
            TableRelation = "G/L Account";
        }

        //to-do incluir cargo/producto en tipo cuenta envios
        field(60012; "Tipo cuenta envios"; Option)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Tipo cuenta envios PS', ENU = 'PS shipment type account';
            OptionMembers = Cuenta,Producto,"Cargo(Producto)";
        }

        field(60013; "Cuenta ventas envios"; Code[20])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Cuenta envios PS', ENU = 'PS shipping account';
            TableRelation = if ("Tipo cuenta envios" = const(Cuenta)) "G/L Account"."No."
            else
            if ("Tipo cuenta envios" = const(Producto)) Item."No."
            else
            if ("Tipo cuenta envios" = const("Cargo(Producto)")) "Item Charge"."No.";
        }

        field(60014; "Filtro almacen inventario PS"; Text[100])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Filtro almacen inventario PS', ENU = 'PS location inventory filter';
        }

        field(60015; "Incluir movs. sin almacen PS"; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Incluir movs. sin almacen PS', ENU = 'Include empty location entries';
        }

        field(60016; "Id pedido PS ultimo"; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Ultimo ID pedido PS sincronizado', ENU = 'Last PS order ID sync.';
        }

        field(60017; "Grupo contable cl. PS nac esp"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Posting Group";
        }

        field(60018; "Grupo contable neg. PS nac esp"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Business Posting Group";
        }

        field(60019; "Grupo contable IVA PS nac esp"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Business Posting Group";
        }

        field(60020; "Zonas PS nacional esp."; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(60021; "Grupo contable cl. PS"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Posting Group";
        }

        field(60022; "Grupo contable neg. PS"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Business Posting Group";
        }

        field(60023; "Grupo contable IVA PS"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Business Posting Group";
        }

        field(60024; "Zonas PS nacional"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(60025; "Grupo contable cl. PS UE"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Posting Group";
        }

        field(60026; "Grupo contable neg. PS UE"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Business Posting Group";
        }

        field(60027; "Grupo contable IVA PS UE"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Business Posting Group";
        }

        field(60028; "Zonas PS UE"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(60029; "Grupo contable cl. PS no UE"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Customer Posting Group";
        }

        field(60030; "Grupo contable neg. PS no UE"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Gen. Business Posting Group";
        }

        field(60031; "Grupo contable IVA PS no UE"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "VAT Business Posting Group";
        }

        field(60032; "Zonas PS no UE"; Text[100])
        {
            DataClassification = ToBeClassified;
        }

        field(60033; "Texto linea descuento"; Text[50])
        {
            DataClassification = ToBeClassified;
        }

        field(60034; "Sincro Tarifas Automat."; Boolean)
        {
            DataClassification = ToBeClassified;
        }

        field(60035; "Serie Pedidos s.factura"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
        }

        field(60036; "Serie Pedidos c.factura"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "No. Series";
            Caption = 'Nº Serie pedidos';
        }

        field(60037; "License key 1"; text[250])
        {
            DataClassification = ToBeClassified;
        }

        field(60038; "License key 2"; text[250])
        {
            DataClassification = ToBeClassified;
        }
        field(60039; "Almacén pedidos PS"; Code[20])
        {
            CaptionML = ESP = 'Almacén pedidos PS';
            DataClassification = ToBeClassified;
            TableRelation = Location;
        }
        field(60040; "Sincronizar atributos"; Option)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Sincronizar atributos', ENU = 'Attribute Sync.';
            OptionMembers = No,Si,Automatica;
            OptionCaptionML = ESP = 'No,Sí,Automática', ENU = 'No,Yes,Automatic';
        }
        field(60041; "Sincronizar categorias"; Option)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Sincronizar categorías', ENU = 'Category Sync.';
            OptionMembers = No,Si,Automatica;
            OptionCaptionML = ESP = 'No,Sí,Automática', ENU = 'No,Yes,Automatic';
        }
        //PERSO ELALMACENDELPROFESIONAL
        field(60042; "Ud Medida productos"; Code[10])
        {
            Caption = 'Ud. Medida defecto productos web';
            DataClassification = ToBeClassified;
            TableRelation = "Unit of Measure";
        }
        field(60043; "Activar productos PS"; Option)
        {
            CaptionML = ESP = 'Activar productos en PS', ENU = 'Activate PS Products';
            DataClassification = ToBeClassified;
            OptionMembers = Si,No;
            OptionCaptionML = ESP = 'Sí,No', ENU = 'Yes,No';
        }

        //PERSO SINCRONIZACIÓN IMÁGENES DESDE FTP
        field(60044; "Last FTP update"; DateTime)
        {
            CaptionML = ESP = 'Últ. actualización FTP', ENU = 'Last FTP update';
            DataClassification = ToBeClassified;
        }

        field(60054; "Sincronizar imagenes FTP"; Boolean)
        {
            CaptionML = ESP = 'Sincronizar imágenes FTP', ENU = 'Sincronize FTP images';
            DataClassification = ToBeClassified;
        }
        //personalización unidades de medida
        field(60055; "Id feature Caja"; Integer)
        {
            Caption = 'Id Feature Cajas';
            DataClassification = ToBeClassified;
        }

        //PERSONALIZACIÓN NEOVITAL- PLANTILLAS SEGÚN ZONA
        field(60056; "Plantilla clientes NAC"; Code[20])
        {
            Caption = 'Plantilla clientes NAC';
            DataClassification = ToBeClassified;
            //modificado para utilizar plantillas de cliente según recomendación de microsoft
            TableRelation = "Customer Templ.";
        }
        field(60057; "Plantilla clientes NAC esp"; Code[20])
        {
            Caption = 'Plantilla clientes NAC esp.';
            DataClassification = ToBeClassified;
            //modificado para utilizar plantillas de cliente según recomendación de microsoft
            TableRelation = "Customer Templ.";
        }
        field(60058; "Plantilla clientes UE"; Code[20])
        {
            Caption = 'Plantilla clientes UE';
            DataClassification = ToBeClassified;
            //modificado para utilizar plantillas de cliente según recomendación de microsoft
            TableRelation = "Customer Templ.";
        }
        field(60059; "Plantilla clientes no UE"; Code[20])
        {
            Caption = 'Plantilla clientes no UE';
            DataClassification = ToBeClassified;
            //modificado para utilizar plantillas de cliente según recomendación de microsoft
            TableRelation = "Customer Templ.";
        }

        field(60098; "Check referencias PS"; Boolean)
        {
            Caption = 'Check referencias PS';
            DataClassification = ToBeClassified;
        }
        field(60099; "Listado referencias PS"; Blob)
        {
            Caption = 'Listado ref. PS';
            Description = 'listado de todas las referencias existentes en PS (Activas) formato xxxx|xxxx';
            DataClassification = ToBeClassified;
        }
    }

}