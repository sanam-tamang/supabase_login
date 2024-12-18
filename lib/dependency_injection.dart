import 'package:get_it/get_it.dart';
import 'package:supabaselearning/features/auth/blocs/auth_bloc/auth_bloc.dart';
import 'package:supabaselearning/features/auth/repositories/auth_repositories.dart';

final GetIt sl = GetIt.instance;

void init() {
  ///bloc
  sl.registerLazySingleton(() => AuthBloc(repo: sl()));

//repos
  sl.registerLazySingleton<BaseAuthRepository>(() => AuthRepositoryImpl());
}
