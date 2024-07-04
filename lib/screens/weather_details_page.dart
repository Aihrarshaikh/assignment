import 'package:flutter/material.dart';
import '../providers/weather_provider.dart';
import 'package:provider/provider.dart';

import '../widgets/widgets.dart';

class WeatherDetailsPage extends StatelessWidget {
  const WeatherDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xfff2274A5),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xfff2274A5),
        child: Icon(Icons.refresh),
        onPressed: () {
          context.read<WeatherProvider>().fetchData();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Refreshing data...'),
              duration: Duration(milliseconds: 500),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Consumer<WeatherProvider>(builder: (context, model, child) {
          return model.loading
              ? const Center(child: CircularProgressIndicator())
              : model.valid == false
                  ?  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                        child: Text(
                            "${model.errorMessage}"),
                      ),
                  )
                  : SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Stack(
                            children: <Widget>[
                              ClipPath(
                                clipper: MyClipper(),
                                child: Container(
                                  color: const Color(0xfff2274A5),
                                  height: 300.0,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          '${model.allData!.location!.region}',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '${model.allData!.current!.temperature}°',
                                          style: const TextStyle(
                                              fontSize: 50,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          model.allData!.current!
                                              .weatherDescriptions[0],
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          infoWidget('humidity.png', 'Humidity',
                              '${model.allData!.current!.humidity}%'),
                          const Divider(
                            color: Colors.black,
                            indent: 50,
                            endIndent: 50,
                          ),
                          infoWidget('wind.png', 'Wind speed',
                              '${model.allData!.current!.windSpeed} k/h'),
                          const Divider(
                            color: Colors.black,
                            indent: 50,
                            endIndent: 50,
                          ),
                          infoWidget('wind-dir.png', 'Wind direction',
                              '${model.allData!.current!.windDir}'),
                          const Divider(
                            color: Colors.black,
                            indent: 50,
                            endIndent: 50,
                          ),
                          infoWidget('cloud.png', 'Cloud cover',
                              '${model.allData!.current!.cloudcover}%'),
                          const Divider(
                            color: Colors.black,
                            indent: 50,
                            endIndent: 50,
                          ),
                          infoWidget('prus.png', 'Pressure',
                              '${model.allData!.current!.pressure} MB'),
                        ],
                      ),
                    );
        }),
      ),
    );
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
