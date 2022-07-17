import 'dart:convert';

import 'package:f1_server/src/generated/protocol.dart';
import 'package:serverpod/serverpod.dart';

class RankingEndpoint extends Endpoint {
  Future<void> initDatabase(Session session, String json, String type) async {
    final data = await jsonDecode(json);
    //Insert data into database
    for (var d in data) {
      switch (type) {
        case "Team":
          await Team.insert(
            session,
            Team(
              id: d['id'],
              name: d['name'],
            ),
          );
          break;
        case "Pilot":
          Team? team = await Team.findById(session, d['team']);
          await Pilot.insert(
            session,
            Pilot(
              id: d['id'],
              firstName: d['firstName'],
              lastName: d['lastName'],
              country: d['country'],
              team: team!,
            ),
          );
          break;
        case "Ranking":
          Pilot? pilot = await Pilot.findById(session, d['pilot']);
          await Ranking.insert(
            session,
            Ranking(
              id: d['id'],
              rank: d['rank'],
              pilot: pilot!,
              points: d['points'],
            ),
          );
          break;
      }
    }
  }

  Future<Ranking?> getRanking(Session session) async {
    var ranking = await Ranking.findSingleRow(session);
    return ranking;
  }

  Future<String> getAllRanking(Session session) async {
    var rankings = await Ranking.find(session);
    var json = jsonEncode(rankings.map((e) => e.toString()).toList());
    return json;
  }
}
