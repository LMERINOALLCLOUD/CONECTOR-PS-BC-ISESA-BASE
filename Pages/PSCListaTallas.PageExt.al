pageextension 60002 "PSC Lista Tallas" extends "Lista tallas"
{
    layout
    {
        addafter(Descripcion)
        {
            field("Id Atributo PS"; Rec."Id Atributo PS")
            {
                ApplicationArea = All;
            }
        }
    }
}