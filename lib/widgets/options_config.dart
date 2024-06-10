import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:organizeme/constants/colors.dart';

class OptionsConfig extends StatefulWidget {

  final String hint;
  final Widget widget;
  final Widget icon;


  const OptionsConfig({super.key, required this.hint, required this.icon, required this.widget});

  @override
  State<OptionsConfig> createState() => _OptionsConfigState();
}

class _OptionsConfigState extends State<OptionsConfig> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 380,
            height: 42,
            margin: EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    readOnly: true,
                    autofocus: false,
                    style: GoogleFonts.sora(
                        color: black,
                        fontSize: 12
                    ),
                    decoration: InputDecoration(
                      prefixIcon: widget.icon,
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
