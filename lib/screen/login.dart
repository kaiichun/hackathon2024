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
  final TextEditingController emailController =
      TextEditingController(text: "admin@example.com");
  final TextEditingController passwordController = TextEditingController();

  // 假设的用户数据
  final List<UserModel> users = [
    UserModel(
      uid: '1',
      name: 'Admin User',
      email: 'admin@example.com',
      role: 'admin',
      checkedIn: false,
      checkedOut: false,
      curGoal: 40,
      cropType: "Sugarcane",
      incentive: 3.5,
    ),
    UserModel(
      uid: '2',
      name: 'Worker User',
      email: 'worker@example.com',
      role: 'worker',
      checkedIn: false,
      checkedOut: false,
      curGoal: 40,
      cropType: "Sugarcane",
      incentive: 3.5,
    ),
  ];

  Future<void> _login() async {
    String email = emailController.text;
    String password = passwordController.text;

    UserModel? user = users.firstWhere((user) => user.email == email,
        orElse: () => UserModel(
              uid: '',
              name: '',
              email: '',
              role: '',
              checkedIn: false,
              checkedOut: false,
              curGoal: 40,
              cropType: "Sugarcane",
              incentive: 0.0,
            ));

    if (user.role.isNotEmpty) {
      if (user.role == 'admin') {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => AdminScreen()));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => WorkerScreen()));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('登录失败')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(onPressed: _login, child: Text('Login')),
            TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RegisterScreen()));
              },
              child: const Text("Don't have an account? Sign up"),
            ),
          ],
        ),
      ),
    );
  }
}
