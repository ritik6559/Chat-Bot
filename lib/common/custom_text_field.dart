import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final VoidCallback onDone;
  const CustomTextField({
    super.key,
    required this.controller,
    required this.hint,
    required this.onDone,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      
      child: TextField(
        controller: controller,
        onSubmitted:(value) => onDone,
        autocorrect: true,
        style: const TextStyle(
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              60,
            ),
            borderSide: const BorderSide(
              width: 0,
            ),
          ),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          hintTextDirection: TextDirection.ltr,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 20,
          ),
          suffixIcon: IconButton(
            onPressed: onDone,
            icon: const Icon(
              Icons.send_outlined,
              color: Colors.white,
            ),
          ),
          filled: true,
          fillColor: Colors.purple.shade500,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              60,
            ),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
