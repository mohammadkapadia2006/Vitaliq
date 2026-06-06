import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:vitaliq/providers/auth_providers.dart';
import 'package:vitaliq/screens/ai_chat_screen.dart';
import 'package:vitaliq/screens/live_workout_screen.dart';
import 'package:vitaliq/screens/login_screen.dart';
import 'package:vitaliq/screens/main_screen.dart';
import 'package:vitaliq/screens/nutrition_screen.dart';
import 'package:vitaliq/screens/onboarding_screen.dart';
import 'package:vitaliq/screens/profile_screen.dart';
import 'package:vitaliq/screens/signup_screen.dart';
import 'package:vitaliq/screens/sleep_screen.dart';
import 'package:vitaliq/screens/splash_screen.dart';
import 'package:vitaliq/screens/verify_email_screen.dart';




class Routes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const onboarding = '/onboarding';
  static const main = '/main';
  static const liveWorkout = '/workout/live';
  static const sleep = '/sleep';
  static const nutrition = '/nutrition';
  static const aiCoach = '/ai-coach';
  static const profile = '/profile';
  static const verifyEmail = '/verify-email';
}

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: Routes.splash,
    debugLogDiagnostics: true,

    redirect: (context, state) {
      final user = authState.asData?.value;
      final isLoggedIn = user != null;
      final isEmailVerified = FirebaseAuth.instance.currentUser?.emailVerified ?? false;
      final loc = state.matchedLocation;

      final isAuthPage = loc == Routes.login ||
          loc == Routes.signup ||
          loc == Routes.splash ||
          loc == Routes.onboarding ||
          loc == Routes.verifyEmail;

      if (!isLoggedIn && !isAuthPage) return Routes.login;
      if (isLoggedIn && !isEmailVerified && loc != Routes.verifyEmail) {
        // Google sign-in emails are already verified
        if (user.providerData.any((p) => p.providerId == 'google.com')) {
          return isAuthPage ? Routes.main : null;
        }
        return Routes.verifyEmail;
      }
      if (isLoggedIn && isEmailVerified && isAuthPage) return Routes.main;
      return null;
    },

    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: Routes.signup,
        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        path: Routes.onboarding,
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: Routes.main,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: Routes.liveWorkout,
        builder: (context, state) => const LiveWorkoutScreen(),
      ),
      GoRoute(
        path: Routes.sleep,
        builder: (context, state) => const SleepScreen(),
      ),
      GoRoute(
        path: Routes.nutrition,
        builder: (context, state) => const NutritionScreen(),
      ),
      GoRoute(
        path: Routes.aiCoach,
        builder: (context, state) => const AiChatScreen(),
      ),
      GoRoute(
        path: Routes.profile,
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: Routes.verifyEmail,
        builder: (context, state) => const VerifyEmailScreen(),
      ),
    ],

    errorBuilder: (context, state) => Scaffold(
      body: Center(child: Text('Page not found: ${state.error}')),
    ),
  );
});