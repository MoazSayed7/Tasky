import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:logger/logger.dart';
import 'package:simple_barcode_scanner/simple_barcode_scanner.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/shared_pref_helper.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/networking/api_constants.dart';
import '../../../core/networking/dio_factory.dart';
import '../../../core/routes/routes.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../data/models/tasks_response_model.dart';
import 'widgets/tasks_bloc_builder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// Active filter
  String selectedFilter = 'All';
  String qrResult = '';

  final filters = ['All', 'In progress', 'Waiting', 'Finished'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Stack(
        clipBehavior: Clip.none, // To avoid clipping the button
        children: [
          Positioned(
            bottom: 80.h, // Adjust the distance from the bottom
            right: 16.w, // Adjust the distance from the right
            child: GestureDetector(
              onTap: () async {
                String? res = await SimpleBarcodeScanner.scanBarcode(
                  context,
                  barcodeAppBar: const BarcodeAppBar(
                    appBarTitle: 'Scan QR Code',
                    centerTitle: false,
                    enableBackButton: true,
                    backButtonIcon: Icon(Icons.arrow_back_ios),
                  ),
                  isShowFlashIcon: true,
                  scanType: ScanType.qr,
                  cameraFace: CameraFace.back,
                  delayMillis: 2000,
                );
                setState(() {
                  qrResult = res as String;
                });
                // check if task found
                if (qrResult.isNotEmpty && qrResult.length >= 24) {
                  //check if task is already created
                  try {
                    Dio dio = DioFactory.getDio();
                    final response = await dio.get(
                      '${ApiConstants.apiBaseUrl}todos/$qrResult',
                    );
                    if (response.statusCode == 200) {
                      if (!context.mounted) return;
                      if (response.data.runtimeType != String) {
                        context.pushNamed(Routes.taskScreen,
                            arguments: TasksData.fromJson(response.data));
                      } else {
                        if (!context.mounted) return;
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Task not found!',
                              textAlign: TextAlign.center,
                            ),
                            duration:
                                const Duration(seconds: 3), // Adjust duration
                            backgroundColor: ColorsManager.darkSlateGray,
                          ),
                        );
                      }
                    }
                  } catch (e) {
                    Logger().e(e);
                  }
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorsManager.paleLavender,
                ),
                width: 50.w,
                height: 50.h,
                child: Icon(
                  CupertinoIcons.qrcode,
                  size: 24.sp,
                  color: ColorsManager.royalPurple,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 16.h, // FAB position
            right: 16.w,
            child: FloatingActionButton(
              onPressed: () => context.pushNamed(Routes.createTaskScreen),
              elevation: 0,
              shape: CircleBorder(),
              backgroundColor: ColorsManager.royalPurple,
              foregroundColor: Colors.white,
              child: Icon(
                Icons.add_rounded,
                size: 32.sp,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Logo',
                    style: TextStyles.font24MidnightGrayBoldDMSans,
                  ),
                  Row(
                    spacing: 20.w,
                    children: [
                      IconButton(
                        onPressed: () =>
                            context.pushNamed(Routes.profileScreen),
                        icon: Icon(
                          CupertinoIcons.person_circle,
                          size: 24.sp,
                          color: Colors.black,
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          try {
                            Dio dio = DioFactory.getDio();
                            await dio.post(
                              '${ApiConstants.apiBaseUrl}${ApiConstants.logout}',
                            );
                          } catch (e) {
                            debugPrint(e.toString());
                          } finally {
                            await SharedPrefHelper.clearAllSecuredData();
                            // ignore: control_flow_in_finally
                            if (!context.mounted) return;
                            context.pushNamedAndRemoveUntil(
                              Routes.signInScreen,
                              predicate: (route) => false,
                            );
                          }
                        },
                        icon: Icon(
                          Icons.logout,
                          size: 24.sp,
                          color: ColorsManager.royalPurple,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              verticalSpace(24),
              Text(
                'My Tasks',
                style: TextStyles.font14MidnightGray60RegularDMSans,
              ),
              verticalSpace(16),
              SizedBox(
                height: 36.h,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: filters.length,
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    final isSelected = filter == selectedFilter;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = filter;
                        });
                      },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 8.w),
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 8.h),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? ColorsManager.royalPurple
                              : ColorsManager.lavenderBlush,
                          borderRadius: BorderRadius.circular(24.r),
                        ),
                        child: Center(
                          child: Text(
                            filter,
                            style: isSelected
                                ? TextStyles.font16WhiteBoldDMSans
                                : TextStyles.font16StormGrayRegularDMSans,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              verticalSpace(16),
              TasksBlocBuilder(selectedTasksStatus: selectedFilter)
            ],
          ),
        ),
      ),
    );
  }
}
