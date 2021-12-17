import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:testing_in_flutter/home_view.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final formKey = GlobalKey<FormState>();
  late String email, password;
  bool isLoading = false;

  void login() async {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    setState(() => isLoading = true);
    await Future.delayed(const Duration(seconds: 3)).then((value) {
      if (email == 'a@a.com' && password == '12345678') {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => const HomeView(),
        ));
      } else {
       showErrorDialog();
      }
      setState(() => isLoading = false);
    });
  }

  showErrorDialog() => showCupertinoDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
          title: const Text('Login Error!'),
          content: const Text('Email & Password did n\'t match!'),
          actions: [
            CupertinoButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(30),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: TextFormField(
                onSaved: (value) => email = value!,
                validator: (value) => value!.isEmpty ? 'Empty!' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: TextFormField(
                onSaved: (value) => password = value!,
                validator: (value) => value!.isEmpty ? 'Empty!' : null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Builder(
                builder: (context) {
                  if (isLoading) {
                    return const CupertinoActivityIndicator();
                  }
                  return ElevatedButton(
                    onPressed: login,
                    child: const Text('Login'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
