//7227678
pageextension 60008 P22CustomerListExtension extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {
            field(fechaAltaClientePS; Rec.fechaAltaClientePS)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(IdClientePS; Rec.IdClientePS)
            {
                ApplicationArea = All;
                Editable = false;
            }
            field(EsClientePS; Rec.EsClientePS)
            {
                ApplicationArea = All;
                Editable = false;
            }
        }
    }

    actions
    {
    }
}