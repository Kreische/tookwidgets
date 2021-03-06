import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tookwidgets/src/plugin_consts/currencies.dart';

import '../text_widget.dart';

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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(currencyData.currency),
                  TextWidget(currencyData.currencyCode),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
