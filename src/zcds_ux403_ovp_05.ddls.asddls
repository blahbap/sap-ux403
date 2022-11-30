@AbapCatalog.sqlViewName: 'ZCDSUX403OVP05'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'UX403 Overview Page'
@OData.publish: true

@UI.headerInfo: {
    typeName: 'Sales Order',
    typeNamePlural: 'Sales Orders',
    typeImageUrl: '',
    imageUrl: 'SAPIconUrl',
    title: {
        type: #STANDARD,
        label: 'Sales Order ID',
        iconUrl: '',
        criticality: '',
        criticalityRepresentation: #WITHOUT_ICON,
        value: 'SalesOrder',
        valueQualifier: '',
        targetElement: '',
        url: ''
    },
    description: {
        type: #STANDARD,
        label: 'Sales Order Item',
        iconUrl: '',
        criticality: '',
        criticalityRepresentation: #WITHOUT_ICON,
        value: 'SalesOrderItem',
        valueQualifier: '',
        targetElement: '',
        url: ''
    }
}



define view ZCDS_UX403_OVP_05
  as select from SEPM_I_SalesOrderItem
{
    @UI.facet: [{
        type: #FIELDGROUP_REFERENCE,
        targetQualifier: 'DETAILED',
        isSummary: true
    }]

      @UI.lineItem.position: 10
  key _SalesOrder.SalesOrder,
  key SalesOrderItem,
      @UI.lineItem.position: 20
      @UI.fieldGroup: [{position: 10, qualifier: 'DETAILED', label: 'Product'}]
      _Product.Product,
      @UI.selectionField.position: 10
      @ObjectModel.foreignKey.association: '_ProductCategory'
      @UI.fieldGroup: [{position: 20, qualifier: 'DETAILED', label: 'Product Category'}]
      _Product.ProductCategory,
      @UI.selectionField.position: 20
      @ObjectModel.foreignKey.association: '_ProductType'
      @UI.fieldGroup: [{position: 30, qualifier: 'DETAILED', label: 'Product Type'}]
      _Product.ProductType,
      @UI.fieldGroup: [{position: 40, qualifier: 'DETAILED', label: 'Company Name'}]
      _SalesOrder._Customer.CompanyName,
      @UI.lineItem.position: 30
      @UI.fieldGroup: [{position: 50, qualifier: 'DETAILED', label: 'Gross Amont'}]
      GrossAmountInTransacCurrency as GrossAmount,
      TransactionCurrency          as Currency,
      _SalesOrder.CreationDateTime,
      _Product._ProductType,
      _Product._ProductCategory,
      'sap-icon://sales-order'     as SAPIconUrl
}
