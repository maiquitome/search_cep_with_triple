import 'package:dio/dio.dart';
import 'package:search_cep/app/modules/cep/cep_state.dart';

class CepRepository {
  final Dio dio;

  CepRepository(this.dio);
  Future<SearchCepSuccess> fetchCep(String cep) async {
    try {
      final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
      return SearchCepSuccess(response.data);
    } on DioError catch (_) {
      // throw SearchCepError(e.message);
      throw const SearchCepError('Cep não ecnontrado!!!');
    }
  }
}
