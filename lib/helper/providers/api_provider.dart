import 'package:get/get.dart';
import 'package:webui/helper/utils/environment_config.dart';

class ApiProvider extends GetConnect {
  final String _baseUrl = (EnvironmentConfig.env == 'localhost')
      ? 'http://localhost/vendorportal.cheil.rocks/api/v1'
      : ((EnvironmentConfig.env == 'stage')
          ? 'https://vendorportal.cheil.rocks/api/stage/v1'
          : 'https://vendorportal.cheil.rocks/api/main/v1');

  Future<Response> getData(String endpoint,
      {Map<String, dynamic>? queryParams}) async {

    // Construct the full URL including query parameters
    final url = Uri.parse('$_baseUrl$endpoint').toString();

    try {
      final response = await get(url, query: queryParams);
      if (response.statusCode == 200) {
        return response;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (error) {
      throw Exception('Failed to connect to server: $error');
    }
  }

  // Future<Response> postData(String endpoint, Map<String, dynamic> data) async {
  //   final String url = Uri.parse('$_baseUrl$endpoint').toString();
  //
  //   try {
  //     final response = await post(
  //       url,
  //       headers: <String, String>{
  //         'Content-Type': 'application/json; charset=UTF-8',
  //       },
  //       body: jsonEncode(data), // Converts map to JSON string
  //     );
  //
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response;
  //     } else {
  //       throw Exception('Failed to post data');
  //     }
  //   } catch (error) {
  //     throw Exception('Failed to connect to server: $error');
  //   }
  // }
}
