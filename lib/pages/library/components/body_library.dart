import 'package:flutter/cupertino.dart';
import 'package:organizeme/pages/library/components/library_header.dart';
import 'package:organizeme/pages/library/components/library_menu.dart';

class BodyLibrary extends StatefulWidget {
  const BodyLibrary({super.key});

  @override
  State<BodyLibrary> createState() => _BodyLibraryState();
}

class _BodyLibraryState extends State<BodyLibrary> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            LibraryHeader(),
            Container(
              height: 510,
            )
          ],
        ),
        Positioned(
          top: 180,
          left: 0,
          right: 0,
          child: LibraryMenu(),
        ),
      ],
    );
  }
}
