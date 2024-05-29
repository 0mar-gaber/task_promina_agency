import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/data/api_datasource_contract/auth_contract.dart';
import 'package:task_manager_app/domain/entities/auth_entity/EntityUser.dart';
import 'package:task_manager_app/domain/repository_contract/auth_repo.dart';

import '../../domain/entities/auth_entity/AuthEntity.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl extends AuthRepo {
  AuthContract authImpl ;
  @factoryMethod
  AuthRepoImpl(this.authImpl);

  @override
  Future<Either<AuthEntity, String>> login({required String email, required String password}) async {
   var result = await authImpl.login(email: email, password: password);
   return result.fold(
           (response) {
             EntityUser user = EntityUser(
               email: response.user?.email,
               id: response.user?.id,
               name: response.user?.name
             );
             AuthEntity authEntity = AuthEntity(
               user: user,
               token: response.token,
             );
             return Left(authEntity);
           },
           (error) => Right(error)
   );
  }
}