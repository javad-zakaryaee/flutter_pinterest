import 'package:flutter/material.dart';
import 'package:pinterest_flutter/screens/pin_details/components/body.dart';
import 'package:pinterest_flutter/models/pin.dart';

class PinDetails extends StatelessWidget {
  Pin pin;

  PinDetails({
    Key? key,
    required this.pin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(pin: pin),
    );
  }
}
