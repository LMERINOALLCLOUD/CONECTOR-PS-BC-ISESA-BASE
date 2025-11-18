tableextension 60013 "PSC Item Reference" extends "Item Reference"
{
    fields
    {
        // Add changes to table fields here
        field(60000; "Habilitar en PS"; Boolean)
        {
            Caption = 'Habilitar en PS';
            DataClassification = ToBeClassified;
        }
    }
}