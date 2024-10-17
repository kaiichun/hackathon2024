import 'package:flutter/material.dart';
import 'package:hackathon_lintramax/model/log_model.dart';
import 'package:hackathon_lintramax/model/user.dart';
import 'package:hackathon_lintramax/screen/login.dart';

int incomePerKG = 5;
int monthlyGoal = 1000;

List<UserModel> fakeUsers = [
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
    email: 'worker1@example.com',
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
    email: 'worker3@example.com',
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
    email: 'worker4@example.com',
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
    email: 'worker2@example.com',
    role: 'worker',
    checkedIn: false,
    checkedOut: false,
    curGoal: 40,
    cropType: "Sugarcane",
    incentive: 3.5,
  ),
];

Map fakeLogs = {
  "2": [
    Log(
        date: DateTime(2024, 1, 1),
        hours: 8.0,
        weight: 70.5,
        goalAchieved: true,
        cropType: "Sugarcane"),
    Log(
        date: DateTime(2024, 1, 2),
        hours: 7.5,
        weight: 71.0,
        goalAchieved: true,
        cropType: "Sugarcane"),
  ],
  "3": [
    Log(
        date: DateTime(2024, 1, 1),
        hours: 8.0,
        weight: 70.5,
        goalAchieved: true,
        cropType: "Sugarcane"),
    Log(
        date: DateTime(2024, 1, 2),
        hours: 7.5,
        weight: 71.0,
        goalAchieved: true,
        cropType: "Sugarcane"),
  ],
  "4": [
    Log(
        date: DateTime(2024, 1, 1),
        hours: 8.0,
        weight: 70.5,
        goalAchieved: true,
        cropType: "Sugarcane"),
    Log(
        date: DateTime(2024, 1, 2),
        hours: 7.5,
        weight: 71.0,
        goalAchieved: true,
        cropType: "Sugarcane"),
  ],
  "5": [
    Log(
        date: DateTime(2024, 1, 1),
        hours: 8.0,
        weight: 70.5,
        goalAchieved: true,
        cropType: "Sugarcane"),
    Log(
        date: DateTime(2024, 1, 2),
        hours: 7.5,
        weight: 71.0,
        goalAchieved: true,
        cropType: "Sugarcane"),
  ],
};

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
