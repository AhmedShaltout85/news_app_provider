import 'package:flutter/material.dart';

class RefactorDrawerListTileItem extends StatelessWidget {
  final String imageName;
  final String titleName;
  const RefactorDrawerListTileItem({
    super.key, required this.imageName, required this.titleName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'assets/images/$imageName',
        width: 25,
        height: 25,
      ),
      title: Text(titleName),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
