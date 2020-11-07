import 'dart:convert';

import 'package:http/http.dart' as http;

class LocationHelper {
  static const GOOGLE_API_KEY = "AIzaSyAb8ohmBXqtK4y2_a5CFnFnfLGiOsuwjIo";
  static String generateLocationPreviewImage({double lat, double lng}) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$lat,$lng&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$lng&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=YOUR_API_KEY';
    final res = await http.get(url);
    return json.decode(res.body)['results'][0]['formatted_address'];
  }
}
