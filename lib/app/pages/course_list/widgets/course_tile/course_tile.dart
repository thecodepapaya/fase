part of '../../view.dart';

class CourseTile extends StatefulWidget {
  final Course course;
  final VoidCallback? onPressed;

  const CourseTile({
    Key? key,
    required this.course,
    this.onPressed,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CourseTileState();
}

class _CourseTileState extends State<CourseTile> with TickerProviderStateMixin {
  late final Course course;
  String timerText = '--:--';
  final timerDuration = const Duration(seconds: 1);
  late final Duration attendanceDuration;
  late final DateTime attendanceEndTime;
  late final DateTime? attendanceStartTime;

  bool hasStarted = false;
  bool hasEnded = true;
  bool isAttendanceWindowActive = false;

  Timer? timer;

  @override
  void initState() {
    super.initState();

    initialize();
  }

  void initialize() {
    course = widget.course;
    final now = DateTime.now();
    attendanceDuration = Duration(minutes: course.attendanceDurationInMinutes);
    attendanceEndTime = course.startTimestamp?.add(attendanceDuration) ?? now.subtract(timerDuration);
    attendanceStartTime = course.startTimestamp;

    hasStarted = course.startTimestamp == null ? false : now.isAfter(course.startTimestamp!);
    hasEnded = attendanceEndTime.isBefore(now);
    isAttendanceWindowActive = hasStarted && !hasEnded;

    if (isAttendanceWindowActive) {
      timer = Timer.periodic(timerDuration, updateTimerText);
    }
  }

  void updateTimerText(Timer timer) {
    final now = DateTime.now();

    final timeLeft = attendanceEndTime.difference(now);

    if (timeLeft.isNegative) {
      timer.cancel();
    }

    final minutesLeft = timeLeft.inMinutes;
    final secondsLeft = timeLeft.inSeconds % 60;

    final padLeftMinute = minutesLeft < 10 ? '0' : '';
    final padLeftSeconds = secondsLeft < 10 ? '0' : '';

    setState(() {
      timerText = '$padLeftMinute$minutesLeft:$padLeftSeconds$secondsLeft';
    });
  }

  @override
  Widget build(BuildContext context) {
    final isEnabled = _isEnabled;

    return Opacity(
      opacity: isEnabled ? 1 : 0.5,
      child: Card(
        elevation: 2,
        child: InkWell(
          onTap: isEnabled ? widget.onPressed : null,
          child: Column(
            children: [
              Row(
                children: [
                  CourseDetails(course: course),
                  WindowTimer(timerText: timerText),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DownloadButton(course: course),
                  ActionButton(course: course, isEnabled: isEnabled),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool get _isEnabled {
    late final bool isEnabled;

    final now = DateTime.now();
    hasEnded = attendanceEndTime.isBefore(now);
    isAttendanceWindowActive = hasStarted && !hasEnded;

    final isFaculty = Globals.profile.isFaculty;

    if (isFaculty) {
      isEnabled = !isAttendanceWindowActive;
    } else {
      isEnabled = !course.isAlreadyMarked && isAttendanceWindowActive;
    }

    return isEnabled;
  }

  @override
  void dispose() {
    if (mounted) {
      timer?.cancel();
    }
    super.dispose();
  }
}
