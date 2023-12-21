import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState());

  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      emit(state.copyWith(isLoading: true));
      try {
        await Supabase.instance.client.auth.signInWithPassword(
          email: emailController.text,
          password: passwordController.text,
        );
      } catch (e) {
        emit(state.copyWith(errorMessage: e.toString()));
      } finally {
        emit(state.copyWith(isLoading: false));
      }
    }
  }
}
