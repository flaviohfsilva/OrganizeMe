import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizeme/constants/colors.dart';

class InputField extends StatefulWidget {

  final String hint;
  final TextEditingController? controller;
  final bool read;
  final Color inputColor;
  final Widget? widget;

  const InputField({super.key, required this.hint, this.controller, this.widget, required this.read, required this.inputColor});

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 280,
            height: 42,
            padding: const EdgeInsets.only(left: 14, right: 4),
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: widget.inputColor,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: widget.widget==null ? false: (widget.read ? true : false),
                    autofocus: false,
                    controller: widget.controller,
                    style: GoogleFonts.sora(
                      color: black,
                      fontSize: 12
                    ),
                    decoration: InputDecoration(
                      //prefixIcon: widget.widget,
                      hintText: widget.hint,
                      hintStyle: GoogleFonts.sora(
                        color: black,
                        fontSize: 12
                      ),
                      border: InputBorder.none
                    ),
                  ),
                ),
                widget==null ? Container() : Container(child: widget.widget)
              ],
            ),
          )

        ],
      ),
    );
  }
}
