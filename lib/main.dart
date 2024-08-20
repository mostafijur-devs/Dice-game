import 'package:dice_roller/start_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: StartPage(),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'dart:math';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Random Image Generator'),
//         ),
//         body: Center(
//           child: RandomImageWidget(),
//         ),
//       ),
//     );
//   }
// }
//
// class RandomImageWidget extends StatefulWidget {
//   @override
//   _RandomImageWidgetState createState() => _RandomImageWidgetState();
// }
//
// class _RandomImageWidgetState extends State<RandomImageWidget> {
//   final List<String> _imageUrls = [
//     'https://example.com/image1.jpg',
//     'https://example.com/image2.jpg',
//     'https://example.com/image3.jpg',
//     // Add more URLs or asset paths here
//   ];
//
//   String _randomImageUrl = '';
//
//   void _generateRandomImage() {
//     setState(() {
//       _randomImageUrl = _imageUrls[Random().nextInt(_imageUrls.length)];
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _generateRandomImage(); // Generate a random image when the widget is first built
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return
//       Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: <Widget>[
//         _randomImageUrl.isNotEmpty
//             ? Image.network(
//           _randomImageUrl,
//           width: 300,
//           height: 300,
//           fit: BoxFit.cover,
//         )
//             : Container(),
//         SizedBox(height: 20),
//         ElevatedButton(
//           onPressed: _generateRandomImage,
//           child: Text('Show Another Image'),
//         ),
//       ],
//     );
//   }
// }
