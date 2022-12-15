codeunit 52600 "JT Event Subscriptions"
{
    [EventSubscriber(ObjectType::Codeunit, 5763, 'OnBeforeSalesLineModify', '', false, false)]
    local procedure "WhsePostShipment-OnBeforeSalesLineModify"(
            var SalesLine: Record "Sales Line";
            var WarehouseShipmentLine: Record "Warehouse Shipment Line";
            var ModifyLine: Boolean;
            Invoice: Boolean)
    var
        Item: Record "Item";
    begin
        if SalesLine.Type = SalesLine.Type::Item then
            if Item.Get(SalesLine."No.") then
                if Item.Type = Item.Type::"Non-Inventory" then begin
                    ModifyLine := false;
                end;
    end;

    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure "SalesLine-No-OnAfterValidate"(var Rec: Record "Sales Line"; var xRec: Record "Sales Line"; CurrFieldNo: Integer)
    var
        Item: Record Item;
    begin
        //<T37-F6> Sales Line - No. - OnAfterValidate field trigger event
        if Rec.Type = Rec.Type::Item then begin
            Item.Get(Rec."No.");
            if Item.Type = Item.Type::"Non-Inventory" then
                Rec."LAX Pack" := false;
            if Item.Type = Item.Type::Service then
                Rec."LAX Pack" := false;
        end;
    end;
}