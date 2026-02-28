import 'package:flutter/material.dart';
import 'package:flutter_app/features/Note/widget/custom_Icon_Botton_Note.dart';

class Home_Screen extends StatelessWidget {
  const Home_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: [
                Icon_Button(icon: Icon(Icons.list_rounded)),
                Text(
                  "My Folders",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: 50,
                  child: IconButton(
                    onPressed: () {},
                    icon: Image.asset('assets/images/notification (1).png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
