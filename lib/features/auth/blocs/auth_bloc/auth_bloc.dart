import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabaselearning/features/auth/repositories/auth_repositories.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final BaseAuthRepository _repo;
  AuthBloc({required BaseAuthRepository repo})
      : _repo = repo,
        super(AuthInitial()) {
    on<AuthSignUpEvent>(_onSignUp);
  }

  Future<void> _onSignUp(AuthSignUpEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    try {
      await _repo.signUpWithEmail(email: event.email, password: event.password);
      emit(AuthLoaded());
    } catch (e) {
      emit(AuthFailure(message: e.toString()));
    }
  }
}
