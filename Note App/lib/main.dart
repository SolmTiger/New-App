import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/String.dart';
import 'package:flutter_app/features/Add_New_Notes_screen/views/New_Notes_Screen.dart';
import 'package:flutter_app/features/Details_folder_screen/view/Folder_Screen.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  await Supabase.initialize(
    url: SupabaseStrings.supabaseUrl,
    anonKey: SupabaseStrings.supabaseKey,
  );
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: New_Notes());
  }
}

final supabase = Supabase.instance.client;
