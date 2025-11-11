import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../viewmodels/auth_viewmodel.dart';
import '../../widgets/app_button.dart';
import '../../widgets/app_input.dart';
import 'package:go_router/go_router.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AuthViewModel>();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppInput(controller: emailCtrl, hint: "Email"),
              const SizedBox(height: 12),
              AppInput(controller: passCtrl, hint: "Password", obscureText: true),
              const SizedBox(height: 24),
              if (vm.isLoading) const CircularProgressIndicator(),
              if (!vm.isLoading)
                AppButton(
                  label: "Iniciar sesión",
                  onPressed: () async {
                    final success = await vm.login(emailCtrl.text, passCtrl.text);
                    if (success && context.mounted) {
                      context.go('/home');
                    }
                  },
                ),
              if (vm.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(top: 12),
                  child: Text(vm.errorMessage!, style: const TextStyle(color: Colors.red)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
