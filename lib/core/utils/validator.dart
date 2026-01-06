class Validator {
  static bool isValidImgUrl({required String url}) {
    if (url.startsWith("https://")) {
      return true;
    } else if (url.startsWith("http://")) {
      return true;
    } else {
      return false;
    }
  }
}
