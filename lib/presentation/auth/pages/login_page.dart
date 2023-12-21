import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_hub/core/theme/styles.dart';
import 'package:movies_hub/core/widgets/better_button.dart';
import 'package:movies_hub/core/widgets/better_input.dart';

import '../../../../core/helpers/app_regex.dart';
import '../../../../core/theme/spacing.dart';
import '../cubit/login_cubit.dart';
import '../widgets/already_have_account_text.dart';
import '../widgets/login_bloc_listener.dart';
import '../widgets/terms_and_conditions_text.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome Back',
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text("We're excited to have you back, can't wait to see what you've been up to since you last logged in.", style: TextStyles.font14GrayRegular),
              verticalSpace(36),
              Form(
                key: context.read<LoginCubit>().formKey,
                child: Column(
                  children: [
                    BetterInput(
                      controller: context.read<LoginCubit>().emailController,
                      hintText: 'Email',
                      validator: (value) {
                        if (value == null || value.isEmpty || !AppRegex.isEmailValid(value)) {
                          return 'Please enter a valid email';
                        }
                      },
                    ),
                    verticalSpace(18),
                    BetterInput(
                      controller: context.read<LoginCubit>().passwordController,
                      hintText: 'Password',
                      isObscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a valid password';
                        }
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              BetterButton(
                buttonText: 'Login',
                textStyle: TextStyles.font16WhiteMedium,
                onPressed: () => context.read<LoginCubit>().login(),
              ),
              verticalSpace(16),
              const TermsAndConditionsText(),
              verticalSpace(60),
              const AlreadyHaveAccountText(),
              const LoginBlocListener(),
            ],
          ),
        ),
      ),
    );
  }
}
