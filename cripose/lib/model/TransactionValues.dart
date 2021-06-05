class TransactionValues {
  String _currencyPair;
  double _orderPrice;
  double _quantity;
  bool _buySell;
  double _triggerValue;
  bool _trigger;

  TransactionValues({buySell, currencyPair, orderPrice, quantity, trigger, triggerValue});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['currencyPair'] = _currencyPair;
    map['orderPrice'] = _orderPrice;
    map['quantity'] = _quantity;
    map['buySell'] = _buySell;
    // map['triggerValue'] = _triggerValue;
    // map['trigger'] = _trigger;
    return map;
  }

  TransactionValues.fromMap(Map<String, dynamic> map) {
    this._currencyPair = map['currencyPair'];
    this._buySell = map['buySell'];
    this._orderPrice = map['orderPrice'].toDouble();
    this._quantity = map['quantity'].toDouble();
    // this._triggerValue = map['triggerValue'].toDouble();
    // this._trigger = map['trigger'];
  }

  String get currencyPair => _currencyPair;
  bool get buySell => _buySell;
  double get orderPrice => _orderPrice;
  double get quantity => _quantity;
  double get triggerValue => _triggerValue;
  bool get trigger => _trigger;

  set currencyPair(String newCurrencyPair) {
    if (newCurrencyPair.length > 0) {
      this._currencyPair = newCurrencyPair;
    }
  }

  set buySell(bool newForm) {
      this._buySell = newForm;
  }

  set trigger(bool newTrigger) {
      this._trigger = newTrigger;
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

  set triggerValue(double newTriggerValue) {
    if (newTriggerValue != 0) {
      this._triggerValue = newTriggerValue;
    }
  }
}
