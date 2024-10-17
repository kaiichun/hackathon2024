import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/model/user.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  String _selectedRole = 'worker'; // 默认角色为 worker
  final List<UserModel> users = []; // 用于存储注册的用户

  Future<void> _register() async {
    UserModel newUser = UserModel(
      uid: (users.length + 1).toString(),
      name: nameController.text,
      email: emailController.text,
      role: _selectedRole,
    );

    setState(() {
      users.add(newUser);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('注册成功')));
    Navigator.pop(context); // 返回登录页面
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('注册')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: '姓名'),
            ),
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: '邮箱'),
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: '密码'),
              obscureText: true,
            ),
            DropdownButton<String>(
              value: _selectedRole,
              items: <String>['worker', 'admin'].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRole = newValue!;
                });
              },
            ),
            ElevatedButton(onPressed: _register, child: Text('注册')),
          ],
        ),
      ),
    );
  }
}