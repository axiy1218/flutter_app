import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String? _email = '';
  String? _password = '';

  final TextEditingController _emailEditingController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      debugPrint('EMAIL :: $_email');
      debugPrint('PASSWORD:: $_password');
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Siz muvofaqqiyatli login qildingiz')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: SafeArea(
        child: Builder(builder: (context) {
          return SizedBox(
            width: double.infinity,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                      controller: _emailEditingController,
                      validator: (value) => !value!.contains('@') ||
                              _passwordController.text.length < 6
                          ? "Notogri email"
                          : null,
                      onSaved: (newValue) {
                        _email = newValue;
                        setState(() {});
                      },
                      decoration: InputDecoration(
                          filled: true,
                          hintText: 'Email',
                          label: const Text('Email'),
                          prefixIcon: const Icon(Icons.email),
                          fillColor: Colors.grey[200],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextFormField(
                        controller: _passwordController,
                        obscureText: true,
                        validator: (value) => value!.length < 6 ||
                                !_emailEditingController.text.contains('@')
                            ? 'Password 6 ta dan kam'
                            : null,
                        onSaved: (newValue) {
                          _password = newValue;
                          setState(() {});
                        },
                        decoration: InputDecoration(
                            filled: true,
                            hintText: 'Password',
                            floatingLabelAlignment:
                                FloatingLabelAlignment.center,
                            floatingLabelBehavior: FloatingLabelBehavior.auto,
                            label: const Text('Password'),
                            prefixIcon: const Icon(Icons.lock),
                            fillColor: Colors.grey[200],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30)))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: MaterialButton(
                        onPressed: _login,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        color: Colors.blue,
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
