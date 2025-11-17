import 'package:flutter/material.dart';

class DrawerListGap extends StatelessWidget {
  const DrawerListGap({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: Colors.grey,
      thickness: 2,
      endIndent: 20,
      indent: 20,
    );
  }
}