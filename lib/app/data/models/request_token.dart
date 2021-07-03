// To parse this JSON data, do
//
//     final requestTokenModel = requestTokenModelFromJson(jsonString);

import 'dart:convert';

import 'package:intl/intl.dart';

RequestTokenModel requestTokenModelFromJson(String str) =>
    RequestTokenModel.fromJson(json.decode(str));

String requestTokenModelToJson(RequestTokenModel data) =>
    json.encode(data.toJson());

class RequestTokenModel {
  RequestTokenModel({
    required this.success,
    required this.expiresAt,
    required this.requestToken,
  });

  final bool success;
  final DateTime expiresAt;
  final String requestToken;

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) =>
      RequestTokenModel(
        success: json["success"],
        expiresAt: DateFormat('yyyy-MM-dd hh:mm:ss').parse(json["expires_at"]),
        requestToken: json["request_token"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "expires_at": expiresAt.toString(),
        "request_token": requestToken,
      };
}
