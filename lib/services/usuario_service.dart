import '../models/usuario_model.dart';

class UsuarioService {
  // Instância inicial do Model
  late UsuarioModel _usuarioModel;
  
  // Map interno mutável que reflete o estado atual da questão
  late Map<String, dynamic> _usuarioMap;

  UsuarioService() {
    _reiniciarDados();
  }

  void _reiniciarDados() {
    _usuarioModel = UsuarioModel(
      login: 'raimundo_dev',
      senha: '12345_secure',
      nome: 'Raimundo de Abreu',
      idade: 38,
    );
    _usuarioMap = _usuarioModel.toMap();
  }

  Map<String, dynamic> get usuarioMap => _usuarioMap;

  // a) Exibir todas as informações
  List<String> exibirTodasInformacoes() {
    List<String> logs = [];
    _usuarioMap.forEach((chave, valor) {
      logs.add("Chave: $chave -> Valor: $valor");
    });
    return logs;
  }

  // b) Mostrar apenas o valor da chave 'nome'
  String mostrarNome() {
    return "Nome: ${_usuarioMap['nome']}";
  }

  // c) Remover a chave 'senha'
  String removerSenha() {
    final removido = _usuarioMap.remove('senha');
    return "Chave 'senha' (valor: $removido) foi removida com sucesso.";
  }

  // d) Exibir mapa atualizado
  String exibirMapaAtualizado() {
    return "Mapa atualizado: $_usuarioMap";
  }

  // Reiniciar estado original
  void reiniciar() {
    _reiniciarDados();
  }
}