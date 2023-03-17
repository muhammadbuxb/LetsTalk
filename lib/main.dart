import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lets_talk/controllers/bindings.dart';
import 'package:lets_talk/resources/themes.dart';
import 'package:lets_talk/routes/mainRoutes.dart';
import 'package:lets_talk/ui/pages/welcome.dart';
import 'package:get/get.dart';
import 'package:uuid/uuid.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp(
      //  options: DefaultFirebaseOptions.currentPlatform,
      );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Uuid uuid = Uuid();
    return GetMaterialApp(
      title: 'lets_talk',
      theme: AppThemes().lightTheme,
      routes: MainRoutes().Routes,
      initialBinding: AppBindings(),
    );
  }
}
