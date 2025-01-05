import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/helpers/constants.dart';
import 'core/routes/app_router.dart';
import 'core/routes/routes.dart';
import 'core/theme/colors.dart';

class TaskyApp extends StatelessWidget {
  final AppRouter appRouter;
  const TaskyApp({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    FlutterNativeSplash.remove();
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Tasky',
        themeMode: ThemeMode.light,
        theme: ThemeData(
          useMaterial3: true,
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: ColorsManager.royalPurple,
          ),
          primaryColor: ColorsManager.royalPurple,
          scaffoldBackgroundColor: Colors.white,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: ColorsManager.royalPurple,
            selectionColor: Color.fromARGB(171, 95, 51, 225),
            selectionHandleColor: ColorsManager.royalPurple,
          ),
        ),
        debugShowCheckedModeBanner: false,
        initialRoute:
            isLoggedInUser ? Routes.homeScreen : Routes.onBoardingScreen,
        onGenerateRoute: appRouter.generateRoute,
      ),
    );
  }
}
