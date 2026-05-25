class AppStrings {
  AppStrings._();

  static const Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'appName': 'Aurelia',
      'login': 'Login',
      'register': 'Register',
      'home': 'Home',
      'logout': 'Logout',
      'createAccount': 'Create Account',
      'backToLogin': 'Back to Login',
      'darkMode': 'Dark Mode',
      'lightMode': 'Light Mode',
      'systemMode': 'System Mode',
      'arabic': 'Arabic',
      'english': 'English',
      'Login Screen':'Login Screen',
      'Go to Home':'Go to Home',
    },
    'ar': {
      'appName': 'أوريليا',
      'login': 'تسجيل الدخول',
      'register': 'إنشاء حساب',
      'home': 'الرئيسية',
      'logout': 'تسجيل الخروج',
      'createAccount': 'إنشاء حساب',
      'backToLogin': 'الرجوع لتسجيل الدخول',
      'darkMode': 'الوضع الداكن',
      'lightMode': 'الوضع الفاتح',
      'systemMode': 'حسب النظام',
      'arabic': 'العربية',
      'english': 'الإنجليزية',
      'Login Screen': 'صفحة تسجيل الدخول',
      'Go to Home':'الذهاب للصفحه الرئيسيه'
    },
  };

  static String translate(String key, String languageCode) {
    return _localizedValues[languageCode]?[key] ??
        _localizedValues['en']?[key] ??
        key;
  }
}