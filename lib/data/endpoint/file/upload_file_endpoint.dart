import 'dart:io';
import 'package:dio/dio.dart';
import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';
import 'package:http_parser/http_parser.dart';  // ✅ Required for MediaType

class UploadFileEndpoint extends Endpoint {
  final File file;

  UploadFileEndpoint(this.file);

  @override
  String get route => ApiRoutes.uploadTemplate;

  @override
  HttpMethod get httpMethod => HttpMethod.post;


  @override
  Map<String, dynamic>? get body => null;

  Future<FormData> createFormData() async {
    return FormData.fromMap({
      "file": await MultipartFile.fromFile(
        file.path,
        filename: file.uri.pathSegments.last,
        contentType: MediaType('multipart', 'form-data'),
      ),
    });
  }


}
