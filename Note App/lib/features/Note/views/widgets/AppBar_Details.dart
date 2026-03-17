import 'package:flutter/material.dart';
import 'package:flutter_app/features/Note/views/widgets/custom_Icon_Botton_Note.dart';
import 'package:flutter_app/features/auth/views/screens/Sign%20in_screen.dart';

class AppBar extends StatelessWidget {
  const AppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon_Button(icon: const Icon(Icons.list_rounded)),
          const Text(
            "My Folders",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Icon_Button(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            ),
            icon: Image.asset('assets/images/notifications.png'),
          ),
        ],
      ),
    );
  }
}
