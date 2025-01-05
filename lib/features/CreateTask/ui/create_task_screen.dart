import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/helpers/svg_assets.dart';
import '../../../core/networking/api_constants.dart';
import '../../../core/networking/dio_factory.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../home/ui/widgets/tasks_bloc_builder.dart';

class CreateTaskScreen extends StatefulWidget {
  const CreateTaskScreen({super.key});

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dueDateController = TextEditingController();
  XFile? selectedImageXFile;
  final _formKey = GlobalKey<FormState>();
  final priorities = ['low', 'medium', 'high'];

  String? value;
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: 'Add new task'),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 16.h),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 16.h,
                    children: [
                      verticalSpace(8),
                      selectedImageXFile == null
                          ? GestureDetector(
                              onTap: () async => await getImage(),
                              child: DottedBorder(
                                color: ColorsManager.royalPurple,
                                radius: Radius.circular(12.r),
                                borderType: BorderType.RRect,
                                strokeWidth: 1.w,
                                dashPattern: [2.w, 2.w],
                                child: SizedBox(
                                  height: 56.h,
                                  child: Row(
                                    spacing: 8.w,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        SvgAssets.addImage,
                                      ),
                                      Text(
                                        'Add Img',
                                        style: TextStyles
                                            .font12RoyalPurpleMediumDMSans
                                            .copyWith(
                                          fontSize: 19.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          : Container(
                              height: 225.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      FileImage(File(selectedImageXFile!.path)),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                      _buildInputField(
                        'Task title',
                        'Enter title here...',
                        (value) {
                          if (value!.isEmpty) {
                            return 'Title cannot be empty';
                          }
                          return null;
                        },
                        titleController,
                        1,
                        null,
                        true,
                      ),
                      _buildInputField(
                        'Task Description',
                        'Enter description here...',
                        (value) {
                          if (value!.isEmpty) {
                            return 'Description cannot be empty';
                          }
                          return null;
                        },
                        descriptionController,
                        5,
                        null,
                        true,
                      ),
                      _buildPriorityFieldColumn(),
                      _buildInputField(
                        'Due date',
                        'choose due date...',
                        (value) {
                          return null;
                        },
                        dueDateController,
                        1,
                        GestureDetector(
                          onTap: () => _showDialog(
                            CupertinoDatePicker(
                              initialDateTime: date,
                              mode: CupertinoDatePickerMode.date,
                              use24hFormat: true,
                              // This shows day of week alongside day of month
                              showDayOfWeek: false,
                              minimumYear: 2025,
                              minimumDate:
                                  DateTime.now().add(const Duration(days: -1)),
                              // This is called when the user changes the date.
                              onDateTimeChanged: (DateTime newDate) {
                                setState(() => date = newDate);
                                dueDateController.text =
                                    date.toIso8601String().split('T')[0];
                              },
                            ),
                          ),
                          child: SvgPicture.asset(
                            SvgAssets.calendarIcon,
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                        false,
                      ),
                      verticalSpace(12.5),
                      AppTextButton(
                        buttonText: 'Add task',
                        textStyle: TextStyles.font19WhiteBoldDMSans,
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              selectedImageXFile != null &&
                              value != null) {
                            if (date.isBefore(DateTime.now())) {
                              await AwesomeDialog(
                                context: context,
                                dialogType: DialogType.error,
                                desc: 'Due date cannot be in the past',
                                animType: AnimType.rightSlide,
                                title: 'Error',
                              ).show();
                            } else {
                              Dio dio = DioFactory.getDio();
                              try {
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => Center(
                                      child: const CircularProgressIndicator()),
                                );
                                final imageResponse =
                                    await uploadImage(dio, selectedImageXFile!);
                                if (imageResponse.statusCode == 201) {
                                  final taskResponse =
                                      await uploadTask(dio, imageResponse);
                                  if (taskResponse.statusCode == 201) {
                                    if (!context.mounted) return;
                                    await AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.success,
                                      desc: 'Task added successfully',
                                      animType: AnimType.rightSlide,
                                      title: 'Success',
                                    ).show();
                                    titleController.clear();
                                    descriptionController.clear();
                                    dueDateController.clear();
                                    selectedImageXFile = null;
                                    value = null;
                                    setState(() {});
                                    if (!context.mounted) return;
                                    context.pop();
                                    TasksBlocBuilder
                                        .refreshIndicatorKey.currentState
                                        ?.show();
                                  } else {
                                    if (!context.mounted) return;
                                    await AwesomeDialog(
                                      context: context,
                                      dialogType: DialogType.error,
                                      desc: 'An error occurred',
                                      animType: AnimType.rightSlide,
                                      title: 'Error',
                                    ).show();
                                    if (!context.mounted) return;
                                    context.pop();
                                  }
                                }
                              } catch (e) {
                                Logger().e(e);
                              }
                            }
                          } else {
                            await AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              desc: 'Check your fields',
                              animType: AnimType.rightSlide,
                              title: 'Error',
                            ).show();
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  getImage() async {
    final ImagePicker picker = ImagePicker();
    // Pick an image.
    final XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    selectedImageXFile = image;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    dueDateController.text = date.toIso8601String().split('T')[0];
  }

  Future<Response> uploadImage(Dio dio, XFile selectedImageXFile) async {
    // upload image
    var data = FormData.fromMap({
      'image': await MultipartFile.fromFile(
        selectedImageXFile.path,
        contentType:
            DioMediaType('image', selectedImageXFile.path.split('.').last),
        filename: selectedImageXFile.path.split('/').last,
      ),
    });

    final imageResponse = await dio.post(
      '${ApiConstants.apiBaseUrl}upload/image',
      data: data,
    );

    return imageResponse;
  }

  Future<Response> uploadTask(Dio dio, Response imageResponse) async {
    var taskData = json.encode({
      "image": imageResponse.data['image'],
      "title": titleController.text,
      "desc": descriptionController.text,
      "priority": value
    });
    final taskResponse = await dio.post(
      '${ApiConstants.apiBaseUrl}todos',
      data: taskData,
    );

    return taskResponse;
  }

  Column _buildInputField(
    String label,
    String hint,
    String? Function(String?) validator,
    TextEditingController controller,
    int maxLines,
    Widget? suffixIcon,
    bool enabled,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          label,
          style: TextStyles.font12LavenderGrayRegularDMSans,
        ),
        Row(
          children: [
            Expanded(
              child: AppTextFormField(
                hintText: hint,
                enabled: enabled,
                controller: controller,
                textInputAction: TextInputAction.next,
                textInputType: TextInputType.text,
                validator: validator,
                maxLines: maxLines,
              ),
            ),
            if (suffixIcon != null) ...[
              horizontalSpace(8),
              suffixIcon,
            ]
          ],
        ),
      ],
    );
  }

  Column _buildPriorityFieldColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          'Priority',
          style: TextStyles.font12LavenderGrayRegularDMSans,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: ColorsManager.lavenderBlush,
          ),
          height: 55.h,
          width: double.infinity,
          padding:
              EdgeInsets.only(right: 10.w, left: 24.w, top: 5.h, bottom: 5.h),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              items: priorities
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        '$item Priority'.toTitleCase,
                        style: TextStyle(
                          fontSize: 18.0.sp,
                          color: ColorsManager.royalPurple,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: ((value) => setState(() {
                    this.value = value;
                    Logger().i(value);
                  })),
              dropdownColor: const Color.fromARGB(234, 255, 255, 255),
              elevation: 1,
              borderRadius: BorderRadius.circular(10.r),
              enableFeedback: true,
              hint: Text(
                "Select Priority",
                style: TextStyles.font16RoyalPurpleBoldDMSans,
              ),
              icon: Icon(
                IconlyBold.arrowDown2,
                size: 24.sp,
                color: ColorsManager.royalPurple,
              ),
              value: value,
            ),
          ),
        ),
      ],
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
