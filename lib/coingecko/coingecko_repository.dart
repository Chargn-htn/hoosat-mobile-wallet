import 'dart:convert';

import 'package:http/http.dart' as http;

// Future<num?> getKaspiumApiPrice(String fiat) async {
//   try {
//     final uri = Uri.https(
//       'api.kaspium.io',
//       '/api/v1/hoosat/price',
//       {'currencies': fiat},
//     );

//     final response = await http.get(uri, headers: {
//       'Accept': 'application/json',
//       'User-Agent': 'Kaspium Wallet',
//     });

//     if (response.statusCode != 200) {
//       return null;
//     }

//     final data = json.decode(response.body);
//     return data[fiat] as num;
//   } catch (_) {
//     return null;
//   }
// }

Future<num?> getCoinPaprikaApiPrice(String fiat) async {
  try {
    final uri = Uri.https(
      'api.coinpaprika.com',
      '/v1/tickers/htn-hoosat-network',
    );
    final response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'User-Agent': 'Mozilla/5.0 (KHTML, like Gecko) Chrome',
    });

    if (response.statusCode != 200) {
      return null;
    }
    final data = json.decode(response.body);
    if (data is! Map) {
      throw Exception('Returned data is not a Map');
    }
    final quotes = data['quotes'];
    if (quotes is! Map) {
      throw Exception('Returned quotes is not a Map');
    }
    final currencyKeyUpper = fiat.toUpperCase();
    final currencyKeyLower = fiat.toLowerCase();
    final dynamic quote =
        quotes[currencyKeyUpper] ?? quotes[currencyKeyLower] ?? quotes[fiat];
    if (quote is Map && quote['price'] is num) {
      return quote['price'] as num;
    }
    return null;
  } catch (_) {
    return null;
  }
}

Future<num?> getHoosatApiPrice(String fiat) async {
  try {
    // api.network.hoosat.fi was Tonto's dead domain; our own htn-rest-server
    // (explorer-nz.hoosat.network) exposes the identical /info/price shape.
    final uri = Uri.https(
      'explorer-nz.hoosat.network',
      '/info/price',
      {'stringOnly': 'false'},
    );
    final response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'User-Agent': 'Mozilla/5.0 (KHTML, like Gecko) Chrome',
    });

    if (response.statusCode != 200) {
      return null;
    }
    final data = json.decode(response.body);
    if (data is! Map) {
      throw Exception('Returned data is not a Map');
    }
    final value = data['price'];
    if (value is num) {
      return value;
    }
    return null;
  } catch (_) {
    return null;
  }
}

Future<num?> getCoinGeckoApiPrice(String fiat) async {
  try {
    final uri = Uri.https(
      'api.coingecko.com',
      '/api/v3/simple/price',
      {'ids': 'hoosat-network', 'vs_currencies': fiat},
    );
    final response = await http.get(uri, headers: {
      'Accept': 'application/json',
      'User-Agent': 'Mozilla/5.0 (KHTML, like Gecko) Chrome',
    });

    if (response.statusCode != 200) {
      return null;
    }
    final data = json.decode(response.body);
    if (data is! Map) {
      throw Exception('Returned data is not a Map');
    }
    final rates = data['hoosat-network'] as Map<String, dynamic>;
    return rates[fiat] as num;
  } catch (_) {
    return null;
  }
}
