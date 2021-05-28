class TransactionValues {
  bool _buySell;
  String _currencyPair;
//   double _triggerPrice;
  double _orderPrice;
  double _quantity;
//   DateTime _dateTime;

//   TransactionValues() {
//     // _buySell = true;
//     _currencyPair = "";
//     // _triggerPrice = 0;
//     _orderPrice = 0;
//     _quantity = 0;
//     // _dateTime = DateTime.now();
//   }
TransactionValues({buySell, currencyPair, orderPrice, quantity});

Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};
}
TransactionValues.fromMap(Map<String, dynamic> map) {

}


//   TransactionValues.fromMap(map) {
//     // this._buySell = map['buySell'];
//     this._currencyPair = map['currencyPair'];
//     // this._triggerPrice = map['triggerPrice'];
//     this._orderPrice = map['orderPrice'];
//     this._quantity = map['quantity'];
//     // this._dateTime = map['dateTime'];
//   }

//   toMap() {
//     var map = Map<String, dynamic>();
//     // map['buySell'] = _buySell;
//     map['currencyPair'] = _currencyPair;
//     // map['triggerPrice'] = _triggerPrice;
//     map['orderPrice'] = _orderPrice;
//     map['quantity'] = _quantity;
//     // map['dateTime'] = _dateTime;
//     return map;
//   }

  String get currencyPair => _currencyPair;
//   double get triggerPrice => _triggerPrice;
  double get orderPrice => _orderPrice;
  double get quantity => _quantity;
  bool get buySell => _buySell;
//   DateTime get dateTime => _dateTime;

  set currencyPair(String newCurrencyPair) {
    if (newCurrencyPair.length > 0) {
      this._currencyPair = newCurrencyPair;
    }
  }

//   set triggerPrice(double newtriggerPrice) {
//     if (newtriggerPrice != 0) {
//       this._triggerPrice = newtriggerPrice;
//     }
//   }

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
