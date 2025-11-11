# Boilerplate MVVM App - Flutter con Supabase

Este es un proyecto boilerplate para aplicaciones Flutter que utilizan Supabase como backend, siguiendo la arquitectura MVVM (Model-View-ViewModel). Está diseñado para acelerar el desarrollo de aplicaciones móviles con autenticación, navegación y gestión de estado.

## Características

- **Arquitectura MVVM**: Separación clara entre la lógica de negocio, la interfaz de usuario y los modelos de datos.
- **Autenticación con Supabase**: Integración completa para login, registro y gestión de sesiones.
- **Navegación con Go Router**: Sistema de rutas avanzado con redirecciones basadas en el estado de autenticación.
- **Gestión de Estado con Provider**: Manejo eficiente del estado de la aplicación.
- **Splash Screen Personalizable**: Pantalla de inicio con animación y navegación automática.
- **Configuración de Variables de Entorno**: Uso de `flutter_dotenv` para manejar claves sensibles de Supabase.

## Estructura del Proyecto

```
lib/
├── main.dart                 # Punto de entrada de la aplicación
├── src/
│   ├── colors/
│   │   └── app_theme.dart    # Definiciones de colores y temas
│   ├── config/
│   │   ├── app_config.dart   # Configuraciones generales
│   │   └── env.dart          # Configuración de entorno
│   ├── constants/
│   │   └── app_constants.dart # Constantes de la aplicación
│   ├── models/
│   │   └── user_model.dart   # Modelos de datos
│   ├── providers.dart        # Configuración de proveedores (Provider)
│   ├── repositories/
│   │   └── auth_repository.dart # Repositorios para acceso a datos
│   ├── routes/
│   │   └── app_router.dart   # Configuración de rutas (Go Router)
│   ├── services/
│   │   ├── supabase_service.dart # Servicio de Supabase
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
- Una cuenta en [Supabase](https://supabase.com) con un proyecto configurado

## Configuración

1. **Clona el repositorio**:
   ```bash
   git clone <url-del-repositorio>
   cd boilerplate_mvvm_app
   ```

2. **Instala las dependencias**:
   ```bash
   flutter pub get
   ```

3. **Configura las variables de entorno**:
   - Edita el archivo `.env` en la raíz del proyecto:
     ```
     SUPABASE_URL=https://tu-proyecto.supabase.co
     SUPABASE_ANON_KEY=tu-clave-anonima
     ```
   - Asegúrate de que `.env` esté incluido en los assets de `pubspec.yaml`.

4. **Configura Supabase**:
   - Crea las tablas necesarias en tu proyecto de Supabase.
   - Actualiza las políticas de Row Level Security (RLS) según tus necesidades.

## Ejecución

Para ejecutar la aplicación en modo de desarrollo:

```bash
flutter run
```

## Arquitectura MVVM

- **Model**: Representa los datos y la lógica de negocio pura.
- **View**: La interfaz de usuario, construida con widgets de Flutter.
- **ViewModel**: Actúa como intermediario entre Model y View, manejando el estado y la lógica de presentación.

## Dependencias Principales

- `supabase_flutter`: Cliente de Supabase para Flutter.
- `provider`: Para gestión de estado.
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

## Recursos Adicionales

- [Documentación de Flutter](https://docs.flutter.dev/)
- [Documentación de Supabase](https://supabase.com/docs)
- [Go Router Documentation](https://pub.dev/packages/go_router)
- [Provider Documentation](https://pub.dev/packages/provider)
