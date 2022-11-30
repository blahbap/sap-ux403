@AbapCatalog.sqlViewName: 'ZCDSUX403OBJP05'
@EndUserText.label: 'UX403 Basic Object Page'
@UI.headerInfo.typeNamePlural: 'Sales Orders'
@UI.headerInfo.typeName: 'Sales Order'
@OData.publish: true
@UI.headerInfo.title.value: 'Customer ID'

define view ZCDS_UX403_OBJP_05
  as select from SEPM_I_SalesOrder
{
      @UI.facet: [
      {
      id: 'COLLFAC1',
      label: 'General Information',
      type: #COLLECTION,
      position: 10
      },
      {
      label: 'General Information',
      type: #IDENTIFICATION_REFERENCE,
      parentId: 'COLLFAC1',
      position: 10
      }
      ]

      @UI.lineItem.position: 10
      @UI.identification.position: 10
  key SalesOrder                     as SalesOrderID,
      @UI.lineItem.position: 20
      @UI.identification.position: 20
      _Customer.BusinessPartner      as CustomerID,
      @UI.lineItem.position: 30
      @UI.identification.position: 30
      _Customer.CompanyName          as CustomerName,
      @UI.lineItem.position: 40
      @UI.identification.position: 40
      GrossAmountInTransacCurrency   as GrossAmount,
      @UI.identification.position: 50
      NetAmountInTransactionCurrency as NetAmount,
      @UI.identification.position: 60
      SalesOrderOverallStatus        as OverallStatus,
      @UI.identification.position: 70
      SalesOrderPaymentMethod        as PaymentMethod,
      @UI.hidden: true
      TransactionCurrency            as Currency
}
