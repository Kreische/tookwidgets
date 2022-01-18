import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tookwidgets/src/models/phone_number.dart';
import 'package:tookwidgets/src/plugin_consts/countries_phone_data.dart';

part 'phonefield_state.dart';

class PhonefieldCubit extends Cubit<PhonefieldState> {
  PhonefieldCubit() : super(PhonefieldInitial()) {
    _loadJson();
  }

  final List<CountriesPhoneData> countriesData = [];

  Future _loadJson() async {
    CountriesPhoneDataList.data
        .map((e) => countriesData.add(CountriesPhoneData.fromMap(e)));
  }
}
