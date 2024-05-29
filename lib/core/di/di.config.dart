// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/api_datasource_contract/auth_contract.dart' as _i6;
import '../../data/api_datasource_contract/get_gallery_contract.dart' as _i8;
import '../../data/api_datasource_contract/upload_contract.dart' as _i4;
import '../../data/api_datasource_impl/auth_impl.dart' as _i7;
import '../../data/api_datasource_impl/get_gallery_impl.dart' as _i9;
import '../../data/api_datasource_impl/upload_contract_impl.dart' as _i5;
import '../../data/repository_impl/auth_repo_impl.dart' as _i13;
import '../../data/repository_impl/get_gallery_repo_impl.dart' as _i15;
import '../../data/repository_impl/upload_repo_impl.dart' as _i11;
import '../../domain/repository_contract/auth_repo.dart' as _i12;
import '../../domain/repository_contract/get_gallery_repo.dart' as _i14;
import '../../domain/repository_contract/upload_repo.dart' as _i10;
import '../../domain/use_cases/auth_case/auth_case.dart' as _i18;
import '../../domain/use_cases/get_gallery_cases/get_gallery_case.dart' as _i17;
import '../../domain/use_cases/upload_cases/upload_case.dart' as _i16;
import '../../presentation/screens/auth_screen/auth_viewmodel.dart' as _i21;
import '../../presentation/screens/home_screen/view_models/gallery_view_model.dart'
    as _i19;
import '../../presentation/screens/home_screen/view_models/upload_view_model.dart'
    as _i20;
import '../api/api_manager.dart' as _i3;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i3.ApiManager>(() => _i3.ApiManager());
    gh.factory<_i4.UploadContract>(
        () => _i5.UploadContractImpl(gh<_i3.ApiManager>()));
    gh.factory<_i6.AuthContract>(() => _i7.AuthImpl(gh<_i3.ApiManager>()));
    gh.factory<_i8.GetGalleryContract>(
        () => _i9.GerGalleryImpl(gh<_i3.ApiManager>()));
    gh.factory<_i10.UploadRepo>(
        () => _i11.UploadRepoImpl(gh<_i4.UploadContract>()));
    gh.factory<_i12.AuthRepo>(() => _i13.AuthRepoImpl(gh<_i6.AuthContract>()));
    gh.factory<_i14.GetGalleryRepo>(
        () => _i15.GetGalleryRepoImpl(gh<_i8.GetGalleryContract>()));
    gh.factory<_i16.UploadUseCase>(
        () => _i16.UploadUseCase(gh<_i10.UploadRepo>()));
    gh.factory<_i17.GalleryUseCase>(
        () => _i17.GalleryUseCase(gh<_i14.GetGalleryRepo>()));
    gh.factory<_i18.AuthCase>(() => _i18.AuthCase(gh<_i12.AuthRepo>()));
    gh.factory<_i19.GalleryViewModel>(
        () => _i19.GalleryViewModel(gh<_i17.GalleryUseCase>()));
    gh.factory<_i20.UploadViewModel>(
        () => _i20.UploadViewModel(gh<_i16.UploadUseCase>()));
    gh.factory<_i21.AuthViewModel>(
        () => _i21.AuthViewModel(gh<_i18.AuthCase>()));
    return this;
  }
}
