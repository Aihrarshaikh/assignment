class Weather {
  Weather({
    required this.request,
    required this.location,
    required this.current,
  });

  final Request? request;
  final Location? location;
  final Current? current;

  Weather copyWith({
    Request? request,
    Location? location,
    Current? current,
  }) {
    return Weather(
      request: request ?? this.request,
      location: location ?? this.location,
      current: current ?? this.current,
    );
  }

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      request: json["request"] == null ? null : Request.fromJson(json["request"]),
      location: json["location"] == null ? null : Location.fromJson(json["location"]),
      current: json["current"] == null ? null : Current.fromJson(json["current"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "request": request?.toJson(),
    "location": location?.toJson(),
    "current": current?.toJson(),
  };

  @override
  String toString() {
    return "$request, $location, $current, ";
  }
}

class Current {
  Current({
    required this.observationTime,
    required this.temperature,
    required this.weatherCode,
    required this.weatherIcons,
    required this.weatherDescriptions,
    required this.windSpeed,
    required this.windDegree,
    required this.windDir,
    required this.pressure,
    required this.precip,
    required this.humidity,
    required this.cloudcover,
    required this.feelslike,
    required this.uvIndex,
    required this.visibility,
    required this.isDay,
  });

  final String? observationTime;
  final double? temperature;
  final double? weatherCode;
  final List<String> weatherIcons;
  final List<String> weatherDescriptions;
  final double? windSpeed;
  final double? windDegree;
  final String? windDir;
  final double? pressure;
  final double? precip;
  final double? humidity;
  final double? cloudcover;
  final double? feelslike;
  final double? uvIndex;
  final double? visibility;
  final String? isDay;

  Current copyWith({
    String? observationTime,
    double? temperature,
    double? weatherCode,
    List<String>? weatherIcons,
    List<String>? weatherDescriptions,
    double? windSpeed,
    double? windDegree,
    String? windDir,
    double? pressure,
    double? precip,
    double? humidity,
    double? cloudcover,
    double? feelslike,
    double? uvIndex,
    double? visibility,
    String? isDay,
  }) {
    return Current(
      observationTime: observationTime ?? this.observationTime,
      temperature: temperature ?? this.temperature,
      weatherCode: weatherCode ?? this.weatherCode,
      weatherIcons: weatherIcons ?? this.weatherIcons,
      weatherDescriptions: weatherDescriptions ?? this.weatherDescriptions,
      windSpeed: windSpeed ?? this.windSpeed,
      windDegree: windDegree ?? this.windDegree,
      windDir: windDir ?? this.windDir,
      pressure: pressure ?? this.pressure,
      precip: precip ?? this.precip,
      humidity: humidity ?? this.humidity,
      cloudcover: cloudcover ?? this.cloudcover,
      feelslike: feelslike ?? this.feelslike,
      uvIndex: uvIndex ?? this.uvIndex,
      visibility: visibility ?? this.visibility,
      isDay: isDay ?? this.isDay,
    );
  }

  factory Current.fromJson(Map<String, dynamic> json) {
    return Current(
      observationTime: json["observation_time"],
      temperature: (json["temperature"] as num?)?.toDouble(),
      weatherCode: (json["weather_code"] as num?)?.toDouble(),
      weatherIcons: json["weather_icons"] == null ? [] : List<String>.from(json["weather_icons"]!.map((x) => x)),
      weatherDescriptions: json["weather_descriptions"] == null ? [] : List<String>.from(json["weather_descriptions"]!.map((x) => x)),
      windSpeed: (json["wind_speed"] as num?)?.toDouble(),
      windDegree: (json["wind_degree"] as num?)?.toDouble(),
      windDir: json["wind_dir"],
      pressure: (json["pressure"] as num?)?.toDouble(),
      precip: (json["precip"] as num?)?.toDouble(),
      humidity: (json["humidity"] as num?)?.toDouble(),
      cloudcover: (json["cloudcover"] as num?)?.toDouble(),
      feelslike: (json["feelslike"] as num?)?.toDouble(),
      uvIndex: (json["uv_index"] as num?)?.toDouble(),
      visibility: (json["visibility"] as num?)?.toDouble(),
      isDay: json["is_day"],
    );
  }

  Map<String, dynamic> toJson() => {
    "observation_time": observationTime,
    "temperature": temperature,
    "weather_code": weatherCode,
    "weather_icons": weatherIcons.map((x) => x).toList(),
    "weather_descriptions": weatherDescriptions.map((x) => x).toList(),
    "wind_speed": windSpeed,
    "wind_degree": windDegree,
    "wind_dir": windDir,
    "pressure": pressure,
    "precip": precip,
    "humidity": humidity,
    "cloudcover": cloudcover,
    "feelslike": feelslike,
    "uv_index": uvIndex,
    "visibility": visibility,
    "is_day": isDay,
  };

  @override
  String toString() {
    return "$observationTime, $temperature, $weatherCode, $weatherIcons, $weatherDescriptions, $windSpeed, $windDegree, $windDir, $pressure, $precip, $humidity, $cloudcover, $feelslike, $uvIndex, $visibility, $isDay";
  }
}

class Location {
  Location({
    required this.name,
    required this.country,
    required this.region,
    required this.lat,
    required this.lon,
    required this.timezoneId,
    required this.localtime,
    required this.localtimeEpoch,
    required this.utcOffset,
  });

  final String? name;
  final String? country;
  final String? region;
  final double? lat;
  final double? lon;
  final String? timezoneId;
  final String? localtime;
  final double? localtimeEpoch;
  final String? utcOffset;

  Location copyWith({
    String? name,
    String? country,
    String? region,
    double? lat,
    double? lon,
    String? timezoneId,
    String? localtime,
    double? localtimeEpoch,
    String? utcOffset,
  }) {
    return Location(
      name: name ?? this.name,
      country: country ?? this.country,
      region: region ?? this.region,
      lat: lat ?? this.lat,
      lon: lon ?? this.lon,
      timezoneId: timezoneId ?? this.timezoneId,
      localtime: localtime ?? this.localtime,
      localtimeEpoch: localtimeEpoch ?? this.localtimeEpoch,
      utcOffset: utcOffset ?? this.utcOffset,
    );
  }

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      name: json["name"],
      country: json["country"],
      region: json["region"],
      lat: (json["lat"] as String?) != null ? double.parse(json["lat"]) : null,
      lon: (json["lon"] as String?) != null ? double.parse(json["lon"]) : null,
      timezoneId: json["timezone_id"],
      localtime: json["localtime"],
      localtimeEpoch: (json["localtime_epoch"] as num?)?.toDouble(),
      utcOffset: json["utc_offset"],
    );
  }

  Map<String, dynamic> toJson() => {
    "name": name,
    "country": country,
    "region": region,
    "lat": lat,
    "lon": lon,
    "timezone_id": timezoneId,
    "localtime": localtime,
    "localtime_epoch": localtimeEpoch,
    "utc_offset": utcOffset,
  };

  @override
  String toString() {
    return "$name, $country, $region, $lat, $lon, $timezoneId, $localtime, $localtimeEpoch, $utcOffset";
  }
}

class Request {
  Request({
    required this.type,
    required this.query,
    required this.language,
    required this.unit,
  });

  final String? type;
  final String? query;
  final String? language;
  final String? unit;

  Request copyWith({
    String? type,
    String? query,
    String? language,
    String? unit,
  }) {
    return Request(
      type: type ?? this.type,
      query: query ?? this.query,
      language: language ?? this.language,
      unit: unit ?? this.unit,
    );
  }

  factory Request.fromJson(Map<String, dynamic> json) {
    return Request(
      type: json["type"],
      query: json["query"],
      language: json["language"],
      unit: json["unit"],
    );
  }

  Map<String, dynamic> toJson() => {
    "type": type,
    "query": query,
    "language": language,
    "unit": unit,
  };

  @override
  String toString() {
    return "$type, $query, $language, $unit";
  }
}
