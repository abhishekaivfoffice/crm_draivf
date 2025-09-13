import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appimages.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/data/models/assigned_members_model.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_icon_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_info_row.dart';
import 'package:crm_draivfmobileapp/widgets/custom_info_row_without_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class INLTaskTabsProfileTabs extends StatelessWidget {
  final User user;

  const INLTaskTabsProfileTabs({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 10,)
,             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomGradientButton(
                  height: 40,
                  width: 190,
                  text: "Convert to Customer",
                  onPressed: () {
                   Get.toNamed(AppRoutes.inlConvertToCustomerScreen);
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomIconSquareButton(
                      icon: Icons.edit, 
                      onPressed: () {
                      Get.toNamed(AppRoutes.editLeadScreen);
                      },
                    ),
                    const SizedBox(width: 12),
                    CustomIconSquareButton(
                      icon: Icons.print,
                      onPressed: () {
                        print("Print pressed");
                      },
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "${user.created}",
                  style: const TextStyle(color: Colors.grey),
                ),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        user.status == "Query"
                            ? Colors.green.shade100
                            : user.status == "Pending"
                            ? Colors.orange.shade100
                            : user.status == "Closed"
                            ? Colors.red.shade100
                            : Colors.blue.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    user.status,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            InfoRow(
              iconPath: AppImages.idicon,
              label: "Id",
              value: user.id.toString(),
            ),
            InfoRow(
              iconPath: AppImages.nameicon,
              label: "Wife Name",
              value: user.name,
            ),
            InfoRow(
              iconPath: AppImages.branchicon,
              label: "Branch",
              value: user.branch,
            ),
            InfoRow(
              iconPath: AppImages.phoneicon,
              label: "Wife Phone",
              value: user.phone,
            ),
            InfoRow(
              iconPath: AppImages.dupeicon,
              label: "Dupe",
              value: user.dupe.toString(),
            ),
            InfoRow(
              iconPath: AppImages.sourceicon,
              label: "Source",
              value: user.source,
            ),
            InfoRow(
              iconPath: AppImages.walkindateicon,
              label: "Walkin Date",
              value: user.walkInDate,
            ),
            InfoRow(
              iconPath: AppImages.lastcontacticon,
              label: "Last Contact",
              value: user.lastContact,
            ),
            /////////////////////////////
            Divider(color: AppColor.primaryColor2,),
           

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
