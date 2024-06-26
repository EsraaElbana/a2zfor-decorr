// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// Future<void> sendMessage(String messageText) async {
//   final apiUrl = Uri.parse('https://your-api-url/messages');
//
//   try {
//     final response = await http.post(
//       apiUrl,
//       body: jsonEncode({'text': messageText}),
//       headers: {'Content-Type': 'application/json'},
//     );
//
//     if (response.statusCode == 200) {
//       print('Message sent successfully');
//     } else {
//       print('Failed to send message');
//     }
//   } catch (error) {
//     print('Error sending message: $error');
//   }
// }
