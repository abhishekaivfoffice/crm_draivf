import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CustomConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final String cancelText;
  final String svgAsset; // Pass SVG path
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomConfirmDialog({
    Key? key,
    required this.title,
    required this.message,
    required this.confirmText,
    required this.cancelText,
    required this.svgAsset,
    required this.onConfirm,
    required this.onCancel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            /// Close button (top-right)
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: onCancel,
                child: const Icon(Icons.close, color: Colors.grey),
              ),
            ),

            /// SVG Icon
            SvgPicture.asset(svgAsset, height: 80, width: 80),
            const SizedBox(height: 16),

            /// Title
            Text(
              title,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),

            /// Message
            Text(
              message,
              style: const TextStyle(fontSize: 15, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(
                  child: CustomGradientButton(
                    height: 40,
                    gradientColors: [
                      Color(0xFF6A85B6), // soft blue
                      Color(0xFFBAC8E0), // light grayish blue
                    ],
                    text: cancelText,
                        textStyle: TextStyle(
                      fontFamily: AppFonts.poppins,
                      color: AppColor.whiteColor,
                    ),
                    onPressed: onConfirm,
                  ),
                ),
                const SizedBox(width: 12), // space between buttons

                Expanded(
                  child: CustomGradientButton(
                    height: 40,
                    text: confirmText,
                    textStyle: TextStyle(
                      fontFamily: AppFonts.poppins,
                      color: AppColor.whiteColor,
                    ),
                    gradientColors: [
                      Color(0xFFEB3349), // bright red
                      Color(0xFFF45C43), // orange-red
                    ],
                    onPressed: onCancel,
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
