library vpp.server;

import 'package:rpc/rpc.dart';
import '../common/messages.dart';

@ApiClass(version: 'v1')
class VppApi
{
    final List<User> registeredUsers = new List();

    VppApi()
    {
        User userA = new User()
        ..email = 'maxneo5@gmail.com'
        ..firstName = 'alejandro'
        ..lastName = 'benitez'
        ..userName = 'maxn';

      User userB = new User()
        ..email='gar@gmail.com'
        ..firstName = 'Edward'
        ..userName = 'pepe';

      registeredUsers.add(userA);
      registeredUsers.add(userB);
    }

    @ApiMethod(path: 'users')
    List<User> listUsers()
    {
        return registeredUsers;
    }
}