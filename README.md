# RELEASE NOTES

## 21.2.1.1/2

- added report to delete service package lines
- adjusted event subscriptions so that both did an if item.get, and both looked for service and non-inventory items.

## 21.2.1.0

- EventSubscribers provided from Lanham to prevent E-Ship from packing Non-Inventory items
  - >> "Adding these two events should prevent E-Ship from packing the Non-Inventory items but still allow them to post along with the rest of the shipment. However, the existing Sales Lines for the Non-Inventory Items will need to have the LAX Pack field cleared as well so you will need to run some code to find and clear that field." - Lanham
  - (Still need to address the LAX Pack field; either config pack or processing only report)
