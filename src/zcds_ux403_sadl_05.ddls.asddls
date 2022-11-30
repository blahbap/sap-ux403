@AbapCatalog.sqlViewName: 'ZCDSUX40305'
@UI.headerInfo.typeName: 'SalesOrder'
@UI.headerInfo.typeNamePlural: 'SalesOrders'
@UI.headerInfo.title.value: 'SalesOrderID'
@EndUserText.label: 'UX403 Generate OData Service by SADL'
@OData.publish

define view ZCDS_UX403_SADL_05 as select from SEPM_I_SalesOrder
{
 @UI.lineItem.position: 10
 key SalesOrder as SalesOrderID,
 @UI.lineItem.position: 20
 _Customer.BusinessPartner as CustomerID,
 @UI.lineItem.position: 30
 _Customer.CompanyName as CustomerName,
 @UI.lineItem.position: 40
 GrossAmountInTransacCurrency as GrossAmount
 }
