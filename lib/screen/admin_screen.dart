import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/model/user.dart';

class AdminScreen extends StatelessWidget {
  final List<UserModel> users = [
    UserModel(uid: '1', name: 'Admin User', email: 'admin@example.com', role: 'admin'),
    UserModel(uid: '2', name: 'Worker User', email: 'worker@example.com', role: 'worker'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('管理员界面')),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text('${user.name} (${user.role})'),
            subtitle: Text('邮箱: ${user.email}'),
          );
        },
      ),
    );
  }
}