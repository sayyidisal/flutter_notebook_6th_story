import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EmailApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/" : (context) =>  EmailListPage(),
      },
    );
  }
}

class EmailListPage extends StatefulWidget {
  @override
  _EmailListPageState createState() => _EmailListPageState();
}

class _EmailListPageState extends State<EmailListPage>with SingleTickerProviderStateMixin {

  AnimationController controller;
  Animation<double> _animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animation = Tween(begin: 0.0, end: 1.0).animate(controller)..addListener(() {
      setState(() {

      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            right: 24,
            bottom: 24,
            child: Container(
              height: 84,
              width: 84,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    spreadRadius: 3,
                    offset: Offset(0,2)
                  )
                ]
              ),
              child: Center(
                child: Text('CHAT', style: GoogleFonts.anton(
                  letterSpacing: 2,
                  fontSize: 20
                ),),
              ),
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            top: 32,
            child: Row(
              children: [
                Container(
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: 2,
                            offset: Offset(0,2)
                        )
                      ]
                  ),
                  child: Center(
                    child:
                    IconButton(
                      onPressed: (){
                        controller.forward();
                      },
                      icon: AnimatedIcon(progress:controller,
                        icon: AnimatedIcons.menu_home,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Inbox",style: GoogleFonts.anton(
                    fontSize: 24,
                    letterSpacing: 1
                  ),),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

























