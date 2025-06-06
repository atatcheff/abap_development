@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order CDS View'
@UI.headerInfo: {
  typeName: 'Order',
  typeNamePlural: 'Orders',
  title: { value: 'orderid' }
}
define root view entity ZI_ORDER_ANGEL
  as select from zorder_angel
  composition [1..*] of ZI_ORDER_I_ANGEL as _Items
{
  key orderuuid,
      orderid,
      name,
      status,
      customer,
      creationdate,
      cancellationdate,
      completiondate,
      deliverycountry,

      ordercurrency,

  @Semantics.amount.currencyCode: 'ordercurrency'
    cast( 0 as abap.curr(15,2) ) as totalprice,

    _Items
}
