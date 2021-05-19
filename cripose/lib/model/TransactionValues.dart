class TransactionValues {
  String _fromCurrency;
  String _toCurrency;
  double _fromValue;
  double _toValue;

  // arthur add para o database local
  // String _transactionId = 'id';
  String _currencyPair = 'Btc/usdt';
  double _triggerPrice = 50.000;
  double _orderPrice = 49.999;
  double _quantity = 0.003;

  TransactionValues() {
    // arthur add para o database local
    // _transactionId = 'id';
    _currencyPair = 'Btc/usdt';
    _triggerPrice = 50.000;
    _orderPrice = 49.999;
    _quantity = 0.003;

    _fromCurrency = 'USD';
    _toCurrency = 'BTC';
    _fromValue = 0.0;
    _toValue = 20.0;
  }

  // String get transactionId => _transactionId;
  String get currencyPair => _currencyPair;
  double get triggerPrice => _triggerPrice;
  double get orderPrice => _orderPrice;
  double get quantity => _quantity;
  // arthur add para o database local

  String get fromCurrency => _fromCurrency;
  String get toCurrency => _toCurrency;
  double get fromValue => _fromValue;
  double get toValue => _toValue;

  TransactionValues.fromMap(map) {
    // this._transactionId = map['transactionId'];
    this._currencyPair = map['currencyPair'];
    this._triggerPrice = map['triggerPrice'];
    this._orderPrice = map['orderPrice'];
    this._quantity = map['quantity'];
  }

  toMap() {
    var map = Map<String, dynamic>();
    map['_currencyPair'] = _currencyPair;
    map['_triggerPrice'] = _triggerPrice;
    map['_orderPrice'] = _orderPrice;
    map['_quantity'] = _quantity;
    // map['_fromCurrency'] = _fromCurrency;
    // map['_toCurrency'] = _toCurrency;
    // map['_fromValue'] = _fromValue;
    // map['_toValue'] = _toValue;
    return map;
  }

  set currencyPair(String newCurrencyPair) {
    if (newCurrencyPair.length > 0) {
      this._currencyPair = newCurrencyPair;
    }
  }

  set triggerPrice(double newtriggerPrice) {
    if (newtriggerPrice != 0) {
      this._triggerPrice = newtriggerPrice;
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
