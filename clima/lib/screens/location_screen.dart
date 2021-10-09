import "package:flutter/material.dart";
import "package:clima/utilities/constants.dart";
import "package:clima/services/weather.dart";
import "package:clima/screens/city_screen.dart";


class LocationScreen extends StatefulWidget {

  final LocationWeather;
  LocationScreen({@required this.LocationWeather});

  @override 
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {

  int temperature;
  int condition;
  String cityName;
  String weatherIcon;
  String message;
  WeatherModel weather = WeatherModel();

  @override 
  void initState() {
    super.initState();
    updateUI(widget.LocationWeather);
  }

  void updateUI(dynamic weatherData) {
      setState(() {
      if (weatherData == null) {
        temperature = 0;
        condition = 0;
        cityName = '';
        weatherIcon = '';
        message = 'Error in loading the weather.';
      }

      else  {
        temperature = weatherData["main"]["temp"].toInt();
      condition = weatherData["weather"][0]["id"];
      cityName = weatherData["name"];
      weatherIcon = weather.getWeatherIcon(condition);
      message = weather.getMessage(temperature);                                
      }
      });
      return;
  }
   
  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () async{
                      var typedName = await Navigator.push(
                        context,  MaterialPageRoute(builder: (context) {
                            return CityScreen();
                        } 
                      ));
                      if (typedName != null) {
                        var weatherData = await weather.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temperature°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherIcon',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text("$message in $cityName!",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}