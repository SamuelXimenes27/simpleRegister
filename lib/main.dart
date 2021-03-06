import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/provider/users.dart';
import 'package:register/routes/app_routes.dart';
import 'package:register/views/user_form.dart';
import 'package:register/views/user_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => Users(),
        ),
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.teal,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          routes: {
            AppRoutes.HOME: (_) => UserList(),
            AppRoutes.USER_FORM: (ctx) => UserForm()
          }),
    );
  }
}
