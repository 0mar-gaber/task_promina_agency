import 'package:dartz/dartz.dart';
import 'package:task_manager_app/data/models/auth_response/AuthResponse.dart';

abstract class AuthContract{
  Future<Either<AuthResponse,String>> login({required String email, required String password});
}