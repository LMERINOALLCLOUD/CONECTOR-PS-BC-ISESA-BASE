pageextension 60000 "PSC Units of measure" extends "Units of Measure"
{
    layout
    {
        addafter(Description)
        {
            field(IdPS; Rec.IdPS)
            {
                ApplicationArea = All;
            }
        }
    }
}