class LoginData {
  String username;
  String password;
  bool confirmed = false;

  doSomething() {
    print("Username: $username");
    print("Password: $password");
  }
}
