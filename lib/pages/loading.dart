import 'package:flutter/cupertino.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/world_time.dart';
import 'package:flutter/material.dart';
class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String c='\"';
  void setupWorldTime() async{
    WorldTime instance = WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home',
        arguments: {
          c+'location'+c :c+instance.location+c,
          c+'time'+c:c+instance.time+c,
          c+'flag'+c:c+instance.flag+c,
          c+'isDay'+c:c+instance.isday.toString()+c
    });

  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:Center(
        child: SpinKitFadingCube(
          color: Colors.red[900],
          size: 50.0,
        ),
      )
    );
  }
}
