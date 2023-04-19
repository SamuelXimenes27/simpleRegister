import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final bool? isName;
  final bool? isEmail;
  final bool? isLink;
  final String? initialValue;
  final void Function(String?)? onSaved;

  const CustomTextField({
    Key? key,
    this.isEmail = false,
    this.isLink = false,
    this.isName = false,
    required this.initialValue,
    this.onSaved,
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 1.0,
          ),
        ),
        child: TextFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            hintText: widget.isName!
                ? 'Digite o seu nome'
                : widget.isEmail!
                    ? 'Digite o seu email'
                    : widget.isLink!
                        ? 'Digite uma URL de um Avatar'
                        : 'Digite aqui',
            hintStyle: TextStyle(
              color: Colors.teal.withOpacity(0.75),
            ),
            prefixIcon: widget.isEmail == true ||
                    widget.isLink == true ||
                    widget.isName == true
                ? Icon(
                    widget.isName!
                        ? Icons.person
                        : widget.isEmail!
                            ? Icons.email
                            : widget.isLink!
                                ? Icons.link
                                : null,
                    color: Colors.grey,
                  )
                : null,
          ),
          initialValue: widget.initialValue!,
          validator: (value) {
            if (widget.isName! == true) {
              {
                if (value == null || value.isEmpty) {
                  return "Ocorreu um erro";
                }
                if (value.trim().length < 5) {
                  return "Nome muito pequeno. No minimo 5 letras.";
                }
                return null;
              }
            }
          },
          onSaved: widget.onSaved,
        ),
      ),
    );
  }
}
