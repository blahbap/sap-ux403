@AbapCatalog.sqlViewName: 'ZCDSUX403ALP05'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #CHECK
@EndUserText.label: 'UX403 Analytical List Page'
@OData: {
    publish: true
}

@Analytics: {
    query: true
}

@UI.selectionVariant: [{
    qualifier: 'Default',
    text: 'Default'
},
{
    qualifier: 'KPISalesByCustomer',
    text: 'KPI Sales By Customer'
}
]

@UI.selectionPresentationVariant: [{
    qualifier: 'Default',
    selectionVariantQualifier: 'Default',
    presentationVariantQualifier: 'Default'
    },
    { qualifier: 'KPISalesByCustomer',
      presentationVariantQualifier: 'KPISalesByCustomer',
      selectionVariantQualifier: 'KPISalesByCustomer'
    }
]

@UI.presentationVariant: [{
    qualifier: 'Default',
    visualizations: [{
        type: #AS_CHART,
        qualifier: 'ChartDefault'
    }]
},
{
    qualifier: 'VisualFilter',
    text: 'Filter: Sales by Product Category',
    visualizations: [{
        type: #AS_CHART,
        qualifier: 'ChartVFSalesByCategory'
    }]
},
{
    qualifier: 'KPISalesByCustomer',
    text: 'KPI: Sales By Customer',
    visualizations: [{
        type: #AS_CHART,
        qualifier: 'ChartKPISalesByCustomer'
     },
     {
        type: #AS_DATAPOINT,
        qualifier: 'GrossAmount'
     }
     ]
}
]

@UI.chart: [{
    qualifier: 'ChartDefault',
    title: 'Sales by Customer',
    chartType: #COLUMN,
    dimensions: ['Customer', 'ProductCategory'],
    measures: ['GrossAmount'],
    dimensionAttributes: [{
        dimension: 'Customer',
        role: #CATEGORY
    },
    {   dimension: 'ProductCategory',
        role: #CATEGORY
    }],
    measureAttributes: [{
        measure: 'GrossAmount',
        role: #AXIS_1,
        asDataPoint: false
    }]
},
{
    qualifier: 'ChartVFSalesByCategory',
    title: 'Sales by Product Category',
    chartType: #COLUMN,
    dimensions: ['ProductCategory'],
    measures: ['GrossAmount'],
    dimensionAttributes: [{
        dimension: 'ProductCategory',
        role: #CATEGORY
    }],
    measureAttributes: [{
        measure: 'GrossAmount',
        role: #AXIS_1,
        asDataPoint: false
    }]
},
{
    qualifier: 'ChartKPISalesByCustomer',
    title: 'Sales By Customer',
    chartType: #COLUMN, 
    dimensions: ['Customer'],
    measures: ['GrossAmount'],
    dimensionAttributes: [{
        dimension: 'Customer',
        role: #CATEGORY
     }],
     measureAttributes: [{
        measure: 'GrossAmount',
        role: #AXIS_1
      }]
}

]

define view ZCDS_UX403_ALP_05
  as select from SEPM_P_SalesOrderItemCube ( P_DisplayCurrency:'USD' )
{
      @UI.lineItem: [{position: 10 }]
      @EndUserText.label: 'Sales Order'
  key SalesOrder,

      @UI.lineItem: [{position: 20 }]
      @EndUserText.label: 'Sales Order Item'
  key SalesOrderItem,

      @UI.lineItem: [{position: 30 }]
      @EndUserText.label: 'Product'
      Product,

      @UI.lineItem: [{position: 40 }]
      @UI.selectionField: [{
          position: 10
      }]
      @EndUserText.label: 'Product Category'
      ProductCategory,

      @EndUserText.label: 'Product Type'
      ProductType,

      @AnalyticsDetails: {
          query: {
              display: #TEXT_KEY
          }
      }
      @UI.lineItem: [{position: 50 }]
      @EndUserText.label: 'Customer'
      Customer,

      @UI.lineItem: [{position: 60 }]
      @EndUserText.label: 'Gross Amount'
      @UI.dataPoint.title: 'Sales by Customers'
      GrossAmountInDisplayCurrency as GrossAmount,

      @UI.hidden: true
      DisplayCurrency              as Currency
}
