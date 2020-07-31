import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false,
      home: MyPage()));
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => new _MyPageState();

}

class _MyPageState extends State<MyPage> {
  var mass = ['Are', 'you', 'ready', 'GO!', ''];
  int _count = 0;
  String _text = 'Hey there';
  Color _color = Color(0xFFFFFFFF);

  void changeColor() {
    setState(() {
      _color = Colors.primaries[Random().nextInt(Colors.primaries.length)];
      _text = mass[_count];
      _count++;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _count==5? Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage("https://i.vimeocdn.com/portrait/6240909_640x640"))),
          padding: EdgeInsets.only(top: 250),
          child: Center(child:  RaisedButton(
            color: Colors.white70,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black)
            ),
            child: Text('repeat'),
            onPressed: () {
              _count=0;
              changeColor();
            },),)) : InkWell(
        onTap: changeColor,
        child: Container(
          color: _color,
          child: Center(
              child: Text(_text, style: TextStyle(fontSize: 55, color: Colors.primaries[Random().nextInt(Colors.primaries.length)]),)),

        ),
      ),
    );
  }

}


