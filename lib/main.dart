// main.dart
import 'package:calendar_scheduler/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:calendar_scheduler/database/drift_database.dart';
import 'package:get_it/get_it.dart';

void main() async {
  // 플러터 프레임워크가 준비될 때까지 대기
  WidgetsFlutterBinding.ensureInitialized();
    // 1. 데이터베이스 생성
  final database = LocalDatabase();
  // 2. GetIt에 데이터베이스 객체 주입
  GetIt.I.registerSingleton<LocalDatabase>(database);


  await initializeDateFormatting(); // intl 패키지 초기화 (다국어화)
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false, // 🔥 Debug 리본 제거
      home: HomeScreen(),
    ),
  );
}
