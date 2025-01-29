import 'package:language_learning/data/endpoint/base/endpoint.dart';
import 'package:language_learning/data/service/preferences/preferences.dart';
import 'package:language_learning/utils/api-route/api_routes.dart';

class SetLanguageEndpoint extends Endpoint {
  final SetLanguageInput input;

  SetLanguageEndpoint(this.input);

  @override
  String get route => ApiRoutes.setUserLanguage;

  @override
  HttpMethod get httpMethod => HttpMethod.post;

  @override
  Map<String, dynamic>? get body => input.toJson();


}

class SetLanguageInput {
  final String userId;
  final int? sourceLanguageId;
  final int? translationLanguageId;

  SetLanguageInput({
    required this.userId,
    required this.sourceLanguageId,
    required this.translationLanguageId,
  });

  Map<String, dynamic> toJson() => {
    'userId': userId,
    'sourceLanguageId': sourceLanguageId,
    'translationLanguageId': translationLanguageId,
  };
}
