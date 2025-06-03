import 'package:flutter/material.dart';

import 'common_button.dart';


class CustomExitDialog extends StatelessWidget {
  const CustomExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 14.0, 10.0, 18.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // CustomImage(
            //   path: Assets.imagesLogo,
            //   height: size.height * .07,
            //   width: size.width * .7,
            // ),
            const SizedBox(height: 14.0),
            Text(
              'Exit App',
              // style: GoogleFonts.montserrat(
              //   fontSize: 18.0,
              //   fontWeight: FontWeight.w600,
              // ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Are you sure you want to exit the app?',
              // style: GoogleFonts.montserrat(
              //   fontSize: 18.0,
              //   fontWeight: FontWeight.w400,
              // ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 14.0),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    elevation: 0,
                    type: ButtonType.secondary,
                    onTap: () => Navigator.of(context).pop(false),
                    title: 'No',
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CustomButton(
                    elevation: 0,
                    type: ButtonType.primary,
                    onTap: () => Navigator.of(context).pop(true),
                    title: 'Yes',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
