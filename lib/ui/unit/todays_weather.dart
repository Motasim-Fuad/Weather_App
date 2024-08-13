import 'package:flutter/material.dart';
import 'package:flutter_weather_bg_null_safety/flutter_weather_bg.dart';
import 'package:intl/intl.dart';
import 'package:my_weather_app/model/weather_model.dart';

class todays extends StatelessWidget {
       final WeatherModel? weatherModel;
  const todays({Key? key,this.weatherModel}) : super(key: key);

  WeatherType getWeather( Current? current){

        if(current?.condition?.text=="Sunny"){
          return WeatherType.sunny;
        }
        if(current?.condition?.text=="OverCast"){
          return WeatherType.overcast;
        }
        if(current?.condition?.text=="Partly cloudy"){
          return WeatherType.cloudy;
        }
        if(current?.condition?.text=="Cloudy"){
          return WeatherType.cloudy;
        }
        if(current?.condition?.text=="Mist"){
          return WeatherType.lightSnow;
        }
        if(current?.condition?.text=="thander"){
          return WeatherType.thunder;
        }if(current?.condition?.text=="fogy"){
          return WeatherType.foggy;
        }if(current?.condition?.text=="rain"){
          return WeatherType.heavyRainy;
        }if(current?.condition?.text=="Clear"){
          return WeatherType.sunny;
        }if(current?.condition?.text=="sunnyNight"){
          return WeatherType.sunnyNight;
        }


    return WeatherType.thunder;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: [
          WeatherBg(
                weatherType:getWeather(weatherModel?.current),
            width: MediaQuery.of(context).size.width ,
            height: 240,
          ),
          SizedBox(
            height: 342,
            width: double.infinity,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white54,
                  ),
                  child: Column(
                    
                    children: [
            Text(weatherModel?.location ?.name?? "",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.black,
              ),
            ),
          
          Text(
            DateFormat.yMMMMEEEEd().format(
              DateTime.parse(weatherModel?.current?.lastUpdated.toString() ??""),

            ),
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
                    ],
                      ),
                ),

                SizedBox(height: 30,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Container(

                      decoration: BoxDecoration(
                        shape: BoxShape.circle,color: Colors.white10,
                      ),
                      child:     Image.network("https:${weatherModel?.current?.condition?.icon ?? ""}"),
                    ),



                   SizedBox(width: 80,),

                   Container(
                     padding: EdgeInsets.all(5),
                     decoration: BoxDecoration(
                        
                       color: Colors.white54,
                       borderRadius: BorderRadius.circular(10),
                     ),
                     child: Column(
                       children: [
                         Container(

                           child: Row(

                             crossAxisAlignment: CrossAxisAlignment.start,


                             children: [


                            Text("${weatherModel?.current?.tempC}",style: TextStyle(fontSize: 25,color: Colors.black),),
                               Text("o",style: TextStyle(fontSize: 10,color: Colors.black),),
                               Text("C",style: TextStyle(fontSize: 25,color: Colors.black),),

                             ],
    ),
                         ),

                         Text(weatherModel?.current?.condition?.text??"", style: TextStyle(
                           color:Colors.black,
                           fontSize: 20,
                         ),),

                       ],
                     ),
                   )
                  ],
                ),

                SizedBox(height: 5,),

                Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius: BorderRadius.circular(20),

                  ),

                  child: Column(
                   children: [
                     Row(


                       children: [
                         SizedBox(width: 10),
                       Column(
                         children: [

                           Text(
                             "FeelsLike",
                             style: TextStyle(
                               color: Colors.black,
                             ),
                           ),
                           Text(
                             weatherModel?.current?.feelslikeC?.round().toString() ??"",
                             style: TextStyle(
                               fontSize: 15,
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                             ),
                           ),
                         ],
                       ),

                         Spacer(),

                         Column(
                         children: [

                           Text(
                             "Wind Spreed",
                             style: TextStyle(
                               color: Colors.black,
                             ),
                           ),
                           Text("${
                               weatherModel?.current?.windKph?.round().toString() ??""} km/h",
                             style: TextStyle(
                               fontSize: 15,
                               fontWeight: FontWeight.bold,
                               color: Colors.black,
                             ),
                           ),
                         ],
                       ),
                         SizedBox(width: 10,),
                       ],
                     ),
                     Row(



                       children: [
                         SizedBox(width: 10,),
                         Column(
                           children: [

                             Text(
                               "Humidity",
                               style: TextStyle(
                                 color: Colors.black,
                               ),
                             ),
                             Text(
                               weatherModel?.current?.humidity?.round().toString() ??"",
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black,
                               ),
                             ),
                           ],
                         ),

                        Spacer(),
                         Column(
                           children: [

                             Text(
                               "UV",
                               style: TextStyle(
                                 color: Colors.black,
                               ),
                             ),
                             Text(
                               weatherModel?.current?.uv?.round().toString() ??"",
                               style: TextStyle(
                                 fontSize: 15,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.black,
                               ),
                             ),
                           ],
                         ),
                         SizedBox(width: 10,),
                       ],
                     ),

                   ],
                  ),
                ),


              ],
            ),
          )
        ],
    );
  }
}
