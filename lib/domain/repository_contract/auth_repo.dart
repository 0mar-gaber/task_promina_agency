import 'package:dartz/dartz.dart';

import '../entities/auth_entity/AuthEntity.dart';

abstract class AuthRepo{
  Future<Either<AuthEntity,String>> login({required String email , required String password}) ;
}