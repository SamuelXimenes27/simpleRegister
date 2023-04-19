import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/models/user.dart';
import 'package:register/provider/users.dart';
import 'package:register/routes/app_routes.dart';

class UserTile extends StatelessWidget {
  final User user;

  const UserTile(this.user, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final avatar = user.avatarURL.isEmpty
        ? ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              user.gender == 'Masculino'
                  ? 'https://cdn.pixabay.com/photo/2018/08/28/12/41/avatar-3637425_960_720.png'
                  : 'https://cdn.pixabay.com/photo/2014/04/03/10/32/user-310807_960_720.png',
            ))
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Image.network(user.avatarURL),
            ),
          );

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: ListTile(
        leading: avatar,
        title: Text(user.name),
        subtitle: Text(user.email),
        trailing: SizedBox(
          width: 100,
          child: Row(
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.edit),
                color: Colors.yellow,
                onPressed: () {
                  Navigator.of(context).pushNamed(
                    AppRoutes.userForm,
                    arguments: user,
                  );
                },
              ), //IconButton
              IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.red,
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: const Text('Excluir Usuário'),
                        content: const Text('Tem certeza?'),
                        actions: <Widget>[
                          OutlinedButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Sim'),
                          ),
                          OutlinedButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('Não'),
                          ),
                        ],
                      ),
                    ).then((confirmed) {
                      if (confirmed) {
                        Provider.of<Users>(context, listen: false).remove(user);
                      }
                    });
                  }) //IconButton
            ], //<Widget>
          ), //Row
        ), //Container
      ),
    ); //ListTile
  }
}
