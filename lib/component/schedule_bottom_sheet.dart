// schedule_bottom_sheet.dart
import 'package:flutter/material.dart';
import 'package:calendar_scheduler/component/custom_text_field.dart';
import 'package:calendar_scheduler/const/colors.dart';

class ScheduleBottomSheet extends StatefulWidget {
  const ScheduleBottomSheet({super.key});

  @override
  State<ScheduleBottomSheet> createState() => _ScheduleBottomSheetState();
}

class _ScheduleBottomSheetState extends State<ScheduleBottomSheet> {
  @override
  Widget build(BuildContext context) {
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return SafeArea(
      child: Container(
        height:
            MediaQuery.of(context).size.height / 2 +
            bottomInset, // 1. 화면 반 높이에 키보드 높이 추가하기
        color: Colors.white,
        child: Padding(
          // 패딩에 키보드 높이 추가해서 위젯 전반적으로 위로 올려주기
          padding: EdgeInsets.only(
            left: 8,
            right: 8,
            top: 8,
            bottom: bottomInset,
          ),
          child: Column(
            // B. 시간 관련 텍스트 필드와 내용관련 텍스트 필드 세로로 배치
            children: [
              const Row(
                // A. 시작 시간 종료 시간 가로로 배치
                children: [
                  Expanded(
                    child: CustomTextField(
                      // 시작시간 입력 필드
                      label: '시작 시간',
                      isTime: true,
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: CustomTextField(
                      // 종료시간 입력 필드
                      label: '종료 시간',
                      isTime: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              const Expanded(
                child: CustomTextField(
                  // 내용 입력 필드
                  label: '내용',
                  isTime: false,
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  // [저장] 버튼
                  onPressed: onSavePressed,
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white70,
                    backgroundColor: PRIMARY_COLOR,
                  ),
                  child: const Text(
                    '저장',
                    style: TextStyle(fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSavePressed() {}
}
