import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode naghban1 = FocusNode();
  FocusNode naghban2 = FocusNode();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    naghban1.addListener(() {
      setState(() {});
    });
    naghban2.addListener(() {
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xff323A99),
            Color(0xffF98BFC),
          ],
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [_getImageColumn(), _getContainerColumn()],
        ),
      ),
    );
  }

  Widget _getImageColumn() {
    return Positioned(
      top: 40,
      right: 0,
      bottom: 0,
      left: 0,
      child: Column(
        children: [
          Expanded(
            child: Image(
              image: AssetImage('images/rocket.png'),
            ),
          ),
          Expanded(
            child: Container(
              width: 428,
              height: 461,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getContainerColumn() {
    return Column(
      children: [
        Expanded(
          child: Container(),
        ),
        Expanded(
          child: Container(
            width: 428,
            height: 461,
            decoration: BoxDecoration(
              color: Color(0xff1C1F2E),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sign in to ',
                      style: TextStyle(
                          color: Colors.white, fontFamily: 'GB', fontSize: 20),
                    ),
                    Image(
                      width: 102,
                      height: 25,
                      image: AssetImage('images/moodinger_logo.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                SizedBox(
                  width: 340,
                  height: 46,
                  child: TextField(
                    focusNode: naghban1,
                    decoration: InputDecoration(
                      label: Text('Email'),
                      labelStyle: TextStyle(
                        color: naghban1.hasFocus
                            ? Color(0xffF35383)
                            : Colors.white,
                        fontSize: 14,
                        fontFamily: 'GM',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3.0,
                          color: Color(0xffC5C5C5),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffF35383),
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 340,
                  height: 46,
                  child: TextField(
                    focusNode: naghban2,
                    decoration: InputDecoration(
                      label: Text('Password'),
                      labelStyle: TextStyle(
                          color: naghban2.hasFocus
                              ? Color(0xffF35383)
                              : Colors.white,
                          fontSize: 14,
                          fontFamily: 'GM'),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 3.0,
                          color: Color(0xffC5C5C5),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(15),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xffF35383),
                          width: 3.0,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      contentPadding: EdgeInsets.all(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 129,
                  height: 46,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {},
                    child: Text('Sign in'),
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                          color: Colors.grey, fontSize: 14, fontFamily: 'GB'),
                    ),
                    Text(
                      'Sign up',
                      style: TextStyle(
                          color: Colors.white, fontSize: 14, fontFamily: 'GB'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    naghban1.dispose();
    naghban2.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
