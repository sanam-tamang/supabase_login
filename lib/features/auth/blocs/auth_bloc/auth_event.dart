// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthSignUpEvent extends AuthEvent {
  final String email;
  final String password;
  const AuthSignUpEvent({
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [email, password];
}
