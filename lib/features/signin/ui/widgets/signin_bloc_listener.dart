import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routes/routes.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/styles.dart';
import '../../logic/cubit/signin_cubit.dart';
import '../../logic/cubit/signin_state.dart';

class SigninBlocListener extends StatelessWidget {
  const SigninBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SigninCubit, SigninState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
              context: context,
              builder: (context) => const Center(
                child: CircularProgressIndicator(
                  color: ColorsManager.royalPurple,
                ),
              ),
            );
          },
          success: (signinResponse) {
            context.pop();
            context.pushNamedAndRemoveUntil(
              Routes.homeScreen,
              predicate: (_) => false,
            );
          },
          error: (error) {
            setupErrorState(context, error);
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font14DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14RoyalPurpleBoldDMSans,
            ),
          ),
        ],
      ),
    );
  }
}
