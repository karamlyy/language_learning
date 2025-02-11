import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';

class GetAllLearningWordsEndpoint extends Endpoint {
  final int page;
  final int pageSize;

  GetAllLearningWordsEndpoint({
    required this.page,
    required this.pageSize,
  });

  @override
  String get route => ApiRoutes.getAllLearningWords;

  @override
  HttpMethod get httpMethod => HttpMethod.get;

  @override
  Map<String, dynamic>? get queryParameters => {
        'page': page,
        'pageSize': pageSize,
      };
}
