import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wallet_3/controllers/test_controller.dart';
import 'package:wallet_3/pages/payment_page.dart';

class User {
  final String name;
  final String email;
  final String password;

  const User({required this.name, required this.email, required this.password});

  static User fromJson(json) => User(
    name: json['name'],
    email: json['email'],
    password: json['password'],
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {'/payment': (context) => const PaymentPage()},
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
  List<User> users = getUsers();

  static List<User> getUsers() {
    const data = [
      {
        "name": "John Doe",
        "email": "johndoe@example.com",
        "password": "password123",
      },
      {
        "name": "Jane Smith",
        "email": "janesmith@example.com",
        "password": "password456",
      },
    ];

    return data.map<User>(User.fromJson).toList();
  }

  // RegisterController registerController = Get.put(RegisterController());

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
        backgroundColor: Colors.black,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title, style: TextStyle(color: Colors.white)),
      ),
      // body: Center(
      //   // Center is a layout widget. It takes a single child and positions it
      //   // in the middle of the parent.
      //   child: Column(
      //     // Column is also a layout widget. It takes a list of children and
      //     // arranges them vertically. By default, it sizes itself to fit its
      //     // children horizontally, and tries to be as tall as its parent.
      //     //
      //     // Column has various properties to control how it sizes itself and
      //     // how it positions its children. Here we use mainAxisAlignment to
      //     // center the children vertically; the main axis here is the vertical
      //     // axis because Columns are vertical (the cross axis would be
      //     // horizontal).
      //     //
      //     // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
      //     // action in the IDE, or press "p" in the console), to see the
      //     // wireframe for each widget.
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       TextFormField(
      //         controller: registerController.nameController,
      //         decoration: const InputDecoration(
      //           labelText: 'Enter your name',
      //           border: OutlineInputBorder(),
      //         ),
      //       ),
      //       ElevatedButton(
      //         onPressed: () {
      //           registerController.saveName();
      //         },
      //         child: const Text('Save Name'),
      //       ),
      //       Text('You have pushed the button this many times:'),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //     ],
      //   ),
      // ),
      backgroundColor: Colors.grey[500],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 160, // Set the height for the scroll view
              child: Container(
                color: Colors.amber[200],
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5, // Show only 3 items
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 80,
                  ),
                  itemBuilder: (context, index) {
                    // Example array of texts
                    final List<String> items = [
                      'One',
                      'Two',
                      'Three',
                      'Four',
                      'Five',
                    ];
                    return Card(
                      color: Colors.amber[600],
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    items[index],
                                    style: const TextStyle(fontSize: 14),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: IconButton(
                                    onPressed: () => {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(children: [Text("\$ 200,000")]),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 160, // Set the height for the scroll view
              child: Container(
                color: Colors.blue[200],
                child: GridView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 5, // Show only 3 items
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 80,
                  ),
                  itemBuilder: (context, index) {
                    // Example array of texts
                    final List<String> items = [
                      'One',
                      'Two',
                      'Three',
                      'Four',
                      'Five',
                    ];
                    return Card(
                      color: Colors.amber[600],
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    items[index],
                                    style: const TextStyle(fontSize: 14),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                                SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: IconButton(
                                    onPressed: () => {},
                                    icon: Icon(
                                      Icons.edit,
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            SizedBox(
              height: 200,
              child: buildUsers(users),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {Navigator.pushNamed(context, '/payment')},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget buildUsers(List<User> users) => ListView.builder(
    itemCount: users.length,
    itemBuilder: (context, index) {
      final user = users[index];
      return ListTile(
        // leading: CircleAvatar(child: Text('${index}')),
        title: Text(user.name),
        subtitle: Text(user.email),
      );
    },
  );
}
