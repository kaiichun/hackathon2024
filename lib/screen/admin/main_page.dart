import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/main.dart';
import 'package:hackathon_lintramax/model/log_model.dart';
import 'package:hackathon_lintramax/model/user.dart';
import 'package:hackathon_lintramax/screen/admin/employee_details.dart';

class AdminMainPage extends StatefulWidget {
  @override
  _AdminMainPageState createState() => _AdminMainPageState();
}

class _AdminMainPageState extends State<AdminMainPage> {
  final List<UserModel> users = fakeUsers;

  double progress = 0.0;

  @override
  void initState() {
    super.initState();
    calculateGoal(); // Initial calculation of progress
  }

  void calculateGoal() {
    double newProgress = 0;
    for (UserModel user in users) {
      for (Log log in fakeLogs[user.uid] ?? []) {
        newProgress += log.weight;
      }
    }
    setState(() {
      progress = newProgress; // Update the state with the new progress
    });
  }

  void onLogsUpdated() {
    calculateGoal(); // Recalculate goal when logs change
  }

  @override
  Widget build(BuildContext context) {
    final List<UserModel> checkedOut =
        filterUsers(users, checkedIn: true, checkedOut: true);
    final List<UserModel> checkedIn =
        filterUsers(users, checkedIn: true, checkedOut: false);
    final List<UserModel> absence =
        filterUsers(users, checkedIn: false, checkedOut: false);

    return Scaffold(
      appBar: AppBar(title: const Text('Admin Page')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                alignment: Alignment.center, // Align the text in the center
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      value: progress / monthlyGoal,
                      strokeWidth: 10,
                    ),
                  ),
                  // The text to display inside the progress bar
                  Text(
                    '${(progress / monthlyGoal * 100).toStringAsFixed(1)}%', // Display percentage
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView(
                children: [
                  sectionTitle("Checked out (${checkedOut.length})"),
                  userListView(checkedOut, context),
                  sectionTitle("Checked in (${checkedIn.length})"),
                  userListView(checkedIn, context),
                  sectionTitle("Absence (${absence.length})"),
                  userListView(absence, context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget userListView(List<UserModel> users, BuildContext context) {
    return ListView.builder(
      shrinkWrap: true, // Ensures the ListView only takes up necessary space
      physics: NeverScrollableScrollPhysics(), // Prevents internal scrolling
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Container(
          margin:
              const EdgeInsets.symmetric(vertical: 8.0), // Add vertical margin
          decoration: BoxDecoration(
            color: Colors.white, // Background color
            borderRadius: BorderRadius.circular(12.0), // Rounded corners
            boxShadow: [
              BoxShadow(
                color:
                    Colors.grey.withOpacity(0.5), // Shadow color with opacity
                spreadRadius: 0.5,
                blurRadius: 2,
                offset: Offset(0, 2), // Shadow position
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.symmetric(
                horizontal: 16.0, vertical: 8.0), // Adjust padding
            onTap: () async {
              if (user.role == 'worker') {
                await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetailPage(user: user),
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
                color: Colors.grey[600], // Softer subtitle color
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios,
                size: 16.0), // Add an icon to the right
          ),
        );
      },
    );
  }
}

List<UserModel> filterUsers(List<UserModel> users,
    {bool? checkedIn, bool? checkedOut}) {
  return users.where((user) {
    if (checkedIn != null && checkedOut != null) {
      return user.checkedIn == checkedIn && user.checkedOut == checkedOut;
    }
    return false;
  }).toList();
}
