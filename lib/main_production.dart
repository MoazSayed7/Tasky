import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'core/di/dependency_injection.dart';
import 'core/helpers/bloc_observer.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/shared_pref_helper.dart';
import 'core/helpers/svg_assets.dart';
import 'core/routes/app_router.dart';
import 'tasky_app.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = MyBlocObserver();
  await Future.wait([
    setupGetIt(),
    SystemChrome.setPreferredOrientations(<DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
    ScreenUtil.ensureScreenSize(),
    preloadSVGs([
      SvgAssets.copyIcon,
      SvgAssets.addImage,
      SvgAssets.calendarIcon,
    ]),
  ]);
  await checkIfUserIsLoggedIn();
  runApp(
    TaskyApp(
      appRouter: AppRouter(),
    ),
  );
}

Future<void> checkIfUserIsLoggedIn() async {
  String? refreshToken =
      await SharedPrefHelper.getSecuredString(SharedPrefKeys.refreshToken);
  if (refreshToken!.startsWith('e')) {
    isLoggedInUser = true;
  }
}

Future<void> preloadSVGs(List<String> paths) async {
  for (final path in paths) {
    final loader = SvgAssetLoader(path);
    await svg.cache.putIfAbsent(
      loader.cacheKey(null),
      () => loader.loadBytes(null),
    );
  }
}
