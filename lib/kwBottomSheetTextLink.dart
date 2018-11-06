import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class KwBottomSheetTextLink extends StatelessWidget {
  final String title;
  final GlobalKey<ScaffoldState> _scaffoldKey;
  static PersistentBottomSheetController _controller;

  const KwBottomSheetTextLink({Key key, @required this.title})
      : _scaffoldKey = key;

  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.all(8.0),
        child:  Material(
            color: Colors.transparent,
            child:  Container(
                child:  Center(
                  child:  InkWell(
                    borderRadius:  BorderRadius.circular(25.0),
                    highlightColor: Colors.brown,
                    splashColor: Colors.grey,
                    onTap: () {
                      _persistentBottomSheet();
                    },
                    child:  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:  Text(
                        this.title,
                        style:  TextStyle(
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
          decoration:  BoxDecoration(
            gradient:  LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [0.1, 0.9],
              colors: [
                Colors.orangeAccent[400],
                Colors.orangeAccent[100],
              ],
            ),
          ),
          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
               GestureDetector(
                onTap: () {
                  _controller.close();
                  launch("tel://+306945219843");
                },
                child:  Container(
                  child:  Row(
                    children: <Widget>[
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  CircleAvatar(
                          maxRadius: 25.0,
                          backgroundImage:  AssetImage('graphics/eva.jpg'),
                        ),
                      ),
                       Icon(Icons.phone,color:Colors.green, size:35.0),
                       Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Text(
                            'Eva Vagionaki',
                            textAlign: TextAlign.left,
                            style:  TextStyle(
                                color: Colors.black, fontSize: 18.0),
                          )),
                    ],
                  ),
                ),
              ),
               GestureDetector(
                onTap: () {
                  _controller.close();
                  launch("tel://+306945230444");
                },
                child:  Container(
                  child:  Row(
                    children: <Widget>[
                       Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:  CircleAvatar(
                          maxRadius: 25.0,
                          backgroundImage:  AssetImage('graphics/fanis.jpg'),
                        ),
                      ),
                       Icon(Icons.phone,color:Colors.green, size:35.0),
                       Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Text(
                            'Fanis Kostomanolakis',
                            textAlign: TextAlign.left,
                            style:  TextStyle(
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
