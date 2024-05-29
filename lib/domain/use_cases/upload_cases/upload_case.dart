
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/domain/entities/upload_entity/UploadEntity.dart';
import 'package:task_manager_app/domain/repository_contract/upload_repo.dart';

@injectable
class UploadUseCase{
  UploadRepo uploadRepo ;
  UploadUseCase(this.uploadRepo);

  Future<Either<UploadEntity,String>> call({required String token, required FormData image}){
    return uploadRepo.upload(token: token, image: image);
  }

}