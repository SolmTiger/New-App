import 'package:flutter/material.dart';
import 'package:flutter_app/core/Components/String.dart';
import 'package:flutter_app/features/auth/view/screens/Sign%20in_screen.dart';
import 'package:flutter_app/features/auth/view/screens/register_screen.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterScreen(),
    );
  }
}

final supabase = Supabase.instance.client;
