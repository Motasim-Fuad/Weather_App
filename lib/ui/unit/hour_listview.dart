import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/model/weather_model.dart';

class hourListView extends StatefulWidget {
 final Hour? hour;
  const hourListView({Key? key,this.hour}) : super(key: key);

  @override
  State<hourListView> createState() => _hourListViewState();
}

class _hourListViewState extends State<hourListView> {

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(9),
      padding: EdgeInsets.all(8),
       width: 100,
      decoration: BoxDecoration(
        color: Colors.white70,borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        children: [
        Text(

          widget.hour?.tempC?.round().toString()??"",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

          Container(
            height: 50,
            decoration: BoxDecoration(
              color: Colors.teal,
              shape: BoxShape.circle,
            ),
            child: Image.network("https:${widget.hour?.condition?.icon??""}"),
          ),
          Text(
            DateFormat.j().format(DateTime.parse(widget.hour?.time?.toString()??"")),
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
