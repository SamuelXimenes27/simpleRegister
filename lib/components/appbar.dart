import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String? title;
  final void Function()? onPressed;
  final bool? isForm;
  const CustomAppBar({
    Key? key,
    required this.title,
    required this.onPressed,
    this.isForm = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title!,
            style: const TextStyle(
                color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    offset: const Offset(12, 26),
                    blurRadius: 50,
                    spreadRadius: 0,
                    color: Colors.grey.withOpacity(.25)),
              ]),
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white,
                child: IconButton(
                  icon: Icon(isForm! ? Icons.save : Icons.add),
                  color: const Color(0xff53E88B),
                  onPressed: onPressed,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
