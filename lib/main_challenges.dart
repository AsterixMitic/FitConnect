import 'dart:math';

import 'package:fit/ChallangeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MainChallengesPage extends StatefulWidget {
  const MainChallengesPage({super.key});

  @override
  State<MainChallengesPage> createState() => _MainChallengesPageState();
}

class _MainChallengesPageState extends State<MainChallengesPage> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       body: Stack(
  children: [

    Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
       scrollDirection: Axis.vertical,
       itemCount:100,
       itemBuilder: (BuildContext context, int index) {
         return GestureDetector(
           onTap: () => _onStepTapped(index,context), // your function to handle step taps
           child: Container(
             padding: EdgeInsets.only(left: index%2==0?70:0, right: index%2==1?70:0,),
             
             child: Column(
               children: [
                 Container(
                   
                   child: Container(
                     width: 50,
                     height: 50,
                     
                     
                     decoration: BoxDecoration(
                       shape: BoxShape.circle,
                       color: Color(0xCC6BFE9F), // your function to determine step color
                     ),
                     child: Icon(
                       Icons.check,
                       color: Colors.white,
                     ),
                   ),
                 ),
                 SizedBox(height: 8.0),
                 Text(
                   "Text",
                   style: TextStyle(fontSize: 12.0),
                 ),
               ],
             ),
           ),
         );
       },
      ),
    ),
    
  ],
)
    );
  }
}

_onStepTapped(int index,var context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const ChallangeView()),
  );
}

