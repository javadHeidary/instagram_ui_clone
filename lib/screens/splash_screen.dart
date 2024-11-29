import 'package:flutter/material.dart';
import 'package:instagram_ui_one/screens/main_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNavigator(context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/pattern1.png'),
            repeat: ImageRepeat.repeat),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter, ///////////////////////////////////
          children: [
            Padding(
              padding: EdgeInsetsDirectional.symmetric(
                  horizontal: 70), //////////////////////////
              child: Center(
                child: Image(
                  image: AssetImage('images/logo_splash.png'),
                ),
              ),
            ),
            Positioned(
              ///////////////////////////////////////////
              bottom: 10,
              child: Column(
                children: [
                  Text(
                    'from',
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  Text(
                    'ExpertFlutter',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

getNavigator(context) {
  var Time = Duration(seconds: 5);
  Future.delayed(
    Time,
    () {
      return Navigator.of(context).push(
        MaterialPageRoute(builder: (BuildContext context) {
          return MainScreen();
        }),
      );
    },
  );
}
