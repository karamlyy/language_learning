import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';

class GetAllCategoriesEndpoint extends Endpoint {
  final String userId;

  GetAllCategoriesEndpoint({required this.userId});

  @override
  String get route => ApiRoutes.getAllCategories;

  @override
  HttpMethod get httpMethod => HttpMethod.get;

  @override
  Map<String, dynamic> get queryParameters => {
    'userId': userId,
  };
}