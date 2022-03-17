import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CircleAvatar(
                  radius: 50.0,
                  backgroundColor: Colors.red,
                  foregroundImage: AssetImage('images/cj_git.jpg'),
                ),
              const Text(
                  'CJ Garcia',
                style: TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'IndieFlower',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )
                ),
              Text(
                  'SOFTWARE ENGINEERING APPRENTICE',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'ReenieBeanie',
                    color: Colors.teal[100],
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2.0,
                  ),
              ),
              SizedBox(
                height: 20,
                width: 150,
                child: Divider(
                  color: Colors.teal.shade100,
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child:
                ListTile(
                  leading: const Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                  title: Text(
                    '123-456-7890',
                    style: TextStyle(
                      color: Colors.teal.shade900,
                      fontFamily: 'ReenieBeanie',
                      fontSize: 30,
                    ),
                  ),
                ),
              ),
              Card(
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child:
                  ListTile(
                    leading: const Icon(
                      Icons.email,
                      color: Colors.teal,
                    ),
                    title: Text(
                      'cj.lifeofmusic@gmail.com',
                      style: TextStyle(
                        color: Colors.teal.shade900,
                        fontFamily: 'ReenieBeanie',
                        fontSize: 30,
                      ),
                    ),
                  ),
              ),
            ],
          )
        ),
      ),
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         backgroundColor: Colors.teal,
//         body: SafeArea(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             // mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               Container(
//                 height: 100,
//                 color: Colors.white,
//                 child: const Center(child: Text('Container 1')),
//               ),
//               Expanded(
//                 child: Center(
//                   child: Container(
//                     color: Colors.teal,
//                     child: const Text('Container 2'),
//                   ),
//                 ),
//               ),
//               Container(
//                 height: 100,
//                 color: Colors.red,
//                 child: const Center(child: Text('Container 3')),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

