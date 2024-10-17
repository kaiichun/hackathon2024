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
      checkedIn: false,
      checkedOut: false,
      curGoal: 40,
      cropType: "Sugarcane",
      incentive: 3.5,
    );

    setState(() {
      users.add(newUser);
    });

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('注册成功')));
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisSize: MainAxisSize
            .min, // Ensures the column takes up only as much space as needed
        children: [
          // Image section
          Container(
            width: double.infinity, // Full width
            height: 300, // Set a fixed height for the image
            child: Image.asset(
              '../assets/idk.jpg', // Replace with your image asset
              fit: BoxFit.contain, // Ensures the image keeps its aspect ratio
            ),
          ),

          // Text section directly below the image
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "I dont have time to do this part okay",
              style: TextStyle(
                fontSize: 17, // Font size
                fontWeight: FontWeight.bold, // Bold text
              ),
              textAlign: TextAlign.center, // Center the text
            ),
          ),
        ],
      ),
    );
  }
}
