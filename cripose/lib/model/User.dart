class User {
    String _email;
    String _name;
    String _pwd;
    User() { 
        _email = "";
        _name = "";
        _pwd = "";
    }

    String get email => _email;
    String get name => _name;
    String get pwd => _pwd;
    set email(String email) {
        _email = email;
    } 
    set name(String name) {
        _name = _name;
    } 
    set pwd(String pwd) {
        _pwd = pwd;
    } 

    User.fromMap(map) {
        this._email = map['email'];
        this._name = map['name'];
        this._pwd = map['pwd'];
    }

    Map<String, dynamic> toMap() {
        Map<String, dynamic> map = Map<String, dynamic>();
        map['email'] = _email;
        map['name'] = _name;
        map['pwd'] = _pwd;
        return map;
    }
}