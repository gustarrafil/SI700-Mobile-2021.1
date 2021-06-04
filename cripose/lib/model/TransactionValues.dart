class TransactionValues {
  String _currencyPair;
  double _orderPrice;
  double _quantity;
  bool _buySell;

  TransactionValues({buySell, currencyPair, orderPrice, quantity});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['currencyPair'] = _currencyPair;
    map['orderPrice'] = _orderPrice;
    map['quantity'] = _quantity;
    map['buySell'] = _buySell;
    return map;
  }

  TransactionValues.fromMap(Map<String, dynamic> map) {
    this._currencyPair = map['currencyPair'];
    this._buySell = map['buySell'];
    this._orderPrice = map['orderPrice'].toDouble();
    this._quantity = map['quantity'].toDouble();
  }

  String get currencyPair => _currencyPair;
  bool get buySell => _buySell;
  double get orderPrice => _orderPrice;
  double get quantity => _quantity;

  set currencyPair(String newCurrencyPair) {
    if (newCurrencyPair.length > 0) {
      this._currencyPair = newCurrencyPair;
    }
  }

  set buySell(bool newForm) {
      this._buySell = newForm;
    
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
