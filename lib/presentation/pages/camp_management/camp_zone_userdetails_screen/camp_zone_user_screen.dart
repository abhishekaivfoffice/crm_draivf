import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../core/constatnts/appcolors.dart';
import '../../../../core/fonts/fonts.dart';
import '../../../../widgets/custom_buttons/custom_gradient_button.dart';
import '../../../../widgets/custom_textfield/Custom_date_field.dart';
import '../../../../widgets/custom_textfield/custom_dropdown_with_search.dart';
import '../../enquiry/enquiry_home/add_new_enquiry/add_enquiry.dart';
import '../addcamp_inside_action_details/addcamp_inside_action_screen.dart';
import '../camp_detalis/camp_details_inside_screen.dart';
import '../new_comp_add/new_camp_screen.dart';
import 'camp_userdetails_provider.dart';

class CampZoneUserScreen extends StatelessWidget {
  const CampZoneUserScreen({super.key});

  @override
  String formatDate(String dateTime) {
    final parsedDate = DateTime.parse(dateTime);
    return DateFormat("dd MMM yyyy • hh:mm a").format(parsedDate);
  }

  Widget build(BuildContext context) {
    final campuserdetailsprovider = Provider.of<CampUserDetailsProvider>(
      context,
    );
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.black12),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4),
                child: SizedBox(
                  height: 35,
                  child: DropdownButton<int>(
                    value: campuserdetailsprovider.pageSize,
                    underline: const SizedBox(),
                    isExpanded: true, // ✅ Makes dropdown take full width
                    items:
                        [5, 10, 15, 20].map((e) {
                          return DropdownMenuItem(
                            value: e,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 12,
                              ), // ✅ Added left spacing
                              child: Text(
                                "$e",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppColor.blackColor,
                                  fontFamily: AppFonts.poppins,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                    onChanged: (val) {
                      if (val != null) {
                        campuserdetailsprovider.setPageSize(val);
                      }
                    },
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                campuserdetailsprovider.toggleFilters();
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  border: Border.all(color: Colors.black12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: SizedBox(
                    height: 35,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            " Filter ",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.blackColor,
                              fontFamily: AppFonts.poppins,
                            ),
                          ),
                          Icon(
                            Icons.arrow_drop_down_outlined,
                            color: AppColor.blackColor,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                CustomGradientButton(
                  height: 40,
                  width: 150,
                  text: "New Camp",
                  icon: Icons.add,
                  onPressed: () {
                    Get.to(() => const NewCampScreen());
                  },
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 15),

        if (campuserdetailsprovider.showFilters) ...[
          Column(
            children: [
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Zone",
                items: campuserdetailsprovider.zone,
                selectedValue: campuserdetailsprovider.selectedzone,
                onChanged: campuserdetailsprovider.setSelectedzone,
                hintText: "Select Zone",
              ),
              const SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Location",
                items: campuserdetailsprovider.location,
                selectedValue: campuserdetailsprovider.selectedlocation,
                onChanged: campuserdetailsprovider.setSelectedlocation,
                hintText: "Select Location",
              ),
              SizedBox(height: 6),
              CustomDateField(
                controller: campuserdetailsprovider.marriageDateController,
                hintText: "Select date Range",
                labelText: "Qucik Range",
                isMandatory: false,
              ),
              SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Camp Type",
                items: campuserdetailsprovider.campeType,
                selectedValue: campuserdetailsprovider.selectedcampeType,
                onChanged: campuserdetailsprovider.setSelectedcampeType,
                hintText: "Select Camp Type",
              ),
              SizedBox(height: 20),
              CustomGradientButton(
                text: "Serach",
                onPressed: () {
                  // submit action
                },
              ),
            ],
          ),
        ],

        Expanded(
          child: ListView.builder(
            itemCount:
                campuserdetailsprovider
                    .campList
                    .length, // Prevent nested scrolling
            padding: const EdgeInsets.all(10),
            itemBuilder: (context, index) {
              final camp = campuserdetailsprovider.campList[index];
              return Container(
                margin: const EdgeInsets.only(
                  bottom: 12,
                ), // Space between items
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.grey.shade300, // ✅ Clean border color
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.circular(10), // ✅ Rounded edges
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Top Row (Branch + Type)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            camp["branch"] ?? "N/A",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                              fontFamily: AppFonts.poppins,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(color: Colors.blue.shade200),
                          ),
                          child: Text(
                            camp["campType"] ?? "N/A",
                            style: TextStyle(
                              color: Colors.blue.shade800,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontFamily: AppFonts.poppins,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Camp Location
                    Text(
                      camp["campLocation"] ?? "Location not available",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Camp Date: ${formatDate(camp["createdDate"])}",
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.black54,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),

                    const SizedBox(height: 10),

                    // Doctor & Date Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "👩‍⚕ ${camp["drName"] ?? "N/A"}",
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.poppins,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              formatDate(camp["createdDate"]),
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black54,
                                fontFamily: AppFonts.poppins,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomGradientButton(
                          width: MediaQuery.of(context).size.width / 3,
                          height: 30,
                          text: "Details",
                          gradientColors: const [
                            Color(0xFF42A5F5),
                            Color(0xFF1565C0),
                          ],
                          onPressed: () {
                            Get.to(() => CampInsideDetailsScreen(campData: camp));
                          },
                        ),
                        CustomGradientButton(
                          height: 30,
                          width: MediaQuery.of(context).size.width / 3,
                          text: "action",
                          gradientColors: const [
                            Color(0xFF42A5F5),
                            Color(0xFF1565C0),
                          ],
                          onPressed: () {
                            Get.to(() => const AddCampInsideActionScreen());
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
