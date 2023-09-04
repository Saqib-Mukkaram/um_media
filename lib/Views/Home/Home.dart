import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:um_media/CustomWidgets/ButtonCustom.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ButtonCustom(
                    buttonText: "+",
                    onPress: () {},
                    width: 20,
                    paddingLeft: 20,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingRight: 20,
                  ),
                  ButtonCustom(
                    buttonText: "+",
                    onPress: () {},
                    width: 20,
                    paddingLeft: 20,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingRight: 20,
                  ),
                  ButtonCustom(
                    buttonText: "+",
                    onPress: () {},
                    width: 20,
                    paddingLeft: 20,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingRight: 20,
                  ),
                  ButtonCustom(
                    buttonText: "+",
                    onPress: () {},
                    width: 20,
                    paddingLeft: 20,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingRight: 20,
                  ),
                  ButtonCustom(
                    buttonText: "+",
                    onPress: () {},
                    width: 20,
                    paddingLeft: 20,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingRight: 20,
                  ),
                  ButtonCustom(
                    buttonText: "+",
                    onPress: () {},
                    width: 20,
                    paddingLeft: 20,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingRight: 20,
                  ),
                  ButtonCustom(
                    buttonText: "+",
                    onPress: () {},
                    width: 20,
                    paddingLeft: 20,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingRight: 20,
                  ),
                  ButtonCustom(
                    buttonText: "+",
                    onPress: () {},
                    width: 20,
                    paddingLeft: 20,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingRight: 20,
                  ),
                  ButtonCustom(
                    buttonText: "+",
                    onPress: () {},
                    width: 20,
                    paddingLeft: 20,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingRight: 20,
                  ),
                  ButtonCustom(
                    buttonText: "+",
                    onPress: () {},
                    width: 20,
                    paddingLeft: 20,
                    paddingTop: 0,
                    paddingBottom: 0,
                    paddingRight: 20,
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
