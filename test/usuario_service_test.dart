import 'package:flutter_test/flutter_test.dart';
import 'package:questao1_map_app/services/usuario_service.dart';

void main() {
  group('Testes da Questão 1 - UsuarioService e Model', () {
    late UsuarioService service;

    setUp(() {
      service = UsuarioService();
    });

    test('Deve inicializar o Model corretamente com o Map', () {
      final map = service.usuarioMap;
      expect(map['login'], equals('raimundo_dev'));
      expect(map['senha'], equals('12345_secure'));
      expect(map['nome'], equals('Raimundo de Abreu'));
      expect(map['idade'], equals(38));
    });

    test('a) Deve exibir todas as informações do Map', () {
      final logs = service.exibirTodasInformacoes();
      expect(logs.length, equals(4));
      expect(logs[0], contains('login'));
      expect(logs[1], contains('senha'));
    });

    test('b) Deve mostrar apenas o valor da chave nome', () {
      final resultado = service.mostrarNome();
      expect(resultado, equals("Nome: Raimundo de Abreu"));
    });

    test('c) e d) Deve remover a chave senha e exibir o mapa atualizado', () {
      final resultadoRemocao = service.removerSenha();
      expect(resultadoRemocao, contains('removida com sucesso'));

      final mapaAtualizado = service.exibirMapaAtualizado();
      expect(mapaAtualizado, contains('raimundo_dev'));
      expect(mapaAtualizado, contains('Raimundo de Abreu'));
      expect(mapaAtualizado, contains('idade: 38'));
      expect(mapaAtualizado, isNot(contains('senha')));
    });
  });
}