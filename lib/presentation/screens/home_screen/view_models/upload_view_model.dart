import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/domain/entities/upload_entity/UploadEntity.dart';

import '../../../../domain/use_cases/upload_cases/upload_case.dart';

@injectable
class UploadViewModel extends Cubit<UploadState>{
  UploadUseCase useCase ;
  @factoryMethod
  UploadViewModel(this.useCase):super(UploadInitState());
  static UploadViewModel get(BuildContext context)=>BlocProvider.of(context);

  upload({required String token , required FormData image}) async {
    emit(UploadLoadingState());
    var result  = await useCase.call(token: token, image: image);
    result.fold(
            (response) => emit(UploadSuccessState(response)),
            (error) => emit(UploadErrorState(error))
    );
  }
  
}
abstract class UploadState {}

class UploadInitState extends UploadState{}
class UploadLoadingState extends UploadState{}
class UploadErrorState extends UploadState{
  String? errorMessage;
  UploadErrorState(this.errorMessage);
}
class UploadSuccessState extends UploadState{
  UploadEntity? uploadEntity ;
  UploadSuccessState(this.uploadEntity);
}