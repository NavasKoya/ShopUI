import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FlatButtonWidget extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final double verticalPadding;
  final double horizontalPadding;
  final Color textColor;

  const FlatButtonWidget({
    Key? key,
    required this.text,
    required this.buttonColor,
    required this.verticalPadding,
    required this.horizontalPadding,
    required this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: buttonColor,
      padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: verticalPadding),
      child: Text(
        text,
        style: GoogleFonts.ubuntu(
          color: textColor
        ),
      ),
    );
  }
}
