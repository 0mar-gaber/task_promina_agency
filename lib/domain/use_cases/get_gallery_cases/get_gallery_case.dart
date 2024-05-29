import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/domain/entities/gallery_entity/GalleryEntity.dart';
import 'package:task_manager_app/domain/repository_contract/get_gallery_repo.dart';

@injectable
class GalleryUseCase{
  GetGalleryRepo galleryRepo ;
  @factoryMethod
  GalleryUseCase(this.galleryRepo);
  Future<Either<GalleryEntity,String>> call(String token){
    return galleryRepo.getGallery(token);
  }
}