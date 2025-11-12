# Boilerplate MVVM Flutter - Arquitectura Flexible (Supabase / REST API)

Este es un proyecto boilerplate para aplicaciones Flutter, diseñado con una arquitectura MVVM (Model-View-ViewModel) limpia y flexible. Su principal ventaja es la capacidad de intercambiar el backend de forma sencilla, permitiendo empezar con **Supabase** y migrar a una **API REST** personalizada (o viceversa) con un cambio mínimo en la configuración.

Está diseñado para acelerar el desarrollo de aplicaciones móviles robustas y escalables.

## Arquitectura Flexible: Backend Intercambiable

Este boilerplate implementa un patrón de diseño que desacopla la lógica de negocio de la fuente de datos, permitiendo una gran flexibilidad.

- **Interfaces (Contratos)**: Se definen interfaces como `IAuthService` y `IAuthRepository` que establecen qué acciones se pueden realizar (ej. `login`, `logout`) sin especificar cómo se implementan.
- **Servicios Concretos**: Existen implementaciones específicas para cada backend:
    - `SupabaseService`: Contiene la lógica para interactuar con Supabase.
    - `RestApiAuthService`: Contiene la lógica para consumir una API REST estándar.
- **Inyección de Dependencias**: A través de `Provider` y una configuración central en `lib/src/providers/providers.dart`, la aplicación decide qué servicio concreto utilizar en tiempo de ejecución basándose en la configuración de `AppConfig`.

### ¿Cómo cambiar de backend?

Para cambiar entre Supabase y una API REST, simplemente modifica el archivo de configuración `lib/src/config/app_config.dart` y ajusta la variable `backend`. El resto de la aplicación se adaptará sin necesidad de cambios adicionales.

## Características

- **Arquitectura MVVM**: Separación clara entre la lógica de negocio, la interfaz de usuario y los modelos de datos.
- **Backend Intercambiable**: Soporte para Supabase y API REST genérica desde el inicio.
- **Autenticación**: Integración completa para login, registro y gestión de sesiones.
- **Navegación con Go Router**: Sistema de rutas avanzado con redirecciones basadas en el estado de autenticación.
- **Gestión de Estado con Provider**: Manejo eficiente del estado de la aplicación.
- **Splash Screen Personalizable**: Pantalla de inicio con animación y navegación automática.
- **Configuración de Variables de Entorno**: Uso de `flutter_dotenv` para manejar claves sensibles.

## Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── src/
│   ├── colors/
│   │   └── app_theme.dart    # Definiciones de colores y temas
│   ├── config/
│   │   ├── app_config.dart   # Configuraciones generales (¡aquí se cambia el backend!)
│   │   └── env.dart          # Configuración de entorno
│   ├── constants/
│   │   └── app_constants.dart # Constantes de la aplicación
│   ├── models/
│   │   └── user_model.dart   # Modelos de datos
│   ├── providers/
│   │   └── providers.dart    # Configuración de proveedores (Provider)
│   ├── repositories/
│   │   └── auth_repository.dart # Repositorios para acceso a datos
│   ├── routes/
│   │   └── app_router.dart   # Configuración de rutas (Go Router)
│   ├── services/
│   │   ├── auth_service_interface.dart # Contrato para los servicios de autenticación
│   │   ├── supabase_service.dart # Servicio de Supabase
│   │   ├── rest_api_auth_service.dart # Servicio para API REST
│   │   └── preferences_service.dart # Servicio de preferencias locales
│   ├── viewmodels/
│   │   └── auth_viewmodel.dart # ViewModels para lógica de negocio
│   ├── views/
│   │   ├── splash_screen.dart # Pantalla de inicio
│   │   ├── auth/
│   │   │   └── login_view.dart # Vistas de autenticación
│   │   └── home/
│   │       └── home_view.dart # Vistas principales
│   └── widgets/              # Widgets reutilizables
│       ├── app_button.dart
│       └── app_input.dart
```

## Requisitos Previos

- Flutter SDK (^3.9.2)
- Una cuenta en [Supabase](https://supabase.com) (si se usa este backend)

## Configuración

1. **Clona el repositorio**:
   ```bash
   git clone <url-del-repositorio>
   cd boilerplate_mvvm_flutter_supabase
   ```

2. **Instala las dependencias**:
   ```bash
   flutter pub get
   ```

3. **Configura las variables de entorno**:
   - Crea un archivo `.env` en la raíz del proyecto a partir del `.env.example` (si existe).
   - Añade las claves para el backend que vayas a utilizar:
     ```
     # Para Supabase
     SUPABASE_URL=https://tu-proyecto.supabase.co
     SUPABASE_ANON_KEY=tu-clave-anonima

     # Para la API REST (si aplica)
     REST_API_BASE_URL=https://api.tu-dominio.com
     ```
   - Asegúrate de que `.env` esté incluido en los assets de `pubspec.yaml`.

4. **Selecciona el Backend**:
   - Abre `lib/src/config/app_config.dart` y elige el `BackendType` que deseas usar.

## Ejecución

Para ejecutar la aplicación en modo de desarrollo:

```bash
flutter run
```

## Dependencias Principales

- `supabase_flutter`: Cliente de Supabase para Flutter.
- `provider`: Para gestión de estado e inyección de dependencias.
- `go_router`: Para navegación.
- `flutter_dotenv`: Para variables de entorno.
- `shared_preferences`: Para almacenamiento local.

## Contribución

Si deseas contribuir a este boilerplate:

1. Haz un fork del proyecto.
2. Crea una rama para tu feature (`git checkout -b feature/nueva-funcionalidad`).
3. Commit tus cambios (`git commit -am 'Agrega nueva funcionalidad'`).
4. Push a la rama (`git push origin feature/nueva-funcionalidad`).
5. Abre un Pull Request.

## Licencia

Este proyecto está bajo la Licencia MIT. Ver el archivo `LICENSE` para más detalles.
