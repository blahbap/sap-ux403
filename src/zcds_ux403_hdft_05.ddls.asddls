@AbapCatalog.sqlViewName: 'ZCDSUX403HDFT05'
@EndUserText.label: 'UX403 Header Facets'
@UI.headerInfo.typeNamePlural: 'Sales Orders'
@UI.headerInfo.typeName: 'Sales Order'
@UI.headerInfo.title.value: 'CustomerID'
@OData.publish: true

define view ZCDS_UX403_HDFT_05
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
       },
       {
         label: 'Amount Information',
         purpose: #HEADER,
         type: #FIELDGROUP_REFERENCE,
         targetQualifier: 'AMOUNT',
         position: 10
       },
       {
         label: 'Status Information',
         purpose: #HEADER, 
         type: #FIELDGROUP_REFERENCE,
         targetQualifier: 'STATUS',
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
      @UI.fieldGroup: [{position: 10, qualifier: 'AMOUNT' }]
      GrossAmountInTransacCurrency   as GrossAmount,
      @UI.identification.position: 50
      @UI.fieldGroup: [{position: 20, qualifier: 'AMOUNT' }]
      NetAmountInTransactionCurrency as NetAmount,
      @UI.identification.position: 60
      @UI.fieldGroup: [{position: 10, qualifier: 'STATUS' }]
      SalesOrderOverallStatus        as OverallStatus,
      @UI.identification.position: 70
      SalesOrderPaymentMethod        as PaymentMethod,
      @UI.hidden: true
      TransactionCurrency            as Currency,
      @UI.fieldGroup: [{position: 20, qualifier: 'STATUS' }]
      SalesOrderBillingStatus        as BillingStatus,
      @UI.fieldGroup: [{position: 30, qualifier: 'STATUS' }]
      SalesOrderDeliveryStatus       as DeliveryStatus,
      @UI.fieldGroup: [{position: 40, qualifier: 'STATUS' }]
      SalesOrderLifeCycleStatus      as LifeCycleStatus
}
