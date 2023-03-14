import 'package:flutter/material.dart';
import 'package:live_streaming_app/utils/colors.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final Function(String) onTap;
  const CustomTextField({
    Key key,
    @required this.controller,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade800,
      child: TextField(
        style: TextStyle(
          color: Colors.yellow,
        ),
        onSubmitted: onTap,
        controller: controller,
        decoration: const InputDecoration(
            hintText: 'Share Your Thoughts Here ..',
            hintStyle: TextStyle(color: Colors.yellow),
            // helperText: 'Username',
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: buttonColor,
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: secondaryBackgroundColor,
              ),
            )),
      ),
    );
  }
}
