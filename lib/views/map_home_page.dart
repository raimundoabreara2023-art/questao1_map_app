import 'package:flutter/material.dart';
import '../services/usuario_service.dart';

class MapHomePage extends StatefulWidget {
  const MapHomePage({super.key});

  @override
  State<MapHomePage> createState() => _MapHomePageState();
}

class _MapHomePageState extends State<MapHomePage> {
  // Instância do nosso serviço isolado
  final UsuarioService _usuarioService = UsuarioService();
  final List<String> _logs = [];

  @override
  void initState() {
    super.initState();
    _adicionarLog("Map inicial criado com sucesso via UsuarioModel: ${_usuarioService.usuarioMap}");
  }

  void _adicionarLog(String mensagem) {
    setState(() {
      _logs.add(mensagem);
    });
  }

  void _executarItemA() {
    _adicionarLog("--- [Item A] Exibindo todas as informações ---");
    for (var log in _usuarioService.exibirTodasInformacoes()) {
      _adicionarLog(log);
    }
  }

  void _executarItemB() {
    _adicionarLog("--- [Item B] Mostrar valor da chave 'nome' ---");
    _adicionarLog(_usuarioService.mostrarNome());
  }

  void _executarItemC() {
    _adicionarLog("--- [Item C] Removendo a chave 'senha' ---");
    _adicionarLog(_usuarioService.removerSenha());
  }

  void _executarItemD() {
    _adicionarLog("--- [Item D] Exibindo o mapa atualizado ---");
    _adicionarLog(_usuarioService.exibirMapaAtualizado());
  }

  void _reiniciar() {
    setState(() {
      _usuarioService.reiniciar();
      _logs.clear();
      _adicionarLog("Estado reiniciado. Map original restaurado.");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arquitetura em Camadas - Questão 1 Map'),
        backgroundColor: Colors.blue.shade700,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Painel de Botões (Ações)
            Expanded(
              flex: 1,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const Text(
                        'Ações da Questão',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: _executarItemA,
                        icon: const Icon(Icons.list),
                        label: const Text('a) Exibir todas as informações'),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: _executarItemB,
                        icon: const Icon(Icons.person),
                        label: const Text('b) Mostrar valor da chave "nome"'),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: _executarItemC,
                        icon: const Icon(Icons.lock_open),
                        label: const Text('c) Remover a chave "senha"'),
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade100),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: _executarItemD,
                        icon: const Icon(Icons.update),
                        label: const Text('d) Exibir mapa atualizado'),
                      ),
                      const Spacer(),
                      OutlinedButton.icon(
                        onPressed: _reiniciar,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Reiniciar Estado'),
                        style: OutlinedButton.styleFrom(foregroundColor: Colors.red),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 24),
            // Painel do Console / Saída
            Expanded(
              flex: 2,
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Console / Saída na Tela (Camada de Serviço)',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const Divider(),
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade900,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(12),
                          child: ListView.builder(
                            itemCount: _logs.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  _logs[index],
                                  style: const TextStyle(
                                    color: Colors.greenAccent,
                                    fontFamily: 'monospace',
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}