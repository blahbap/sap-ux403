@AbapCatalog.sqlViewName: 'ZCDSUX403VIS05'
@EndUserText.label: 'UX403 data visualization in list report'
@UI.headerInfo.typeNamePlural: 'Products'
@OData.publish: true

define view ZCDS_UX403_VIS_05
  as select from SEPM_I_Stock
{
      @UI.lineItem.position: 10
  key _Product.Product                                                                                   as ProductID,

      @UI.lineItem.position: 20
  key Bin                                                                                                as BinID,

      @UI.lineItem.position: 30
      _Product._NameGroup._ShortText[1: Language = $session.system_language ].ShortText                  as ProductName,

      @UI.lineItem.position: 40
      Quantity,

      @UI.hidden: true
      QuantityUnit,

      @EndUserText.label: 'Stock Level'
      @UI.lineItem.position: 50
      @UI.lineItem.criticality: 'StockLevelCritical'
      case when
      Quantity > LotSizeQuantity then 'High'
      when Quantity > MinimumStockQuantity then 'Medium'
      else 'Low'
      end                                                                                                as StockLevel,
      @UI.hidden: true
      case 
        when Quantity > LotSizeQuantity 
            then 3 
        when Quantity > MinimumStockQuantity 
            then 2 
        else 1 
    end                                                                                                  as StockLevelCritical

}
