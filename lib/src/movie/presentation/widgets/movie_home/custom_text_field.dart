import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: const TextStyle(
          color: Colors.grey,
        ),
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        enabledBorder: OutlineInputBorder( // Added enabledBorder
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 197, 197, 197),
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder( // Added focusedBorder
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 200, 200, 200),
          ),
          borderRadius: BorderRadius.circular(10),
        ),

      ),
    );
  }
}
