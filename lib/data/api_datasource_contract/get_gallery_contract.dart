import 'package:dartz/dartz.dart';
import 'package:task_manager_app/data/models/gallery_response/GalleryResponse.dart';

abstract class GetGalleryContract{
  Future<Either<GalleryResponse,String>> getGallery(String token);
}