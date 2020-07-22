import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:tock_flutter_kit/services/authenticator_tock.dart';
import 'dart:developer' as developer;

class MessageService {
  final AuthenticatorTOCK authenticatorTOCK;
  final String language;
  final String userId;

  const MessageService(
      {@required this.authenticatorTOCK, this.language = "fr", this.userId = "test_flutter_app"});

  Future<TOCKResponse> sendHTTPMessage(String query) async {
    String body = json.encode(
        {'query': query, 'userId': this.userId, 'locale': this.language});
    developer.log(body);

    var responses = await authenticatorTOCK.post(
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: body);

    return TOCKResponse(responses: json.decode(responses.body));
  }
}

class TOCKResponse {
  final Map<String, dynamic> responses;

  TOCKResponse({@required this.responses});

  String getMessage() {
    return this.responses.value;
  }

  String getType() {
    // TODO: implement getType
    return '';
  }
}