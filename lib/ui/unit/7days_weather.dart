import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/model/weather_model.dart';

class next7daysWeather extends StatefulWidget {

  final Forecastday? forcastday;
   next7daysWeather({Key? key,this.forcastday}) : super(key: key);

  @override
  State<next7daysWeather> createState() => _next7daysWeatherState();
}

class _next7daysWeatherState extends State<next7daysWeather> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),

      child:  Row(
        children: [
          Image.network("https:${widget.forcastday?.day?.condition?.icon}"),

          Expanded(
              child:Text(
                DateFormat.MMMEd().format(DateTime.parse(widget.forcastday?.date.toString() ??"")),
                style: TextStyle(color: Colors.black),
              ),
          ),
          Expanded(
              child:Text(
                widget.forcastday?.day?.condition?.text.toString() ??"",
                style: TextStyle(color: Colors.black),
              ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                  "maxTemp ${widget.forcastday?.day?.maxtempC?.round().toString()??""}"
                ),
                Text(
                  "minTemp ${widget.forcastday?.day?.mintempC?.round().toString()??""}"
                ),
              ],
            ),
          ),
        ],
      ) ,
    );
  }
}
