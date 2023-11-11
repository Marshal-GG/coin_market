import '../../models/crypto_metadata_model.dart';
import '../../models/crypto_model.dart';

abstract class BaseCryptoRepository {
  Future<Crypto> getCryptos();
  Future<Metadata> getCryptoDetails(int id);
}
