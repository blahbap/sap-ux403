@AbapCatalog.sqlViewName: 'ZCDSUX403CD05'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'UX403 add chart in object page – data'
@UI.chart: [{
    qualifier: '',
    title: 'Gross Amount by customer',
    description: 'Gross Amount by customer',
    chartType: #COLUMN,
    dimensions: ['CompanyName'],
    measures: ['GrossAMount']
}]

define view ZCDS_UX403_CHART_D_05
  as select from SEPM_I_SalesOrderItem
{
  key _SalesOrder.SalesOrder,
  key SalesOrderItem,
  key _Product.Product,
  key _SalesOrder._Customer.CompanyName,
  @DefaultAggregation: #SUM
      GrossAmountInTransacCurrency as GrossAmount
}
