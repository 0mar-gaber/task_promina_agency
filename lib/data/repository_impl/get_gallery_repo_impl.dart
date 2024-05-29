import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/data/api_datasource_contract/get_gallery_contract.dart';
import 'package:task_manager_app/domain/entities/gallery_entity/DataEntity.dart';
import 'package:task_manager_app/domain/entities/gallery_entity/GalleryEntity.dart';
import 'package:task_manager_app/domain/repository_contract/get_gallery_repo.dart';

@Injectable(as: GetGalleryRepo)
class GetGalleryRepoImpl extends GetGalleryRepo {
  GetGalleryContract galleryContract ;
  @factoryMethod
  GetGalleryRepoImpl(this.galleryContract);
  @override
  Future<Either<GalleryEntity, String>> getGallery(String token) async {
    var result = await galleryContract.getGallery(token);
    return result.fold(
            (response) {
              DataEntity data = DataEntity(
                images: response.data?.images
              );
              GalleryEntity galleryEntity = GalleryEntity(
                data: data
              );
              return Left(galleryEntity);
            },
            (error) => Right(error)
    );
  }

}