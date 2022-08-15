import 'package:flutter/material.dart';
import 'package:movies/src/app/utils/components_app_theme.dart';
import 'package:movies/src/app/widgets/information_container.dart';


class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      appBar: AppBar(
        title:  Text(
          "Details",
          style: TextStyle(color: whiteColor),
        ),
        backgroundColor: blackColor,
        elevation: 0,
        centerTitle: false,
      ),
      body: const InformationContainer(
        icon: Icons.handyman_rounded,
        message: "Work in progress",
      ),
    );
  }
}
