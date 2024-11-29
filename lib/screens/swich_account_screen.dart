import 'dart:ui';
import 'package:flutter/cupertino.dart';import 'package:flutter/material.dart';

class SwichAccountScreen extends StatelessWidget {
  const SwichAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1C1F2E),
      body: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('images/switch_account_background.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 220,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                      child: Container(
                        width: 340,
                        height: 352,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Color.fromRGBO(255, 255, 255, 0.5),
                              Color.fromRGBO(255, 255, 255, 0.2),
                            ],
                          ),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 32),
                            Image(
                              image: AssetImage('images/profile.png'),
                            ),
                            SizedBox(height: 20),
                            Text('AmirMoahmmad adibi',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium), ///////////
                            SizedBox(height: 20),
                            SizedBox(
                              width: 129,
                              height: 46,
                              child: ElevatedButton(
                                style: Theme.of(context)
                                    .elevatedButtonTheme
                                    .style, ////////////////
                                onPressed: () {},
                                child: Text('Confirm'),
                              ),
                            ),
                            SizedBox(height: 32),
                            Text(
                              'switch account',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium, ///////////////
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 132, bottom: 63),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account ?',
                  style: TextStyle(
                      color: Colors.grey, fontSize: 16, fontFamily: 'GB'),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'sign up',
                  style: TextStyle(
                      color: Colors.white, fontSize: 16, fontFamily: 'GB'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
