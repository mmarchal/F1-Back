/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import
// ignore_for_file: unnecessary_import
// ignore_for_file: overridden_fields

import 'package:serverpod_client/serverpod_client.dart';
import 'dart:typed_data';
import 'protocol.dart';

class Ranking extends SerializableEntity {
  @override
  String get className => 'Ranking';

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
}
