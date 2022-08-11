import 'package:bitcoin_ticker/services/network.dart';

class Conversion {
  Future<dynamic> getConversion(String digitalCurrency, String physicalCurrency) async {
    NetworkHelper networkHelper = NetworkHelper(digitalCurrency, physicalCurrency);

    var conversionData = await networkHelper.getData();
    return conversionData;
  }
}