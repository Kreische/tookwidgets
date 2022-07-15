import 'package:easy_localization/easy_localization.dart';
import 'package:tookwidgets/took_widgets.dart';

import '../plugin_consts/plugin_string_data.dart';

class WorkingDays {
  const WorkingDays({
    this.monday = false,
    this.tuesday = false,
    this.wednesday = false,
    this.thursday = false,
    this.friday = false,
    this.saturday = false,
    this.sunday = false,
  });

  factory WorkingDays.fromMap(map) {
    if (map == null) return const WorkingDays();
    return WorkingDays(
      monday: map['monday'] as bool,
      tuesday: map['tuesday'] as bool,
      wednesday: map['wednesday'] as bool,
      thursday: map['thursday'] as bool,
      friday: map['friday'] as bool,
      saturday: map['saturday'] as bool,
      sunday: map['sunday'] as bool,
    );
  }

  final bool monday;
  final bool tuesday;
  final bool wednesday;
  final bool thursday;
  final bool friday;
  final bool saturday;
  final bool sunday;

  WorkingDays copyWith({
    bool? monday,
    bool? tuesday,
    bool? wednesday,
    bool? thursday,
    bool? friday,
    bool? saturday,
    bool? sunday,
  }) {
    return WorkingDays(
      monday: monday ?? this.monday,
      tuesday: tuesday ?? this.tuesday,
      wednesday: wednesday ?? this.wednesday,
      thursday: thursday ?? this.thursday,
      friday: friday ?? this.friday,
      saturday: saturday ?? this.saturday,
      sunday: sunday ?? this.sunday,
    );
  }

  WorkingDays smartCopy(int day) {
    return copyWith(
      monday: day == 1 ? !monday : monday,
      tuesday: day == 2 ? !tuesday : tuesday,
      wednesday: day == 3 ? !wednesday : wednesday,
      thursday: day == 4 ? !thursday : thursday,
      friday: day == 5 ? !friday : friday,
      saturday: day == 6 ? !saturday : saturday,
      sunday: day == 7 ? !sunday : sunday,
    );
  }

  List<Tuple3<int, String, bool>> get values {
    return [
      Tuple3(1, PluginStringData.monday.tr()[0], monday),
      Tuple3(2, PluginStringData.tuesday.tr()[0], tuesday),
      Tuple3(3, PluginStringData.wednesday.tr()[0], wednesday),
      Tuple3(4, PluginStringData.thursday.tr()[0], thursday),
      Tuple3(5, PluginStringData.friday.tr()[0], friday),
      Tuple3(6, PluginStringData.saturday.tr()[0], saturday),
      Tuple3(7, PluginStringData.sunday.tr()[0], sunday),
    ];
  }

  Map<String, dynamic> get toMap => {
        'monday': monday,
        'tuesday': tuesday,
        'wednesday': wednesday,
        'thursday': thursday,
        'friday': friday,
        'saturday': saturday,
        'sunday': sunday,
      };
}
