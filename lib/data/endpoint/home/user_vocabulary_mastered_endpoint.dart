import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';

class GetAllMasteredWordsEndpoint extends Endpoint {
  final int page;
  final int pageSize;

  GetAllMasteredWordsEndpoint({
    required this.page,
    required this.pageSize,
  });

  @override
  String get route => ApiRoutes.getAllMasteredWords;

  @override
  HttpMethod get httpMethod => HttpMethod.get;

  @override
  Map<String, dynamic>? get queryParameters => {
    'page': page,
    'pageSize': pageSize,
  };
}
