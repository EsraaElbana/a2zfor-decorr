//
// import 'package:clint_store/interduce_pages/choose_client_or_engineer.dart';
// import 'package:clint_store/utilities/routes_manager.dart';
// import 'package:flutter/material.dart';
// import '../login/login_Screen.dart';
//
// class ChooseLoginOrRegister extends StatelessWidget {
//   const ChooseLoginOrRegister({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor:Color(0xff070F2B),
//       body: Column(
//         children: [
//           Expanded(
//             child: Container(
//               //height: double.infinity,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                   color:Color(0xff070F2B),
//                   image: DecorationImage(
//                       image: AssetImage("assets/images/logo.png"),
//                       fit: BoxFit.scaleDown)),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.fromLTRB(8, 5, 2, 2),
//               width: double.infinity,
//               //height: double.infinity,
//               decoration:  BoxDecoration(
//                 border: Border.all(
//                   color: const Color(0xffc58a00),
//                   // border: 3px solid rgba(210, 171, 69, 1)// Change border color here
//                   width: 2, // Set border width
//                 ),
//
//                 color: Color(0xFFFFFFFF),
//                 borderRadius: const BorderRadius.only(
//                   topLeft: Radius.circular(50),
//                   topRight: Radius.circular(50),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         "Welcome to our community",
//                         style: TextStyle(
//                             color: Color(0xff070F2B),
//                             fontSize: 19,
//                             fontWeight: FontWeight.normal),
//                       ),
//                       SizedBox(
//                         height: 30,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(45, 30, 45, 5),
//                         child: MaterialButton(
//                           onPressed: () {
//
//                             RoutesManager.navigatorAndRemove(context, LoginScreen());
//                           },
//                           shape: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(35)),
//                           textColor: Colors.white,
//                           minWidth: double.infinity,
//                           height: 55,
//                           color: Color(0xff070F2B),
//                           elevation: 0.5,
//                           child: const Text(
//                             "Log in",
//                             style: TextStyle(
//                               fontWeight: FontWeight.normal,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.fromLTRB(45, 2.5, 45, 10),
//                         child: MaterialButton(
//                           onPressed: () {
//
//                         RoutesManager.navigatorPush(context, ChooseClientOrEngineer());
//
//
//                           },
//                           shape: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(50)),
//                           textColor:Color(0xff070F2B),
//                           minWidth: double.infinity,
//                           height: 55,
//                           elevation: 0.5,
//                           child: const Text("Sign UP",
//                               style: TextStyle(
//                                   fontSize: 20, fontWeight: FontWeight.normal)),
//                         ),
//                       ),
//                     ]),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
