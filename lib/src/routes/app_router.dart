import 'package:boilerplate_mvvm_app/src/views/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';
import '../views/auth/login_view.dart';
import '../views/home/home_view.dart';
import '../viewmodels/auth_viewmodel.dart';

class AppRouter {
  final AuthViewModel authViewModel;
  late final GoRouter router;

  AppRouter(this.authViewModel) {
    router = GoRouter(
      refreshListenable: authViewModel,
      initialLocation: '/splash',
      routes: [
        GoRoute(path: '/splash', builder: (_, __) => const SplashView()),
        GoRoute(path: '/login', builder: (_, __) => const LoginView()),
        GoRoute(path: '/home', builder: (_, __) => const HomeView()),
      ],
      redirect: (context, state) {
        final bool loggedIn = authViewModel.isAuthenticated;
        final String location = state.matchedLocation;

        if (!loggedIn) {
          return location == '/login' || location == '/splash' ? null : '/login';
        }

        if (location == '/login' || location == '/splash') {
          return '/home';
        }

        return null;
      },
    );
  }
}
