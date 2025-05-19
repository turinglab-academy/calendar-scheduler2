import 'package:drift/drift.dart';

class Schedules extends Table {
  // 1. PRIMARY KEY, 정수 열
  IntColumn get id => integer().autoIncrement()();
  // 2. 내용, 글자 열
  TextColumn get content => text()();
  // 3. 일정 날짜, 날짜 열
  DateTimeColumn get date => dateTime()();
  // 시작 시간
  IntColumn get startTime => integer()();
  // 종료 시간
  IntColumn get endTime => integer()();
}
