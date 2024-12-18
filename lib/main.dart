// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:supabaselearning/features/auth/blocs/auth_bloc/auth_bloc.dart'
    as auth;
import 'package:supabaselearning/dependency_injection.dart';
import 'package:supabaselearning/features/auth/pages/sign_up_page.dart';
import 'package:supabaselearning/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  init();
  await Supabase.initialize(
    url: "https://dfzlbnvxxcniuvvdoxxt.supabase.co",
    anonKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRmemxibnZ4eGNuaXV2dmRveHh0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ1MTA5ODEsImV4cCI6MjA1MDA4Njk4MX0.-ax7nTSnKd0RzSPp_RHCdpbb9oiT2fEaxqyBh1miLXA",
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<auth.AuthBloc>(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routerConfig: AppRoute.goRoute,
      ),
    );
  }
}
