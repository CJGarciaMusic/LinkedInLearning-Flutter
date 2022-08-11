import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.digitalCurrency, this.physicalCurrency);

  late final String digitalCurrency;
  late final String physicalCurrency;

  Future getData() async {
    var httpsUri = Uri (
      scheme: 'https',
      host: 'apiv2.bitcoinaverage.com',
      path: '/indices/global/ticker/$digitalCurrency$physicalCurrency',
    );

    http.Response res = await http.get(httpsUri);
    print(res.body);
    if (res.statusCode == 200) {
      String data = res.body;
      return jsonDecode(data);
    } else {
      print(res.statusCode);
    };
  }
}