Future<String> changeUsername() async {
  try {
    return await fetchNewUsername();
  } catch (e) {
    return e.toString();
  }
}

Future<String> fetchNewUsername() =>
    Future.delayed(_meioSegundo, () => throw Exception('Nao_Autenticado'));

void main() async {
  print('Testando...');
  List<String> mensagens = [];
  const passou = 'PASSOU';
  const mensagemFalhaTeste = 'O teste falhou para a função:';
  const mensagemErroDigitacao = 'O teste falhou! Verifique erros de digitação no retorno';
  
  try {
    mensagens
      ..add(_tornarLeitivel(
          testLabel: 'Parte 1',
          testResult: await _asyncEquals(
            expected: 'Exception: Nao_Autenticado',
            actual: await changeUsername(),
            typoKeyword: 'Nao_Autenticado',
          ),
          readableErrors: {
            mensagemErroDigitacao: mensagemErroDigitacao,
            'null':
                'O teste falhou! Você esqueceu de implementar ou retornar em changeUsername?',
            'Instance of \'Future<String>\'':
                '$mensagemFalhaTeste changeUsername. Você usou a palavra-chave await?',
            'Instance of \'_Future<String>\'':
                '$mensagemFalhaTeste changeUsername. Você usou a palavra-chave await?',
          }))
      ..removeWhere((m) => m.contains(passou))
      ..toList();

    if (mensagens.isEmpty) {
      print('Sucesso. Todos os testes passaram!');
    } else {
      mensagens.forEach(print);
    }
  } on UnimplementedError {
    print(
        'O teste falhou! Você esqueceu de implementar ou retornar em changeUsername?');
  } catch (e) {
    print('Tentativa de executar a solução falhou, exceção recebida: $e');
  }
}

const _meioSegundo = Duration(milliseconds: 500);

String _tornarLeitivel({
  required String testResult,
  required Map<String, String> readableErrors,
  required String testLabel,
}) {
  if (readableErrors.containsKey(testResult)) {
    var readable = readableErrors[testResult];
    return '$testLabel $readable';
  } else {
    return '$testLabel $testResult';
  }
}

Future<String> _asyncEquals({
  required String expected,
  required dynamic actual,
  required String typoKeyword,
}) async {
  var strActual = actual is String ? actual : actual.toString();
  try {
    if (expected == actual) {
      return 'PASSOU';
    } else if (strActual.contains(typoKeyword)) {
      return 'O teste falhou! Verifique erros de digitação no retorno';
    } else {
      return strActual;
    }
  } catch (e) {
    return e.toString();
  }
}