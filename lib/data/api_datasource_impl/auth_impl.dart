
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:task_manager_app/core/api/api_manager.dart';
import 'package:task_manager_app/core/api/end_points.dart';
import 'package:task_manager_app/data/api_datasource_contract/auth_contract.dart';
import 'package:task_manager_app/data/models/auth_response/AuthResponse.dart';

@Injectable(as: AuthContract)
class AuthImpl extends AuthContract{
  ApiManager apiManager ;
  @factoryMethod
  AuthImpl(this.apiManager);
  @override
  Future<Either<AuthResponse, String>> login({required String email, required String password}) async {
   try{
     var request = await apiManager.postRequest(endPoint: EndPoint.loginEndpoint, body:{
       "email":email,
       "password":password
     });
     var response = AuthResponse.fromJson(request.data);
     if(response.errorMessage!=null){
       return Right(response.errorMessage.toString());
     }
     return Left(response);
   }catch(error){
     return Right(error.toString());
   }

  }
  
}