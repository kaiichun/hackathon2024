import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/model/user.dart';
import 'register_screen.dart';
import 'worker_screen.dart';
import 'admin_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // 假设的用户数据
  final List<UserModel> users = [
    UserModel(uid: '1', name: 'Admin User', email: 'admin@example.com', role: 'admin'),
    UserModel(uid: '2', name: 'Worker User', email: 'worker@example.com', role: 'worker'),
  ];

  Future<void> _login() async {
    String email = emailController.text;
    String password = passwordController.text; 

    UserModel? user = users.firstWhere((user) => user.email == email, orElse: () => UserModel(uid: '', name: '', email: '', role: ''));
    
    if (user.role.isNotEmpty) {
      // 跳转到不同的界面
      if (user.role == 'admin') {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AdminScreen()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => WorkerScreen()));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('登录失败')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('登录')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: '邮箱'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: '密码'),
              obscureText: true,
            ),
            ElevatedButton(onPressed: _login, child: Text('登录')),
            TextButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: Text('没有账户？注册'),
            ),
          ],
        ),
      ),
    );
  }
}