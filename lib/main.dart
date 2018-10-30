import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'kwWebViewTextLink.dart';
import 'kwBottomSheetTextLink.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Tour of Crete',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Tour of Crete 2019'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
          title: Row(
        children: <Widget>[
          new Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.centerLeft,
            decoration: new BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('graphics/toc_logo.png'), fit: BoxFit.fill),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: new Text(title),
          ),
        ],
      )),
      body: Container(
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new AssetImage("graphics/toc_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: new Center(
          child:  new ListView(
              children: <Widget>[
                new KwWebViewTextLink(
                  description: 'ToC web site',
                  url: "http://www.tourofcrete.gr",
                ),
                new KwWebViewTextLink(
                  description: 'Live view',
                  url:
                      "http://live2019.tourofcrete.gr:8080/?locale=en&token=WzGsIqGEdUdfARM6STgAMa6cExf5ZSpi",
                ),
                new KwWebViewTextLink(
                  description: 'Daily standings',
                  url: "http://live2019.tourofcrete.gr",
                ),
                new KwBottomSheetTextLink(
                  key: _scaffoldKey,
                  title: 'Contact Us',
                ),
              ],
            ),
        ),
      ),
    );
  }
}

