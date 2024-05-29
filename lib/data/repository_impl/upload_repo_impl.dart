import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/data/api_datasource_contract/upload_contract.dart';
import 'package:task_manager_app/domain/entities/upload_entity/UploadEntity.dart';
import 'package:task_manager_app/domain/repository_contract/upload_repo.dart';

@Injectable(as: UploadRepo)
class UploadRepoImpl extends UploadRepo {
  UploadContract uploadContract ;
  @factoryMethod
  UploadRepoImpl(this.uploadContract);
  @override
  Future<Either<UploadEntity, String>> upload({required String token, required FormData image}) async {
    var result  = await uploadContract.upload(token: token, image: image);
    return result.fold(
            (response) {
              UploadEntity uploadEntity = UploadEntity(
                message: response.message,
                status: response.status,
              );
              return Left(uploadEntity);
            },
            (error) => Right(error)
    );
  }

}