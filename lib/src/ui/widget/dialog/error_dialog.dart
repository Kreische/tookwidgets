// import 'package:flutter/material.dart';
// import 'package:tookwidgets/src/ui/widget/text_widget.dart';
// import 'package:tookwidgets/took_widgets.dart';

// class ErrorDialog extends StatelessWidget {
//   const ErrorDialog({
//     Key? key,
//     required this.error,
//   }) : super(key: key);

//   final String error;

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       backgroundColor: Colors.white,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextWidget(error),
//             AlertActionBTN(
//               width: 200,
//               text: 'Restart',
//               onPressed: () {},
//             ),
//             const TextWidget(
//               'If problem remains persistent, please contact support',
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
