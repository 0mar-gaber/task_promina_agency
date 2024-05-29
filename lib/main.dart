import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:task_manager_app/task_manger_app.dart';

import 'core/api/api_manager.dart';
import 'core/di/di.dart';
import 'core/local_storage/shared_prefrence_helper.dart';
import 'core/utils/myopserver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsHelper.init();
  Bloc.observer = MyBlocObserver();
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
  ApiManager.init();
  runApp(const TaskMangerApp());
}