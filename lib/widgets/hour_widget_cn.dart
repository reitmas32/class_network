import 'package:class_network/models/hour_model.dart';
import 'package:class_network/widgets/raised_button_cn.dart';
import 'package:date_format/date_format.dart';
//import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class HourWidget_CN extends StatefulWidget {
  String lable;
  HourSchedule hourSchedule;
  HourWidget_CN({
    this.lable,
    this.hourSchedule,
    Key key,
  }) : super(key: key);

  @override
  _HourWidget_CNState createState() => _HourWidget_CNState();
}

class _HourWidget_CNState extends State<HourWidget_CN> {
  bool active;
  TextEditingController _timeStartController = TextEditingController();
  String _hourStart;
  String _minuteStart;
  String _timeStart;

  TextEditingController _timeEndController = TextEditingController();
  String _hourEnd;
  String _minuteEnd;
  String _timeEnd;

  TimeOfDay _selectedTimeStart = TimeOfDay(hour: 7, minute: 00);
  TimeOfDay _selectedTimeEnd = TimeOfDay(hour: 7, minute: 00);
  @override
  void initState() {
    this.active = false;
    _timeStartController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    _timeEndController.text = formatDate(
        DateTime(2019, 08, 1, DateTime.now().hour, DateTime.now().minute),
        [hh, ':', nn, " ", am]).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          this.active = !this.active;
        });
      },
      child: Material(
        borderRadius: BorderRadius.circular(18.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      child: Text(
                        this.widget.lable,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: RaisedButton_CN(
                  color: this.active ? Colors.blueAccent : Colors.blue[100],
                  onPressed: this.active
                      ? () {
                          setState(() {
                            _selectTimeStart();
                          });
                        }
                      : () {},
                  label: _getStartLable(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(1.0),
                child: RaisedButton_CN(
                  color: this.active ? Colors.blueAccent : Colors.blue[100],
                  onPressed: this.active
                      ? () {
                          setState(() {
                            _selectTimeEnd();
                          });
                        }
                      : () {},
                  label: _getEndLable(),
                ),
              )
            ],
          ),
        ),
        color: this.active ? Colors.blue[200] : Colors.blue[50],
      ),
    );
  }

  String _getStartLable() {
    if (this._hourStart == null || this._minuteStart == null) {
      return 'Start';
    }
    return this._timeStart;
  }

  String _getEndLable() {
    if (this._hourEnd == null || this._minuteEnd == null) {
      return 'End';
    }
    return this._timeEnd;
  }

  Future<Null> _selectTimeStart() async {
    final TimeOfDay picked = await showTimePicker(
      context: this.context,
      initialTime: this._selectedTimeStart,
    );
    if (picked != null)
      setState(() {
        this._selectedTimeStart = picked;
        this._hourStart = this._selectedTimeStart.hour.toString();
        this._minuteStart = this._selectedTimeStart.minute.toString();
        this._timeStart = this._hourStart +
            ' : ' +
            (int.parse(this._minuteStart) < 10
                ? '0' + this._minuteStart
                : this._minuteStart);
        this._timeStartController.text = this._timeStart;
        this._timeStartController.text = formatDate(
            DateTime(2019, 08, 1, this._selectedTimeStart.hour,
                this._selectedTimeStart.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    this.widget.hourSchedule.init.hour = int.parse(this._hourStart);
    this.widget.hourSchedule.init.minutes = int.parse(this._minuteStart);
  }

  Future<Null> _selectTimeEnd() async {
    final TimeOfDay picked = await showTimePicker(
      context: this.context,
      initialTime: this._selectedTimeEnd,
    );
    if (picked != null)
      setState(() {
        this._selectedTimeEnd = picked;
        this._hourEnd = this._selectedTimeEnd.hour.toString();
        this._minuteEnd = this._selectedTimeEnd.minute.toString();
        this._timeEnd = this._hourEnd +
            ' : ' +
            (int.parse(this._minuteEnd) < 10
                ? '0' + this._minuteEnd
                : this._minuteEnd);
        this._timeEndController.text = this._timeEnd;
        this._timeEndController.text = formatDate(
            DateTime(2019, 08, 1, this._selectedTimeEnd.hour,
                this._selectedTimeEnd.minute),
            [hh, ':', nn, " ", am]).toString();
      });
    this.widget.hourSchedule.end.hour = int.parse(this._hourEnd);
    this.widget.hourSchedule.end.minutes = int.parse(this._minuteEnd);
  }
}
