import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/apis/home_api_service.dart';
import '../../features/home/data/repos/home_repo.dart';
import '../../features/profile/data/apis/profile_api_service.dart';
import '../../features/profile/data/repos/profile_repo.dart';
import '../../features/signin/data/repos/signin_repo.dart';
import '../../features/signin/logic/cubit/signin_cubit.dart';
import '../../features/signup/data/repos/sign_up_repo.dart';
import '../../features/signup/logic/cubit/signup_cubit.dart';
import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Signin
  getIt.registerLazySingleton<SigninRepo>(() => SigninRepo(getIt()));
  getIt.registerFactory<SigninCubit>(() => SigninCubit(getIt()));
  // Signup
  getIt.registerLazySingleton<SignupRepo>(() => SignupRepo(getIt()));
  getIt.registerFactory<SignupCubit>(() => SignupCubit(getIt()));
  // home
  getIt.registerLazySingleton<HomeApiService>(() => HomeApiService(dio));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepo(getIt()));
  // profile
  getIt.registerLazySingleton<ProfileApiService>(() => ProfileApiService(dio));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepo(getIt()));
}
