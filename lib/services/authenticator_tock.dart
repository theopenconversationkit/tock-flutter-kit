import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class AuthenticatorTOCK {
  final String url;

  AuthenticatorTOCK({@required this.url});

  Future<Response> post({Map<String, String> headers, body}) async {
    return await http.post(this.url, headers: headers, body: body);
  }
}
