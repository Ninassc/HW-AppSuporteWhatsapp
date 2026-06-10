import 'package:app_suporte_whatsapp/models/cliente.dart';
import 'package:app_suporte_whatsapp/models/aparelho.dart';
import 'package:app_suporte_whatsapp/models/atendimento.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDatabase();

    return _database!;
  }

  Future<Database> initDatabase() async {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;

    final path =
        r'\\hwfs01\Area Publica\Suporte (Disco T)\Suporte\AppsSuporte\Databases\AppSuporteWhatsapp\suporte.db';

    return await databaseFactory.openDatabase(path);
  }

  Future<List<Cliente>> getClientes() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('clientes');

    return List.generate(maps.length, (i) {
      return Cliente.fromMap(maps[i]);
    });
  }

  Future<List<Aparelho>> getAparelhosCliente(int clienteId) async {
    final db = await database;

    final maps = await db.query(
      'aparelhos',
      where: 'cliente_id = ?',
      whereArgs: [clienteId],
    );

    return List.generate(maps.length, (i) {
      return Aparelho.fromMap(maps[i]);
    });
  }

  Future<List<Atendimento>> getAtendimentosAparelho(int aparelhoId) async {
    final db = await database;

    final maps = await db.query(
      'atendimentos',
      where: 'aparelho_id = ?',
      whereArgs: [aparelhoId],
      orderBy: 'data_contato DESC',
    );

    return List.generate(maps.length, (i) {
      return Atendimento.fromMap(maps[i]);
    });
  }

  Future<List<Atendimento>> getAtendimentosCliente(int clienteId) async {
    final db = await database;

    final maps = await db.rawQuery(
      '''
    SELECT atendimentos.*
    FROM atendimentos

    INNER JOIN aparelhos
    ON atendimentos.aparelho_id = aparelhos.id

    WHERE aparelhos.cliente_id = ?

    ORDER BY atendimentos.data_contato DESC
    ''',
      [clienteId],
    );

    return List.generate(maps.length, (i) => Atendimento.fromMap(maps[i]));
  }

  Future<int> getTotalClientes() async {
    final db = await database;

    final result = await db.rawQuery('SELECT COUNT(*) as total FROM clientes');

    return result.first['total'] as int;
  }

  Future<int> getTotalAparelhos() async {
    final db = await database;

    final result = await db.rawQuery('SELECT COUNT(*) as total FROM aparelhos');

    return result.first['total'] as int;
  }

  Future<int> getTotalAtendimentos() async {
    final db = await database;

    final result = await db.rawQuery(
      'SELECT COUNT(*) as total FROM atendimentos',
    );

    return result.first['total'] as int;
  }

  Future<void> insertAtendimento(Atendimento atendimento) async {
    final db = await database;

    await db.insert('atendimentos', {
      'aparelho_id': atendimento.aparelhoId,
      'problema': atendimento.problema,
      'observacoes': atendimento.observacoes,
      'status': atendimento.status,
      'solucao': atendimento.solucao,
      'data_contato': atendimento.dataContato,
    });
  }

  Future<void> insertAparelho(Aparelho aparelho) async {
    final db = await database;

    await db.insert('aparelhos', {
      'cliente_id': aparelho.clienteId,
      'numero_serie': aparelho.numeroSerie,
    });
  }

  Future<void> insertCliente(Cliente cliente) async {
    final db = await database;

    await db.insert('clientes', {
      'nome': cliente.nome,
      'whatsapp': cliente.whatsapp,
      'empresa': cliente.empresa,
    });
  }

  Future<void> updateAparelho(Aparelho aparelho) async {
    final db = await database;

    await db.update(
      'aparelhos',
      {'numero_serie': aparelho.numeroSerie},

      where: 'id = ?',
      whereArgs: [aparelho.id],
    );
  }

  Future<void> updateAtendimento(Atendimento atendimento) async {
    final db = await database;

    await db.update(
      'atendimentos',
      {
        'problema': atendimento.problema,
        'observacoes': atendimento.observacoes,
        'status': atendimento.status,
        'solucao': atendimento.solucao,
      },

      where: 'id = ?',
      whereArgs: [atendimento.id],
    );
  }
}
