import 'package:flutter_triple/flutter_triple.dart';
import 'package:search_cep/app/modules/cep/cep_repository.dart';
import 'package:search_cep/app/modules/cep/cep_state.dart';

// Tipagem do erro: SearchCepError
// Tipagem do estado: SearchCepSuccess
class CepStore extends StreamStore<SearchCepError, SearchCepSuccess> {
  final CepRepository repository;

  // CepStore() : super(initialState);
  CepStore(this.repository) : super(const SearchCepSuccess({}));

  Future<void> searchCep(String cep) async {
    execute(() => repository.fetchCep(cep));
  }

  // Future<void> searchCep(String cep) async {
  //   setLoading(true);

  //   try {
  //     final response = await dio.get('https://viacep.com.br/ws/$cep/json/');
  //     update(SearchCepSuccess(response.data));
  //   } catch (e) {
  //     setError(const SearchCepError('Cep não encontrado!!!'));
  //   }
  // }
}
