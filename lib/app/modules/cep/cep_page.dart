import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:search_cep/app/modules/cep/cep_state.dart';
import 'package:search_cep/app/modules/cep/cep_store.dart';

class CepPage extends StatefulWidget {
  final String title;
  const CepPage({Key? key, this.title = 'CepPage'}) : super(key: key);
  @override
  CepPageState createState() => CepPageState();
}

// class CepPageState extends State<CepPage> {
class CepPageState extends ModularState<CepPage, CepStore> {
  final TextEditingController textController = TextEditingController();

  // @override
  // void initState() {
  //   super.initState();
  //   Modular.get<CepStore>().observer(
  //     onError: (e) => print(e),
  //     onState: (state) => print(state),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Modular.to.pop(),
        ),
      ),
      body: Container(
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: textController,
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () =>
                  Modular.get<CepStore>().searchCep(textController.text),
              child: const Text('Pesquisar Cep'),
            ),
            const SizedBox(height: 20.0),
            ScopedBuilder<CepStore, SearchCepError, SearchCepSuccess>(
              // store: Modular.get<CepStore>(),
              store: store,
              onError: (_, SearchCepError? e) => Text(
                "${e?.message}",
                style: const TextStyle(color: Colors.red),
              ),
              onLoading: (_) => const Expanded(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
              onState: (_, SearchCepSuccess state) => state.data.isEmpty
                  ? Container()
                  : Text(
                      "Cidade ${state.data['localidade']}/${state.data['uf']}"),
            ),
          ],
        ),
      ),
    );
  }
}
