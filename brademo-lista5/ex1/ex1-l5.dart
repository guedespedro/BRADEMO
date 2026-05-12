Future<String> reportarCargoUsuario() async {
  String cargo = await buscarCargo();
  return 'Cargo do usuario: $cargo';
}

Future<String> reportarLogins() async {
  int logins = await buscarQuantidadeLogins();
  return 'Numero total de logins: $logins';
}

Future<String> buscarCargo() => Future.delayed(_meioSegundo, () => _cargo);
Future<int> buscarQuantidadeLogins() => Future.delayed(_meioSegundo, () => _logins);

void main() async {
  print('Testando...');
  List<String> mensagens = [];
  const passou = 'PASSOU';
  const mensagemFalhaTeste = 'O teste falhou para a funcao:';
  const mensagemErroDigitacao = 'O teste falhou! Verifique erros de digitacao no retorno';
  
  try {
    mensagens
      ..add(_tornarLeitivel(
          testLabel: 'Parte 1',
          testResult: await _asyncEquals(
            expected: 'Cargo do usuario: administrador',
            actual: await reportarCargoUsuario(),
            typoKeyword: _cargo,
          ),
          readableErrors: {
            mensagemErroDigitacao: mensagemErroDigitacao,
            'null':
                'O teste falhou! Voce esqueceu de implementar ou retornar em reportarCargoUsuario?',
            'Cargo do usuario: Instance of \'Future<String>\'':
                '$mensagemFalhaTeste reportarCargoUsuario. Voce usou a palavra-chave await?',
            'Cargo do usuario: Instance of \'_Future<String>\'':
                '$mensagemFalhaTeste reportarCargoUsuario. Voce usou a palavra-chave await?',
            'Cargo do usuario:':
                '$mensagemFalhaTeste reportarCargoUsuario. Voce retornou o cargo do usuario?',
            'Cargo do usuario: ':
                '$mensagemFalhaTeste reportarCargoUsuario. Voce retornou o cargo do usuario?',
            'Cargo do usuario: tester':
                '$mensagemFalhaTeste reportarCargoUsuario. Voce chamou buscarCargo para obter o cargo?',
          }))
      ..add(_tornarLeitivel(
          testLabel: 'Parte 2',
          testResult: await _asyncEquals(
            expected: 'Numero total de logins: 42',
            actual: await reportarLogins(),
            typoKeyword: _logins.toString(),
          ),
          readableErrors: {
            mensagemErroDigitacao: mensagemErroDigitacao,
            'null':
                'O teste falhou! Voce esqueceu de implementar ou retornar em reportarLogins?',
            'Numero total de logins: Instance of \'Future<int>\'':
                '$mensagemFalhaTeste reportarLogins. Voce usou a palavra-chave await?',
            'Numero total de logins: Instance of \'_Future<int>\'':
                '$mensagemFalhaTeste reportarLogins. Voce usou a palavra-chave await?',
            'Numero total de logins: ':
                '$mensagemFalhaTeste reportarLogins. Voce retornou o numero de logins?',
            'Numero total de logins:':
                '$mensagemFalhaTeste reportarLogins. Voce retornou o numero de logins?',
            'Numero total de logins: 57':
                '$mensagemFalhaTeste reportarLogins. Voce chamou buscarQuantidadeLogins para obter o numero de logins?',
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
        'O teste falhou! Voce esqueceu de implementar ou retornar em reportarCargoUsuario?');
  } catch (e) {
    print('Tentativa de executar a solucao falhou, excecao recebida: $e');
  }
}

const _cargo = 'administrador';
const _logins = 42;
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
      return 'O teste falhou! Verifique erros de digitacao no retorno';
    } else {
      return strActual;
    }
  } catch (e) {
    return e.toString();
  }
}