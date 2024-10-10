import 'package:flutter/material.dart';

class CustomeTextField extends StatefulWidget {
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String?) onSave;
  final TextInputType keyboardType;

  const CustomeTextField({
    super.key,
    required this.hint,
    required this.validator,
    required this.onSave,
    this.keyboardType = TextInputType.text,
  });

  @override
  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(10, 10, 186, 180),
            blurRadius: 10,
            offset: Offset(0, 4), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        validator: widget.validator,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintStyle: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
          hintText: widget.hint,
        ),
        onSaved: widget.onSave,
      ),
    );
  }
}
