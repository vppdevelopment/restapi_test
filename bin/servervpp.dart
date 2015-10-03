library servervpp;

import 'dart:io';

main() async {

  HttpServer server = await HttpServer.bind(InternetAddress.ANY_IP_V4, 8088);
  server.listen(handleRequest);
  print('Server listening on http://${server.address.host}:'
        '${server.port}');
}

void handleRequest(HttpRequest request) {
  request.response..write('Saludos!')
                  ..close();
}
