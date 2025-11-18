//7227677
pageextension 60006 P21CustomerCardExtension extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group("PS Sincro")
            {
                CaptionML = ESP = 'PS Sincro', ENU = 'PS Sync';
                field(IdClientePS; Rec.IdClientePS)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field(fechaAltaClientePS; Rec.fechaAltaClientePS)
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
    }
}