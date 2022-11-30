@AbapCatalog.sqlViewName: 'ZCDSUX403LIST05'
@EndUserText.label: 'UX403 Basic List Report'
@UI.headerInfo.typeNamePlural: 'Sales Orders'
@OData.publish: true

define view ZCDS_UX403_LIST_05 as select from SEPM_I_SalesOrder {
   @UI.lineItem: [{position: 10 }]
   key SalesOrder as SalesOrderID,
   @UI.lineItem: [{position: 20 }]
   _Customer.BusinessPartner as CustomerID,
   @UI.lineItem: [{position: 30 }]
   _Customer.CompanyName as CustomerName,
   @UI.lineItem: [{position: 40 }]
   GrossAmountInTransacCurrency as GrossAmount,
   @UI.lineItem: [{position: 50 }]
   NetAmountInTransactionCurrency as NetAmount,
   @UI.lineItem: [{position: 60 }]
   @UI.lineItem.importance: #LOW
   @Semantics.amount.currencyCode: 'Currency'
   cast ( GrossAmountInTransacCurrency - NetAmountInTransactionCurrency as zux403_tax_amount_05 ) as TaxAmount,
   
   @Semantics.currencyCode: true
   @UI.hidden: true
   TransactionCurrency as Currency
}
