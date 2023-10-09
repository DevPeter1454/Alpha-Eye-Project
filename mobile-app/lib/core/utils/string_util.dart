class StringUtil {
  static String toKmb(int num) {
    if (num > 999 && num < 99999) {
      return "${(num / 1000).toStringAsFixed(1)}K";
    } else if (num > 99999 && num < 999999) {
      return "${(num / 1000).toStringAsFixed(0)}K";
    } else if (num > 999999 && num < 999999999) {
      return "${(num / 1000000).toStringAsFixed(1)}M";
    } else if (num > 999999999) {
      return "${(num / 1000000000).toStringAsFixed(1)}B";
    } else {
      return num.toString();
    }
  }

  static String monStr(int mon) {
    if (mon == 1) {
      return 'Jan';
    } else if (mon == 2) {
      return 'Feb';
    } else if (mon == 3) {
      return 'Mar';
    } else if (mon == 4) {
      return 'Apr';
    } else if (mon == 5) {
      return 'May';
    } else if (mon == 6) {
      return 'Jun';
    } else if (mon == 7) {
      return 'Jul';
    } else if (mon == 8) {
      return 'Aug';
    } else if (mon == 9) {
      return 'Sept';
    } else if (mon == 10) {
      return 'Oct';
    } else if (mon == 11) {
      return 'Nov';
    } else if (mon == 12) {
      return 'Dec';
    } else {
      return '-';
    }
  }

  String convertDateTime(String date, time) {
    return '';
  }
}
