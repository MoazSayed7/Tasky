import 'dart:convert';
import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/helpers/extensions.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/networking/api_constants.dart';
import '../../../core/networking/dio_factory.dart';
import '../../../core/theme/colors.dart';
import '../../../core/theme/styles.dart';
import '../../../core/widgets/app_bar.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/app_text_form_field.dart';
import '../../home/data/models/tasks_response_model.dart';
import '../../home/ui/widgets/tasks_bloc_builder.dart';

class EditTaskScreen extends StatefulWidget {
  final TasksData task;
  const EditTaskScreen({super.key, required this.task});
  @override
  State<EditTaskScreen> createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  XFile? selectedImageXFile;
  final _formKey = GlobalKey<FormState>();
  final priorities = ['low', 'medium', 'high'];
  final status = ['waiting', 'inProgress', 'finished'];

  String? priorityValue;
  String? statusValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(title: 'Edit task'),
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
                              child: Hero(
                                tag: widget.task.taskID!,
                                child: CachedNetworkImage(
                                  imageUrl:
                                      '${ApiConstants.apiBaseUrl}images/${widget.task.imagePath!}',
                                  progressIndicatorBuilder:
                                      (context, url, downloadProgress) {
                                    return Shimmer.fromColors(
                                      baseColor:
                                          Color(0xFFE0E0E0), // Light gray
                                      highlightColor:
                                          Color(0xFFF5F5F5), // Very light gray
                                      child: SizedBox(
                                        height: 225.h,
                                        width: double.infinity,
                                      ),
                                    );
                                  },
                                  imageBuilder: (context, imageProvider) =>
                                      Container(
                                    height: 225.h,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: imageProvider,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
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
                      _buildStatusFieldColumn(),
                      verticalSpace(12.5),
                      AppTextButton(
                        buttonText: 'Edit task',
                        textStyle: TextStyles.font19WhiteBoldDMSans,
                        onPressed: () async {
                          if (_formKey.currentState!.validate() &&
                              priorityValue != null &&
                              statusValue != null) {
                            Dio dio = DioFactory.getDio();
                            try {
                              showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => Center(
                                    child: const CircularProgressIndicator()),
                              );
                              // upload image
                              if (selectedImageXFile != null) {
                                final imageResponse =
                                    await uploadImage(dio, selectedImageXFile!);

                                if (imageResponse.statusCode == 201) {
                                  await editTask(dio, {
                                    "image": imageResponse.data['image'],
                                  });
                                }
                              }

                              final taskResponse = await editTask(dio, {
                                "title": titleController.text,
                                "desc": descriptionController.text,
                                "priority": priorityValue,
                                "status": statusValue
                              });
                              if (taskResponse.statusCode == 200) {
                                if (!context.mounted) return;
                                await AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.success,
                                  desc: 'Task Edited successfully',
                                  animType: AnimType.rightSlide,
                                  title: 'Success',
                                ).show();
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
                            } catch (e) {
                              Logger().e(e);
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

  Future<Response> editTask(Dio dio, Map<String, dynamic> data) async {
    var taskData = json.encode(data);
    final taskResponse = await dio.put(
      '${ApiConstants.apiBaseUrl}todos/${widget.task.taskID}',
      data: taskData,
    );
    return taskResponse;
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
    titleController.text = widget.task.taskTitle!;
    descriptionController.text = widget.task.taskDescription!;
    priorityValue = widget.task.taskPriority!;
    statusValue = widget.task.taskStatus!;
    super.initState();
  }

  Future<Response> uploadImage(Dio dio, XFile selectedImageXFile) async {
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
                    priorityValue = value;
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
              value: priorityValue,
            ),
          ),
        ),
      ],
    );
  }

  Column _buildStatusFieldColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8.h,
      children: [
        Text(
          'Status',
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
              items: status
                  .map(
                    (item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(
                        item.toCapitalized,
                        style: TextStyle(
                          fontSize: 18.0.sp,
                          color: ColorsManager.royalPurple,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              onChanged: ((value) => setState(() {
                    statusValue = value;
                    Logger().i(value);
                  })),
              dropdownColor: const Color.fromARGB(234, 255, 255, 255),
              elevation: 1,
              borderRadius: BorderRadius.circular(10.r),
              enableFeedback: true,
              hint: Text(
                "Select Status",
                style: TextStyles.font16RoyalPurpleBoldDMSans,
              ),
              icon: Icon(
                IconlyBold.arrowDown2,
                size: 24.sp,
                color: ColorsManager.royalPurple,
              ),
              value: statusValue,
            ),
          ),
        ),
      ],
    );
  }
}
