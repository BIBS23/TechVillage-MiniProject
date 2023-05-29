import 'package:flutter/material.dart';

class FeebackTxtField extends StatelessWidget {
  final String hint;

  final TextEditingController controller;
    const FeebackTxtField({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 244,
      decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.8),
          borderRadius: BorderRadius.circular(15)),
      child: TextField(
        controller: controller,
        maxLines: 10,
        decoration:  InputDecoration(
          border: InputBorder.none,
          hintText: hint,
          contentPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
