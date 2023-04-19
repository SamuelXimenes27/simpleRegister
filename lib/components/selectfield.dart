import 'package:flutter/material.dart';

class CustomSelectField extends StatefulWidget {
  final bool? isSexInput;
  final void Function(String?)? onSaved;
  final items;
  final String? initialValue;

  const CustomSelectField({
    Key? key,
    this.isSexInput = false,
    this.onSaved,
    required this.items,
    this.initialValue,
  }) : super(key: key);

  @override
  State<CustomSelectField> createState() => _CustomSelectFieldState();
}

class _CustomSelectFieldState extends State<CustomSelectField> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

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
        child: DropdownButtonFormField(
          decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            hintText:
                widget.isSexInput! ? 'Selecione o seu gênero' : 'Selecione',
            hintStyle: TextStyle(
              color: Colors.teal.withOpacity(0.75),
            ),
            prefixIcon: widget.isSexInput == true
                ? const Icon(
                    Icons.male,
                    color: Colors.grey,
                  )
                : null,
          ),
          onChanged: (value) {},
          value: widget.initialValue,
          onSaved: widget.onSaved,
          items: widget.items!.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
