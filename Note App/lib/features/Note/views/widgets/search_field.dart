import 'package:flutter/material.dart';

class Search_Field extends StatelessWidget {
  const Search_Field({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search...",
              hintStyle: TextStyle(color: Colors.grey[400], fontSize: 18),
              prefixIcon: Icon(Icons.search, color: Colors.grey[600]),
              suffixIcon: Icon(
                Icons.mic_none_rounded,
                size: 30,
                color: Colors.grey[600],
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
