import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/domain/entities/gallery_entity/GalleryEntity.dart';

import '../../../../domain/use_cases/get_gallery_cases/get_gallery_case.dart';

@injectable
class GalleryViewModel extends Cubit<GalleryState>{
  GalleryUseCase galleryUseCase ;
  @factoryMethod
  GalleryViewModel(this.galleryUseCase):super(GalleryInitState());
  static GalleryViewModel get(BuildContext context)=>BlocProvider.of(context);

  getGallery(String token) async {
    emit(GalleryLoadingState());
    var result = await galleryUseCase.call(token);
    result.fold(
            (gallery) => emit(GallerySuccessState(gallery)),
            (error) => emit(GalleryErrorState(error))
    );
  }

}
abstract class GalleryState{}
class GalleryInitState extends GalleryState{}
class GalleryLoadingState extends GalleryState{}
class GalleryErrorState extends GalleryState{
  String? errorMessage;
  GalleryErrorState(this.errorMessage);
}
class GallerySuccessState extends GalleryState{
  GalleryEntity? galleryEntity ;
  GallerySuccessState(this.galleryEntity);
}