import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/main.dart';
import 'package:hackathon_lintramax/model/log_model.dart';
import 'package:hackathon_lintramax/model/user.dart';
import 'package:hackathon_lintramax/screen/admin/employee_details.dart';

class SearchEmployeePage extends StatefulWidget {
  @override
  _SearchEmployeePageState createState() => _SearchEmployeePageState();
}

class _SearchEmployeePageState extends State<SearchEmployeePage> {
  final List<UserModel> users = fakeUsers;

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

  void onLogsUpdated() {}

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
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 8.0), // Add vertical margin
                          decoration: BoxDecoration(
                            color: Colors.white, // Background color
                            borderRadius:
                                BorderRadius.circular(12.0), // Rounded corners
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(
                                    0.5), // Shadow color with opacity
                                spreadRadius: 0.5,
                                blurRadius: 2,
                                offset: Offset(0, 2), // Shadow position
                              ),
                            ],
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0), // Adjust padding
                            onTap: () async {
                              if (user.role == 'worker') {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserDetailPage(user: user),
                                  ),
                                );
                              }
                              onLogsUpdated();
                            },
                            title: Text(
                              '${user.name} (${user.role})',
                              style: TextStyle(
                                fontWeight: FontWeight.bold, // Bold title
                                fontSize: 16.0,
                              ),
                            ),
                            subtitle: Text(
                              'Email: ${user.email}',
                              style: TextStyle(
                                color:
                                    Colors.grey[600], // Softer subtitle color
                              ),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios,
                                size: 16.0), // Add an icon to the right
                          ),
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
