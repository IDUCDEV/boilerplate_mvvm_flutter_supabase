import 'package:boilerplate_mvvm_app/src/config/app_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';
import 'src/routes/app_router.dart';
import 'src/providers/providers.dart';
import 'src/colors/app_theme.dart';
import 'src/services/supabase_service.dart';
import 'src/viewmodels/auth_viewmodel.dart';
import 'src/constants/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  switch (AppConfig.backend) {
    case BackendType.supabase:
      await SupabaseService.initializeSupabase();
      break;
    case BackendType.restApi:
      // No initialization needed for REST API
      break;
  }

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
            title: AppConstants.appName,
            theme: AppTheme.lightTheme,
            routerConfig: appRouter,
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
