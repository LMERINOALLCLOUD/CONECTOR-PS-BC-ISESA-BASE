//7227677
tableextension 60000 T18CustomerExtension extends Customer
{
    fields
    {
        field(60000; IdClientePS; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Id Cliente PS', ENU = 'PS Cust. Id';
        }
        field(60001; fechaAltaClientePS; DateTime)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Fecha alta PS', ENU = 'PS date add';
        }
        field(60002; IdDireccionPrincipalPS; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Id Dirección principal PS', ENU = 'PS main cust. address  Id';
        }
        field(60003; EsClientePS; Boolean)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Es Cliente PS', ENU = 'Is PS Cust.';
        }
        
    }

}