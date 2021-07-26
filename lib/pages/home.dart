import 'dart:convert';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String tex="";
  Map data={};
  @override
  Widget build(BuildContext context) {

   tex= ModalRoute.of(context)!.settings.arguments.toString();
   // print(tex);
   data = data.isEmpty? jsonDecode(tex): data;
   // print(data);

   String bg = data['isDay']=="true"? 'day.png':'night.png';
   // print(bg);
   Color c = data['isDay']=="true"? Colors.blueAccent: Colors.indigo;
   Color tx = data['isDay']=="true"? Colors.black:Colors.grey;

    return Scaffold(
      backgroundColor: c,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bg'),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,120.0,0,0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () async{
                      dynamic result = await Navigator.pushNamed(context, "/location");
                      // print(result);
                      setState(() {
                        data=jsonDecode(result.toString());
                      });
                    },
                    icon: Icon(
                      Icons.add_location_alt_outlined,
                      color: tx,
                    ),
                    label: Text(
                        "Choose a location",
                      style: TextStyle(
                        color:tx,
                      ),
                    ),
                ),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: tx,
                        fontSize: 30.0,
                        letterSpacing: 2.0,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20.0,),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: tx,
                    fontSize: 75.0
                  ),
                )
              ]
            ),
          ),
        ),
      ),
    );
  }
}
