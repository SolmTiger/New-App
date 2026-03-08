import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/String.dart';
import 'package:flutter_app/features/Add_New_Notes_screen/views/New_Notes_Screen.dart';
import 'package:flutter_app/features/New_Folder_Screen/Views/New_Folders.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_quill/flutter_quill.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      // إضافة مفوضي الترجمة هنا
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        FlutterQuillLocalizations.delegate, // السطر السحري لحل مشكلة الـ Crash
      ],
      // تحديد اللغات المدعومة
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
      home: const New_Folder(),
    );
  }
}

final supabase = Supabase.instance.client;
