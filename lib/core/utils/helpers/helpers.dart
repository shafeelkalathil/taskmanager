import 'package:flutter/material.dart';



class HelperFunctions{
  static void failureSnackBar({required BuildContext context,required String message}) {
    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
      SnackBar(
          backgroundColor: const Color(0xFFD32F2F),
          content: Text(message)),
    );
  }
  static void successSnackBar({required BuildContext context,required String message}) {
    ScaffoldMessenger.of(context)..hideCurrentSnackBar()..showSnackBar(
      SnackBar(
          backgroundColor: const Color(0xFF388E3C),
          content: Text(message)),
    );
  }

// static void navigateToScreen(BuildContext context, Widget screen) {
//   Navigator.push(
//     context,
//     MaterialPageRoute(builder: (_) => screen),
//   );
// }
//
// static void confirmationAlert({required BuildContext context,required String activity,required Function() onYes}){
//   showDialog(context: context, builder:(context) =>  AlertDialog(
//     title: Text(activity),
//     content: Text('Are you sure, do you want to $activity?'),
//     actions: [
//       TextButton(onPressed:() => Navigator.pop(context), child:const Text('NO')),
//       TextButton(onPressed:() {
//         Navigator.pop(context);
//         onYes();
//       }, child:const Text('YES'))
//     ],
//   ));
// }

}