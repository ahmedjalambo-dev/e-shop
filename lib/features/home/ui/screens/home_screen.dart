import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text('Home Screen')),
    );
  }
}


//  SafeArea(
//         child: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//             child: Column(
//               children: [HomeAppBar(), verticalSapce(28), MySearchBar(), ],
//             ),
//           ),
//         ),
//       ),