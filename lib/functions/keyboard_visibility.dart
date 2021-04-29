// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart' show Colors;
// import 'package:keyboard_visibility/keyboard_visibility.dart';

// class KeyboarActiondWalabi {
//   static void init(BuildContext context) {
//     KeyboardVisibilityNotification().addNewListener(
//       onChange: (bool visible) {
//         if (visible) {
//           _KeyboardActionController.showOverlay(context);
//         } else {
//           _KeyboardActionController.closeOverlay();
//         }
//       },
//     );
//   }
// }

// class _KeyboardActionController {
//   static OverlayEntry overlayEntry;

//   static void showOverlay(BuildContext context) {
//     if (overlayEntry != null) return;

//     final overlayState = Overlay.of(context);
//     overlayEntry = OverlayEntry(builder: (context) {
//       return Positioned(
//         bottom: MediaQuery.of(context).viewInsets.bottom,
//         right: 0,
//         left: 0,
//         child: SizedBox(
//           height: 40,
//           child: _KeyboardActionComponent(),
//         ),
//       );
//     });

//     overlayState.insert(overlayEntry);
//   }

//   static void closeOverlay() {
//     if (overlayEntry != null) {
//       overlayEntry.remove();
//       overlayEntry = null;
//     }
//   }
// }

// class _KeyboardActionComponent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       color: Colors.grey.withOpacity(0.4),
//       child: Align(
//         alignment: Alignment.topRight,
//         child: Padding(
//           padding: EdgeInsets.symmetric(vertical: 4),
//           child: CupertinoButton(
//             padding: EdgeInsets.only(right: 24.0, top: 8.0, bottom: 8.0),
//             onPressed: () {
//               FocusScope.of(context).requestFocus(FocusNode());
//             },
//             child: Text(
//               "Cerrar",
//               style: TextStyle(
//                 color: Colors.black,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
