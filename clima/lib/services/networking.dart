import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.lat, this.long, this.apiK, this.city);

  late final double lat;
  late final double long;
  late final String apiK;
  late final String city;

  Future getData() async {
    var httpsUri = Uri (
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: '/data/2.5/weather',
        queryParameters: city == '' ? {'lat': lat.toString(), 'lon': long.toString(), 'units': 'imperial', 'appid': apiK} : {'q': city, 'units': 'imperial', 'appid': apiK}
    );

    http.Response res = await http.get(httpsUri);

    if (res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
    } else {
      print(res.statusCode);
    };
  }
}