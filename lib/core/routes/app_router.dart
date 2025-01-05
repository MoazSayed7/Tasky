import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/CreateTask/ui/create_task_screen.dart';
import '../../features/EditTask/ui/edit_task_screen.dart';
import '../../features/home/data/models/tasks_response_model.dart';
import '../../features/home/logic/cubit/home_cubit.dart';
import '../../features/home/ui/home_screen.dart';
import '../../features/onboarding/ui/onboarding_screen.dart';
import '../../features/profile/logic/cubit/profile_cubit.dart';
import '../../features/profile/ui/profile_screen.dart';
import '../../features/signin/logic/cubit/signin_cubit.dart';
import '../../features/signin/ui/signin_screen.dart';
import '../../features/signup/logic/cubit/signup_cubit.dart';
import '../../features/signup/ui/signup_screen.dart';
import '../../features/task/ui/task_screen.dart';
import '../di/dependency_injection.dart';
import 'routes.dart';

class AppRouter {
  Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(
          builder: (_) => const OnBoardingScreen(),
        );
      case Routes.createTaskScreen:
        return MaterialPageRoute(
          builder: (_) => const CreateTaskScreen(),
        );

      case Routes.taskScreen:
        final taskData = routeSettings.arguments as TasksData;
        return MaterialPageRoute(
          builder: (_) => TaskScreen(
            tasksModel: taskData,
          ),
        );
      case Routes.editTaskScreen:
        final taskData = routeSettings.arguments as TasksData;
        return MaterialPageRoute(
          builder: (_) => EditTaskScreen(
            task: taskData,
          ),
        );
      case Routes.signInScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SigninCubit>(),
            child: const SignInScreen(),
          ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SignUpScreen(),
          ),
        );
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => HomeCubit(getIt())..getTasks(),
            child: const HomeScreen(),
          ),
        );
      case Routes.profileScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProfileCubit(getIt())..getProfileData(),
            child: const ProfileScreen(),
          ),
        );

      default:
        return null;
    }
  }
}
