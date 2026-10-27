class UsuarioModel {
  String login;
  String senha;
  String nome;
  int idade;

  UsuarioModel({
    required this.login,
    required this.senha,
    required this.nome,
    required this.idade,
  });

  // Converte o objeto para um Map mutável
  Map<String, dynamic> toMap() {
    return {
      'login': login,
      'senha': senha,
      'nome': nome,
      'idade': idade,
    };
  }
}