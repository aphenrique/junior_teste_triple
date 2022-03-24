class UrlValidator {
  static bool isValid(String url) {
    final regex = RegExp(r"^(?:http(s)?:\/\/)?[\w.-]+(?:\.[\w\.-\/]+)+$");

    return regex.hasMatch(url);
  }
}
