/*########################*/
/* ARQUIVO NO DIRETORIO 'lib/views/user_list.dart'*/
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/data/dummy_users.dart';
import 'package:register/components/user_tile.dart';
import 'package:register/provider/users.dart';
import 'package:register/routes/app_routes.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Usuários'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(
                AppRoutes.USER_FORM,
              );
            },
          )
        ],
      ), //AppBar
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i))),
    );
  }
}

/*########################*/