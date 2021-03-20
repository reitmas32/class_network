class Hour {
  int hour;
  int minutes;
  int seconds;
  int day;

  Hour({this.day, this.hour, this.minutes, this.seconds});

  Hour.fromJson(Map<String, dynamic> json) {
    this.day = json['day'];
    this.hour = json['hour'];
    this.seconds = json['seconds'];
    this.minutes = json['minutes'];
  }

  Map<String, dynamic> toJson() {
    return {
      'day': this.day,
      'minutes': this.minutes,
      'seconds': this.seconds,
      'hour': this.hour,
    };
  }
}

class HourSchedule {
  Hour init;
  Hour end;

  HourSchedule({this.end, this.init});

  HourSchedule.fromJson(Map<String, dynamic> json) {
    this.init = Hour.fromJson(json['init']);
    this.end = Hour.fromJson(json['end']);
  }

  Map<String, dynamic> toJson() {
    return {
      'init': this.init,
      'end': this.end,
    };
  }
}

class Days_CN {
  static int monday = 0;
  static int tuesday = 1;
  static int wednesday = 2;
  static int thursday = 3;
  static int friday = 4;
  static int saturday = 5;
  static int sunday = 6;
//TODO: CAMBIAR LOS DIAS
  static String mondayString = 'Monday';
  static String tuesdayString = 'Tuesday';
  static String wednesdayString = 'Wednesday';
  static String thursdayString = 'Thursday';
  static String fridayString = 'Friday';
  static String saturdayString = 'Saturday';
  static String sundayString = 'Sunday';
}
