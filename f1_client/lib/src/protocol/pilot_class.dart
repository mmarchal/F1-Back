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

class Pilot extends SerializableEntity {
  @override
  String get className => 'Pilot';

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
}
