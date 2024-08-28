import 'package:stater_project/res/api_name.dart';
import 'package:stater_project/services/network_service/base_api_services.dart';

class AuthRepository {
  BaseApiServices apiServices;
  AuthRepository({required this.apiServices}) : super();
  loginUser(dynamic data) async {
    try {
      var response =
          await apiServices.postApiResponseServices(AipName.loginUrl, data);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  googleLoging(dynamic data) async {
    try {
      var response =
          await apiServices.postApiResponseServices(AipName.googleUrl, data);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  appleLoging(dynamic data) async {
    try {
      var response =
          await apiServices.postApiResponseServices(AipName.appleUrl, data);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }

  facebookLoging(dynamic data) async {
    try {
      var response =
          await apiServices.postApiResponseServices(AipName.facebookUrl, data);
      return response;
    } catch (e) {
      print(e.toString());
    }
  }
}
