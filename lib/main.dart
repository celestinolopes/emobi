// ignore_for_file: must_be_immutable

import 'package:e_mobi/views/choice_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';
import 'package:toastification/toastification.dart';

import 'core/di/di_container.dart' as depencyInjection;
import 'pallete_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await depencyInjection.initializeDepencyInjection();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: PalleteColors.primaryColor,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return ToastificationWrapper(
        child: MaterialApp(
          title: 'EMobi',
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white,
            ),
            textTheme: const TextTheme(
              bodySmall: TextStyle(
                fontFamily: "Montserrat",
              ),
              bodyMedium: TextStyle(
                fontFamily: "Montserrat",
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const ChoiceView(),
        ),
      );
    });
  }
}
/* 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeController = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'Upload File and Photo',
          style: TextStyle(fontSize: 16),
        ),
      ),
      body: GetBuilder(
        init: homeController,
        id: "home",
        builder: (conext) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                    onPressed: () async {
                      final base = await homeController
                          .getBase64(homeController.filesList[0]);

                      log(base);
                    },
                    child: const Text("Click button")),
                TextButton(
                  onPressed: () => homeController.handleUpload(context),
                  child: const Text("Upload File"),
                ),
                ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: homeController.filesList.length,
                  itemBuilder: (context, idx) {
                    return CustomCardUploadFile(
                      onTap: () => homeController.removeItem(idx),
                      index: idx,
                      name: homeController.getFileName(
                        homeController.filesList[idx],
                      ),
                      icon: homeController.checkTypeFile(
                        homeController.filesList[idx],
                      ),
                      size: homeController.getFileSize(
                        homeController.filesList[idx],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox(
                      height: 5,
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: ElevatedButton(
            onPressed: () => homeController.handleSubmit(),
            style: ButtonStyle(
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              backgroundColor:
                  WidgetStateProperty.all<Color>(Colors.transparent),
              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                const EdgeInsets.all(0),
              ),
            ),
            child: Ink(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.green],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Container(
                height: 50,
                constraints:
                    const BoxConstraints(minWidth: 88.0, minHeight: 36.0),
                alignment: Alignment.center,
                child: const Text(
                  "Submit",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
 */