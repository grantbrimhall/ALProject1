report 52600 "JT Delete Serv. Packing Lines"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    ProcessingOnly = true;

    dataset
    {
        dataitem("LAX Package Line"; "LAX Package Line")
        {
            trigger OnAfterGetRecord()
            var
                Item: Record Item;
            begin
                if Item.Get("No.") then
                    if Item.Type = Item.Type::Service then begin
                        i += 1;
                        if not Preview then
                            Delete(false);
                    end;
            end;

            trigger OnPreDataItem()
            begin
                SetFilter(Type, '%1', "LAX Package Line".Type::Item);
                SetFilter("No.", 'AZ*');
                i := 0;
            end;

            trigger OnPostDataItem()
            begin
                if Confirm('%1 records will be deleted ...', false, i) then;
                if not Preview then
                    Message('Records Deleted.');
            end;
        }
    }

    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                    field(Preview; Preview)
                    {
                        ApplicationArea = All;

                    }
                }
            }
        }

        // actions
        // {
        //     area(processing)
        //     {
        //         action(ActionName)
        //         {
        //             ApplicationArea = All;

        //         }
        //     }
        // }

        trigger OnInit()
        begin
            Preview := true;
        end;
    }

    var
        Preview: Boolean;
        i: integer;

}