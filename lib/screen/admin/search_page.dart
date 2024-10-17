import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/model/user.dart';
import 'package:hackathon_lintramax/screen/admin/employee_details.dart';

class SearchEmployeePage extends StatefulWidget {
  @override
  _SearchEmployeePageState createState() => _SearchEmployeePageState();
}

class _SearchEmployeePageState extends State<SearchEmployeePage> {
  final List<UserModel> users = [
    UserModel(
      uid: '1',
      name: 'Admin User',
      email: 'admin@example.com',
      role: 'admin',
      checkedIn: true,
      checkedOut: false,
      curGoal: 40,
      cropType: "Sugarcane",
      incentive: 3.5,
    ),
    UserModel(
      uid: '2',
      name: 'Worker 1',
      email: 'worker@example.com',
      role: 'worker',
      checkedIn: true,
      checkedOut: true,
      curGoal: 40,
      cropType: "Sugarcane",
      incentive: 3.5,
    ),
    UserModel(
      uid: '3',
      name: 'Worker 3',
      email: 'worker@example.com',
      role: 'worker',
      checkedIn: true,
      checkedOut: true,
      curGoal: 40,
      cropType: "Sugarcane",
      incentive: 3.5,
    ),
    UserModel(
      uid: '4',
      name: 'Worker 4',
      email: 'worker@example.com',
      role: 'worker',
      checkedIn: true,
      checkedOut: true,
      curGoal: 40,
      cropType: "Sugarcane",
      incentive: 3.5,
    ),
    UserModel(
      uid: '5',
      name: 'Worker 2',
      email: 'worker@example.com',
      role: 'worker',
      checkedIn: false,
      checkedOut: false,
      curGoal: 40,
      cropType: "Sugarcane",
      incentive: 3.5,
    ),
  ];

  List<UserModel> _filteredUsers = [];
  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _filteredUsers = users; // Initially show all users
    _searchController.addListener(_filterUsers); // Add listener to filter users
  }

  void _filterUsers() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredUsers = users.where((user) {
        return user.name.toLowerCase().contains(query) ||
            user.email.toLowerCase().contains(query);
      }).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Employee'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search by name or email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: _filteredUsers.isNotEmpty
                  ? ListView.builder(
                      itemCount: _filteredUsers.length,
                      itemBuilder: (context, index) {
                        final user = _filteredUsers[index];
                        return ListTile(
                          title: Text(user.name),
                          subtitle: Text(user.email),
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      UserDetailPage(user: user))),
                        );
                      },
                    )
                  : Center(child: Text('No users found')),
            ),
          ],
        ),
      ),
    );
  }
}
