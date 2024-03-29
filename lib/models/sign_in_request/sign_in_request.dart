import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'sign_in_request.freezed.dart';
part 'sign_in_request.g.dart';

@freezed
class SignInRequest with _$SignInRequest {
  const factory SignInRequest({
    required String email,
    required String password
  }) = _SignInRequest;

  factory SignInRequest.fromJson(Map<String, Object?> json) =>
      _$SignInRequestFromJson(json);
}