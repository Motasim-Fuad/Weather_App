import 'dart:convert';

import 'package:http/http.dart';
import 'package:my_weather_app/constants/constants.dart';

import '../model/weather_model.dart';


class ApiServices{


  Future<WeatherModel> getWeatherData (String searchText) async{
    String url="$base_url&q=$searchText&days=7";

    try{

      Response responce=await get(Uri.parse(url));

      if(responce.statusCode ==200){
        Map<String, dynamic> json= jsonDecode(responce.body);

        WeatherModel weatherModel=WeatherModel.fromJson(json);
        return weatherModel;
      }else{
        throw ("No data not found");
      }


    }catch(e){
      throw e.toString();
      print(e.toString());
        }





  }
}