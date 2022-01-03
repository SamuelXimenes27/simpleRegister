/*########################*/
/* ARQUIVO NO DIRETORIO 'lib/views/user_list.dart'*/
import 'package:flutter/material.dart';
import 'package:register/data/dummy_users.dart';
import 'package:register/components/user_tile.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const users = {...DUMMY_USERS};

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
          )
        ],
      ), //AppBar
      body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (ctx, i) => UserTile(users.values.elementAt(i))),
    ); //Scaffold
  }
}

/*########################*/