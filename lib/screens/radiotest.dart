import 'package:flutter/material.dart';
class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, }) : super(key: key);

  final String title="ghhgj";

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color bulbColor = Colors.black;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.lightbulb_outline,
                size: 100,
                color: bulbColor,
              ),
              Container(
                width: 150,
                child: Row(
                  children: <Widget>[
                    Radio(
                        value: Colors.red,
                        groupValue: bulbColor,
                        onChanged: (val) {
                          setState(() {
                            bulbColor = val;
                          });
                        }),
                    Text('Red', style: TextStyle(fontSize: 24),
                    )
                  ],
                ),
              ),
              Container(
                width: 150,
                child: Row(
                  children: <Widget>[
                    Radio(
                        value: Colors.blue,
                        groupValue: bulbColor,
                        onChanged: (val) {

                          setState(() {bulbColor = val;});
                        }),
                    Text('Blue', style: TextStyle(fontSize: 24))
                  ],
                ),
              ),
              Container(
                width: 150,
                child: Row(
                  children: <Widget>[
                    Radio(
                        value: Colors.green,
                        groupValue: bulbColor,
                        onChanged: (val) {

                          setState(() {bulbColor = val;});
                        }),
                    Text('Green', style: TextStyle(fontSize: 24))
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
