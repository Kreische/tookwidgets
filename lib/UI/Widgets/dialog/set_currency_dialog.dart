import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/Constants/currencies.dart';

import '../TextWidget.dart';

class SetCurrencyDialog extends StatelessWidget {
  const SetCurrencyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        child: ListView.separated(
          itemCount: SuppotedCurrencies.list.length,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            final currencyData = SuppotedCurrencies.list[index];
            return CupertinoButton(
              onPressed: () => Navigator.pop(context, currencyData),
              child: TextWidget(currencyData.currency),
            );
          },
        ),
      ),
    );
  }
}
