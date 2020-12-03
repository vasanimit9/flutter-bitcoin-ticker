import 'package:http/http.dart' as http;
import 'dart:convert';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  String apiKey = 'F84821FD-62DB-491E-B121-78EA5C3B336D';
  String coinAPIHost = 'https://rest.coinapi.io/v1/exchangerate/';

  Future getRates(String currency, String cryptocurrency) async {
    var url = coinAPIHost + cryptocurrency + '/' + currency;
    url += '?apikey=$apiKey';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var rate = jsonDecode(response.body)['rate'].toDouble();
      return rate.round().toString();
    }
    return 0.0;
  }
}
