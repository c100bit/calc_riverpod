abstract class Utils {
  static intToTime(int val) {
    int sec = val % 60;
    int min = (val / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }
}
