import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/international_leads_data/inl_data_profile.dart';
import 'package:crm_draivfmobileapp/provider/setup_staff_provider/setup_staff_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class STPStaffData extends StatelessWidget {
  const STPStaffData({super.key});

  @override
  Widget build(BuildContext context) {
    final stpstaffdataprovider = Provider.of<SetupStaffDataProvider>(
      context,
    );
    final users = stpstaffdataprovider.currentPageUsers;

    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SizedBox(
                      height: 35,
                      child: DropdownButton<int>(
                        value: stpstaffdataprovider.pageSize,
                        underline: const SizedBox(),
                        items:
                            [5, 10, 15, 20].map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "   $e",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.blackColor,
                                    fontFamily: AppFonts.poppins,
                                  ),
                                ),
                              );
                            }).toList(),
                        onChanged: (val) {
                          if (val != null) {
                            stpstaffdataprovider.setPageSize(val);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      bottomLeft: Radius.circular(8),
                    ),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SizedBox(
                      height: 35,
                      child: DropdownButton<String>(
                        value: stpstaffdataprovider.selectedAction,
                        underline: const SizedBox(),
                        hint: const Text(
                          " Export",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColor.blackColor,
                            fontFamily: AppFonts.poppins,
                          ),
                        ),
                        items:
                            stpstaffdataprovider.actionItems.map((e) {
                              return DropdownMenuItem(
                                value: e,
                                child: Text(
                                  "    $e",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: AppColor.blackColor,
                                    fontFamily: AppFonts.poppins,
                                  ),
                                ),
                              );
                            }).toList(),
                        onChanged: (val) {
                          stpstaffdataprovider.setSelectedAction(val);
                        },
                      ),
                    ),
                  ),
                ),
                ////
              ],
            ),
          ),
        ),

       

        /////////////////////////////////////////////
        ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.all(10),
          itemCount: users.length + 1, // extra for pagination buttons
          itemBuilder: (context, index) {
            if (index < users.length) {
              final user = users[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InlDataProfile(user: user),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      border: Border.all(color: Colors.black26),
                      borderRadius: BorderRadius.circular(8),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header Row
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Name + Branch
                              Text(
                                user.name,
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontFamily: AppFonts.poppins,
                                  color: AppColor.blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
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
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "# ID: ${user.id}",
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: AppColor.blackColor,
                                ),
                              ),
                                  Text(
                                "${user.source}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Branch: ${user.branch}",
                                style: const TextStyle(
                                  color: AppColor.blackColor,
                                ),
                              ),
                              Text(
                                "${user.created}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                            ],
                          ),

                          const Divider(),
                          CustomGradientButton(
                            text: ("${user.phone}"),
                            height: 33,
                            icon: Icons.call,
                            gradientColors: const [
                              Color(0xFF42A5F5), // Sky Blue
                              Color(0xFF1565C0), // Rich Blue
                            ],

                            onPressed: () {
                              // cancel action
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            } else {
              // Show pagination controls (Next + Back) at the bottom
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (stpstaffdataprovider
                      .hasPreviousPage) // Show Back only if not on first page
                    ElevatedButton(
                      onPressed: stpstaffdataprovider.previousPage,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("← Back"),
                    ),
                  const SizedBox(width: 12),
                  if (stpstaffdataprovider
                      .hasNextPage) // Show Next if more pages
                    ElevatedButton(
                      onPressed: stpstaffdataprovider.nextPage,
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("Next →"),
                    ),
                ],
              );
            }
          },
        ),
      ],
    );
  }
}
