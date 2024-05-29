import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/entities/auth_entity/AuthEntity.dart';
import '../../../domain/use_cases/auth_case/auth_case.dart';
@injectable
class AuthViewModel extends Cubit<AuthState> {
  AuthCase authCase;

  @factoryMethod
  AuthViewModel(this.authCase) : super(AuthInitState());
  static AuthViewModel get(BuildContext context)=>BlocProvider.of(context);
  login({required String email, required String password}) async {
    emit(AuthLoadingState());
    var request = await authCase.call(email: email, password: password);

    request.fold((response) => emit(AuthSuccessState(response)),
        (error) => emit(AuthErrorState(error)));
  }
}

abstract class AuthState {}

class AuthInitState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  String? errorMessage;

  AuthErrorState(this.errorMessage);
}

class AuthSuccessState extends AuthState {
  AuthEntity? userData;

  AuthSuccessState(this.userData);
}
