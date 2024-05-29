import 'package:injectable/injectable.dart';
import 'package:task_manager_app/domain/repository_contract/auth_repo.dart';

@injectable
class AuthCase{
  AuthRepo authRepo;
  @factoryMethod
  AuthCase(this.authRepo);

  call({required String email, required String password}){
    return authRepo.login(email: email, password: password);
  }

}