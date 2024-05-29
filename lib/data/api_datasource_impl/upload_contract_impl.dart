import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/api/api_manager.dart';
import 'package:task_manager_app/core/api/end_points.dart';
import 'package:task_manager_app/data/api_datasource_contract/upload_contract.dart';
import 'package:task_manager_app/data/models/upload_response/UploadResponse.dart';

@Injectable(as: UploadContract)
class UploadContractImpl extends UploadContract{
  ApiManager apiManager ;
  @factoryMethod
  UploadContractImpl(this.apiManager);
  @override
  Future<Either<UploadResponse, String>> upload({required String token, required FormData image}) async {
   try{
     var request = await apiManager.postRequest(endPoint: EndPoint.addToGalleryEndpoint,formData: image,token: token);
     UploadResponse uploadResponse = UploadResponse.fromJson(request.data);

     if(uploadResponse.message=="Image uploaded successfully"){
       return Left(uploadResponse);
     }

     return Right(uploadResponse.message.toString());
   }catch(error){
     return Right(error.toString());

   }
   
  }

}