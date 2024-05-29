import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_manager_app/domain/entities/upload_entity/UploadEntity.dart';

abstract class UploadRepo{
  Future<Either<UploadEntity,String>> upload({required String token, required FormData image});
}