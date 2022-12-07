import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 237, 237, 237),
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [CyanBox(), HeadPersonIcon(), this.child],
      ),
    );
  }
}

class HeadPersonIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        margin: EdgeInsets.only(top: 30),
        child: Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 150,
        ),
      ),
    );
  }
}

class CyanBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * .4,
      decoration: _cyanBackground(),
      child: Stack(children: [
        Positioned(child: Bubble(), top: 50, left: 300),
        Positioned(child: Bubble(), top: 240, left: -30),
        Positioned(child: Bubble(), bottom: -50, left: 300),
      ]),
    );
  }

  BoxDecoration _cyanBackground() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromARGB(255, 191, 230, 249),
        Color.fromARGB(255, 14, 157, 240)
      ]));
}

class Bubble extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 1)),
    );
  }
}
