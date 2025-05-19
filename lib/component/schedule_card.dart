// schedule_card.dart

import 'package:calendar_scheduler/const/colors.dart';
import 'package:flutter/material.dart';

class ScheduleCard extends StatelessWidget {
  final int startTime;
  final int endTime;
  final String content;

  const ScheduleCard({
    required this.startTime,
    required this.endTime,
    required this.content,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(width: 1.0, color: PRIMARY_COLOR),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: IntrinsicHeight(
          // A. 높이를 내부 위젯들의 최대 높이로 설정
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Time(
                // B. 시작과 종료 시간을 보여줄 위젯
                startTime: startTime,
                endTime: endTime,
              ),
              const SizedBox(width: 16.0),
              _Content(
                // C. 일정 내용을 보여줄 위젯
                content: content,
              ),
              const SizedBox(width: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _Time extends StatelessWidget {
  final int startTime; // 1. 시작 시간
  final int endTime; // 2. 종료 시간

  const _Time({required this.startTime, required this.endTime, super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = const TextStyle(
      fontWeight: FontWeight.w600,
      color: PRIMARY_COLOR,
      fontSize: 16.0,
    );

    return Column(
      // 3. 시간을 위에서 아래로 배치
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${startTime.toString().padLeft(2, '0')}:00', // 숫자가 두 자리수가 안 되면 0으로 채워주기
          style: textStyle,
        ),
        Text(
          '${endTime.toString().padLeft(2, '0')}:00', // 숫자가 두 자리수가 안 되면 0으로 채워주기
          style: textStyle.copyWith(fontSize: 10.0),
        ),
      ],
    );
  }
}

class _Content extends StatelessWidget {
  final String content; // 4. 내용

  const _Content({required this.content, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // 5. 최대한 넓게 늘리기
      child: Text(content),
    );
  }
}
