import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../utils/constraints/colors.dart';

class AboutKcoins extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: VoidColors.black.withOpacity(0.8),
      body: Stack(
        children: [
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Lottie.asset(
                'assets/animation/kcoin.json',
                fit: BoxFit.cover,
                repeat: true,

              ),
            ),
          ),
          Column(
            children: [
              CupertinoNavigationBar(
                backgroundColor: Colors.transparent,
                border: null,
                leading: CupertinoNavigationBarBackButton(
                  color: VoidColors.white,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                middle: Text(
                  'About Kcoins',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: VoidColors.white,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40).copyWith(bottom: 57),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 80),
                      Text(
                        'Kcoins are the currency of the app. You can earn Kcoins by completing tasks and challenges. You can use Kcoins to buy packages and unlock features in the app.',
                        style: TextStyle(
                          fontSize: 14,
                          color: VoidColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
