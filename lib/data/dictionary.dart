class Dictionary {
  static var currentLanguage = ENG;

  static const ENG = "eng";

  static const can_not_be_empty = "can_not_be_empty";
  static const invalid_email = "invalid_email";
  static const invalid_password = "invalid_password";
  static const email = "email";
  static const password = "password";
  static const error_occurred = "error_occurred";
  static const sign_in_action = "sign_in_action";
  static const forgot_password = "forgot_password";
  static const match_password = "match_password";
  static const or_sign_in_with = "or_sign_in_with";
  static const login_successful = "login_successful";
  static const name = "name";
  static const surname = "surname";
  static const go_to_home_page = "go_to_home_page";
  static const loading = "loading";

  static final engDictionary = {
    can_not_be_empty: "Can not be empty",
    invalid_email: "Email can not be empty",
    invalid_password: "Password can not be empty",
    email: "Email",
    password: "Password",
    error_occurred: "Error occurred",
    sign_in_action: "Sign in",
    forgot_password: "Forgot password?",
    match_password: "Match password?",
    or_sign_in_with: "or sign in with",
    login_successful: "Login successful",
    name: "Name",
    surname: "Surname",
    go_to_home_page: "Go to Home page",
    loading: "Loading...",
  };

  static String string(key) {
    if (currentLanguage == ENG) {
      return engDictionary[key] ?? "";
    }

    return "";
  }
}