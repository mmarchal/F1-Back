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

class Pilot extends TableRow {
  @override
  String get className => 'Pilot';
  @override
  String get tableName => 'pilot';

  static final t = PilotTable();

  @override
  int? id;
  late String firstName;
  late String lastName;
  late Team team;
  late String country;

  Pilot({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.team,
    required this.country,
  });

  Pilot.fromSerialization(Map<String, dynamic> serialization) {
    var _data = unwrapSerializationData(serialization);
    id = _data['id'];
    firstName = _data['firstName']!;
    lastName = _data['lastName']!;
    team = Team.fromSerialization(_data['team']);
    country = _data['country']!;
  }

  @override
  Map<String, dynamic> serialize() {
    return wrapSerializationData({
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'team': team.serialize(),
      'country': country,
    });
  }

  @override
  Map<String, dynamic> serializeForDatabase() {
    return wrapSerializationData({
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'team': team.serialize(),
      'country': country,
    });
  }

  @override
  Map<String, dynamic> serializeAll() {
    return wrapSerializationData({
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'team': team.serialize(),
      'country': country,
    });
  }

  @override
  void setColumn(String columnName, value) {
    switch (columnName) {
      case 'id':
        id = value;
        return;
      case 'firstName':
        firstName = value;
        return;
      case 'lastName':
        lastName = value;
        return;
      case 'team':
        team = value;
        return;
      case 'country':
        country = value;
        return;
      default:
        throw UnimplementedError();
    }
  }

  static Future<List<Pilot>> find(
    Session session, {
    PilotExpressionBuilder? where,
    int? limit,
    int? offset,
    Column? orderBy,
    List<Order>? orderByList,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.find<Pilot>(
      where: where != null ? where(Pilot.t) : null,
      limit: limit,
      offset: offset,
      orderBy: orderBy,
      orderByList: orderByList,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Pilot?> findSingleRow(
    Session session, {
    PilotExpressionBuilder? where,
    int? offset,
    Column? orderBy,
    bool orderDescending = false,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.findSingleRow<Pilot>(
      where: where != null ? where(Pilot.t) : null,
      offset: offset,
      orderBy: orderBy,
      orderDescending: orderDescending,
      useCache: useCache,
      transaction: transaction,
    );
  }

  static Future<Pilot?> findById(Session session, int id) async {
    return session.db.findById<Pilot>(id);
  }

  static Future<int> delete(
    Session session, {
    required PilotExpressionBuilder where,
    Transaction? transaction,
  }) async {
    return session.db.delete<Pilot>(
      where: where(Pilot.t),
      transaction: transaction,
    );
  }

  static Future<bool> deleteRow(
    Session session,
    Pilot row, {
    Transaction? transaction,
  }) async {
    return session.db.deleteRow(
      row,
      transaction: transaction,
    );
  }

  static Future<bool> update(
    Session session,
    Pilot row, {
    Transaction? transaction,
  }) async {
    return session.db.update(
      row,
      transaction: transaction,
    );
  }

  static Future<void> insert(
    Session session,
    Pilot row, {
    Transaction? transaction,
  }) async {
    return session.db.insert(row, transaction: transaction);
  }

  static Future<int> count(
    Session session, {
    PilotExpressionBuilder? where,
    int? limit,
    bool useCache = true,
    Transaction? transaction,
  }) async {
    return session.db.count<Pilot>(
      where: where != null ? where(Pilot.t) : null,
      limit: limit,
      useCache: useCache,
      transaction: transaction,
    );
  }
}

typedef PilotExpressionBuilder = Expression Function(PilotTable t);

class PilotTable extends Table {
  PilotTable() : super(tableName: 'pilot');

  @override
  String tableName = 'pilot';
  final id = ColumnInt('id');
  final firstName = ColumnString('firstName');
  final lastName = ColumnString('lastName');
  final team = ColumnSerializable('team');
  final country = ColumnString('country');

  @override
  List<Column> get columns => [
        id,
        firstName,
        lastName,
        team,
        country,
      ];
}

@Deprecated('Use PilotTable.t instead.')
PilotTable tPilot = PilotTable();
