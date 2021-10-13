import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/Constants/Colors.dart';
import 'package:tookwidgets/Constants/CountriesPhoneData.dart';
import 'package:tookwidgets/Models/PhoneNumber.dart';
import 'package:tookwidgets/UI/Widgets/TextWidget.dart';
import 'package:tookwidgets/Utils/Validators.dart';

class PhoneField extends StatefulWidget {
  const PhoneField({
    Key? key,
    required this.initialCountry,
    required this.onChanged,
    this.hint = 'Phone Number',
  }) : super(key: key);

  final String? initialCountry;
  final Function(PhoneNumber number) onChanged;
  final String hint;

  @override
  _PhoneFieldState createState() => _PhoneFieldState();
}

class _PhoneFieldState extends State<PhoneField> {
  late TextEditingController _controller;
  final List<CountriesPhoneData> countriesData = [];

  late CountriesPhoneData _selectedCountry;

  @override
  void initState() {
    _controller = TextEditingController();
    _setCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: _selectCountry,
          child: Container(
            width: 75,
            height: 50,
            decoration: boxDecoration,
            alignment: Alignment.center,
            child: TextWidget(
              _selectedCountry.fullDialCode,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          width: 250,
          height: 50,
          decoration: boxDecoration,
          child: TextFormField(
            controller: _controller,
            keyboardType: TextInputType.phone,
            validator: ValidatorUtils.validateMobile,
            textAlignVertical: TextAlignVertical.center,
            style: const TextStyle(),
            cursorColor: MyColors.mainColor,
            onChanged: (v) {
              final phone = PhoneNumber(
                countryIsoCode: _selectedCountry.dialCode.toString(),
                countryCode: _selectedCountry.code,
                number: v,
              );
              widget.onChanged(phone);
            },
            decoration: InputDecoration(
              hintText: widget.hint,
              contentPadding: const EdgeInsets.symmetric(horizontal: 14),
              border: InputBorder.none,
              suffixIcon: Icon(
                CupertinoIcons.phone,
                color: MyColors.mainColor.withOpacity(0.8),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future _selectCountry() async {
    final item = await showDialog<CountriesPhoneData>(
      context: context,
      builder: (context) => const _SelectionDialog(),
    );
    if (item == null) return;
    _selectedCountry = item;
    setState(() {});
    widget.onChanged(
      PhoneNumber(
        countryIsoCode: _selectedCountry.dialCode.toString(),
        countryCode: _selectedCountry.code,
        number: _controller.text,
      ),
    );
  }

  void _setCountries() {
    for (final item in CountriesPhoneDataList.data) {
      countriesData.add(CountriesPhoneData.fromMap(item));
    }
    _selectedCountry = countriesData.firstWhere(
      (e) => e.code == (widget.initialCountry?.toUpperCase() ?? 'AU'),
    );
  }

  final boxDecoration = BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.4),
        spreadRadius: 1,
        blurRadius: 5,
      ),
    ],
    borderRadius: BorderRadius.circular(40),
  );
}

class _SelectionDialog extends StatefulWidget {
  const _SelectionDialog({Key? key}) : super(key: key);

  @override
  State<_SelectionDialog> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<_SelectionDialog> {
  final List<CountriesPhoneData> countriesData = [];
  List<CountriesPhoneData> _filteredList = [];

  @override
  void initState() {
    _setCountries();
    super.initState();
  }

  void _setCountries() {
    for (final item in CountriesPhoneDataList.data) {
      countriesData.add(CountriesPhoneData.fromMap(item));
    }
    _filteredList.addAll(countriesData);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                labelText: 'Search',
              ),
              onChanged: (value) {
                setState(() {
                  _filteredList = countriesData
                      .where(
                        (e) => e.countryName.toLowerCase().contains(
                              value.toLowerCase(),
                            ),
                      )
                      .toList();
                });
              },
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _filteredList.length,
                itemBuilder: (BuildContext context, int index) {
                  final item = _filteredList[index];
                  return ListTile(
                    onTap: () => Navigator.pop(context, item),
                    title: TextWidget(item.countryName),
                    leading: TextWidget(
                      item.flag,
                      fontSize: 30,
                    ),
                    trailing: TextWidget(
                      item.fullDialCode,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
