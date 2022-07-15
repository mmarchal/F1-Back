/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_serialization/serverpod_serialization.dart';
import 'dart:typed_data';
import 'protocol.dart';

class Ranking extends TableRow {
  @override
  String get className => 'Ranking';
  @override
  String get tableName => 'ranking';

  static final t = RankingTable();

  @override
  int? id;
  late int rank;
  late Pilot pilot;
  late int points;

  Ranking({
    this.id,
    required this.rank,
    required this.pilot,
    required this.points,
  });

  Ranking.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    rank = _data['rank']!;
    pilot = Pilot.fromSerialization(_data['pilot']);
    points = _data['points']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'rank': rank,
      'pilot': pilot.serialize(),
      'points': points,
    });
  }

  @override
  Map<String, dynamic> serializeForDatabase() {
    return wrapSerializationData({
      'id': id,
      'rank': rank,
      'pilot': pilot.serialize(),
      'points': points,
    });
  }

  @override
  Map<String, dynamic> serializeAll() {
    return wrapSerializationData({
      'id': id,
      'rank': rank,
      'pilot': pilot.serialize(),
      'points': points,
    });
  }

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'rank':
        rank = value;
        return;
      case 'pilot':
        pilot = value;
        return;
      case 'points':
        points = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Ranking>> find(
    Session session, {
    RankingExpressionBuilder? where,
    int? limit,
    int? offset,
    Column? orderBy,
    List<Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.find<Ranking>(
      where: where != null ? where(Ranking.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Ranking?> findSingleRow(
    Session session, {
    RankingExpressionBuilder? where,
    int? offset,
    Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Ranking>(
      where: where != null ? where(Ranking.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Ranking?> findById(Session session, int id) async {
    return session.db.findById<Ranking>(id);
  }

  static Future<int> delete(
    Session session, {
    required RankingExpressionBuilder where,
    Transaction? transaction,
  }) async {
    return session.db.delete<Ranking>(
      where: where(Ranking.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    Session session,
    Ranking row, {
    Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    Session session,
    Ranking row, {
    Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    Session session,
    Ranking row, {
    Transaction? transaction,
  }) async {
    return session.db.insert(row, transaction: transaction);
  }

  static Future<int> count(
    Session session, {
    RankingExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.count<Ranking>(
      where: where != null ? where(Ranking.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef RankingExpressionBuilder = Expression Function(RankingTable t);

class RankingTable extends Table {
  RankingTable() : super(tableName: 'ranking');

  @override
  String tableName = 'ranking';
  final id = ColumnInt('id');
  final rank = ColumnInt('rank');
  final pilot = ColumnSerializable('pilot');
  final points = ColumnInt('points');

  @override
  List<Column> get columns => [
        id,
        rank,
        pilot,
        points,
      ];
}

@Deprecated('Use RankingTable.t instead.')
RankingTable tRanking = RankingTable();
