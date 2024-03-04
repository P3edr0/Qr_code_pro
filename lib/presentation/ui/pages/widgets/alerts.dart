import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_pro/presentation/utils/constants.dart';

enum AlertType { information, error, sucess }

class Alerts {
  BuildContext context;
  String message;
  String title;
  AlertType type;
  Alerts({
    Key? key,
    required this.context,
    required this.message,
    required this.title,
    required this.type,
  });

  Future dialog() async {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(10),
        backgroundColor: Colors.transparent,
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        content: Stack(clipBehavior: Clip.none, children: [
          Positioned(
              bottom: -5,
              right: -5,
              child: Container(
                decoration: BoxDecoration(
                    color: type == AlertType.error
                        ? ProjectColors.darkRed
                        : type == AlertType.information
                            ? ProjectColors.darkblue
                            : ProjectColors.darkGreen,
                    borderRadius: BorderRadius.circular(15)),
                height: 60,
                width: 300,
              )),
          Container(
            decoration: BoxDecoration(
                color: type == AlertType.error
                    ? ProjectColors.lightRed
                    : type == AlertType.information
                        ? ProjectColors.lightblue
                        : ProjectColors.lightGreen,
                borderRadius: BorderRadius.circular(15)),
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                const SizedBox(width: 60),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: ProjectColors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      message,
                      style: const TextStyle(
                          color: ProjectColors.white, fontSize: 14),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              bottom: 32,
              left: 15,
              child: Icon(
                Icons.circle_rounded,
                size: 40,
                color: type == AlertType.error
                    ? ProjectColors.darkRed
                    : type == AlertType.information
                        ? ProjectColors.darkblue
                        : ProjectColors.darkGreen,
              )),
          Positioned(
              bottom: 42,
              left: 24,
              child: Icon(
                type == AlertType.error
                    ? Icons.close
                    : type == AlertType.information
                        ? FontAwesomeIcons.exclamation
                        : Icons.check,
                size: 22,
                color: ProjectColors.white,
              )),
        ]),
      ),
    );
  }
}
