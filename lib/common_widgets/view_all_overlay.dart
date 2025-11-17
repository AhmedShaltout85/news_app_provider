import 'package:flutter/material.dart';
import 'package:news_app/utils/app_routes.dart';

class ViewAllOverlay extends StatelessWidget {
  final bool isLeft;
  final String label;

  const ViewAllOverlay({
    super.key,
    required this.isLeft,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    final alignment = isLeft
        ? Positioned(
            bottom: 50,
            right: 50,
            child: _buildOverlay(context, isLeft),
          )
        : Positioned(
            bottom: 50,
            left: 50,
            child: _buildOverlay(context, isLeft),
          );

    return alignment;
  }

  Widget _buildOverlay(BuildContext context, bool isLeft) {
    final arrowIcon = isLeft
        ? Icons.arrow_back_ios
        : Icons.arrow_forward_ios;

    final children = isLeft
        ? [
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black,
              child: Icon(
                arrowIcon,
                color: Colors.white,
                size: 25,
              ),
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ]
        : [
            Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(width: 10),
            CircleAvatar(
              radius: 25,
              backgroundColor: Colors.black,
              child: Icon(
                arrowIcon,
                color: Colors.white,
                size: 25,
              ),
            ),
          ];

    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoutes.generalRouteName);
      },
      child: Container(
        padding: EdgeInsets.only(
          right: isLeft ? 10 : 0,
          left: isLeft ? 0 : 10,
        ),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}
