import 'dart:convert';

import 'package:f1_client/f1_client.dart';
import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Sets up a singleton client object that can be used to talk to the server from
// anywhere in our app. The client is generated from your server code.
// The client is set up to connect to a Serverpod running on a local server on
// the default port. You will need to modify this to connect to staging or
// production servers.
var client = Client('http://localhost:8080/');

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Serverpod Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'API F1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Ranking> rankings = <Ranking>[];

  @override
  void initState() {
    super.initState();
    client.ranking.getRanking().then((ranking) {
      if (ranking == null) {
        initDatas();
      } else {
        _getDatas().then((rankings) {
          setState(() {
            this.rankings = rankings;
          });
        });
      }
    });
  }

  Future<List<Ranking>> _getDatas() async {
    List<Ranking> rankingsReturn = <Ranking>[];
    final response = await client.ranking.getAllRanking();
    final data = await jsonDecode(response);
    data.forEach((d) {
      rankingsReturn.add(
        Ranking.fromSerialization(
          jsonDecode(d),
        ),
      );
    });
    return rankingsReturn;
  }

  Future<void> initDatas() async {
    final String jsonTeams = await rootBundle.loadString('data/teams.json');
    await client.ranking.initDatabase(jsonTeams, "Team");
    final String jsonPilots = await rootBundle.loadString('data/pilots.json');
    await client.ranking.initDatabase(jsonPilots, "Pilot");
    final String jsonRanking = await rootBundle.loadString('data/ranking.json');
    await client.ranking.initDatabase(jsonRanking, "Ranking");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: rankings.length,
          itemBuilder: (context, index) {
            final ranking = rankings[index];
            return ListTile(
              title: Text(
                '${ranking.rank} - ${ranking.pilot.firstName} ${ranking.pilot.lastName}',
                style: const TextStyle(fontSize: 18),
              ),
              leading: Flag.fromString(
                getFlagFromCountry(ranking.pilot.country.toLowerCase()),
                height: 40,
                width: 40,
                fit: BoxFit.fill,
                replacement: Text('${ranking.pilot.country} not found'),
              ),
              subtitle: Text(
                ranking.pilot.team.name,
                style: const TextStyle(fontSize: 14),
              ),
              trailing: Text(
                '${ranking.points} pts',
                style: const TextStyle(fontSize: 18),
              ),
            );
          },
        ),
      ),
    );
  }

  String getFlagFromCountry(String lowerCase) {
    switch (lowerCase) {
      case 'france':
        return 'fr';
      case 'germany':
        return 'de';
      case 'italy':
        return 'it';
      case 'spain':
        return 'es';
      case 'united states':
        return 'us';
      case 'england':
        return 'gb';
      case 'australia':
        return 'au';
      case 'japan':
        return 'jp';
      case 'china':
        return 'cn';
      case 'russia':
        return 'ru';
      case 'brazil':
        return 'br';
      case 'canada':
        return 'ca';
      case 'austria':
        return 'at';
      case 'belgium':
        return 'be';
      case 'denmark':
        return 'dk';
      case 'finland':
        return 'fi';
      case 'holland':
        return 'nl';
      case 'hungary':
        return 'hu';
      case 'iceland':
        return 'is';
      case 'ireland':
        return 'ie';
      case 'luxembourg':
        return 'lu';
      case 'netherlands':
        return 'nl';
      case 'poland':
        return 'pl';
      case 'portugal':
        return 'pt';
      case 'switzerland':
        return 'ch';
      case 'czech republic':
        return 'cz';
      case 'romania':
        return 'ro';
      case 'serbia':
        return 'rs';
      case 'slovakia':
        return 'sk';
      case 'slovenia':
        return 'si';
      case 'sweden':
        return 'se';
      case 'turkey':
        return 'tr';
      case 'ukraine':
        return 'ua';
      case 'belarus':
        return 'by';
      case 'bulgaria':
        return 'bg';
      case 'croatia':
        return 'hr';
      case 'greece':
        return 'gr';
      case 'monaco':
        return 'mc';
      case 'danmark':
        return 'dk';
      case 'thailand':
        return 'th';
      default:
        return lowerCase;
    }
  }
}
