import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controllers/app_controller.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final AppController c = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: FutureBuilder(
          future: c.initialize(), // 여기서 앱 실행 전에 해야 하는 초기화 진행
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: Obx(() => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(c.message.value?.notification?.title ?? 'title', style: TextStyle(fontSize: 20)),
                          Text(c.message.value?.notification?.body ?? 'message', style: TextStyle(fontSize: 15)),
                        ],
                      )));
            } else if (snapshot.hasError) {
              return Center(child: Text('failed to initialize'));
            } else {
              return Center(child: Text('initializing...'));
            }
          },
        ),
      ),
    );
  }
}
