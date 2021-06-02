class TransactionValues {
  String _currencyPair;
  double _orderPrice;
  double _quantity;

  TransactionValues({buySell, currencyPair, orderPrice, quantity});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['currencyPair'] = _currencyPair;
    map['orderPrice'] = _orderPrice;
    map['quantity'] = _quantity;
    return map;
  }

  TransactionValues.fromMap(Map<String, dynamic> map) {
    double orderDouble = map['orderPrice'].toDouble();
    double quantityDouble = map['quantity'].toDouble();
    this._currencyPair = map['currencyPair'];
    this._orderPrice = orderDouble;
    this._quantity = quantityDouble;
  }

  String get currencyPair => _currencyPair;
  double get orderPrice => _orderPrice;
  double get quantity => _quantity;

  set currencyPair(String newCurrencyPair) {
    if (newCurrencyPair.length > 0) {
      this._currencyPair = newCurrencyPair;
    }
  }

  set orderPrice(double newOrderPrice) {
    if (newOrderPrice != 0) {
      this._orderPrice = newOrderPrice;
    }
  }

  set quantity(double newQuantity) {
    if (newQuantity != 0) {
      this._quantity = newQuantity;
    }
  }
}
