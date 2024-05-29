import 'package:dartz/dartz.dart';
import 'package:task_manager_app/domain/entities/gallery_entity/GalleryEntity.dart';

abstract class GetGalleryRepo {
  Future<Either<GalleryEntity,String>> getGallery(String token);
}