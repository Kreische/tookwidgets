import 'package:flutter/material.dart';
import 'package:tookwidgets/src/plugin_consts/plugin_string_data.dart';
import 'package:tookwidgets/took_widgets.dart';

class GetTextDialog extends StatefulWidget {
  const GetTextDialog({
    Key? key,
    this.textInputType,
    this.textCapitalization,
    this.initialText = '',
  }) : super(key: key);

  final TextInputType? textInputType;

  final TextCapitalization? textCapitalization;

  final String initialText;

  @override
  State<GetTextDialog> createState() => _GetTextDialogState();
}

class _GetTextDialogState extends State<GetTextDialog> {
  late TextEditingController _textController;

  @override
  void initState() {
    _textController = TextEditingController(text: widget.initialText);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 12),
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 20,
                  ),
                ],
              ),
              child: TextField(
                controller: _textController,
                maxLines: null,
                autofocus: true,
                keyboardType: widget.textInputType,
                textCapitalization:
                    widget.textCapitalization ?? TextCapitalization.sentences,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, null);
                  },
                  child: const TextWidget(PluginStringData.cancel),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(_textController.text);
                  },
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all(MyColors.mainColor),
                    backgroundColor:
                        MaterialStateProperty.all(MyColors.mainColor),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                  ),
                  child: const TextWidget(
                    PluginStringData.ok,
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    color: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
