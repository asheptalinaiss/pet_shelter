import 'package:pet_shelter/models/request_result.dart';
import 'package:pet_shelter/models/sign_in_request/sign_in_request.dart';
import 'package:pet_shelter/models/sign_up_request/sign_up_request.dart';
import 'package:pet_shelter/models/login_response/login_response.dart';

abstract class BasicNetworkService {
  Future<void> healthCheck();
  Future<RequestResult<LoginResponse>> signUp(SignUpRequest request);
  Future<RequestResult<LoginResponse>> signIn(SignInRequest request);
}