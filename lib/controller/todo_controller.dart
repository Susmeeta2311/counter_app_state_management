import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:state_management/model/todo_model.dart';

class TodoController extends GetxController {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  final todoList = [].obs;

  void onSaveButtonClicked() {
    todoList.add(TodoModel(
        title: titleController.text, description: descriptionController.text));
     //CLEAR THE VALUES FROM TITLE AND DESCRIPTION
    titleController.text = "";
    descriptionController.text = "";

    print(todoList.length);
  }
}
