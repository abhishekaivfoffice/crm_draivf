import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/presentation/pages/internationalLeads/international_lead_home/international_leads_data/inl_data_profile.dart';
import 'package:crm_draivfmobileapp/provider/internationallead_provider/Inl_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_daterange_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdownfield_with_selectall_option.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class InlData extends StatelessWidget {
  const InlData({super.key});

  @override
  Widget build(BuildContext context) {
    final domestileaddataprovider = Provider.of<InlDataProvider>(
      context,
    );
    final users = domestileaddataprovider.currentPageUsers;

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
                        value: domestileaddataprovider.pageSize,
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
                            domestileaddataprovider.setPageSize(val);
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
                        value: domestileaddataprovider.selectedAction,
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
                            domestileaddataprovider.actionItems.map((e) {
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
                          domestileaddataprovider.setSelectedAction(val);
                        },
                      ),
                    ),
                  ),
                ),
                ////
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.bulkActionScreen);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(8),
                        bottomRight: Radius.circular(8),
                      ),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(
                        height: 35,
                        child: Center(
                          child: const Text(
                            " Bulk Actions ",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.blackColor,
                              fontFamily: AppFonts.poppins,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ////
                GestureDetector(
                  onTap: () {
                    domestileaddataprovider.toggleFilters();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border: Border.all(color: Colors.black12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      child: SizedBox(
                        height: 35,
                        child: Center(
                          child: const Text(
                            " Filter ",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.blackColor,
                              fontFamily: AppFonts.poppins,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        /// SHOW FILTERS ONLY IF ENABLED
        if (domestileaddataprovider.showFilters) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                SelectAllMultiSelectTextfield(
                  labelText: "Zone",
                  hintText: "Select zone",
                  items: domestileaddataprovider.filterzones,
                  selectedValues: domestileaddataprovider.selectedFilterZones,
                  onChanged:
                      (vals) => domestileaddataprovider.setFilterZones(vals),
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                SelectAllMultiSelectTextfield(
                  labelText: "Branches",
                  hintText: "Select branches",
                  items: domestileaddataprovider.branches,
                  selectedValues:
                      domestileaddataprovider.selectedFilterBranches,
                  onChanged:
                      (vals) => domestileaddataprovider.setFilterBranches(vals),
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                SelectAllMultiSelectTextfield(
                  labelText: "Status",
                  hintText: "Select Status",
                  items: domestileaddataprovider.filterstatus,
                  selectedValues: domestileaddataprovider.selectedFilterStatus,
                  onChanged:
                      (vals) => domestileaddataprovider.setFilterStatus(vals),
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: false,
                  labelText: "Assigned",
                  items: domestileaddataprovider.filteragentName,
                  selectedValue:
                      domestileaddataprovider.selectedFilterAgentName,
                  onChanged: domestileaddataprovider.setFilterAgentNames,
                  hintText: "Select Assigned",
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: false,
                  labelText: "Social media",
                  items: domestileaddataprovider.filtersocialMedia,
                  selectedValue:
                      domestileaddataprovider.selectedFilterSocialMedia,
                  onChanged: domestileaddataprovider.setFilterSocialMedia,
                  hintText: "Select social media",
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: false,
                  labelText: "Digital media",
                  items: domestileaddataprovider.filterdigitalmedia,
                  selectedValue:
                      domestileaddataprovider.selectedFilterDigitalMedia,
                  onChanged: domestileaddataprovider.setFilterDigitalMedia,
                  hintText: "Select digital media",
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: false,
                  labelText: "Date filter",
                  items: domestileaddataprovider.filterdateFilter,
                  selectedValue:
                      domestileaddataprovider.selectedFilterDateFilter,
                  onChanged: domestileaddataprovider.setFilterDateFilter,
                  hintText: "Select date filter",
                ),
                const SizedBox(height: 6),
                CustomDateRangeField(
                  controller: domestileaddataprovider.dateRangeController,
                  hintText: "Select Date Range",
                  labelText: "Date Range",
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
              ],
            ),
          ),
        ],

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
                  if (domestileaddataprovider
                      .hasPreviousPage) // Show Back only if not on first page
                    ElevatedButton(
                      onPressed: domestileaddataprovider.previousPage,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("← Back"),
                    ),
                  const SizedBox(width: 12),
                  if (domestileaddataprovider
                      .hasNextPage) // Show Next if more pages
                    ElevatedButton(
                      onPressed: domestileaddataprovider.nextPage,
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
