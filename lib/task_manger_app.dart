import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_manager_app/config/theme.dart';
import 'package:task_manager_app/core/di/di.dart';
import 'package:task_manager_app/presentation/screens/auth_screen/login_screen.dart';
import 'package:task_manager_app/presentation/screens/home_screen/home_screen.dart';
import 'package:task_manager_app/presentation/screens/home_screen/view_models/upload_view_model.dart';

import 'core/local_storage/shared_prefrence_helper.dart';

class TaskMangerApp extends StatelessWidget {
  const TaskMangerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          LoginScreen.route:(_)=>const LoginScreen(),
          HomeScreen.route:(_)=>BlocProvider(
            create: (context) => getIt<UploadViewModel>(),
              child: const HomeScreen()),
        },
        initialRoute: PrefsHelper.getToken().isEmpty
            ? LoginScreen.route
            : HomeScreen.route
        ,
        // initialRoute: LoginScreen.route,
        theme: AppTheme.theme,
      ),
    );
  }
}
