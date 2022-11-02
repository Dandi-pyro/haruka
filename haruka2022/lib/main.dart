import 'package:flutter/material.dart';
import 'package:haruka2022/provider/apg3_provider.dart';
import 'package:haruka2022/provider/apg4_filter_provider.dart';
import 'package:haruka2022/provider/apg4_provider.dart';
import 'package:haruka2022/provider/apg4_searching_provider.dart';
import 'package:haruka2022/provider/apg4_sorting_provider.dart';
import 'package:haruka2022/provider/auth_provider.dart';
import 'package:haruka2022/provider/create_apg_provider.dart';
import 'package:haruka2022/provider/create_apg_respon_provider.dart';
import 'package:haruka2022/provider/create_dbhar_provider.dart';
import 'package:haruka2022/provider/dbhar_filter_provider.dart';
import 'package:haruka2022/provider/dbhar_provider.dart';
import 'package:haruka2022/provider/dbhar_sorting_provider.dart';
import 'package:haruka2022/provider/delete_apg_provider.dart';
import 'package:haruka2022/provider/delete_dbhar_provider.dart';
import 'package:haruka2022/provider/edit_apg_provider.dart';
import 'package:haruka2022/provider/edit_dbhar.dart';
import 'package:haruka2022/provider/edit_user_provider.dart';
import 'package:haruka2022/provider/list_user_provider.dart';
import 'package:haruka2022/provider/search_dbhar_provider.dart';
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
        ChangeNotifierProvider(
          create: (_) => DbHarSearchProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreateDbHarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditDbHarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DeleteDbHarProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Apg3Provider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Apg4Provider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreateApgProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => EditApgProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => DeleteApgProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Apg4SortingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Apg4FilterProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => Apg4SearchingProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => CreateApgResponProvider(),
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
