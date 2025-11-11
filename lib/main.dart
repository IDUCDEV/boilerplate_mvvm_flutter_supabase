import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'src/routes/app_router.dart';
import 'src/providers/providers.dart';
import 'src/colors/app_theme.dart';
import 'src/services/supabase_service.dart';
import 'src/viewmodels/auth_viewmodel.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await SupabaseService.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: appProviders,
      child: Builder(
        builder: (context) {
          final authViewModel = Provider.of<AuthViewModel>(context);
          final appRouter = AppRouter(authViewModel).router;
          return MaterialApp.router(
            title: 'Flutter MVVM Starter',
            theme: AppTheme.lightTheme,
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
