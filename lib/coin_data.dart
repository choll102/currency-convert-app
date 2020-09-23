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
  'ZAR',
];
const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];


const bitcoinAverageURL =
    'https://rest.coinapi.io/v1/exchangerate';
const apiKey = 'D9D6A6EA-AF1D-46AF-8841-BD0D4CB05AAD';
// https://rest.coinapi.io/v1/exchangerate/BTC/GBP?apikey=D9D6A6EA-AF1D-46AF-8841-BD0D4CB05AAD
// https://rest.coinapi.io/v1/exchangerate/BTC/<Currency>?apikey=YOUR_API_KEY
class CoinData {
  //3: lấy dữ liệu API tiền tệ đầu vào
  Future getCoinData(String selectedCurrency) async {
    //4: đường dẫn API đầu vào mới .
    String requestURL = '$bitcoinAverageURL/BTC/$selectedCurrency?apikey=$apiKey';
    http.Response response = await http.get(requestURL);
    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      double lastPrice = decodedData['rate'];
      return lastPrice.toStringAsFixed(0);
    } else {
      print(response.statusCode);
      throw 'vấn đề API';
    }
  }
}


// const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate';
// const apiKey = 'D9D6A6EA-AF1D-46AF-8841-BD0D4CB05AAD';
// class CoinData {
//   Future getCoinData() async {
//     String requestURL = '$coinAPIURL/BTC/USD?apikey=$apiKey';
//     http.Response response = await http.get(requestURL);
//     if (response.statusCode == 200) {
//       var decodedData = jsonDecode(response.body);
//       var lastPrice = decodedData['rate'];
//       return lastPrice;
//     } else {
//       print(response.statusCode);
//       throw 'vấn đề  api';
//     }
//   }
// }
