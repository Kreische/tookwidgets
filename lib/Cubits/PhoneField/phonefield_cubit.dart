import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tookwidgets/Constants/CountriesPhoneData.dart';
import 'package:tookwidgets/Models/PhoneNumber.dart';

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
