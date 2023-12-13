import 'package:flutter/material.dart';
import '../providers/weather_provider.dart';
import '../widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController nameController = TextEditingController();
  String cityName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Weather App',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color(0xfff2274A5),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: "Enter Location"),
                  onChanged: (text) {
                    setState(() {
                      cityName = text;
                    });
                  },
                  onSubmitted: (val) {
                    context.read<WeatherProvider>().setCity(val);
                  },
                ),
                Consumer<WeatherProvider>(builder: (context, model, child) {
                  return model.loading == true
                      ? Container(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: Center(child: CircularProgressIndicator()))
                      : model.valid == false
                          ? Container(
                              height: MediaQuery.of(context).size.height * 0.5,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.question_mark),
                                    Text("Cound not find your place"),
                                    Text("Enter a valid name for the location"),
                                  ],
                                ),
                              ))
                          : Column(
                              children: <Widget>[
                                Stack(
                                  children: <Widget>[
                                    ClipPath(
                                      clipper: MyClipper(),
                                      child: Container(
                                        color: Color(0xfff2274A5),
                                        height: 300.0,
                                        child: Center(
                                            child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '${model.allData.location!.region}',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              '${model.allData.current!.temperature}°',
                                              style: TextStyle(
                                                  fontSize: 50,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              model.allData.current!
                                                  .weatherDescriptions[0],
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  color: Colors.white),
                                            ),
                                          ],
                                        )),
                                      ),
                                    ),
                                  ],
                                ),
                                infoWidget('humidity.png', 'Humidity',
                                    '${model.allData.current!.humidity}%'),
                                Divider(
                                  color: Colors.black,
                                  indent: 50,
                                  endIndent: 50,
                                ),
                                infoWidget('wind.png', 'Wind speed',
                                    '${model.allData.current!.windSpeed} k/h'),
                                Divider(
                                  color: Colors.black,
                                  indent: 50,
                                  endIndent: 50,
                                ),
                                infoWidget('wind-dir.png', 'Wind direction',
                                    '${model.allData.current!.windDir}'),
                                Divider(
                                  color: Colors.black,
                                  indent: 50,
                                  endIndent: 50,
                                ),
                                infoWidget('cloud.png', 'Cloud cover',
                                    '${model.allData.current!.cloudcover}%'),
                                Divider(
                                  color: Colors.black,
                                  indent: 50,
                                  endIndent: 50,
                                ),
                                infoWidget('prus.png', 'Pressure',
                                    '${model.allData.current!.pressure} MB'),
                              ],
                            );
                }),
              ],
            ),
          ),
        ));
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 100);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
