class Transaction {
    String _fromCurrency;
    String _toCurrency;
    double _fromValue;
    double _toValue;

    Transaction() {
        _fromCurrency = 'USD';
        _toCurrency = 'BTC';
        _fromValue = 0.0;
        _toValue = 20.0;
    }

    String get fromCurrency => _fromCurrency;
    String get toCurrency => _toCurrency;
    double get fromValue => _fromValue;
    double get toValue => _toValue;
}

