import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('TabBar Example'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.train)),
              Tab(icon: Icon(Icons.directions_bus)),
              Tab(icon: Icon(Icons.directions_bike)),
            ],
            indicatorColor: Colors.green,
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
          ),
        ),
        body: TabBarView(
          children: [
            TransportWidget(
              icon: Icons.train,
              onPressed: () => _showTrainDialog(context),
            ),
            TransportWidget(
              icon: Icons.directions_bus,
              onPressed: () => _showBusDialog(context),
            ),
            BasicListWidget(),
          ],
        ),
      ),
    );
  }

  void _showTrainDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 240, 168, 192),
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.music_note,
                  size: 40,
                  color: Colors.white,
                ),
                SizedBox(height: 16.0),
                Text(
                  'Хотите включить музыку?',
                  style: TextStyle(
                    color: const Color.fromARGB(255, 186, 59, 59),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Да',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text(
                        'Нет',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _showBusDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Как ваш день?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Хорошо)'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Отлично!'),
            ),
          ],
        );
      },
    );
  }
}

class TransportWidget extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  TransportWidget({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        icon: Icon(icon),
        onPressed: onPressed,
      ),
    );
  }
}

@override
State<StatefulWidget> createState() {
  // TODO: implement createState
  throw UnimplementedError();
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("ЗДЕСЬ ВСЕ МЯСО"),
    );
  }
}

class BasicListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: Text('Барное меню')),
        ListTile(title: Text('Закуски')),
        ListTile(title: Text('Паста')),
        ListTile(title: Text('Супы')),
      ],
    );
  }
}
