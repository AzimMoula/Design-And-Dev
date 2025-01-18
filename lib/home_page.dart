import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          //optional profile photo
          leading: const Icon(
            Icons.circle,
            size: 35,
            color: Color.fromARGB(255, 57, 103, 255),
          ),
          backgroundColor: Colors.transparent,
        ),
        extendBodyBehindAppBar: true,
        backgroundColor: const Color.fromRGBO(240, 240, 240, 1),
        //background
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Stack(children: [
            Center(
              child: Container(
                height: MediaQuery.sizeOf(context).height / 1.45,
                width: MediaQuery.sizeOf(context).width / 2,
                decoration: const BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurStyle: BlurStyle.normal,
                        color: Color.fromARGB(255, 57, 103, 255),
                        blurRadius: 120,
                        spreadRadius: 35)
                  ],
                ),
              ),
            ),
            SizedBox.expand(
                child: Image.asset(fit: BoxFit.contain, 'assets/person.png'))
          ]),
        ),
      ),
    );
  }
}
