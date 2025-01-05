import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/app_bar.dart';
import 'widgets/profile_bloc_builder.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.5.w),
          child: Column(
            spacing: 24.h,
            children: [
              CustomAppBar(title: 'Profile'),
              ProfileBlocBuilder(),
            ],
          ),
        ),
      ),
    );
  }
}
