/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: public_member_api_docs
// ignore_for_file: unused_import

import 'dart:io';
import 'dart:typed_data' as typed_data;
import 'package:serverpod_client/serverpod_client.dart';
import 'protocol.dart';

class _EndpointExample extends EndpointRef {
  @override
  String get name => 'example';

  _EndpointExample(EndpointCaller caller) : super(caller);

  Future<String> hello(
    String name,
  ) async {
    return await caller.callServerEndpoint('example', 'hello', 'String', {
      'name': name,
    });
  }
}

class _EndpointRanking extends EndpointRef {
  @override
  String get name => 'ranking';

  _EndpointRanking(EndpointCaller caller) : super(caller);

  Future<void> initDatabase(
    String json,
    String type,
  ) async {
    return await caller.callServerEndpoint('ranking', 'initDatabase', 'void', {
      'json': json,
      'type': type,
    });
  }

  Future<Ranking?> getRanking() async {
    return await caller
        .callServerEndpoint('ranking', 'getRanking', 'Ranking', {});
  }

  Future<List<Ranking>> getAllRanking() async {
    return await caller
        .callServerEndpoint('ranking', 'getAllRanking', 'List<Ranking>', {});
  }
}

class Client extends ServerpodClient {
  late final _EndpointExample example;
  late final _EndpointRanking ranking;

  Client(String host,
      {SecurityContext? context,
      ServerpodClientErrorCallback? errorHandler,
      AuthenticationKeyManager? authenticationKeyManager})
      : super(host, Protocol.instance,
            context: context,
            errorHandler: errorHandler,
            authenticationKeyManager: authenticationKeyManager) {
    example = _EndpointExample(this);
    ranking = _EndpointRanking(this);
  }

  @override
  Map<String, EndpointRef> get endpointRefLookup => {
        'example': example,
        'ranking': ranking,
      };

  @override
  Map<String, ModuleEndpointCaller> get moduleLookup => {};
}
