import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';

class UploadFileEndpoint extends Endpoint {
  final File file;

  UploadFileEndpoint(this.file);

  @override
  String get route => ApiRoutes.uploadTemplate;

  @override
  HttpMethod get httpMethod => HttpMethod.post;

  Future<http.StreamedResponse> uploadFile() async {
    var request = http.MultipartRequest("POST", Uri.parse(route));
    request.files.add(await http.MultipartFile.fromPath('file', file.path));

    return request.send();
  }
}
