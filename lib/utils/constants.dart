import 'dart:io';

class Constants {
  static const productBaseUrl =
      'https://shop-cod3r-c70a4-default-rtdb.firebaseio.com/products';
  static const orderBaseUrl =
      'https://shop-cod3r-c70a4-default-rtdb.firebaseio.com/orders';
  static const filmeflixUrl = '10.0.2.2:8080';
  static const filmeflixBasePath = 'filmeflix';
  static const filmeflixBaseUrl = filmeflixUrl + filmeflixBasePath;
  static const token =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJmaWxtZWZsaXgiLCJzdWIiOiJwYXVsYUBnbWFpbC5jb20iLCJleHAiOjE3MDI5MjU1MDB9.JLBN0UVVMiNYk3zaXwiTesyFba2KZD_DuI9H4io_lT4';

  static final Map<String, String> defaultHeaders = Map.from({
    HttpHeaders.authorizationHeader: Constants.token,
    HttpHeaders.acceptHeader: 'application/json; charset=UTF-8',
  });
}
