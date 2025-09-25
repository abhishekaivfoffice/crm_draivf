import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:flutter/material.dart';

class InfoRowWithoutIcon extends StatelessWidget {
  final String label;
  final String value;

  const InfoRowWithoutIcon({Key? key, required this.label, required this.value})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Label text
          Text(
            '$label : ',
            style: const TextStyle(
              fontFamily: AppFonts.poppins,
              color: Color.fromARGB(171, 0, 0, 0),
              fontSize: 16,
            ),
          ),

          const SizedBox(width: 8),

          /// Value text — expanded so it won’t overflow
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
