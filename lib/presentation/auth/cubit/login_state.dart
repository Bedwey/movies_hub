part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    this.isLoading = false,
    this.errorMessage = '',
  });

  final bool isLoading;
  final String errorMessage;

  @override
  List<Object> get props => [isLoading, errorMessage];

  LoginState copyWith({bool? isLoading, String? errorMessage}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
