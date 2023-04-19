import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:register/models/user.dart';
import 'package:register/provider/users.dart';

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
      appBar: AppBar(
        title: const Text('Formulário de Usuário'),
        actions: <Widget>[
          IconButton(
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
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _form,
          child: Column(
            children: <Widget>[
              TextFormField(
                initialValue: _formData['name'],
                decoration: const InputDecoration(labelText: 'Nome'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Ocorreu um erro";
                  }
                  if (value.trim().length < 5) {
                    return "Nome muito pequeno. No minimo 5 letras.";
                  }
                  return null;
                },
                onSaved: (value) => _formData['name'] = value,
              ),
              TextFormField(
                initialValue: _formData['email'],
                decoration: const InputDecoration(labelText: 'Email'),
                onSaved: (value) => _formData['email'] = value,
              ),
              TextFormField(
                initialValue: _formData['avatarURL'],
                decoration: const InputDecoration(labelText: 'URL do Avatar'),
                onSaved: (value) => _formData['avatarURL'] = value,
              )
            ],
          ),
        ),
      ),
    );
  }
}
