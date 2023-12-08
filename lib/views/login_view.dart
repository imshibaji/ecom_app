import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  String username = '';
  String password = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onLogin() {
    if (username == 'admin' && password == 'admin') {
      Navigator.pushReplacementNamed(
        context,
        '/home',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: const EdgeInsets.all(20),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Colors.yellow.shade100,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            SvgPicture.asset(
              'assets/svgs/login.svg',
              width: 200,
              height: 200,
            ),
            const Text(
              'Login Page',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            TextField(
              decoration: inputDecoration(
                'Username',
                checkedValue: username != '',
              ),
              onSubmitted: (value) {
                setState(() {
                  username = value;
                });
              },
            ),
            const SizedBox(
              height: 8,
            ),
            TextField(
              decoration: inputDecoration(
                'Password',
                checkedValue: password != '',
              ),
              onSubmitted: (value) {
                setState(() {
                  password = value;
                });
              },
              maxLength: 200,
            ),
            const SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: onLogin,
              child: const Text(
                'Login',
              ),
            ),
            const SizedBox(
              height: 200,
            )
          ],
        ),
      ),
    );
  }

  InputDecoration inputDecoration(String name, {bool checkedValue = false}) {
    return InputDecoration(
      border: const OutlineInputBorder(),
      labelText: name,
      prefixIcon: const Icon(Icons.person),
      suffixIcon: checkedValue ? const Icon(Icons.check) : null,
      helperText: 'Enter your $name',
      hintText: 'Enter your $name',
      errorText: checkedValue ? null : 'Enter your $name',
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
    );
  }
}
