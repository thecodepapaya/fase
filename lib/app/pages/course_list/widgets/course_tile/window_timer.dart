part of '../../view.dart';

// class WindowTimer extends StatefulWidget {
//   final String timerText;

//   const WindowTimer({
//     Key? key,
//     required this.course,
//   }) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _WindowTimerState();
// }

// class _WindowTimerState extends State<WindowTimer> with TickerProviderStateMixin {
//   late final Course course;
//   String timerText = '--:--';
//   final timerDuration = const Duration(seconds: 1);
//   late final Duration attendanceDuration;
//   late final DateTime attendanceEndTime;

//   Timer? timer;

//   @override
//   void initState() {
//     super.initState();
//     course = widget.course;
//     final now = DateTime.now();
//     attendanceDuration = Duration(minutes: course.attendanceDurationInMinutes);
//     attendanceEndTime = course.startTimestamp!.add(attendanceDuration);

//     final hasNeverStarted = course.startTimestamp == null;
//     final hasEnded = course.startTimestamp?.add(attendanceDuration).isBefore(now) ?? true;
//     final isAttendanceWindowActive = !hasNeverStarted && !hasEnded;

//     if (isAttendanceWindowActive) {
//       timer = Timer.periodic(timerDuration, updateTimerText);
//     }
//   }

//   void updateTimerText(Timer timer) {
//     final now = DateTime.now();

//     final timeLeft = attendanceEndTime.difference(now);
//     final minutesLeft = timeLeft.inMinutes;
//     final secondsLeft = timeLeft.inSeconds % 60;

//     if (timeLeft.isNegative) {
//       timer.cancel();
//     }

//     final padLeftMinute = minutesLeft < 10 ? '0' : '';
//     final padLeftSeconds = secondsLeft < 10 ? '0' : '';

//     setState(() {
//       timerText = '$padLeftMinute$minutesLeft:$padLeftSeconds$secondsLeft';
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {},
//       child: Padding(
//         padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
//         child: Column(
//           children: [
//             const Icon(Icons.timer_outlined),
//             const SizedBox(height: 4),
//             Text(timerText),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     if (mounted) {
//       timer?.cancel();
//     }
//     super.dispose();
//   }
// }

class WindowTimer extends StatelessWidget {
  final String timerText;

  const WindowTimer({
    Key? key,
    required this.timerText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.only(top: 12, left: 16, right: 16),
        child: Column(
          children: [
            const Icon(Icons.timer_outlined),
            const SizedBox(height: 4),
            Text(timerText),
          ],
        ),
      ),
    );
  }
}
