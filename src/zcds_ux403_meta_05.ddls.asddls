@AbapCatalog.sqlViewName: 'ZCDSUX403META05'
@Metadata.allowExtensions: true
@OData.publish: true


define view ZCDS_UX403_META_05 as select from SEPM_I_SalesOrder
{

 key SalesOrder as SalesOrderID,
 _Customer.BusinessPartner as CustomerID,

 _Customer.CompanyName as CustomerName,

 GrossAmountInTransacCurrency as GrossAmount

}
