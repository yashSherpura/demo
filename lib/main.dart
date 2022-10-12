import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nearme/pages/page.dart';
import 'package:nearme/utils/pref_manager.dart';
import 'package:nearme/view/login/login.dart';
import 'package:nearme/view/splash.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
   await PreferenceUtils.init();
   await Firebase.initializeApp();
  // FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(kDebugMode ? false:true); // toggle for testing
  // FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
  runApp(MyApp());
}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // PreferenceUtils.setBoolen("sessionToken", true);
    // PreferenceUtils.getBoolen("sessionToken", );
    // print("Login :- ${PreferenceUtils.getBoolen("sessionToken" )}");
    //FirebaseCrashlytics.instance.crash(); // for checking
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: () =>GetMaterialApp(
            home: const SplashScreen(),
            //  home: Dashboard(),
            debugShowCheckedModeBanner: false,
            // theme: Themes().lightTheme,
            // darkTheme: Themes().darkTheme,
            // themeMode:ThemeService().getThemeMode(),
            // locale: LocalizationService.locale,
            // fallbackLocale: LocalizationService.fallbackLocale,
            // translations: LocalizationService(),
             getPages: AppPages.pages
        )
    );
  }
}
