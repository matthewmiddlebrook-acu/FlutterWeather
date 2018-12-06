import 'package:FlutterWeather/models/ForecastData.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class WeatherItem extends StatelessWidget {
  final DailyForecastData weather;
  final conditionColors = {
    'clear-day': Colors.amber,
    'clear-night': Colors.blueGrey,
    'rain': Colors.indigo,
    'snow': Colors.grey[100],
    'sleet': Colors.blueGrey[200],
    'wind': Colors.green,
    'fog': Colors.grey[300],
    'cloudy': Colors.grey,
    'partly-cloudy-day': Color.lerp(Colors.blueGrey, Colors.amber, .75),
    'partly-cloudy-night': Colors.blueGrey[600],
  };
  final textColor = Colors.white;

  WeatherItem({Key key, @required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: conditionColors[weather.icon],
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: SvgPicture.asset("assets/${weather.icon}.svg",
                  color: textColor, width: 54, height: 54),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: EdgeInsets.fromLTRB(16.0, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      DateFormat.E().format(weather.date),
                      textAlign: TextAlign.start,
                      style: TextStyle(color: textColor, fontSize: 24),
                    ),
                    Text(weather.main,
                        style: TextStyle(color: textColor, fontSize: 16)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('${weather.tempH.round().toString()}°',
                      style: TextStyle(color: textColor, fontSize: 24)),
                  Text('${weather.tempL.round().toString()}°',
                      style: TextStyle(color: textColor, fontSize: 24)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
