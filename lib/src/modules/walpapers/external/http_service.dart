import 'dart:io';

abstract class HttpService {
  Future<Map<String, dynamic>> get(String url);
}
