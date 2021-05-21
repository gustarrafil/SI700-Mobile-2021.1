class TransactionValues {
  bool _buySell;
  String _currencyPair;
  double _triggerPrice;
  double _orderPrice;
  double _quantity;
  DateTime _dateTime;

  TransactionValues() {
    // pegar dos inputs
    //Adicionar a chamada no bloc
    _buySell = true;
    _currencyPair = 'Btc/usdt';
    _triggerPrice = 50.000;
    _orderPrice = 49.999;
    _quantity = 0.003;
    // datetime unico atribuido no construtor
    _dateTime = DateTime.now();
  }

  TransactionValues.fromMap(map) {
    this._buySell = map['buySell'];
    this._currencyPair = map['currencyPair'];
    this._triggerPrice = map['triggerPrice'];
    this._orderPrice = map['orderPrice'];
    this._quantity = map['quantity'];
    this._dateTime = map['dateTime'];
  }

  toMap() {
    var map = Map<String, dynamic>();
    map['buySell'] = buySell;
    map['currencyPair'] = currencyPair;
    map['triggerPrice'] = triggerPrice;
    map['orderPrice'] = orderPrice;
    map['quantity'] = quantity;
    map['dateTime'] = dateTime;
    return map;
  }

  String get currencyPair => _currencyPair;
  double get triggerPrice => _triggerPrice;
  double get orderPrice => _orderPrice;
  double get quantity => _quantity;
  bool get buySell => _buySell;
  DateTime get dateTime => _dateTime;

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

  set buysell(bool newbuysell) {
    if (newbuysell != null) {
      bool newbuySell;
      this._buySell = newbuySell;
    }
  }
}
