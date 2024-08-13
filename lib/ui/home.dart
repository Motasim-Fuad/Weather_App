import 'package:flutter/material.dart';
import 'package:my_weather_app/model/weather_model.dart';
import 'package:my_weather_app/services/ApiServices.dart';
import 'package:my_weather_app/ui/unit/7days_weather.dart';
import 'package:my_weather_app/ui/unit/hour_listview.dart';
import 'package:my_weather_app/ui/unit/todays_weather.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {

  ApiServices apiServices=ApiServices();

  final _textEditingContriler=TextEditingController();
  String searchText="auto:ip";



  _showDialog(BuildContext context) async{
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Search Location"),
        content: TextField(
          controller: _textEditingContriler,
          decoration: InputDecoration(hintText: ("search chity ")),
        ),
        actions: [
          ElevatedButton(onPressed: (){
            Navigator.pop(context);
          },
              child: Text("Cancel")
          ),
          ElevatedButton(onPressed: (){
            if(_textEditingContriler.text.isEmpty){
              return;
            }
            Navigator.pop(context,_textEditingContriler.text);
          },
              child: Text("Ok")
          ),
        ],
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white60,
      appBar: AppBar(
        title: Text("weather"),

        actions: [
          IconButton(onPressed: ()async{
          _textEditingContriler.clear();
          String text=  await _showDialog(context);
          setState(() {

            searchText=text;
          });
          }, icon: Icon(Icons.search)),
          IconButton(onPressed: (){
             searchText="Dhaka";
            setState(() {

            });
          }, icon: Icon(Icons.my_location)),
        ],
        backgroundColor: Colors.grey.shade500,

      ),

      body: FutureBuilder(
        future: apiServices.getWeatherData(searchText),
        builder: (context, snapshot){
          if(snapshot.hasData){
            WeatherModel? weatherModel= snapshot.data;

            return SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                todays(
                weatherModel:weatherModel,

                  ),


                  Text("Weather by hour",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      itemCount: weatherModel?.forecast?.forecastday?[0].hour?.length,
                        scrollDirection:  Axis.horizontal,

                        itemBuilder:(context,index) {
                          Hour? hour=weatherModel?.forecast?.forecastday?[0].hour?[index];
                          return hourListView(
                            hour:hour,
                          );
                        }

                    ),
                  ),
                  SizedBox(height: 10,),
                  Text("Next 7 Dayes",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),

                  Expanded(
                    child: ListView.builder(
                      itemCount: weatherModel?.forecast?.forecastday?.length ,

                      itemBuilder: (context,index){
                          Forecastday? forcastday=weatherModel?.forecast?.forecastday?[index];

                          return next7daysWeather(
                            forcastday:forcastday,
                          );
                      },
                    ),
                  )





                ],
              ),
            );
          }
          if(snapshot.hasError){
            return Center(child: Text("Error has ocared"),);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
