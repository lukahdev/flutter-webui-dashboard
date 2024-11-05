import 'package:get/get.dart';
import 'package:webui/helper/providers/api_provider.dart';
import 'package:webui/helper/services/auth_services.dart';

class UserProvider extends ApiProvider {

  Future<Response> login(Map<String, dynamic>? data) => postData("/login", body: data);

  // Get request
  // Future<Response> login(String email, String password) => getData('/login.php/$id');
  //
  //
  // // Post request
  // Future<Response> postUser(Map data) => post('http://youapi/users', body: data);
  //
  // // Post request with File
  // Future<Response<CasesModel>> postCases(List<int> image) {
  //   final form = FormData({
  //     'file': MultipartFile(image, filename: 'avatar.png'),
  //     'otherFile': MultipartFile(image, filename: 'cover.png'),
  //   });
  //   return post('http://youapi/users/upload', form);
  // }
  // GetSocket userMessages() {
  //   return socket('https://yourapi/users/socket');
  // }
}