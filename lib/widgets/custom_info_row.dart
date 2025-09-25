
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InfoRow extends StatelessWidget {
  final String iconPath;
  final String label;
  final String value;

  const InfoRow({
    Key? key,
    required this.iconPath,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Left side (icon + label)
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                iconPath,
                width: 22.0,
                height: 22.0,
                color: const Color.fromARGB(171, 0, 0, 0),
              ),
              const SizedBox(width: 8),
              Text(
                '$label : ',
                style: const TextStyle(
                  fontFamily: AppFonts.poppins,
                  color: Color.fromARGB(171, 0, 0, 0),
                  fontSize: 16,
                ),
              ),
            ],
          ),

          const SizedBox(width: 8),

          /// Right side (value text) — flexible to avoid overflow
          Expanded(
            child: Text(
              value,
              textAlign: TextAlign.right,
              softWrap: true,
              overflow: TextOverflow.visible,
              style: const TextStyle(
                fontFamily: AppFonts.poppins,
                color: AppColor.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
