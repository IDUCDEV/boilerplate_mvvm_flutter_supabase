import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../viewmodels/auth_viewmodel.dart';
import '../repositories/authRepository/auth_repository.dart';
import '../services/supabase_service.dart';
import '../services/preferences_service.dart';

final List<SingleChildWidget> appProviders = [
  Provider(create: (_) => SupabaseService()),
  Provider(create: (_) => PreferencesService()),
  ChangeNotifierProvider(
    create: (context) => AuthViewModel(
      authRepository: AuthRepository(supabase: SupabaseService().client),
    ),
  ),
  // Add other providers here

];
