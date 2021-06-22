class Transaction {
  late String _currencyPair;
  late double _orderPrice;
  late double _quantity;
  late bool _buySell;
  late DateTime _dateTime;
  late double _wallet;
  late bool _trigger;
  late String _triggerName;
  late double _triggerValue;

  late String _userName;

  Transaction(
      {buySell,
      currencyPair,
      orderPrice,
      quantity,
      trigger,
      triggerValue,
      triggerName,
      wallet,
      userName});

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map['currencyPair'] = _currencyPair;
    map['orderPrice'] = _orderPrice;
    map['quantity'] = _quantity;
    map['buySell'] = _buySell;
    map['triggerValue'] = _triggerValue;
    map['triggerName'] = _triggerName;
    map['trigger'] = _trigger;
    map['dateTime'] = _dateTime;
    map['wallet'] = _wallet;
    map['userName'] = _userName;
    return map;
  }

  Transaction.fromMap(Map<String, dynamic> map) {
    this._currencyPair = map['currencyPair'];
    this._buySell = map['buySell'];
    this._orderPrice = map['orderPrice'].toDouble();
    this._quantity = map['quantity'].toDouble();
    this._wallet = map['wallet'] != null ? map['wallet'].toDouble() : 0;
    this._triggerValue =
        map['triggerValue'] != null ? map['triggerValue'].toDouble() : 0;
    this.triggerName = map['triggerName'] != null ? map['triggerName'] : "";
    this._trigger = map['trigger'];
    this._dateTime = DateTime.parse(map['dateTime']);
    this._userName = map['userName'];
  }

  String get currencyPair => _currencyPair;
  String get userName => _userName;
  bool get buySell => _buySell;
  double get orderPrice => _orderPrice;
  double get quantity => _quantity;
  double get wallet => _wallet;
  double get triggerValue => _triggerValue;
  String get triggerName => _triggerName;
  bool get trigger => _trigger;
  DateTime get dateTime => _dateTime;

  set currencyPair(String newCurrencyPair) {
      this._currencyPair = newCurrencyPair;
  }

  set userName(String newUserName) {
    if (newUserName.length > 0) {
      this._userName = newUserName;
    }
  }

  set buySell(bool newForm) {
    this._buySell = newForm;
  }

  set trigger(bool newTrigger) {
    this._trigger = newTrigger;
  }

  set orderPrice(double newOrderPrice) {
      this._orderPrice = newOrderPrice;
  }

  set quantity(double newQuantity) {
      this._quantity = newQuantity;
  }

  set wallet(double newWallet) {
    if (newWallet != 0) {
      this._wallet = newWallet;
    }
  }

  set triggerValue(double newTriggerValue) {
    this._triggerValue = newTriggerValue;
  }

  set triggerName(String newTriggerName) {
    this._triggerName = newTriggerName;
  }

  set dateTime(DateTime newDateTime) {
    this._dateTime = newDateTime;
  }
}
