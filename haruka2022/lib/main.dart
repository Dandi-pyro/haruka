import 'package:flutter/material.dart';
import 'package:haruka2022/provider/auth_provider.dart';
import 'package:haruka2022/provider/dbhar_filter_provider.dart';
import 'package:haruka2022/provider/dbhar_provider.dart';
import 'package:haruka2022/provider/dbhar_sorting_provider.dart';
import 'package:haruka2022/provider/edit_user_provider.dart';
import 'package:haruka2022/provider/list_user_provider.dart';
import 'package:haruka2022/screen/admin/tab_control_admin.dart';
import 'package:haruka2022/screen/login.dart';
import 'package:haruka2022/model/forgot_password_model.dart';
import 'package:haruka2022/provider/forgot_password_provider.dart';
import 'package:haruka2022/provider/login_provider.dart';
import 'package:haruka2022/provider/register_provier.dart';
import 'package:haruka2022/screen/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ForgotPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => ListUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditUserProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DbHarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DbHarFilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DbHarSortingProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Haruka 2.0',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    ),
  );
}
