import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';

class QuizEndpoint extends Endpoint {
  final List<int> excludeIds;

  QuizEndpoint({required this.excludeIds});

  @override
  String get route => ApiRoutes.getQuizQuestion;

  @override
  HttpMethod get httpMethod => HttpMethod.get;

  @override
  Map<String, dynamic>? get queryParameters =>
      excludeIds.isNotEmpty ? {'excludeIds': excludeIds.join(',')} : {};
}
