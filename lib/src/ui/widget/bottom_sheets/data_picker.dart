import 'package:flutter/cupertino.dart';
import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:tookwidgets/src/plugin_consts/colors.dart';
import 'package:tookwidgets/src/plugin_consts/plugin_string_data.dart';
import '../text_widget.dart';

class DatePicker extends StatelessWidget {
  const DatePicker(
      {Key? key,
      this.mode = CupertinoDatePickerMode.dateAndTime,
      this.height = 220,
      this.initialDateTime,
      this.minimumDateTime,
      this.maximumDateTime,
      this.use24HourClock = true,
      this.backgroundColor = CupertinoColors.extraLightBackgroundGray})
      : super(key: key);

  final double? height;
  final CupertinoDatePickerMode? mode;
  final DateTime? initialDateTime;
  final DateTime? minimumDateTime;
  final DateTime? maximumDateTime;
  final bool? use24HourClock;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    DateTime? selectedDateTime;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 45,
          color: backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const TextWidget(
                  PluginStringData.cancel,
                  color: CupertinoColors.systemRed,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              CupertinoButton(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const TextWidget(
                  PluginStringData.confirm,
                  color: MyColors.mainColor,
                ),
                onPressed: () => Navigator.pop(context, selectedDateTime),
              ),
            ],
          ),
        ),
        const SizedBox(height: 2),
        SizedBox(
          height: height ?? 220,
          child: CupertinoDatePicker(
            mode: mode ?? CupertinoDatePickerMode.dateAndTime,
            minimumDate: minimumDateTime,
            maximumDate: maximumDateTime,
            initialDateTime: initialDateTime,
            use24hFormat: use24HourClock ?? false,
            backgroundColor: backgroundColor,
            onDateTimeChanged: (v) {
              selectedDateTime = v;
              Vibrate.feedback(FeedbackType.selection);
            },
          ),
        ),
      ],
    );
  }
}
