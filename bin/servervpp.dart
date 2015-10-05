library servervpp;

import 'dart:io';
import 'package:rpc/rpc.dart';

import 'package:vpp/server/vppApi.dart';

final ApiServer _apiServer = new ApiServer( prettyPrint: true );

main() async {

  _apiServer.addApi(new VppApi());
  HttpServer server = await HttpServer.bind(InternetAddress.ANY_IP_V4, 8088);
  server.listen(_apiServer.httpRequestHandler);
  print('Server listening on http://${server.address.host}:'
        '${server.port}');
}