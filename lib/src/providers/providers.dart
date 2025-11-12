import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../repositories/authRepository/auth_repository.dart';
import '../services/supabase_service.dart';
import '../services/rest_api_auth_service.dart';
import '../services/auth_service_interface.dart';
import '../services/preferences_service.dart';
import '../config/app_config.dart';

IAuthService _createAuthService() {
  switch (AppConfig.backend) {
    case BackendType.supabase:
      return SupabaseService();
    case BackendType.restApi:
      return RestApiAuthService(baseUrl: AppConfig.restApiBaseUrl);
  }
}

final List<SingleChildWidget> appProviders = [
  Provider<IAuthService>(create: (_) => _createAuthService()),
  Provider(create: (_) => PreferencesService()),
  ChangeNotifierProvider(
    create: (context) => AuthViewModel(
      authRepository: AuthRepository(authService: context.read<IAuthService>()),
    ),
  ),
  // Add other providers here

];
