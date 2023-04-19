import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/components/user_tile.dart';
import 'package:register/provider/users.dart';

import '../components/appbar.dart';
import '../routes/app_routes.dart';

class UserList extends StatelessWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 100),
        child: CustomAppBar(
          title: 'Lista de\nUsuários',
          onPressed: () {
            Navigator.of(context).pushNamed(
              AppRoutes.userForm,
            );
          },
        ),
      ),
      body: ListView.builder(
          itemCount: users.count,
          itemBuilder: (ctx, i) => UserTile(users.byIndex(i))),
    );
  }
}
