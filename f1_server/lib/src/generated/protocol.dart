/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unnecessary_import

library protocol;

// ignore: unused_import
import 'dart:typed_data';
import 'package:serverpod/serverpod.dart';

import 'example_class.dart';
import 'pilot_class.dart';
import 'ranking_class.dart';
import 'team_class.dart';

export 'example_class.dart';
export 'pilot_class.dart';
export 'ranking_class.dart';
export 'team_class.dart';

class Protocol extends SerializationManagerServer {
  static final Protocol instance = Protocol();

  final Map<String, constructor> _constructors = {};
  @override
  Map<String, constructor> get constructors => _constructors;

  final Map<String, String> _tableClassMapping = {};
  @override
  Map<String, String> get tableClassMapping => _tableClassMapping;

  final Map<Type, Table> _typeTableMapping = {};
  @override
  Map<Type, Table> get typeTableMapping => _typeTableMapping;

  Protocol() {
    constructors['Example'] = (Map<String, dynamic> serialization) =>
        Example.fromSerialization(serialization);
    constructors['Pilot'] = (Map<String, dynamic> serialization) =>
        Pilot.fromSerialization(serialization);
    constructors['Ranking'] = (Map<String, dynamic> serialization) =>
        Ranking.fromSerialization(serialization);
    constructors['Team'] = (Map<String, dynamic> serialization) =>
        Team.fromSerialization(serialization);

    tableClassMapping['pilot'] = 'Pilot';
    typeTableMapping[Pilot] = Pilot.t;
    tableClassMapping['ranking'] = 'Ranking';
    typeTableMapping[Ranking] = Ranking.t;
    tableClassMapping['team'] = 'Team';
    typeTableMapping[Team] = Team.t;
  }
}
