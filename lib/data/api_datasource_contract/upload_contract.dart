import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_manager_app/data/models/upload_response/UploadResponse.dart';

abstract class UploadContract{
  Future<Either<UploadResponse,String>> upload({required String token, required FormData image});
}