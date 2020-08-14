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
    this.init = json['init'];
    this.end = json['end'];
  }

  Map<String, dynamic> toJson() {
    return {
      'init': this.init,
      'end': this.end,
    };
  }
}
