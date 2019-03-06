import 'package:flutter/material.dart';
//import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:url_launcher/url_launcher.dart';


class KwWebViewTextLink extends StatelessWidget {
  final String description;
  final String url;

  const KwWebViewTextLink({
    Key key,
    @required this.description,
    @required this.url,
  })  : assert(description != null),
        assert(url != null),
        super(key: key);

  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Material(
            color: Colors.transparent,
            child:  Center(
              child:  Container(
                  child:  InkWell(
                    borderRadius:  BorderRadius.circular(25.0),
                    highlightColor: Colors.brown,
                    splashColor: Colors.grey,
                    onTap: () {
                        //launch(this.url,forceWebView:false);
                      //_launchURL(this.url);
                      ///*
                      Navigator.push(
                        context,
                         MaterialPageRoute(
                            builder: (context) =>  WebViewScreen(url: this.url)),
                      );
                      //*/
                    },
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text(
                        this.description,
                        style:  TextStyle(
                            color: Colors.deepOrange,
                            fontFamily: 'GloriaHallelujah',
                            fontSize: 31.0),
                      ),
                    ),
                  )),
            )));
  }
}


class WebViewScreen extends StatelessWidget {
  final String url;

  WebViewScreen({Key key, @required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /*
    return WebView(
      key: UniqueKey(),
      javascriptMode: JavascriptMode.unrestricted,
      initialUrl: this.url,
    );
    */

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tour of Crete 2019'),
      ),
      body:  WebView(
        initialUrl: this.url,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );

    /*
    return  WebviewScaffold(
      url: this.url,
      appBar:  AppBar(
        //title: new Image.asset('graphics/toc_logo.png', fit: BoxFit.scaleDown),
        title:  Text("Tour of Crete 2019"),
      ),
    );
    */
  }
}



_launchURL(url) async {

  if (await canLaunch(url)) {
    await launch(url, forceWebView:false);
  } else {
    throw 'Could not launch $url';
  }
}