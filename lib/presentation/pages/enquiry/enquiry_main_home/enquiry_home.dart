import 'package:crm_draivfmobileapp/presentation/pages/enquiry/convert_screen/convert_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';
import '../../../../core/constatnts/appcolors.dart';
import '../../../../core/fonts/fonts.dart';
import '../../../../data/models/enquiry_user_model.dart';
import '../../../../widgets/custom_buttons/custom_gradient_button.dart';
import '../edit_enquiry/edit_enquiry_screen.dart';
import '../enquiry_home/add_new_enquiry/add_enquiry.dart';
import '../../../../provider/enquiry_provider/home_enquiry_provider.dart';

class EnquiryHome extends StatefulWidget {
  const EnquiryHome({super.key});

  @override
  State<EnquiryHome> createState() => _EnquiryHomeState();
}

String _formatDate(String dateString) {
  try {
    DateTime date = DateTime.parse(dateString);
    return DateFormat(
      'dd-MM-yyyy hh:mm a',
    ).format(date); // ✅ Shows date + AM/PM
  } catch (e) {
    return "Invalid Date"; // Fallback if parsing fails
  }
}

class _EnquiryHomeState extends State<EnquiryHome> {
  @override
  Widget build(BuildContext context) {
    final homeenquiryprovider = Provider.of<HomeEnquiryProvider>(context);

    return Scaffold(
      drawer: const TabletMobileDrawer(),
      appBar: const CustomAppBar(title: "Enquiry"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: CustomGradientButton(
                    height: 40,
                    width: 150,
                    text: "New Enquiry",
                    icon: Icons.add,
                    onPressed: () {
                      Get.to(() => const AddEnquiry());
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Page size + Export controls
            Row(
              children: [
                // Page size
                Container(
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: SizedBox(
                    height: 35,
                    child: DropdownButton<int>(
                      value: homeenquiryprovider.pageSize,
                      underline: const SizedBox(),
                      isExpanded: true,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconEnabledColor: Colors.black,
                      iconSize: 24,
                      items:
                          [5, 10, 15, 20].map((e) {
                            return DropdownMenuItem<int>(
                              value: e,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "$e",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: AppColor.blackColor,
                                      fontFamily: AppFonts.poppins,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                      onChanged: (val) {
                        if (val != null) {
                          homeenquiryprovider.setPageSize(val);
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // Export popup
                Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 5,
                  ),
                  width: 100,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: PopupMenuButton<String>(
                    onSelected: (value) {
                      homeenquiryprovider.setSelectedAction(value);
                    },
                    itemBuilder: (context) {
                      return homeenquiryprovider.actionItems.map((String item) {
                        return PopupMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.blackColor,
                              fontFamily: AppFonts.poppins,
                            ),
                          ),
                        );
                      }).toList();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Export",
                            style: TextStyle(
                              fontSize: 14,
                              color: AppColor.blackColor,
                              fontFamily: AppFonts.poppins,
                            ),
                          ),
                          const Icon(Icons.arrow_drop_down, size: 20),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 15),

            // Enquiries list (cards)
            Expanded(
              child:
                  homeenquiryprovider.enquiries.isEmpty
                      ? Center(
                        child: Text(
                          "No enquiries found",
                          style: TextStyle(
                            fontFamily: AppFonts.poppins,
                            color: AppColor.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      )
                      : ListView.separated(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        separatorBuilder:
                            (context, index) => const SizedBox(height: 12),
                        itemCount: homeenquiryprovider.enquiries.length,
                        itemBuilder: (context, index) {
                          final Enquiry e =
                              homeenquiryprovider.enquiries[index];
                          return Container(
                            padding: const EdgeInsets.all(14),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColor.gryColor,
                                width: 0.5,
                              ),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // === Top Row: ID & Name ===
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "ID: ${e.id}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 15,
                                        fontFamily: AppFonts.poppins,
                                        color: AppColor.blackColor,
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        e.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15,
                                          fontFamily: AppFonts.poppins,
                                          color: AppColor.blackColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 10),

                                // === Contact Information ===
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Phone & Email Row
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.phone,
                                          size: 16,
                                          color: AppColor.gryColor,
                                        ),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            e.phone,
                                            style: TextStyle(
                                              fontFamily: AppFonts.poppins,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        const Icon(
                                          Icons.email,
                                          size: 16,
                                          color: AppColor.gryColor,
                                        ),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            e.email,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              fontFamily: AppFonts.poppins,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 8),

                                    // Source & Date Row
                                    Row(
                                      children: [
                                        Text(
                                          "Source:",
                                          style: TextStyle(
                                            fontFamily: AppFonts.poppins,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                        Expanded(
                                          child: Text(
                                            e.source,
                                            overflow: TextOverflow.ellipsis,

                                            style: TextStyle(
                                              fontFamily: AppFonts.poppins,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ),
                                        Icon(
                                          Icons.calendar_month_outlined,
                                          size: 16,
                                          color: AppColor.gryColor,
                                        ),
                                        const SizedBox(width: 6),
                                        Text(
                                          _formatDate(e.createdDate),
                                          style: TextStyle(
                                            fontFamily: AppFonts.poppins,
                                            fontSize: 14,
                                          ),
                                        ),
                                        const SizedBox(width: 6),
                                      ],
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 12),
                                Divider(
                                  color: AppColor.gryColor,
                                  thickness: 0.5,
                                  height: 0.5,
                                ),
                                const SizedBox(height: 12),

                                Row(
                                  children: [
                                    Expanded(
                                      flex: 2,
                                      child: CustomGradientButton(
                                        height: 40,
                                        text:
                                            e.isConverted
                                                ? "Converted"
                                                : "Convert Lead",
                                        gradientColors: const [
                                          Color(0xFF42A5F5),
                                          Color(0xFF1565C0),
                                        ],
                                        onPressed: () {
                                          Get.to(() => ConvertScreen());
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      flex: 1,
                                      child: CustomGradientButton(
                                        height: 40,
                                        text: "Edit",
                                        gradientColors: const [
                                          Color(0xFF42A5F5),
                                          Color(0xFF1565C0),
                                        ],
                                        onPressed: () {
                                          Get.to(() => EditEnquiryScreen());
                                        },
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Expanded(
                                      flex: 1,
                                      child: CustomGradientButton(
                                        height: 40,
                                        text: "Delete",
                                        gradientColors: const [
                                          Color(0xFFE53935),
                                          Color(0xFFB71C1C),
                                        ],
                                        onPressed:
                                            () => homeenquiryprovider
                                                .deleteEnquiry(e),
                                      ),
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
        ),
      ),
    );
  }
}
