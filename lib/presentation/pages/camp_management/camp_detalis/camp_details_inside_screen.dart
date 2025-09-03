import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';
import '../../../../core/fonts/fonts.dart';
import '../../../../widgets/custom_buttons/custom_gradient_button.dart';
import '../add_camp_inside_details/addcamp_inside_details_screen.dart';
import 'camp_details_inside_provider.dart';

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
    final campProvider = Provider.of<CampDetailsInsidePageProvider>(context);
    final campData = campProvider.campList[0];

    return Scaffold(
      drawer: const TabletMobileDrawer(),
      appBar: const CustomAppBar(title: "Camp Details"),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildDetailItem("Zone", campData["Zone"] ?? "N/A"),
              const SizedBox(height: 8),
              _buildDetailItem("Camp Date", campData["Camp Date"] ?? "N/A"),
              _buildDetailItem("Branch", campData["Branch"] ?? "N/A"),
              const SizedBox(height: 8),
              _buildDetailItem("Location", campData["Location"] ?? "N/A"),

              // Column 3
              _buildDetailItem("Camp Type", campData["Camp Type"] ?? "N/A"),
              const SizedBox(height: 8),
              _buildDetailItem(
                "Camp Incharge",
                campData["Camp Incharge"]?.isNotEmpty == true
                    ? campData["Camp Incharge"]
                    : ".",
              ),

              // Column 4
              _buildDetailItem("Dr. Name", campData["Dr. Name"] ?? "N/A"),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetailItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: RichText(
        text: TextSpan(
          text: "$title : ",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
            fontFamily: AppFonts.poppins,
          ),
          children: [
            TextSpan(
              text: value,
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Colors.black,
                fontSize: 16,
                fontFamily: AppFonts.poppins,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
