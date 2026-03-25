import 'package:flutter/material.dart';
import 'package:flutter_app/core/config/String.dart';
import 'package:flutter_app/features/Add_New_Folder/View_Models/cubit/new_folder_cubit.dart';
import 'package:flutter_app/features/on_boarding/view/OnboardingMain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return BlocProvider(
      create: (context) => NewFolderCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // إضافة مفوضي الترجمة هنا
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          FlutterQuillLocalizations
              .delegate, // السطر السحري لحل مشكلة الـ Crash
        ],
        // تحديد اللغات المدعومة
        supportedLocales: const [Locale('en', 'US'), Locale('ar', 'EG')],
        home: OnboardingMain(),
      ),
    );
  }
}

final supabase = Supabase.instance.client;
