import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<MyProvider>(create: (_) => MyProvider()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Honkai: Star Rail News & Events',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: NewsEventsPage(),
    );
  }
}

class MyProvider extends ChangeNotifier {
  int _count = 0;

  void increment() {
    _count++;
    notifyListeners();
  }

  int get count => _count;
}

class NewsEventsPage extends StatelessWidget {
  final List<Map<String, String>> newsEventsList = [
    {
      'title': 'New Character Released!',
      'date': '2024-02-07',
      'content': 'Introducing a powerful new character to join your squad.',
    },
    {
      'title': 'Honkai: Star Rail Clockie Cartoon Series: "Welcome to Dreamville!"',
      'date': '2024-02-13',
      'content': 'HonKai: Star Rail short story',
    },
    {
      'title': 'Special Event: Starry Night Gala',
      'date': '2024-02-15',
      'content': 'Join the Starry Night Gala and unlock exclusive rewards!',
    },
    
    
  ];

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MyProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Honkai: Star Rail News & Events'),
        backgroundColor: Color.fromRGBO(88, 86, 88, 0.612),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: newsEventsList.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              color: Color(0xFFEFEFEF),
              child: ExpansionTile(
                title: Text(
                  newsEventsList[index]['title'] ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                subtitle: Text(
                  newsEventsList[index]['date'] ?? '',
                  style: TextStyle(
                    color: Color(0xFF666666),
                  ),
                ),
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Details:',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                            color: Color(0xFF333333),
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          newsEventsList[index]['content'] ?? '',
                          style: TextStyle(
                            color: Color(0xFF333333),
                          ),
                        ),
                        SizedBox(height: 16.0),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      backgroundColor: Color.fromRGBO(57, 52, 55, 100),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          provider.increment();
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SecondPage()),
          );
        },
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Consumer<MyProvider>(
          builder: (context, provider, child) {
            return Text(
              'This button has been pressed for ${provider.count} times',
              style: TextStyle(
                fontSize: 24.0,
              ),
            );
          },
        ),
      ),
    );
  }
}