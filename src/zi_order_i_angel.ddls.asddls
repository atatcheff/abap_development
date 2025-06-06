@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Item CDS View'
define view entity ZI_ORDER_I_ANGEL
  as select from zorder_item_ang
  association to parent ZI_ORDER_ANGEL as _Order
      on $projection.orderuuid = _Order.orderuuid
{
  key itemuuid,
      orderuuid,
      name,
      itemcurrency,
      quantity,

  @Semantics.amount.currencyCode: 'itemcurrency'
    
      cast( 0 as abap.curr(15,2) ) as price,

      _Order
}
