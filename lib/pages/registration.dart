import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool showPassword = false;
  bool showConfirmPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('注册')),
      body: SafeArea(
        minimum: EdgeInsets.all(30),
        child: ListView(children: [
          TextField(
              decoration:
                  InputDecoration(labelText: '用户名', hintText: '请输入用户名')),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
              obscureText: !showPassword,
              decoration: InputDecoration(
                  labelText: '密码',
                  hintText: '请输入密码',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = !showPassword;
                        });
                      },
                      icon: Icon(showPassword
                          ? Icons.visibility_off
                          : Icons.visibility)))),
          Padding(padding: EdgeInsets.all(10)),
          TextField(
              obscureText: !showConfirmPassword,
              decoration: InputDecoration(
                  labelText: '确认密码',
                  hintText: '请确认您的密码',
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          showConfirmPassword = !showConfirmPassword;
                        });
                      },
                      icon: Icon(showConfirmPassword
                          ? Icons.visibility_off
                          : Icons.visibility)))),
          Padding(padding: EdgeInsets.all(10)),
          ElevatedButton(
              onPressed: () {
                print('注册动作');
              },
              child: Text('注册')),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('已有账号，'),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                child: Text('去登录~'))
          ])
        ]),
      ),
    );
  }
}
