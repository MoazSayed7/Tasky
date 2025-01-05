// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TasksData _$TasksDataFromJson(Map<String, dynamic> json) => TasksData(
      taskID: json['_id'] as String?,
      imagePath: json['image'] as String?,
      taskTitle: json['title'] as String?,
      taskDescription: json['desc'] as String?,
      taskPriority: json['priority'] as String?,
      taskStatus: json['status'] as String?,
    );

Map<String, dynamic> _$TasksDataToJson(TasksData instance) => <String, dynamic>{
      '_id': instance.taskID,
      'image': instance.imagePath,
      'title': instance.taskTitle,
      'desc': instance.taskDescription,
      'priority': instance.taskPriority,
      'status': instance.taskStatus,
    };
