import 'package:http/http.dart' as http;

import '../../models/crypto_metadata_model.dart';
import '../../models/crypto_model.dart';
import 'base_crypto_repo.dart';

class CryptoRepository extends BaseCryptoRepository {
  final String baseUrl = 'https://pro-api.coinmarketcap.com/v1/cryptocurrency';
  final String apiKey = '17eecf2f-cc65-4ae2-ab21-aa3edbde8c6a';

  @override
  Future<Crypto> getCryptos() async {
    final client = http.Client();
    final uri = Uri.parse(
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/listings/latest?start=1&limit=20&convert=USD&CMC_PRO_API_KEY=17eecf2f-cc65-4ae2-ab21-aa3edbde8c6a');

    final response = await client.get(uri);

    if (response.statusCode == 200) {
      final json = response.body;

      return cryptoFromJson(json);
    } else {
      print('Request failed with status: ${response.statusCode}');
      return Crypto(
        data: [],
        status: Status(
          timestamp: DateTime.now(),
          errorCode: 0,
          errorMessage: 'No Error',
          elapsed: 0,
          creditCount: 0,
          notice: 'No Notice',
          totalCount: 0,
        ),
      );
    }
  }

  @override
  Future<Metadata> getCryptoDetails(int id) async {
    final client = http.Client();
    final uri = Uri.parse(
        'https://pro-api.coinmarketcap.com/v1/cryptocurrency/info?id=$id&CMC_PRO_API_KEY=17eecf2f-cc65-4ae2-ab21-aa3edbde8c6a');
    final response = await client.get(uri);
    if (response.statusCode == 200) {
      final json = response.body;
      return metadataFromJson(json);
    } else {
      throw Exception('Failed to fetch cryptocurrency details');
    }
  }
}
