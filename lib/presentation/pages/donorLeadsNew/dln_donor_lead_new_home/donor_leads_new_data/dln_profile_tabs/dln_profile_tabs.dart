import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appimages.dart';
import 'package:crm_draivfmobileapp/data/models/donor_lead_new/dln_assigned_member_model.dart';

import 'package:crm_draivfmobileapp/widgets/custom_info_row.dart';
import 'package:crm_draivfmobileapp/widgets/custom_info_row_without_icon.dart';
import 'package:flutter/material.dart';

class DLNProfileTabs extends StatelessWidget {
  final PatientRecord user;

  const DLNProfileTabs({super.key, required this.user});

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
              label: "Donor Name",
              value: user.wifeName,
            ),
            InfoRow(
              iconPath: AppImages.walkindateicon,
              label: "Donor Age",
              value: "33",
            ),
            InfoRow(
              iconPath: AppImages.branchicon,
              label: "Location",
              value: user.location,
            ),
            InfoRow(
              iconPath: AppImages.phoneicon,
              label: "Wife Phone",
              value: user.wifePhone,
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
            Divider(color: AppColor.primaryColor2),

            InfoRowWithoutIcon(label: "Created", value: "12-10-2025"),
            InfoRowWithoutIcon(label: "Children details", value: "2 Baby"),
            InfoRowWithoutIcon(label: "MRD Number", value: "B564AIVF"),

            InfoRowWithoutIcon(label: "Husband Name", value: "---"),
            InfoRowWithoutIcon(label: "Wife Number", value: "+91 9999 9999 54"),

            InfoRowWithoutIcon(label: "Address", value: "---"),
            InfoRowWithoutIcon(label: "City", value: "---"),
            InfoRowWithoutIcon(label: "State", value: "---"),
            InfoRowWithoutIcon(label: "Country", value: "---"),
            InfoRowWithoutIcon(label: "Zipcode", value: "---"),

            InfoRowWithoutIcon(label: "Preferred Time To Call", value: "---"),
            InfoRowWithoutIcon(label: "Preferred Language", value: "---"),
            InfoRowWithoutIcon(label: "Description", value: "---"),
            InfoRowWithoutIcon(label: "Attribute", value: "---"),
            InfoRowWithoutIcon(label: "Assigned", value: "---"),

            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
