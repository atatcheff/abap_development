@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Order Projection View'
@Metadata.allowExtensions: true
@UI.headerInfo: {
  typeName: 'Order',
  typeNamePlural: 'Orders',
  title: { value: 'orderid' }
}




define root view entity ZC_ORDER_ANGEL
  as projection on ZI_ORDER_ANGEL
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
      totalprice,
      _Items
}
