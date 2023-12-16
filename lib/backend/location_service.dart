import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'package:dotenv/dotenv.dart';

class LocationService {
  static const serviceUrl = "https://ipgeolocation.abstractapi.com/v1/";
  late String _token;

  Map<String,dynamic> responseBody = {};

  LocationService loadAccessToken() {
    var env = DotEnv();
    env.load();
    _token = env['ABSTRACT_API_KEY']!;
    return this;
  }

  Future<void> updateLocation() async {
    try {
      var uri = Uri.parse(serviceUrl);
      var response = await http.get(
        uri.replace(
          queryParameters: {
            "api_key": _token,
            "ip_address": await ipv6,
          }
        )
      );
      responseBody = json.decode(response.body);
      if (response.statusCode!=200) {
        throw Exception("Retrieval exited with code ${response.statusCode}");
      } else if (responseBody["city"]==null) {
        throw Exception("Response is null (turn off VPN)");
      }
    } catch (exception) {
      print("\x1b[1;31mException caught in LocationService.updateLocation()\x1b[0m\n$exception");
      responseBody = {};
    }
  }

  Future<String> get ipv6 async {
    NetworkInterface interface = (await NetworkInterface.list()).first;
    return interface.addresses.first.address;
  }

  bool get empty => responseBody.isEmpty;
  double get latitude => empty? 0.0 : responseBody["latitude"];
  double get longitude => empty? 0.0 : responseBody["longitude"];
  String get city => empty? "NULL" : responseBody["city"];
}

void main() async {
  LocationService ls = LocationService();
  await ls.updateLocation();
  print("${ls.city}: ${ls.latitude},${ls.longitude}");
}