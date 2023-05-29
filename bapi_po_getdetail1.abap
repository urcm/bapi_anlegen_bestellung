
*bapi_po_getdetail1
* importing value(purchaseorder)  type ebeln
*  value(account_assignment)  type selkz default space
*  value(item_text)  type selkz default space
*  value(header_text)  type selkz default space
*  value(delivery_address)  type selkz default space
*  value(version)  type selkz default space
*  value(services)  type selkz default space
*  value(serialnumbers)  type selkz default space
*  value(invoiceplan)  type selkz default space
* exporting value(poheader)  type bapimepoheader
*  value(poexpimpheader)  type bapieikp
* tables return  type standard table of bapiret2 with header line optional
*  poitem  type standard table of bapimepoitem with header line optional
*  poaddrdelivery  type standard table of bapimepoaddrdelivery with header line optional
*  poschedule  type standard table of bapimeposchedule with header line optional
*  poaccount  type standard table of bapimepoaccount with header line optional
*  pocondheader  type standard table of bapimepocondheader with header line optional
*  pocond  type standard table of bapimepocond with header line optional
*  polimits  type standard table of bapiesuhc with header line optional
*  pocontractlimits  type standard table of bapiesucc with header line optional
*  poservices  type standard table of bapiesllc with header line optional
*  posrvaccessvalues  type standard table of bapiesklc with header line optional
*  potextheader  type standard table of bapimepotextheader with header line optional
*  potextitem  type standard table of bapimepotext with header line optional
*  poexpimpitem  type standard table of bapieipo with header line optional
*  pocomponents  type standard table of bapimepocomponent with header line optional
*  poshippingexp  type standard table of bapimeposhippexp with header line optional
*  pohistory  type standard table of bapiekbe with header line optional
*  pohistory_totals  type standard table of bapiekbes with header line optional
*  poconfirmation  type standard table of bapiekes with header line optional
*  allversions  type standard table of bapimedcm_allversions with header line optional
*  popartner  type standard table of bapiekkop with header line optional
*  extensionout  type standard table of bapiparex with header line optional
*  serialnumber  type standard table of bapimeposerialno with header line optional
*  invplanheader  type standard table of bapi_invoice_plan_header with header line optional
*  invplanitem  type standard table of bapi_invoice_plan_item with header line optional
*  pohistory_ma  type standard table of bapiekbe_ma with header line optional
*
*
*Documentation
*
*Detail Information for a Purchase Order
*
*Longtext Documentation  Longtext Documentation
*
*Parameters
*
*
*importing  purchaseorder   Purchasing Document Number
*importing  account_assignment   Account Assignment Data
*importing  item_text   Item Text
*importing  header_text   Header Txt
*importing  delivery_address   Delivery address
*importing  version   Version Management
*importing  services   External Service Data
*importing  serialnumbers   Serial Numbers
*importing  invoiceplan   Invoicing Plan
*exporting  poheader   Purchase Order Header Data
*exporting  poexpimpheader   Foreign Trade: Export/Import: Header Data
*tables  return   Return Parameter(s)
*tables  poitem   Purchase Order Item
*tables  poaddrdelivery   Addresses for Inward Delivery (Item)
*tables  poschedule   Delivery Schedule
*tables  poaccount   Account Assignment Fields
*tables  pocondheader   Conditions (header)
*tables  pocond   Conditions (Items)
*tables  polimits   External Services: Limits
*tables  pocontractlimits   Communication Structure: Contract Limits
*tables  poservices   Communication Structure: Create Service Line
*tables  posrvaccessvalues   External Services: Account Assignment Distribution for Servi
*tables  potextheader   Header Texts
*tables  potextitem   Item Texts
*tables  poexpimpitem   Foreign Trade: Item Data
*tables  pocomponents   BAPI Structure for Components
*tables  poshippingexp   Export Structure for Shipping Data
*tables  pohistory   Purchase Order History
*tables  pohistory_totals   Purchase Order History - Totals
*tables  poconfirmation   Vendor Confirmation
*tables  allversions   Version Data
*tables  popartner   Partner
*tables  extensionout   ExtensionOut
*tables  serialnumber   Serial Numbers in Purchase Order BAPIs
*tables  invplanheader   Invoicing Plan: Header Data
*tables  invplanitem   Invoicing Plan: Item Data
*tables  pohistory_ma   Transfer Structure for Purchase Order History Account Assign


data: lv_purchaseorder type ebeln value '4500000014'.

data: gt_poheader type bapimepoheader.

data: gt_return            type standard table of bapiret2,
      gt_poitem            type standard table of bapimepoitem,
      gt_poaddrdelivery    type standard table of bapimepoaddrdelivery,
      gt_poschedule        type standard table of bapimeposchedule,
      gt_poaccount         type standard table of bapimepoaccount,
      gt_pocondheader      type standard table of bapimepocondheader,
      gt_pocond            type standard table of bapimepocond,
      gt_polimits          type standard table of bapiesuhc,
      gt_pocontractlimits  type standard table of bapiesucc,
      gt_poservices        type standard table of bapiesllc,
      gt_posrvaccessvalues type standard table of bapiesklc.
      
     
call function 'BAPI_PO_GETDETAIL1'
  exporting
    purchaseorder     = lv_purchaseorder   " Purchasing Document Number
*   account_assignment = SPACE    " Account Assignment Data
*   item_text         = SPACE    " Item Text
*   header_text       = SPACE    " Header Txt
*   delivery_address  = SPACE    " Delivery address
*   version           = SPACE    " Version Management
*   services          = SPACE    " External Service Data
*   serialnumbers     = SPACE    " Serial Numbers
*   invoiceplan       = SPACE    " Invoicing Plan
  importing
    poheader          = gt_poheader    " Purchase Order Header Data
*   poexpimpheader    =     " Foreign Trade: Export/Import: Header Data
  tables
    return            = gt_return    " Return Parameter(s)
    poitem            = gt_poitem    " Purchase Order Item
    poaddrdelivery    = gt_poaddrdelivery   " Addresses for Inward Delivery (Item)
    poschedule        = gt_poschedule         " Delivery Schedule
    poaccount         = gt_poaccount          " Account Assignment Fields
    pocondheader      = gt_pocondheader       " Conditions (header)
    pocond            = gt_pocond             " Conditions (Items)
    polimits          = gt_polimits           " External Services: Limits
    pocontractlimits  = gt_pocontractlimits     " Communication Structure: Contract Limits
    poservices        = gt_poservices         " Communication Structure: Create Service Line
    posrvaccessvalues = gt_posrvaccessvalues    " External Services: Account Assignment Distribution for Servi
*   potextheader      =     " Header Texts
*   potextitem        =     " Item Texts
*   poexpimpitem      =     " Foreign Trade: Item Data
*   pocomponents      =     " BAPI Structure for Components
*   poshippingexp     =     " Export Structure for Shipping Data
*   pohistory         =     " Purchase Order History
*   pohistory_totals  =     " Purchase Order History - Totals
*   poconfirmation    =     " Vendor Confirmation
*   allversions       =     " Version Data
*   popartner         =     " Partner
*   extensionout      =     " ExtensionOut
*   serialnumber      =     " Serial Numbers in Purchase Order BAPIs
*   invplanheader     =     " Invoicing Plan: Header Data
*   invplanitem       =     " Invoicing Plan: Item Data
*   pohistory_ma      =     " Transfer Structure for Purchase Order History Account Assign
  .
  
  
  if  gt_poheader-po_number = lv_purchaseorder .
  cl_demo_output=>write_data( gt_return ).
  cl_demo_output=>write_data( gt_poheader ).
  cl_demo_output=>write_data( gt_poaddrdelivery ).
  cl_demo_output=>write_data( gt_poschedule ).
  cl_demo_output=>write_data( gt_poaccount ).
  cl_demo_output=>write_data( gt_pocondheader ).
  cl_demo_output=>write_data( gt_pocond ).
  cl_demo_output=>write_data( gt_polimits ).
  cl_demo_output=>write_data( gt_pocontractlimits ).
  cl_demo_output=>write_data( gt_poservices ).
  cl_demo_output=>write_data( gt_posrvaccessvalues ).
  cl_demo_output=>display( ).
else.
  message 'Es wurden keine Bestellung mit der angegebenen Nummer gefunden.' type 'I'.

endif.
