import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qr_code_pro/utils/constants.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      required this.actionFunction,
      required this.buttonText,
      required this.iconbutton})
      : super(key: key);
  final Function() actionFunction;
  final String buttonText;
  final IconData iconbutton;
  @override
  Widget build(
    BuildContext context,
  ) {
    return InkWell(
        onTap: () async {
          actionFunction();
        },
        child: Container(
          decoration: BoxDecoration(
              color: ProjectColors.lightblue,
              border: Border.all(width: 1),
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              )),
          padding: const EdgeInsets.only(left: 20),
          height: 40,
          width: MediaQuery.of(context).size.width * 0.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Icon(
                FontAwesomeIcons.plusCircle,
                color: Colors.white,
              ),
              const SizedBox(width: 20),
              Text(
                buttonText,
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
