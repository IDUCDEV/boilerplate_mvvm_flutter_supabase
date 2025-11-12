

enum BackendType { supabase, restApi }
class AppConfig {
  static const BackendType backend = BackendType.supabase; // Cambia a restApi para usar REST API
  static const String restApiBaseUrl = 'https://your-api.com'; // URL base para REST API
}