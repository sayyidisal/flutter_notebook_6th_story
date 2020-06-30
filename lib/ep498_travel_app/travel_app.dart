import 'package:flutter/material.dart';

class TravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TravelHomePage(),
    );
  }
}

class TravelHomePage extends StatefulWidget {
  @override
  _TravelHomePageState createState() => _TravelHomePageState();
}

class _TravelHomePageState extends State<TravelHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            top:24,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(24),
                image: DecorationImage(
                  image: NetworkImage("https://cdn.pixabay.com/photo/2015/03/26/09/41/mountain-690104_960_720.jpg"),
                  fit: BoxFit.fitHeight
                )
              ),
            ),
          ),
          Positioned(
            bottom: 24,
            left: 0,
            right: 0,
            child: Container(
              height: 210,
              child: Placeholder(),
            ),
          ),
          Center(
            child: Text("TRIP LOVER",),
          )

        ],
      ),
    );
  }
}




















