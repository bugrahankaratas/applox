extension TimeDifference on DateTime {
  String get differenceFromNow {
    final now = DateTime.now();
    final difference = now.difference(this);

    final hours = difference.inHours.toString().padLeft(2, '0');
    final minutes = (difference.inMinutes % 60).toString().padLeft(2, '0');
    final seconds = (difference.inSeconds % 60).toString().padLeft(2, '0');

    return '$hours:$minutes:$seconds'; // 02:05:08 gibi
  }
}
