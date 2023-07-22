import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('登录')),
      body: SafeArea(
        minimum: const EdgeInsets.all(30),
        child: ListView(
          children: [
            const TextField(
                decoration: InputDecoration(
              labelText: '用户名',
              hintText: '请输入用户名',
            )),
            const Padding(padding: EdgeInsets.all(10)),
            TextField(
                obscureText: !showPassword,
                decoration: InputDecoration(
                    labelText: '密码',
                    hintText: '请输入密码',
                    suffixIcon: IconButton(
                        icon: Icon(showPassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showPassword = !showPassword;
                          });
                        }))),
            const Padding(padding: EdgeInsets.all(10)),
            ElevatedButton(
                onPressed: () {
                  print('登录动作');
                },
                child: const Text('登录')),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('还没有账号，'),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/registration');
                  },
                  child: const Text('去注册~'))
            ])
          ],
        ),
      ),
    );
  }
}
