import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:job_app/cubits/search_jobs/cubit/search_jobs_cubit.dart';
import 'package:job_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/create account/views/create_account_view.dart';
import 'features/create account/views/job_preferences_view.dart';
import 'features/create account/views/widgets/all_done_screen.dart';
import 'features/home/views/home_view.dart';

import 'features/home/views/seach_view.dart';
import 'features/home/views/widgets/saved_jobs_provider.dart';
import 'features/home/views/widgets/saved_jobs_screen.dart';
import 'features/login/views/login_screen_view.dart';
import 'features/messages/views/messages_view.dart';
import 'features/onboarding/views/onboarding_view.dart';
import 'features/splash/views/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();  //// Ensure Flutter bindings are initialized
  final isLoggedIn = await checkLoginStatus();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => SavedJobsProvider()),
      // Add other providers if needed
    ],
    child: MyApp(isLoggedIn: isLoggedIn),
  ));
}

Future<bool> checkLoginStatus() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var status = prefs.getBool('isLoggedIn') ?? false;

  print('isLoggedIn is: $status');
  return status;
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SearchJobsCubit>(
          create: (context) => SearchJobsCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // Hide the debug banner
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.kprimarycolor,
        ),
        routes: {
          HomeView.id: (context) => const HomeView(),
          LoginScreenView.id: (context) => const LoginScreenView(),
          MessagesView.id: (context) => const MessagesView(),
          SavedJobsScreen.id: (context) => const SavedJobsScreen(),
          SplashView.id: (context) => const SplashView(),
          CreateAccountView.id: (context) => const CreateAccountView(),
          OnboardingScreenView.id: (context) => const OnboardingScreenView(),
          JobPreferencesView.id: (context) => const JobPreferencesView(),
          SearchView.id: (context) => const SearchView(),
          AllDoneScreen.id: (context) => const AllDoneScreen(),
        },
        initialRoute: isLoggedIn ? LoginScreenView.id : SplashView.id,
      ),
    );
  }
}
