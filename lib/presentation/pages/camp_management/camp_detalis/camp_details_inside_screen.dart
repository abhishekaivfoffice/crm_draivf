import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';
import '../../../../core/fonts/fonts.dart';
import '../../../../widgets/custom_buttons/custom_gradient_button.dart';
import '../add_camp_inside_details/addcamp_inside_details_screen.dart';

class CampInsideDetailsScreen extends StatelessWidget {
  final Map<String, dynamic> campData;

  const CampInsideDetailsScreen({super.key, required this.campData});

  String formatDate(String dateTime) {
    final parsedDate = DateTime.tryParse(dateTime);
    if (parsedDate == null) return "Invalid Date";
    return DateFormat("dd MMM yyyy • hh:mm a").format(parsedDate);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const TabletMobileDrawer(),
      appBar: const CustomAppBar(title: "Camp Details"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Branch & Type
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            campData["branch"] ?? "N/A",
                            style: const TextStyle(
                              fontSize: 18,
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
                            campData["campType"] ?? "N/A",
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

                    const SizedBox(height: 12),

                    // Camp Location
                    Text(
                      campData["campLocation"] ?? "Location not available",
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),

                    const SizedBox(height: 12),

                    // Camp Date
                    Text(
                      "Camp Date: ${formatDate(campData["createdDate"])}",
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black54,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),

                    const SizedBox(height: 15),

                    // Doctor Details
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "👩‍⚕ ${campData["drName"] ?? "N/A"}",
                          style: const TextStyle(
                            fontSize: 15,
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
                              formatDate(campData["createdDate"]),
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
                  ],
                ),
              ),
              SizedBox(height: 20,),
              CustomGradientButton(
                height: 40,
                width: 150,
                text: "Add Activity",
                onPressed: () {
                  Get.to(() => const AddCampInsideDetailsScreen());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
