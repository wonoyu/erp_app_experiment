class AppConstants {
  static const margin = 24.0;
  static const noData = 'No Data';
}

class AssetConstants {
  static const icon = 'assets/images/ic_launcher.png';
  static const companyIcon = 'assets/images/ic_company.png';
  static const cart = 'assets/images/ic_cart.png';
  static const plant = 'assets/images/ic_plant.png';
  static const planty = 'assets/images/ic_planty.png';
  static const safety = 'assets/images/ic_safety.png';
  static const splash = 'assets/images/ic_splash.jpg';
  static const noData = 'assets/images/ic_nodata.png';
  static const icApps = 'assets/images/ic_apps.png';
  static const icLogin = 'assets/images/ic_login.png';
  static const icProfile = 'assets/images/ic_profile.png';
  static const icPlan = 'assets/images/ic_plan.png';
  static const icForm = 'assets/images/ic_form.png';
  static const imBgCard = 'assets/images/im_bg_card.jpg';
  static const notFound = 'assets/images/not_found.png';
}

class TimeConstants {
  static const dateFormat = 'dd-MMM-yyyy HH:mm:ss';
  static const dateFormatNoHour = 'dd-MMM-yyyy';
  static DateTime now = DateTime.now();
  static DateTime today = DateTime(now.year, now.month, now.day);
  static DateTime endToday = DateTime(now.year, now.month, now.day, 23, 59, 59);
  static DateTime yesterday = DateTime(now.year, now.month, now.day - 1);
  static DateTime endYesterday =
      DateTime(now.year, now.month, now.day - 1, 23, 59, 59);
  static DateTime weekStart =
      DateTime(now.year, now.month, now.day - (now.weekday - 1));
  static DateTime weekEnd = DateTime(now.year, now.month,
      now.day + (DateTime.daysPerWeek - now.weekday), 23, 59, 59);
  static DateTime lastWeekStart =
      DateTime(now.year, now.month, now.day - 7 - (now.weekday - 1));
  static DateTime lastWeekEnd = DateTime(now.year, now.month,
      now.day - 7 + (DateTime.daysPerWeek - now.weekday), 23, 59, 59);
  static DateTime thisMonthStart = DateTime(now.year, now.month, 1);
  static DateTime thisMonthEnd = DateTime(now.year, now.month + 1)
      .subtract(const Duration(days: 1))
      .add(const Duration(hours: 23, minutes: 59, seconds: 59));
  static DateTime lastMonthStart = DateTime(now.year, now.month - 1, 1);
  static DateTime lastMonthEnd = DateTime(now.year, now.month)
      .subtract(const Duration(days: 1))
      .add(const Duration(hours: 23, minutes: 59, seconds: 59));
}
