import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';

class AddToMasterEndpoint extends Endpoint {
  final int id;

  AddToMasterEndpoint({
    required this.id,
  });

  @override
  String get route => '${ApiRoutes.addToMaster}$id';

  @override
  HttpMethod get httpMethod => HttpMethod.post;
}
