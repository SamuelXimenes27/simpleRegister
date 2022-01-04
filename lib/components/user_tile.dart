/*########################*/
/* ARQUIVO NO DIRETORIO 'lib/components/user_tile.dart'*/

import 'package:flutter/material.dart';
import 'package:register/models/user.dart';
import 'package:register/routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user);
  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarURL == null || user.avatarURL.isEmpty
        ? CircleAvatar(child: Icon(Icons.person))
        : CircleAvatar(backgroundImage: NetworkImage(user.avatarURL));
    return ListTile(
      leading: avatar,
      title: Text(user.name),
      subtitle: Text(user.email),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_FORM,
                  arguments: user,
                );
              },
            ), //IconButton
            IconButton(
              icon: Icon(Icons.delete),
              color: Colors.red,
              onPressed: () {},
            ), //IconButton
          ], //<Widget>
        ), //Row
      ), //Container
    ); //ListTile
  }
}

/*########################*/
