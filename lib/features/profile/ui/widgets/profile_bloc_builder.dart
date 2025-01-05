import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/profile_response_model.dart';
import '../../logic/cubit/profile_cubit.dart';
import '../../logic/cubit/profile_state.dart';
import 'profile_card_item.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return state.maybeWhen(
          fetchSuccess: (profileResponseModel) {
            return setupSuccess(profileResponseModel);
          },
          fetchError: (error) => setupError(),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          orElse: () => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget setupError() => Text(
        'Error',
        style: const TextStyle(color: Colors.red, fontSize: 64),
      );

  Widget setupSuccess(ProfileResponseModel profileResponseModel) {
    return ProfileListViewItem(profileResponseModel: profileResponseModel);
  }
}
