import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/theme/colors.dart';
import 'locator.dart';
import 'core/router/router.dart';
import 'core/logic/authentication_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );
  await setupLocator();
  runApp(BlocProvider(create: (_) => AuthenticationCubit(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          AppRouter.router.refresh();
        },
        child: MaterialApp.router(
          title: 'Movies Hub',
          theme: ThemeData(
            brightness: Brightness.light,
            useMaterial3: true,
            primaryColor: ColorsManager.mainBlue,
            navigationBarTheme: const NavigationBarThemeData(
              backgroundColor: Colors.white,
              surfaceTintColor: ColorsManager.mainBlue,
              indicatorColor: ColorsManager.mainBlue,
            ),
            scaffoldBackgroundColor: Colors.white,
          ),
          debugShowCheckedModeBanner: false,
          routerDelegate: AppRouter.router.routerDelegate,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routeInformationProvider: AppRouter.router.routeInformationProvider,
        ),
      ),
    );
  }
}
