import 'package:flutter/material.dart';
import '../services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {


  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
    WorldTime(url: 'Europe/Berlin',location: 'Berlin', flag: 'germany.png'),
  ];

  void updateTime(index) async{
    String c='\"';
    WorldTime instance = locations[index];
    // print(instance);
     await instance.getTime();
      //nav to home
      //simply pop
    Navigator.pop(context, {
      c+'location'+c :c+instance.location+c,
      c+'time'+c :c+instance.time+c,
      c+'flag'+c :c+instance.flag+c,
      c+'isday'+c :c+instance.isday.toString()+c
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context , index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 4.0),
              child: Card(
                child: ListTile(
                  onTap: (){
                      updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage("assets/${locations[index].flag}"),
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
