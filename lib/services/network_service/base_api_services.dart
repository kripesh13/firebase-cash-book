abstract class BaseApiServices {
  Future<dynamic> getApiResponseServices(String url);
  Future<dynamic> postApiResponseServices(String url , dynamic data);
  Future<dynamic> deleteApiResponseServices(String url , dynamic data);
  Future<dynamic> patchApiResponseServices(String url , dynamic data);
}
