tableextension 60011 "PS Unit of Measure" extends "Unit of Measure"
{
    fields
    {
        field(60000; "IdPS"; Integer)
        {
            DataClassification = ToBeClassified;
            Caption = 'Prestashop ID', comment = 'ESP="ID Prestashop"';
        }
    }
    trigger OnDelete()
    begin
        TestField("IdPS", 0);
    end;
}