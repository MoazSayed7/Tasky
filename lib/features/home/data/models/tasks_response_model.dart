import 'package:json_annotation/json_annotation.dart';

part 'tasks_response_model.g.dart';

@JsonSerializable()
class TasksData {
  @JsonKey(name: '_id')
  String? taskID;
  @JsonKey(name: 'image')
  String? imagePath;
  @JsonKey(name: 'title')
  String? taskTitle;
  @JsonKey(name: 'desc')
  String? taskDescription;
  @JsonKey(name: 'priority')
  String? taskPriority;
  @JsonKey(name: 'status')
  String? taskStatus;

  TasksData({
    this.taskID,
    this.imagePath,
    this.taskTitle,
    this.taskDescription,
    this.taskPriority,
    this.taskStatus,
  });

  factory TasksData.fromJson(Map<String, dynamic> json) =>
      _$TasksDataFromJson(json);
}
