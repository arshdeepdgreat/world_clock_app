import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class WorldTime{

  String location;
  String time="loading";
  String flag;
  String url;
  bool isday=false;
  WorldTime({required this.location,required this.flag,required this.url});

  Future<void> getTime() async{

    try {
      Response response = await get(
          Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      Map data = jsonDecode(response.body);
      //print(data);

      //get the properties
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(datetime);
      // print(offset);

      //create a datetime object

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      isday=now.hour>6 && now.hour<18?true:false;
      time = DateFormat.jm().format(now);

    }
    catch(e){
      print("Caught error $e");
      time="Couldn't get correct data";
    }
  }

}