@AbapCatalog.sqlViewName: 'ZCDSUX403CHART05'
@EndUserText.label: 'UX403 chart in object page'
@UI.headerInfo.typeNamePlural: 'Products'
@UI.headerInfo.typeName: 'Product'
@UI.headerInfo.title: {
    value: 'Product'
}
@OData.publish: true

define view ZCDS_UX403_CHART_05
  as select from SEPM_I_Product
  association [*] to ZCDS_UX403_CHART_D_00 as _Sales on $projection.Product = _Sales.Product
{
      @UI.facet: [
       {
         label: 'General Information',
         id: 'COLLFAC1',
         type: #COLLECTION,
         position: 10
       },
       {
         parentId: 'COLLFAC1',
         type: #IDENTIFICATION_REFERENCE,
         position: 10
       },
       {
        label: 'Chart',
        type: #CHART_REFERENCE,
        targetElement: '_Sales',
        position: 20
       }
      ]

      @UI.lineItem.position: 10
      @UI.identification.position: 10
  key Product,
      @UI.lineItem.position: 20
      @UI.identification.position: 20
      _ProductCategory.MainProductCategory,
      @UI.lineItem.position: 30
      @UI.identification.position: 30
      _ProductCategory.ProductCategory,
      @UI.lineItem.position: 40
      @UI.identification.position: 40
      ProductType,
      _Sales
}
