@AbapCatalog.sqlViewName: 'ZCDSUX403LINK05'
@EndUserText.label: 'UX403 navigate to external link'
@UI.headerInfo.typeNamePlural: 'Sales Orders'
@OData.publish: true

define view ZCDS_UX403_LINK_05
  as select from SEPM_I_SalesOrder
{
      @UI.lineItem.position: 10
  key SalesOrder                                                        as SalesOrderID,
      @UI.lineItem.position: 20
      _Customer.BusinessPartner                                         as CustomerID,
      @UI.lineItem.position: 30
      @UI.lineItem.url: 'SearchURL'
      @UI.lineItem.type: #WITH_URL
      _Customer.CompanyName                                             as CustomerName,
      @UI.hidden: true
      concat('https://www.google.com/search?q=', _Customer.CompanyName) as SearchURL
}
