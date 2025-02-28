import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:state_management/controller/counter_controller.dart';
import 'package:state_management/todo_page.dart';


class CounterGetxPage extends GetView<CounterController> {
  const CounterGetxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // Centers content vertically
                children: [
                  CircleAvatar(
                    radius: 30, // Circular profile image/icon
                    backgroundColor: Colors.transparent,
                    child: Icon(Icons.person, size: 70),
                  ),
                  SizedBox(height: 15.0), // Spacing
                  Text("Hello User", style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/todo.svg",
                height: 34.0,
                width: 34.0,
              ),
              title: Text("Todo"),
              onTap: () {
                //NAVIGATE TO THE BACK SCREEN
                Get.back();

                //NAVIGATE TO THE NEXT SCREEN
                Get.to(TodoPage());
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/setting.svg",
                height: 34.0,
                width: 34.0,
              ),
              title: Text("Settings"),
              onTap: () {

              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/theme.svg",
                height: 34.0,
                width: 34.0,
              ),
              title: Text("Theme"),
              onTap: () {
                controller.onThemeClicked();
              },
            ),
            ListTile(
              leading: SvgPicture.asset(
                "assets/icons/profile.svg",
                height: 34.0,
                width: 34.0,
              ),
              title: Text("profile"),
              onTap: () {

              },
            ),
          ],
        ),
      ),

      appBar: AppBar(
        title: const Text(
          "Counter App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xfff7aef8),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              controller.restart();
            },
            icon: const Icon(
              Icons.refresh,
            ),
            tooltip: 'Reset Counter',
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 12.0,
                shadowColor: Theme
                    .of(context)
                    .colorScheme
                    .primary
                    .withValues(alpha: 0.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24.0),
                ),
                child: Container(
                  padding: const EdgeInsets.all(32.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Theme
                            .of(context)
                            .cardColor,
                        Theme
                            .of(context)
                            .cardColor
                            .withValues(alpha: 0.5),
                      ],
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Current Count",
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w500,
                          color: Theme
                              .of(context)
                              .colorScheme
                              .primary,
                          shadows: [
                            Shadow(
                              color: Theme
                                  .of(context)
                                  .colorScheme
                                  .primary
                                  .withValues(alpha: 0.3),
                              offset: const Offset(2, 2),
                              blurRadius: 4,
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 12.0),
                      Obx(() {
                        return Text(
                          '${controller.counter.value}',
                          style: const TextStyle(
                            fontSize: 48.0,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 48.0),

              // BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FloatingActionButton(
                    onPressed: () {
                      controller.decrementClicked();
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  ),
                  const SizedBox(width: 24.0),
                  FloatingActionButton(
                    onPressed: () {
                      controller.incrementClicked();
                    },
                    tooltip: 'Increment',
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
