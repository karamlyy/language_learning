enum Routes {

  onboarding( 'onboarding'),
  login( 'login'),
  register( 'register'),
  verification( 'verification'),
  verifyCode( 'verify-code'),
  forgotPassword( 'forgot-password'),
  resetPassword( 'reset-password'),
  passwordChanged( 'password-changed'),
  setLanguage('set-language'),
  setTiming('set-timing'),
  home('home'),
  wordList('word-list'),
  vocabulary('vocabulary'),
  newWord('new-word'),
  settings('settings');

  const Routes( this.path);

  final String path;


  static Routes? fromString(String? route){
    return Routes.values.firstWhere((element) => element.path == route);
  }
}