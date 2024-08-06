pageextension 50222 SalesOrderListExt extends "Sales Order List"
{
    layout
    {
        addbefore(Control1902018507)
        {
            part(salesOrderWorkDescription; "Sales Order Work Description")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No."),
                              "Document Type" = field("Document Type");
            }
        }
    }
}

page 50222 "Sales Order Work Description"
{
    Caption = 'Work Description';
    DeleteAllowed = false;
    InsertAllowed = false;
    LinksAllowed = false;
    PageType = CardPart;
    SourceTable = "Sales Header";

    layout
    {
        area(content)
        {
            field(WorkDescription; WorkDescription)
            {
                ApplicationArea = All;
                Importance = Additional;
                MultiLine = true;
                ShowCaption = false;
            }
        }
    }

    var
        WorkDescription: Text;

    trigger OnAfterGetRecord()
    begin
        WorkDescription := '';
        if Rec."Work Description".HasValue then
            WorkDescription := Rec.GetWorkDescription();
    end;
}
