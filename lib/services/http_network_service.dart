import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:pet_shelter/models/announcement/announcement.dart';
import 'package:pet_shelter/models/pet_type.dart';
import 'package:pet_shelter/models/request_result.dart';
import 'package:pet_shelter/models/sign_in_request/sign_in_request.dart';
import 'package:pet_shelter/models/sign_up_request/sign_up_request.dart';
import 'package:pet_shelter/models/login_response/login_response.dart';
import 'package:pet_shelter/services/basic_network_service.dart';

class HttpNetworkService implements BasicNetworkService {
  static const _baseAddress = "https://pet-shelter-api.issart.com/api/1.0.0";
  static const _serverAddress = "pet-shelter-api.issart.com";
  static const _basePath = "api/1.0.0";
  static const _timeOutSeconds = 10;

  @override
  Future<void> healthCheck() async {
    try {
      final response =
          await http.get(Uri.parse("$_baseAddress/tech/healthcheck"));
      if (response.statusCode == 200) {
        print("Health Check success");
      } else {
        throw Exception("Failed health check. Code ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Failed health check. Error $error");
    }
  }

  @override
  Future<RequestResult<LoginResponse>> signUp(SignUpRequest request) async {
    return _post(
        url: "$_baseAddress/register/email",
        body: request,
        parser: (responseBody) => LoginResponse.fromJson(json.decode(responseBody))
    );
  }

  @override
  Future<RequestResult<LoginResponse>> signIn(SignInRequest request) async {
    return _post(
        url: "$_baseAddress/login/email",
        body: request,
        parser: (responseBody) => LoginResponse.fromJson(json.decode(responseBody))
    );
  }

  @override
  Future<RequestResult<List<Announcement>>> getAds({PetType? petType}) {
    return _get(
        path: "announcements",
        queryParams: petType == null ? {} : {"petType": petType.name},
        parser: (responseBody) {
          Iterable list = json.decode(responseBody);
          return list.map((model) => Announcement.fromJson(model)).toList();
        }
    );
  }

  @override
  Future<RequestResult<List<Announcement>>> createAd(String accessToken, Announcement announcement) {
    return _post(
        url: "$_baseAddress/announcements",
        body: announcement,
        parser: (responseBody) {
          Iterable list = json.decode(responseBody);
          return list.map((model) => Announcement.fromJson(model)).toList();
        }
    );
  }

  Future<RequestResult<T>> _post<T, V>({
    required String url,
    String? accessToken,
    required V body,
    required T Function(String responseBody) parser
  }) async {
    try {
      final headers = {
        'accept': 'application/json; charset=UTF-8',
        'Content-Type': 'application/json'
      };
      if (accessToken != null) {
        headers['Authorization'] = 'Bearer $accessToken';
      }
      final response = await http.post(
          Uri.parse(url),
          headers: headers,
          body: jsonEncode(body)
      );
      if (response.statusCode == 200) {
        return RequestResult(
            success: true,
            body: parser(response.body)
        );
      } else {
        // ErrorResponse.fromJson(jsonDecode(response.body)).message;
        print("Request error. Url: $url,\nError: ${response.body}");
        return RequestResult(
            success: false,
            errorMessage: response.body
        );
      }
    } catch (error) {
      print("Request error. Url: $url,\nError: $error");
      return RequestResult(
          success: false,
          errorMessage: "Failed request $url. Error: $error"
      );
    }
  }

  Future<RequestResult<T>> _get<T>({
    required String path,
    String? accessToken,
    required Map<String, String> queryParams,
    required T Function(String responseBody) parser
  }) async {
    final uri = Uri.https(_serverAddress, "$_basePath/$path", queryParams);
    final headers = {
      'accept': 'application/json; charset=UTF-8',
      'Content-Type': 'application/json'
    };
    if (accessToken != null) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    try {
      final response = await http.get(
          uri,
          headers: headers
      );
      if (response.statusCode == 200) {
        return RequestResult(
            success: true,
            body: parser(response.body)
        );
      } else {
        // ErrorResponse.fromJson(jsonDecode(response.body)).message;
        print("Request error. Url: ${uri.toString()},\nError: ${response.body}");
        return RequestResult(
            success: false,
            errorMessage: response.body
        );
      }
    } catch (error) {
      print("Request error. Url: ${uri.toString()},\nError: $error");
      return RequestResult(
          success: false,
          errorMessage: "Failed request ${uri.toString()}. Error: $error"
      );
    }
  }
}
