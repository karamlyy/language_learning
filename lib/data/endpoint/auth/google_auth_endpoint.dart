import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';

class GoogleAuthEndpoint extends Endpoint {
  final GoogleAuthInput input;

  GoogleAuthEndpoint(this.input);

  @override
  String get route => ApiRoutes.googleAuth;

  @override
  HttpMethod get httpMethod => HttpMethod.post;

  @override
  Map<String, dynamic>? get body => input.toJson();
}

class GoogleAuthInput {
  final String idToken;

  GoogleAuthInput({
    required this.idToken,
  });

  Map<String, dynamic> toJson() {
    return {
      "idToken": idToken,
    };
  }
}
