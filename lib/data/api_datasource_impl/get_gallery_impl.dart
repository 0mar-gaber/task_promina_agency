import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/api/api_manager.dart';
import 'package:task_manager_app/core/api/end_points.dart';
import 'package:task_manager_app/data/api_datasource_contract/get_gallery_contract.dart';
import 'package:task_manager_app/data/models/gallery_response/GalleryResponse.dart';
@Injectable(as: GetGalleryContract)
class GerGalleryImpl extends GetGalleryContract {
  ApiManager apiManager ;
  @factoryMethod
  GerGalleryImpl(this.apiManager);
  @override
  Future<Either<GalleryResponse, String>> getGallery(String token) async {
   try{
     var request  = await apiManager.getRequest(endPoint: EndPoint.galleryEndpoint,token: token);
     GalleryResponse galleryResponse = GalleryResponse.fromJson(request);
     return Left(galleryResponse);

   }catch(error){
     return Right(error.toString());
   }

  }
  
}