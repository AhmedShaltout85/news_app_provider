
import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';

class CustomDrawerHeader extends StatelessWidget {
  const CustomDrawerHeader({
    super.key,
    required this.heightSize,
  });

  final Size heightSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: heightSize.height * 0.2,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(0),
      ),
      child: Center(
        child: Text(
          textAlign: TextAlign.center,
          AppLocalizations.of(context)!.news_app,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}


