import 'package:flutter/material.dart';

import '../../../../common/utils/routes.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late final TextEditingController _nameController1;
  late final TextEditingController _nameController2;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _nameController1 = TextEditingController();
    _nameController2 = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController1.dispose();
    _nameController2.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  width: 150,
                  child: Image.asset('assets/images/shop.png'),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _nameController1,
                        decoration: const InputDecoration(
                          labelText: 'Nome',
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        controller: _nameController2,
                        decoration: const InputDecoration(
                          labelText: 'Sobrenome',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: _confirmPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'Confirmar Senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF3781DA), // Define a cor azul em hexadecimal
                        Color(
                            0xFF175BAE), // Define a cor azul escura em hexadecimal
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      print('Botão pressionado!');
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.transparent,
                    ),
                    child: const Text(
                      'CADASTRAR',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                      onPressed: () => {
                            Navigator.popUntil(
                                context, ModalRoute.withName(Routes.login)),
                          },
                      child: const Text(
                        "Já tenho uma conta, Entrar!",
                        style: TextStyle(fontSize: 18),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
