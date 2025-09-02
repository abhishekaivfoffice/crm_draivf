import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_icon_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_info_row_without_icon.dart';
import 'package:flutter/material.dart';

class ProfileTabs extends StatelessWidget {
  const ProfileTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomGradientButton(
                  height: 40,
                  width: 190,
                  text: "Convert to Customer",
                  onPressed: () {
                    // submit action
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconSquareButton(
                      icon: Icons.edit, // ✏️ edit icon
                      onPressed: () {
                        print("Edit pressed");
                      },
                    ),
                    const SizedBox(width: 12),
                    CustomIconSquareButton(
                      icon: Icons.print, // 🖨️ print icon
                      onPressed: () {
                        print("Print pressed");
                      },
                    ),
                  ],
                ),
              ],
            ),

            InfoRowWithoutIcon(label: "Husband Name", value: "---"),
            InfoRowWithoutIcon(label: "Wife Number", value: "+91 9999 9999 54"),
            InfoRowWithoutIcon(label: "Purpose", value: "Fertility Treatment"),
            InfoRowWithoutIcon(label: "Hysband Number", value: "---"),
            Row(
              children: [
                Expanded(
                  child: InfoRowWithoutIcon(label: "Husband Age", value: "56"),
                ),
                Expanded(
                  child: InfoRowWithoutIcon(label: "Wife Age", value: "47"),
                ),
              ],
            ),
            InfoRowWithoutIcon(label: "Address", value: "---"),
            InfoRowWithoutIcon(label: "City", value: "---"),
            InfoRowWithoutIcon(label: "State", value: "---"),
            InfoRowWithoutIcon(label: "Country", value: "---"),
            InfoRowWithoutIcon(label: "Zipcode", value: "---"),
            Row(
              children: [
                Expanded(
                  child: InfoRowWithoutIcon(label: "Marriage at", value: "---"),
                ),
                Expanded(
                  child: InfoRowWithoutIcon(
                    label: "Married Years",
                    value: "---",
                  ),
                ),
              ],
            ),
            InfoRowWithoutIcon(label: "Profile Group", value: "---"),
            InfoRowWithoutIcon(label: "For Fertility Treatment", value: "---"),
            InfoRowWithoutIcon(label: "Preferred Time To Call", value: "---"),
            InfoRowWithoutIcon(label: "Preferred Language", value: "---"),
            InfoRowWithoutIcon(label: "Description", value: "---"),
            InfoRowWithoutIcon(label: "Attribute", value: "---"),
            InfoRowWithoutIcon(label: "Assigned", value: "---"),
            Row(
              children: [
                Expanded(
                  child: InfoRowWithoutIcon(label: "Wife MDR no", value: "---"),
                ),
                Expanded(
                  child: InfoRowWithoutIcon(
                    label: "Husband MDR no",
                    value: "---",
                  ),
                ),
              ],
            ),
            InfoRowWithoutIcon(label: "Tags", value: "---"),
            InfoRowWithoutIcon(label: "Created", value: "---"),
            InfoRowWithoutIcon(label: "LastContact", value: "---"),
            InfoRowWithoutIcon(label: "Public", value: "---"),
            InfoRowWithoutIcon(label: "Preferred Location", value: "---"),
            InfoRowWithoutIcon(label: "Walkin Date", value: "---"),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
