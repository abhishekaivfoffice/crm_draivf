import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';
import '../../../../core/constatnts/appcolors.dart';
import '../../../../core/fonts/fonts.dart';
import '../../../../data/models/enquiry_user_model.dart';
import '../../../../widgets/custom_buttons/custom_gradient_button.dart';
import 'add_new_enquiry/add_enquiry.dart';
import 'home_enquiry_provider.dart';


class EnquiryHome extends StatefulWidget {
  const EnquiryHome({super.key});

  @override
  State<EnquiryHome> createState() => _EnquiryHomeState();
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
            // New Enquiry button
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
                      items: [5, 10, 15, 20].map((e) {
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
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
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
              child: homeenquiryprovider.enquiries.isEmpty
                  ? Center(
                child: Text(
                  "No enquiries found",
                  style: TextStyle(
                    fontFamily: AppFonts.poppins,
                    color: AppColor.blackColor,
                  ),
                ),
              )
                  : ListView.builder(
                itemCount: homeenquiryprovider.enquiries.length,
                itemBuilder: (context, index) {
                  final Enquiry e = homeenquiryprovider.enquiries[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // header: id + name + action badges
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  "#${e.id}   ${e.name}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    fontFamily: AppFonts.poppins,
                                    color: AppColor.blackColor,
                                  ),
                                ),
                              ),
                              // Converted/Convert button
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                  e.isConverted ? Colors.green : Colors.blue,
                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                                ),
                                onPressed: () => homeenquiryprovider.toggleConverted(e),
                                child: Text(
                                  e.isConverted ? "Converted" : "Convert Lead",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Edit
                              IconButton(
                                icon: const Icon(Icons.edit, color: Colors.blue),
                                onPressed: () {
                                  // implement edit navigation
                                  Get.snackbar("Edit", "Edit ${e.name}");
                                },
                              ),
                              // Delete
                              IconButton(
                                icon: const Icon(Icons.delete, color: Colors.red),
                                onPressed: () => homeenquiryprovider.deleteEnquiry(e),
                              ),
                            ],
                          ),

                          const SizedBox(height: 8),

                          // details rows
                          Wrap(
                            runSpacing: 6,
                            spacing: 12,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.phone, size: 16),
                                  const SizedBox(width: 6),
                                  Text(e.phone, style: TextStyle(fontFamily: AppFonts.poppins)),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.email, size: 16),
                                  const SizedBox(width: 6),
                                  Text(e.email, style: TextStyle(fontFamily: AppFonts.poppins)),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.source, size: 16),
                                  const SizedBox(width: 6),
                                  Text(e.source, style: TextStyle(fontFamily: AppFonts.poppins)),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Icon(Icons.calendar_today, size: 16),
                                  const SizedBox(width: 6),
                                  Text(e.createdDate, style: TextStyle(fontFamily: AppFonts.poppins)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
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
