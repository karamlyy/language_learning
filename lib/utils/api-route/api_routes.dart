class ApiRoutes {
  static const String baseUrl = 'https://language-learn-axe5epeugbbqepez.uksouth-01.azurewebsites.net/api/';

  static const String register = 'Register';
  static const String login = 'Login';
  static const String confirmEmail = 'ConfirmEmail';
  static const String resendConfirmationEmail = 'ResendEmailConfirmationCode';
  static const String verifyCode = 'ConfirmPasswordResetCode';
  static const String refreshToken = 'RefreshToken';
  static const String forgotPassword = 'ForgotPassword';
  static const String confirmResetToken = 'ConfirmPasswordResetToken';
  static const String resetPassword = 'ResetPassword';

  static const String deleteAccount = 'DeleteUser';

  static const String getAllLanguages = 'Language/GetAll';
  static const String setUserLanguage = 'UserLanguage/Create';
  static const String setUserTiming = 'NotificationSetting/Create';

  static const String getAllCategories = 'Category/GetAllByUserId';

  static const String getAllWords = 'UserVocabulary/GetPaginatedByUserId';

  static const String getUserLanguagePairs = 'UserLanguage/GetAllByUserId';

  static const String newWord = 'UserVocabulary/Create';
}
