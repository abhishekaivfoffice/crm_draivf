import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/job_leads_new/job_lead_new_home/job_leads_new_data/job_lead_new_data_profile.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_job_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/Custom_date_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdownfield_with_selectall_option.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JobLeadsNewData extends StatelessWidget {
  const JobLeadsNewData({super.key});

  @override
  Widget build(BuildContext context) {
    final jobleadnewdataprovider = Provider.of<JlNJobLeadsDataProvider>(
      context,
    );
    final users = jobleadnewdataprovider.currentPageUsers;

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
                        value: jobleadnewdataprovider.pageSize,
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
                            jobleadnewdataprovider.setPageSize(val);
                          }
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: SizedBox(
                      height: 35,
                      child: DropdownButton<String>(
                        value: jobleadnewdataprovider.selectedAction,
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
                            jobleadnewdataprovider.actionItems.map((e) {
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
                          jobleadnewdataprovider.setSelectedAction(val);
                        },
                      ),
                    ),
                  ),
                ),
                ////
                // GestureDetector(
                //   onTap: () {
                //     Get.toNamed(AppRoutes.jlbulkActionScreen);
                //   },
                //   child: Container(
                //     decoration: BoxDecoration(
                //       borderRadius: BorderRadius.only(
                //         topRight: Radius.circular(8),
                //         bottomRight: Radius.circular(8),
                //       ),
                //       border: Border.all(color: Colors.black12),
                //     ),
                //     child: Padding(
                //       padding: const EdgeInsets.symmetric(horizontal: 4),
                //       child: SizedBox(
                //         height: 35,
                //         child: Center(
                //           child: const Text(
                //             " Bulk Actions ",
                //             style: TextStyle(
                //               fontSize: 14,
                //               color: AppColor.blackColor,
                //               fontFamily: AppFonts.poppins,
                //             ),
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
                const SizedBox(width: 10),
                ////
                GestureDetector(
                  onTap: () {
                    jobleadnewdataprovider.toggleFilters();
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
        if (jobleadnewdataprovider.showFilters) ...[
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              children: [
                SelectAllMultiSelectTextfield(
                  labelText: "Zone",
                  hintText: "Select zone",
                  items: jobleadnewdataprovider.filterzones,
                  selectedValues: jobleadnewdataprovider.selectedFilterZones,
                  onChanged:
                      (vals) => jobleadnewdataprovider.setFilterZones(vals),
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                SelectAllMultiSelectTextfield(
                  labelText: "Branches",
                  hintText: "Select branches",
                  items: jobleadnewdataprovider.branches,
                  selectedValues: jobleadnewdataprovider.selectedFilterBranches,
                  onChanged:
                      (vals) => jobleadnewdataprovider.setFilterBranches(vals),
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                //Joining date
                CustomDateField(
                  controller: jobleadnewdataprovider.joiningDateController,
                  hintText: "Select Joining date",
                  labelText: "Joining Date",
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                SelectAllMultiSelectTextfield(
                  labelText: "Job Title",
                  hintText: "Select Job Title",
                  items: jobleadnewdataprovider.jobtitle,
                  selectedValues: jobleadnewdataprovider.selectedJobTitle,
                  onChanged: (vals) => jobleadnewdataprovider.setJobTitle(vals),
                  isMandatory: false,
                ),
                const SizedBox(height: 6),
                CustomSearchDropdownWithSearch(
                  isMandatory: false,
                  labelText: "Assigned",
                  items: jobleadnewdataprovider.filteragentName,
                  selectedValue: jobleadnewdataprovider.selectedFilterAgentName,
                  onChanged: jobleadnewdataprovider.setFilterAgentNames,
                  hintText: "Select Assigned",
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
              return  Center(
        child: Container(
          margin: const EdgeInsets.all(0),
          child: Card(
            elevation: 2,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Section
                  Row(
                    children: [
                      // Profile Image
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.orange[300],
                        ),
                        child: ClipOval(
                          child: Image.network(
                            'https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Placeholder_Person.jpg/500px-Placeholder_Person.jpg',
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.orange[300],
                                child: Icon(
                                  Icons.person,
                                  size: 40,
                                  color: Colors.white,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      // Name and Title
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                 Text(
                               user.name,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                     fontFamily: AppFonts.poppins,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                               
                              ],
                            ),
                            const SizedBox(height: 4),
                             Text(
                              user.branch,
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Rating Section
                  Row(
                    children: [
                      Row(
                        children: List.generate(5, (index) {
                          if (index < 4) {
                            return Icon(
                              Icons.star,
                              size: 18,
                              color: Colors.orange[400],
                            );
                          } else {
                            return Icon(
                              Icons.star_half,
                              size: 18,
                              color: Colors.orange[400],
                            );
                          }
                        }),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Text(
                        '(23 testimonials)',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  // Divider
                  Container(
                    height: 1,
                    color: Colors.grey[200],
                  ),
                  const SizedBox(height: 20),
                  // Details Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildDetailRow('Speaks:', 'Hindi, English'),
                      const SizedBox(height: 12),
                      _buildDetailRow('Starts at:', 'INR 1,200+'),
                      const SizedBox(height: 16),
                     
                      
                   
                    ],
                  ),
                  // Footer Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Next Available Slot:',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: Colors.orange[400],
                              ),
                              const SizedBox(width: 4),
                              Text(
                                'Tomorrow, 10:00 AM',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.orange[600],
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange[400],
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          elevation: 0,
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'View Profile',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(width: 8),
                            Icon(Icons.arrow_forward, size: 18),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
              
              
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => JOBLeadNewDataProfile(user: user),
              //       ),
              //     );
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.symmetric(vertical: 6),
              //     child: Container(
              //       decoration: BoxDecoration(
              //         color: const Color.fromARGB(255, 255, 255, 255),
              //         border: Border.all(color: Colors.black26),
              //         borderRadius: BorderRadius.circular(8),
              //       ),

              //       child: Padding(
              //         padding: const EdgeInsets.all(12.0),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             // Header Row
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 // Name + Branch
              //                 Text(
              //                   user.name,
              //                   style: const TextStyle(
              //                     fontSize: 15,
              //                     fontFamily: AppFonts.poppins,
              //                     color: AppColor.blackColor,
              //                     fontWeight: FontWeight.bold,
              //                   ),
              //                 ),

              //                 Container(
              //                   padding: const EdgeInsets.symmetric(
              //                     horizontal: 8,
              //                     vertical: 4,
              //                   ),
              //                   decoration: BoxDecoration(
              //                     color:
              //                         user.status == "Query"
              //                             ? Colors.green.shade100
              //                             : user.status == "Pending"
              //                             ? Colors.orange.shade100
              //                             : user.status == "Closed"
              //                             ? Colors.red.shade100
              //                             : Colors.blue.shade100,
              //                     borderRadius: BorderRadius.circular(8),
              //                   ),
              //                   child: Text(
              //                     user.status,
              //                     style: const TextStyle(
              //                       fontWeight: FontWeight.bold,
              //                     ),
              //                   ),
              //                 ),
              //               ],
              //             ),
              //             const SizedBox(height: 8),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   "# ID: ${user.id}",
              //                   style: const TextStyle(
              //                     fontWeight: FontWeight.w500,
              //                     fontSize: 14,
              //                     color: AppColor.blackColor,
              //                   ),
              //                 ),
              //                 Text(
              //                   "${user.source}",
              //                   style: const TextStyle(color: Colors.grey),
              //                 ),
              //               ],
              //             ),
              //             Row(
              //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //               children: [
              //                 Text(
              //                   "Branch: ${user.branch}",
              //                   style: const TextStyle(
              //                     color: AppColor.blackColor,
              //                   ),
              //                 ),
              //                 Text(
              //                   "${user.created}",
              //                   style: const TextStyle(color: Colors.grey),
              //                 ),
              //               ],
              //             ),

              //             const Divider(),
              //             CustomGradientButton(
              //               text: ("${user.phone}"),
              //               height: 33,
              //               icon: Icons.call,
              //               gradientColors: const [
              //                 Color(0xFF42A5F5), // Sky Blue
              //                 Color(0xFF1565C0), // Rich Blue
              //               ],

              //               onPressed: () {
              //                 // cancel action
              //               },
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // );
            } else {
              // Show pagination controls (Next + Back) at the bottom
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (jobleadnewdataprovider
                      .hasPreviousPage) // Show Back only if not on first page
                    ElevatedButton(
                      onPressed: jobleadnewdataprovider.previousPage,

                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade600,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text("← Back"),
                    ),
                  const SizedBox(width: 12),
                  if (jobleadnewdataprovider
                      .hasNextPage) // Show Next if more pages
                    ElevatedButton(
                      onPressed: jobleadnewdataprovider.nextPage,
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
  
  Widget _buildDetailRow(String label, String value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildExpertiseTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: Colors.orange[50],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.orange[200]!,
          width: 1,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14,
          color: Colors.orange[700],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
