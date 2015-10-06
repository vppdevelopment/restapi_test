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

    @ApiMethod(method: 'POST', path: 'user')
    User addUser(User user)
    {
      registeredUsers.add(user);
      return user;
    }

    @ApiMethod(method: 'DELETE', path: 'user/{userName}')
    User deleteUser(String userName)
    {
      String userNameDecoded = Uri.decodeComponent(userName);
      User foundedUser = registeredUsers.firstWhere( (u) => u.userName == userNameDecoded, orElse: ()=> new User() );
      registeredUsers.remove(foundedUser);
      return foundedUser;
    }
}