import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pfa_mobile_app/customs/sharedElements/AppColors.dart';
import 'package:pfa_mobile_app/firebase_options.dart';
import 'package:pfa_mobile_app/screens_admin/menu_item_modifications.dart';
import 'package:pfa_mobile_app/screens_admin/menu_modifications.dart';
import 'package:pfa_mobile_app/screens_client/logIn.dart';
import 'package:flutter/services.dart';
import 'package:pfa_mobile_app/screens_client/menuItemBody.dart';

import 'models/menu_item.dart';
Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.mainColor,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PFA2',
      theme: ThemeData(
          colorScheme: ColorScheme.light(
            primary: AppColors.mainColor,
          ),
          backgroundColor: AppColors.backgroundWhite,
          scaffoldBackgroundColor: AppColors.backgroundWhite,

          appBarTheme: const AppBarTheme(
            elevation: 1,
            backgroundColor:  Colors.white ,

          )
      ),

      home: MenuItemModification(menuItem: MenuItem(components: [], isLunch: true)),
    );
  }
}