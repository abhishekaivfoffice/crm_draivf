import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appimages.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/presentation/pages/course/course_lead_home/course_leads_data/course_data_profile.dart';
import 'package:crm_draivfmobileapp/provider/course_provider/course_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_daterange_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdownfield_with_selectall_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

//course leads data page
class CourseData extends StatelessWidget {
  const CourseData({super.key});

  @override
  Widget build(BuildContext context) {
    final courseleaddataprovider = Provider.of<CourseDataProvider>(context);
    final users = courseleaddataprovider.currentPageUsers;

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
                        value: courseleaddataprovider.pageSize,
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
                            courseleaddataprovider.setPageSize(val);
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
                        value: courseleaddataprovider.selectedAction,
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
                            courseleaddataprovider.actionItems.map((e) {
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
                          courseleaddataprovider.setSelectedAction(val);
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
                    courseleaddataprovider.toggleFilters();
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
        if (courseleaddataprovider.showFilters) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                SelectAllMultiSelectTextfield(
                  labelText: "Zone",
                  hintText: "Select zone",
                  items: courseleaddataprovider.filterzones,
                  selectedValues: courseleaddataprovider.selectedFilterZones,
                  onChanged:
                      (vals) => courseleaddataprovider.setFilterZones(vals),
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                SelectAllMultiSelectTextfield(
                  labelText: "Branches",
                  hintText: "Select branches",
                  items: courseleaddataprovider.branches,
                  selectedValues: courseleaddataprovider.selectedFilterBranches,
                  onChanged:
                      (vals) => courseleaddataprovider.setFilterBranches(vals),
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                SelectAllMultiSelectTextfield(
                  labelText: "Status",
                  hintText: "Select Status",
                  items: courseleaddataprovider.filterstatus,
                  selectedValues: courseleaddataprovider.selectedFilterStatus,
                  onChanged:
                      (vals) => courseleaddataprovider.setFilterStatus(vals),
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: false,
                  labelText: "Assigned",
                  items: courseleaddataprovider.filteragentName,
                  selectedValue: courseleaddataprovider.selectedFilterAgentName,
                  onChanged: courseleaddataprovider.setFilterAgentNames,
                  hintText: "Select Assigned",
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: false,
                  labelText: "Social media",
                  items: courseleaddataprovider.filtersocialMedia,
                  selectedValue:
                      courseleaddataprovider.selectedFilterSocialMedia,
                  onChanged: courseleaddataprovider.setFilterSocialMedia,
                  hintText: "Select social media",
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: false,
                  labelText: "Digital media",
                  items: courseleaddataprovider.filterdigitalmedia,
                  selectedValue:
                      courseleaddataprovider.selectedFilterDigitalMedia,
                  onChanged: courseleaddataprovider.setFilterDigitalMedia,
                  hintText: "Select digital media",
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: false,
                  labelText: "Date filter",
                  items: courseleaddataprovider.filterdateFilter,
                  selectedValue:
                      courseleaddataprovider.selectedFilterDateFilter,
                  onChanged: courseleaddataprovider.setFilterDateFilter,
                  hintText: "Select date filter",
                ),
                const SizedBox(height: 6),
                CustomDateRangeField(
                  controller: courseleaddataprovider.dateRangeController,
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
          padding: const EdgeInsets.all(0),
          itemCount: users.length + 1, // extra for pagination buttons
          itemBuilder: (context, index) {
            if (index < users.length) {
              final user = users[index];
              return GestureDetector(
                           onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CourseDataProfile(),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Name and reviews count
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImages.idicon,
                                    width: 20.0,
                                    height: 20.0,
                                    color: Color.fromARGB(171, 0, 0, 0),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    user.name,
                                    style: const TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: Color.fromARGB(171, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                
                              SizedBox(height: 4),
                              Row(
                                children: [
                                  SvgPicture.asset(
                                    AppImages.phoneicon,
                                    width: 20.0,
                                    height: 20.0,
                                    color: Color.fromARGB(171, 0, 0, 0),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    user.phone,
                                    style: const TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: Color.fromARGB(171, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 4),
                              Text(
                                user.city,
                                style: const TextStyle(
                                  fontFamily: AppFonts.poppins,
                                  color: Color.fromARGB(171, 0, 0, 0),
                                  fontSize: 14,
                                ),
                              ),
                
                              SizedBox(height: 4),
                
                              Text(
                                user.qualification,
                                style: const TextStyle(
                                  fontFamily: AppFonts.poppins,
                                  color: Color.fromARGB(171, 0, 0, 0),
                                  fontSize: 14,
                                ),
                              ),
                
                              SizedBox(height: 16),
                
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Center(
                                    child: Text(
                                      user.createdDate,
                                      style: const TextStyle(
                                        fontFamily: AppFonts.poppins,
                                        color: Color.fromARGB(171, 0, 0, 0),
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                
                                  SizedBox(width: 8),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Text(
                                      user.status,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                        fontFamily: AppFonts.poppins,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                
                      // Right side - Profile image
                      Column(
                        children: [
                          Container(
                            width: 120,
                            height: 160,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(12),
                              ),
                              child: Image.network(
                                "${user.photo}",
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) {
                                  return Container(
                                    color: Colors.grey[300],
                                    child: Icon(
                                      Icons.person,
                                      size: 50,
                                      color: Colors.grey[600],
                                    ),
                                  );
                                },
                                loadingBuilder: (
                                  context,
                                  child,
                                  loadingProgress,
                                ) {
                                  if (loadingProgress == null) return child;
                                  return Container(
                                    color: Colors.grey[200],
                                    child: Center(
                                      child: CircularProgressIndicator(
                                        value:
                                            loadingProgress.expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          Container(
                            width: 120,
                
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(137, 201, 201, 201),
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(12),
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Center(
                                child: Text(
                                  user.empId,
                                  style: TextStyle(
                                    color: AppColor.blackColor,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
             
            } else {
              // Show pagination controls (Next + Back) at the bottom
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (courseleaddataprovider
                      .hasPreviousPage) // Show Back only if not on first page
                    ElevatedButton(
                      onPressed: courseleaddataprovider.previousPage,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("← Back"),
                    ),
                  const SizedBox(width: 12),
                  if (courseleaddataprovider
                      .hasNextPage) // Show Next if more pages
                    ElevatedButton(
                      onPressed: courseleaddataprovider.nextPage,
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
