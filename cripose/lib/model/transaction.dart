class Transaction {
  late String _currencyPair;
  late double _orderPrice;
  late double _quantity;
  late bool _buySell;
  late double _triggerValue;
  late bool _trigger;
  late DateTime _dateTime;
  late double _wallet;

  Transaction(
      {buySell, currencyPair, orderPrice, quantity, trigger, triggerValue, wallet});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['currencyPair'] = _currencyPair;
    map['orderPrice'] = _orderPrice;
    map['quantity'] = _quantity;
    map['buySell'] = _buySell;
    // map['triggerValue'] = _triggerValue;
    // map['trigger'] = _trigger;
    map['dateTime'] = _dateTime;
    map['wallet'] = _wallet;
    return map;
  }

  Transaction.fromMap(Map<String, dynamic> map) {
    this._currencyPair = map['currencyPair'];
    this._buySell = map['buySell'];
    this._orderPrice = map['orderPrice'].toDouble();
    this._quantity = map['quantity'].toDouble();
    this._wallet = map['wallet'] != null ? map['wallet'].toDouble() : 0;
    // this._triggerValue = map['triggerValue'].toDouble();
    // this._trigger = map['trigger'];
    this._dateTime = DateTime.parse(map['dateTime']);
  }

  String get currencyPair => _currencyPair;
  bool get buySell => _buySell;
  double get orderPrice => _orderPrice;
  double get quantity => _quantity;
  double get wallet => _wallet;
  double get triggerValue => _triggerValue;
  bool get trigger => _trigger;
  DateTime get dateTime => _dateTime;

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
  set wallet(double newWallet) {
    if (newWallet != 0) {
      this._wallet = newWallet;
    }
  }

  set triggerValue(double newTriggerValue) {
    if (newTriggerValue != 0) {
      this._triggerValue = newTriggerValue;
    }
  }

  set dateTime(DateTime newDateTime) {
    this._dateTime = newDateTime;
  }
}
