import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KwBottomSheetTextLink extends StatelessWidget {
  final String title;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  static PersistentBottomSheetController _controller;

  const KwBottomSheetTextLink({Key key, @required this.title})
      : _scaffoldKey = key;

  Widget build(BuildContext context) {
    return new Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
            color: Colors.transparent,
            child: Container(
                child: Center(
                  child: InkWell(
                    borderRadius: new BorderRadius.circular(25.0),
                    highlightColor: Colors.brown,
                    splashColor: Colors.grey,
                    onTap: () {
                      _persistentBottomSheet();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        this.title,
                        style: new TextStyle(
                            color: Colors.deepOrange,
                            fontFamily: 'GloriaHallelujah',
                            fontSize: 31.0),
                      ),
                    ),
                  ),
                ))));
  }

  void _persistentBottomSheet() {
    //assert(_scaffoldKey==null);
    _controller = _scaffoldKey.currentState.showBottomSheet((context) {
      return new Container(
        //color: Colors.orangeAccent,
        //height: 250.0,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.9],
              colors: [
                Colors.orangeAccent[400],
                Colors.orangeAccent[100],
              ],
            ),
          ),
          child: new Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              new GestureDetector(
                onTap: () {
                  _controller.close();
                  launch("tel://+306946420706");
                },
                child: Container(
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          maxRadius: 20.0,
                          backgroundImage: AssetImage('graphics/kostoman.jpg'),
                        ),
                      ),
                      Icon(Icons.phone,color:Colors.green, size:35.0),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            'Eva Vagionaki',
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 18.0),
                          )),
                    ],
                  ),
                ),
              ),
              new GestureDetector(
                onTap: () {
                  _controller.close();
                  launch("tel://+306946420706");
                },
                child: Container(
                  child: new Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          maxRadius: 20.0,
                          backgroundImage: AssetImage('graphics/kostoman.jpg'),
                        ),
                      ),
                      Icon(Icons.phone,color:Colors.green, size:35.0),
                      new Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Text(
                            'Fanis Kostomanolakis',
                            textAlign: TextAlign.left,
                            style: new TextStyle(
                                color: Colors.black, fontSize: 18.0),
                          )),
                    ],
                  ),
                ),
              ),
            ],
          ));
    });
  }
}
