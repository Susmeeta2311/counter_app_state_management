import 'package:get/get.dart';
import 'package:state_management/controller/todo_controller.dart';
import 'package:flutter/material.dart';

class TodoPage extends GetView<TodoController> {
  const TodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: controller.titleController,
                  decoration: InputDecoration(
                      hintText: "Enter Title", border: OutlineInputBorder()),
                ),
                SizedBox(height: 10.0),
                TextField(
                  controller: controller.descriptionController,
                  minLines: 2,
                  maxLines: 6,
                  decoration: InputDecoration(
                      hintText: "Enter Description",
                      border: OutlineInputBorder()),
                ),
                ElevatedButton(
                    onPressed: () {
                      controller.onSaveButtonClicked();
                    },
                    child: Text("Save")),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                        itemCount: controller.todoList.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                controller.todoList[index].title,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(controller.todoList[index].description),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Divider(),
                              )
                            ],
                          );
                        });
                  }),
                )
              ],
            ),
          )),
    );
  }
}
