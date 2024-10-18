import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/main.dart';
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

  final List<UserModel> users = fakeUsers;

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
          .showSnackBar(SnackBar(content: Text('Login Failed')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                  top: 170.0, bottom: 70), // Set the margin
              child: Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 40, // Set the desired font size
                ),
              ),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft, // Align to the left
              child: ElevatedButton(
                onPressed: _login,
                child: Text('Login'),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterScreen()));
                },
                child: const Text(
                  "Don't have an account? Sign up",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
