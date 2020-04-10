import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'kwWebViewTextLink.dart';
import 'kwBottomSheetTextLink.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Tour of Crete',
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        primarySwatch: Colors.orange,
      ),
      home:  MyHomePage(title: 'Tour of Crete 2020'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;
  final _scaffoldKey = new GlobalKey<ScaffoldState>();

  MyHomePage({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      key: _scaffoldKey,
      appBar:  AppBar(
          title:  Row(
        children: <Widget>[
           Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.centerLeft,
            decoration:  BoxDecoration(
              image:  DecorationImage(
                  image:  AssetImage('graphics/toc_logo.png'), fit: BoxFit.fill),
            ),
          ),
           Padding(
            padding: const EdgeInsets.all(8.0),
            child:  Text(title),
          ),
        ],
      )),
      body:  Container(
        decoration:  BoxDecoration(
          image:  DecorationImage(
            image:  AssetImage("graphics/toc_bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:  Center(
          child:   ListView(
              children: <Widget>[
                 KwWebViewTextLink(
                  description: 'ToC web site',
                  url: "http://www.tourofcrete.gr",
                ),
                 KwWebViewTextLink(
                  description: 'Live view',
                  url:
                      "http://live.tourofcrete.gr:8080/?locale=en&token=WzGsIqGEdUdfARM6STgAMa6cExf5ZSpi",
                ),
                 KwWebViewTextLink(
                  description: 'Daily standings',
                  url: "http://live.tourofcrete.gr",
                ),
                 KwBottomSheetTextLink(
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

