// Create a singleton instance of GetIt for dependency injection.
import 'package:get_it/get_it.dart';
import 'package:language_learning/data/repository/auth_repository.dart';
import 'package:language_learning/data/repository/language_repository.dart';
import 'package:language_learning/data/service/api/api.dart';

GetIt getIt = GetIt.instance;

// Injector class handles the registration of services, components, and repositories in GetIt.
class Injector {
  // Asynchronous method to register all dependencies.
  static register() async {
    await _registerRepositories();
    await _registerServices();
  }

  // Register services as singletons in the locator.
  static _registerServices() {
    // Registers ApiService as a singleton, meaning a single instance is used throughout the app.
    getIt.registerSingleton<ApiService>(ApiService());
  }

  // Placeholder method for registering repositories. Currently, it's empty but can be used to register repository dependencies.
  static _registerRepositories() {
    getIt
        .registerFactory<AuthRepository>(() => AuthRepositoryImpl(getIt.get()));
    getIt.registerFactory<LanguageRepository>(
        () => LanguageRepositoryImpl(getIt.get()));
  }
}
