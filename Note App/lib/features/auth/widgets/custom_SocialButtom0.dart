import 'package:flutter/material.dart';

class Socialbuttom0 extends StatelessWidget {
  final ImageProvider image;
  final String text;
  const Socialbuttom0({super.key, required this.image, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[500]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(width: 24, height: 24, child: Image(image: image)),
          const SizedBox(width: 8),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
