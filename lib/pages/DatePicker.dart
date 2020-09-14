import 'package:flutter/material.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';

class DatePickerDemo extends StatefulWidget {
  @override
  _DatePickerDemoState createState() => _DatePickerDemoState();
}

class _DatePickerDemoState extends State<DatePickerDemo> {
  var now = DateTime.now();
  var time = TimeOfDay(hour: 10, minute: 30);

  var thirdNow = DateTime.now();
//  _showDatePicker() {
//    showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime(1980), lastDate: DateTime(2100)).then((value){
//      print(value);
//    });
//  }

  _showDatePicker() async {
    var result = await showDatePicker(context: context, initialDate: now, firstDate: DateTime(1980), lastDate: DateTime(2100));
    setState(() {
      if (result != null) {
        now = result;
      }
    });
  }

  _showTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: time);
    setState(() {
      if (result != null) {
        time = result;
      }
    });
  }

  _showThirdDatePicker() async {
//    var result = await showDatePicker(context: context, initialDate: now, firstDate: DateTime(1980), lastDate: DateTime(2100));
//    setState(() {
//      if (result != null) {
//        now = result;
//      }
//    });
    DatePicker.showDatePicker(
        context,
      pickerTheme: DateTimePickerTheme(
        showTitle: true,
        confirm: Text(
          "确定",
          style: TextStyle(
            color: Theme.of(context).accentColor
          ),
        ),
        cancel: Text(
          "取消",
          style: TextStyle(
            color: Colors.grey
          ),
        ),
      ),
      minDateTime: DateTime.parse("1980-05-12"),
      maxDateTime: DateTime.parse("2100-05-12"),
      initialDateTime: thirdNow,
//      dateFormat: "yyyy-MMMM-dd",
      dateFormat: "yyyy-MMMM-dd HH:mm",
      pickerMode: DateTimePickerMode.datetime,
      locale: DateTimePickerLocale.zh_cn,
      onCancel: () {
          debugPrint("onCancel");
      },
      onConfirm: (dateTime, List<int> index) {
          setState(() {
            thirdNow = dateTime;
          });
      }
    );
  }

  _showThirdTimePicker() async {
    var result = await showTimePicker(context: context, initialTime: time);
    setState(() {
      if (result != null) {
        time = result;
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
//    print(now);
//    print(now.millisecondsSinceEpoch);
//    print(DateTime.fromMillisecondsSinceEpoch(now.millisecondsSinceEpoch));
    print(formatDate(now, [yyyy, '-', mm, '-', dd]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "DatePicker",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(formatDate(now, [yyyy, '-', mm, '-', dd])),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: _showDatePicker,
              ),
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(time.format(context)),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: _showTimePicker,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              InkWell(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(formatDate(thirdNow, [yyyy, '-', mm, '-', dd, ' ', HH, ':', nn])),
                    Icon(Icons.arrow_drop_down)
                  ],
                ),
                onTap: _showThirdDatePicker,
              )
            ],
          )
        ],
      ),
    );
  }
}
