import 'dart:io';

import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';

class UploadFileEndpoint extends Endpoint {
  final File file;

  UploadFileEndpoint(this.file);

  @override
  String get route => ApiRoutes.uploadTemplate;

  @override
  HttpMethod get httpMethod => HttpMethod.post;


}
