import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/components/textfield.dart';
import 'package:register/models/user.dart';
import 'package:register/provider/users.dart';

import '../components/appbar.dart';

class UserForm extends StatefulWidget {
  const UserForm({Key? key}) : super(key: key);

  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final GlobalKey<FormState>? _form = GlobalKey<FormState>();

  final Map<String?, String?> _formData = {
    'id': null,
    'name': null,
    'email': null,
    'avatarURL': null,
  };

  void _loadFormData(User user) {
    _formData['id'] = user.id;
    _formData['name'] = user.name;
    _formData['email'] = user.email;
    _formData['avatarURL'] = user.avatarURL;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final user = ModalRoute.of(context)?.settings.arguments as User?;
    if (user != null) {
      _loadFormData(user);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(100, 100),
        child: CustomAppBar(
          title: "Novo \nUsuário",
          isForm: true,
          onPressed: () {
            final isValid = _form!.currentState!.validate();
            if (isValid) {
              _form!.currentState!.save();
              Provider.of<Users>(context, listen: false).put(
                User(
                  id: _formData['id'] ?? ' ',
                  name: _formData['name'] ?? ' ',
                  email: _formData['email'] ?? ' ',
                  avatarURL: _formData['avatarURL'] ?? ' ',
                ),
              );
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              CustomTextField(
                initialValue: _formData['name'] ?? '',
                isName: true,
                onSaved: (value) => _formData['name'] = value,
              ),
              CustomTextField(
                initialValue: _formData['email'] ?? '',
                isEmail: true,
                onSaved: (value) => _formData['email'] = value,
              ),
              CustomTextField(
                initialValue: _formData['avatarURL'] ?? '',
                isLink: true,
                onSaved: (value) => _formData['avatarURL'] = value,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Center(
          child: Icon(Icons.subdirectory_arrow_left_outlined),
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        tooltip: 'Voltar',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
