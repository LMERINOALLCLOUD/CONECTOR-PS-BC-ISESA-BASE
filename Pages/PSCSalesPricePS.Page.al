page 60022 PSCSalesPricePS
{
    Caption = 'PSC Sales Price List';
    PageType = List;
    UsageCategory = Lists;
    ApplicationArea = All;
    SourceTable = "Sales Price";

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Sales Code"; Rec."Sales Code")
                {
                    ApplicationArea = All;
                }
                field("Sales Type"; Rec."Sales Type")
                {
                    ApplicationArea = All;
                }
                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                }
                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                }
                field("Minimum Quantity"; Rec."Minimum Quantity")
                {
                    ApplicationArea = All;
                }
                field("Unit of Measure Code"; Rec."Unit of Measure Code")
                {
                    ApplicationArea = All;
                }
                field("Unit Price"; Rec."Unit Price")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    var
        rSalesSetup: Record "Sales & Receivables Setup";
        rCustomer: Record Customer;
    begin
        rSalesSetup.Get();

        if rSalesSetup."Cliente tarifa web" <> '' then begin
            rCustomer.Get(rSalesSetup."Cliente tarifa web");
            if rCustomer."Customer Price Group" <> '' then begin
                rec.SetRange("Sales Type", Rec."Sales Type"::"Customer Price Group");
                rec.setrange("Sales Code", rCustomer."Customer Price Group");
            end else begin
                rec.SetRange("Sales Type", Rec."Sales Type"::"Customer");
                rec.setrange("Sales Code", rCustomer."No.");
            end;
        end else begin
            rec.SetRange("Sales Type", Rec."Sales Type"::"All Customers");
            rec.setRange("Sales Code", '');
        end;
        // rec.SetFilter("Starting Date", '<=%1', Today);
        // rec.SetFilter("Ending Date", '<=%1|%2', Today, 0D);
        rec.SetFilter("Minimum Quantity", '>1');
    end;

}