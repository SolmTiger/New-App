import 'package:flutter/material.dart';

class custom_icon_Button extends StatelessWidget {
  final Function()? onPressed;
  final Widget? icon;
  const custom_icon_Button({super.key, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: const Color.fromARGB(156, 0, 0, 0),

            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromARGB(249, 255, 255, 255),
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
          Spacer(flex: 1),
          CircleAvatar(
            radius: 22,
            backgroundColor: const Color.fromARGB(156, 0, 0, 0),
            child: IconButton(
              icon: const Icon(
                Icons.blur_circular,
                color: Colors.white,
                size: 20,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
