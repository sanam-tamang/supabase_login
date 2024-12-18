// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:supabaselearning/features/auth/blocs/auth_bloc/auth_bloc.dart'
    as auth;
import 'package:supabaselearning/core/utils.dart';
import 'package:supabaselearning/core/validation.dart';
import 'package:supabaselearning/dependency_injection.dart';
import 'package:supabaselearning/router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({
    super.key,
  });

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void initState() {
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Sign up",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            Gap(30),
            CustomTextField(
              controller: _emailController,
              hintText: "Enter your email",
              labelText: "Email",
              validator: Validation.validateEmail,
            ),
            Gap(20),
            CustomTextField(
              controller: _passwordController,
              hintText: "Enter your password",
              labelText: "Password",
              validator: Validation.validatePassword,
            ),
            Gap(30),
            BlocListener<auth.AuthBloc, auth.AuthState>(
              listener: (context, state) async {
                if (state is auth.AuthLoading) {
                  await Utils.showLoadingDialog(context);
                } else if (state is auth.AuthLoaded) {
                  context.pop();

                  context.goNamed(AppRouteName.home);

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("auth successful")));
                } else if (state is auth.AuthFailure) {
                  context.pop();

                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text(state.message)));
                }
              },
              child: SizedBox(
                  width: double.maxFinite,
                  child: FilledButton(
                      onPressed: _onSignUp, child: Text("Sign up"))),
            )
          ],
        ),
      ),
    ));
  }

  void _onSignUp() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      sl<auth.AuthBloc>()
          .add(auth.AuthSignUpEvent(email: email, password: password));
    }
  }
}

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.validator,
  });
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          label: Text(labelText),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16))),
    );
  }
}
