import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.lat, this.long, this.apiK);

  late final double lat;
  late final double long;
  late final String apiK;

  Future getData() async {
    var httpsUri = Uri (
        scheme: 'https',
        host: 'api.openweathermap.org',
        path: '/data/2.5/weather',
        queryParameters: {'lat': lat.toString(), 'lon': long.toString(), 'units': 'imperial', 'appid': apiK}
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