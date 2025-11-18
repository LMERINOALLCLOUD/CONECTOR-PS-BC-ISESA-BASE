//7227681
tableextension 60010 T222ShipToAddressExtension extends "Ship-to Address"
{
    fields
    {
        field(60000; "IdDireccionPS"; Integer)
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Id dirección PS', ENU = 'PS address Id';
        }

        field(60001; "id_zona"; Text[30])
        {
            DataClassification = ToBeClassified;
            CaptionML = ESP = 'Id zona PS', ENU = 'PS zone Id';
        }
    }

}