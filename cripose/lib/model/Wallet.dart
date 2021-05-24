class Wallet {
    double _walletValue;
    Wallet() { 
        _walletValue = 100.0;
        // pegar valor da table
    }

    String get walletValueString => _walletValue.toString();
    double get walletValueDouble => _walletValue;
    set walletValueString(String walletValue) {
        _walletValue = double.parse(walletValue);
    } 
    set walletValueDouble(double walletValue) {
        _walletValue = walletValue;
    } 

    Wallet.fromMap(map) {
        this._walletValue = map['wallet'];
    }

    Map<String, dynamic> toMap() {
        Map<String, dynamic> map = Map<String, dynamic>();
        map['wallet'] = _walletValue;
        return map;
    }
}