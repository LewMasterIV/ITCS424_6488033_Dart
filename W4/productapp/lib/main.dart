import 'package:flutter/material.dart';

void main() { 
  runApp(MyApp());
  imageCache.clear();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World Demo Application',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: "6488033"),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductInfoNetwork(name: "Apple", description: "This is a real apple", price: 40, url: 'https://cdn.discordapp.com/attachments/365803720765603842/1202227385995362384/red-apple.png?ex=65ccb081&is=65ba3b81&hm=916d027ec053251beae5a29e069f2eb7278f9eab55b139e882006e661710ab9a&'),
          ProductInfoNetwork(name: "Aeroplane", description: "Want an aeroplane?", price: 300000000, url: 'https://cdn.discordapp.com/attachments/365803720765603842/1202227570829955114/Tarom.png?ex=65ccb0ad&is=65ba3bad&hm=18c82189c683d1de02ba367da43a195b134a84e6e33af369e21c612112280a63&'),
          ProductInfoLocal(name: "Oranges", description: "Orange and haft orange", price: 20, image: 'Orangeandhaft.jpg'),
          ProductInfoLocal(name: "Bananas", description: "Bananas", price: 4000, image: 'Bananas.jpg')
        ],
      ),
    );
  }
}

class ProductInfoLocal extends StatelessWidget {
  ProductInfoLocal({Key? key, required this.name, required this.description,  required this.price, required this.image})
      : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.asset("assets/" + image),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          Text("Price: " + this.price.toString()),
                        ],
                      )))
            ])));
  }
}

class ProductInfoNetwork extends StatelessWidget {
  ProductInfoNetwork({Key? key, required this.name, required this.description,  required this.price, required this.url})
      : super(key: key);

  final String name;
  final String description;
  final int price;
  final String url;

  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(2),
        height: 120,
        child: Card(
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
              Image.network(url),
              Expanded(
                  child: Container(
                      padding: EdgeInsets.all(5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(this.name,
                              style: TextStyle(fontWeight: FontWeight.bold)),
                          Text(this.description),
                          Text("Price: " + this.price.toString()),
                        ],
                      )))
            ])));
  }
}