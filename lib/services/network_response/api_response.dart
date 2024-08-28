
import 'package:stater_project/services/network_response/status.dart';

class ApiResponse<T> {
  DataStatus? Datastatus;
  T? data;
  String? message;
  ApiResponse(this.data, this.message, this.Datastatus);

  ApiResponse.loading() : Datastatus = DataStatus.Loading;
  ApiResponse.completed(this.data) : Datastatus = DataStatus.Completed;
  ApiResponse.error(this.message) : Datastatus = DataStatus.Error;

  @override
  String toString() {
    return " message :$message , data : $data , status: $Datastatus ";
  }
}
