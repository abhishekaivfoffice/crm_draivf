import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appimages.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/provider/payment_link_provider/payment_link_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_daterange_field.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdownfield_with_selectall_option.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

//payment page
class PaymentLinkPage extends StatelessWidget {
  const PaymentLinkPage({super.key});

  @override
  Widget build(BuildContext context) {
    final paymentlinkprovider = Provider.of<PaymentLinkProvider>(context);
    final users = paymentlinkprovider.currentPageUsers;

    return Scaffold(
      drawer: TabletMobileDrawer(),
      appBar: CustomAppBar(title: "Payment link page"),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 10),
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
                            value: paymentlinkprovider.pageSize,
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
                                paymentlinkprovider.setPageSize(val);
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
                            value: paymentlinkprovider.selectedAction,
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
                                paymentlinkprovider.actionItems.map((e) {
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
                              paymentlinkprovider.setSelectedAction(val);
                            },
                          ),
                        ),
                      ),
                    ),
                    ////

                    ////
                    GestureDetector(
                      onTap: () {
                        paymentlinkprovider.toggleFilters();
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
                                "    Filter    ",
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
            if (paymentlinkprovider.showFilters) ...[
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    //payment status
                    CustomSearchDropdownWithSearch(
                      labelText: "Payment Status",
                      hintText: "Select Payment Status",
                      items: paymentlinkprovider.paymentstatus,
                      selectedValue: paymentlinkprovider.selectedPaymentStatus,
                      onChanged:
                          (vals) => paymentlinkprovider.setPaymentStatus(vals),
                      isMandatory: false,
                    ),
                    const SizedBox(height: 6),

                    CustomDateRangeField(
                      controller: paymentlinkprovider.dateRangeController,
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
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          
                          // First Row (IMM)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              Row(
                                children: [
                                  const Icon(
                                    Icons.description_outlined,
                                    color: Color.fromARGB(171, 0, 0, 0),
                                    size: 20,
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    "Lead ID : ",
                                    style: const TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: Color.fromARGB(171, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    "DRAIVF4352a",
                                    style: const TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: Color.fromARGB(171, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),

                              const SizedBox(width: 4),
                              Container(
                                decoration: BoxDecoration(
                                  color: AppColor.inBoundCallColor,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  child: Text(
                                    "Pending",
                                    style: TextStyle(
                                      color: const Color.fromARGB(
                                        255,
                                        255,
                                        255,
                                        255,
                                      ),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
   // second Row (IMM)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              
                              Row(
                                children: [
                                  const Icon(
                                    Icons.description_outlined,
                                    color: Color.fromARGB(171, 0, 0, 0),
                                    size: 20,
                                  ),
                                  const SizedBox(width: 6),
                                  const Text(
                                    "Name : ",
                                    style: const TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: Color.fromARGB(171, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                  ),
                                  const Text(
                                    "Laxmi Sharma",
                                    style: const TextStyle(
                                      fontFamily: AppFonts.poppins,
                                      color: Color.fromARGB(171, 0, 0, 0),
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),

                         
                            ],
                          ),
                          const SizedBox(height: 12),
                          // Second Row (Original Glass + Price)
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(Icons.window_outlined, size: 20),
                              const SizedBox(width: 6),
                              const Expanded(
                                child: Text("Original Glass (No Exemption)"),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "₹ 8.987,78",
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Text(
                                    "12 Installments",
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),

                          // Third Row (Quick Support Service)
                          Row(
                            children: [
                              const Icon(Icons.build_circle_outlined, size: 20),
                              const SizedBox(width: 6),
                              const Text("Quick Support Service"),
                            ],
                          ),
                          const Divider(thickness: 1, height: 20),

                          // Bottom Row (Economic Car Insurance)
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                "Economic Car Insurance",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "Detail",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );

                  // GestureDetector(
                  //              onTap: () {
                  //     // Navigator.push(
                  //     //   context,
                  //     //   MaterialPageRoute(
                  //     //     builder: (context) => CourseDataProfile(),
                  //     //   ),
                  //     // );
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.symmetric(horizontal: 16,vertical: 4),
                  //     decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(12),
                  //       boxShadow: [
                  //         BoxShadow(
                  //           color: Colors.grey.withOpacity(0.2),
                  //           spreadRadius: 2,
                  //           blurRadius: 8,
                  //           offset: Offset(0, 4),
                  //         ),
                  //       ],
                  //     ),
                  //     child: Row(
                  //       children: [
                  //         Expanded(
                  //           flex: 2,
                  //           child: Padding(
                  //             padding: EdgeInsets.all(16),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               mainAxisSize: MainAxisSize.min,
                  //               children: [
                  //                 // Name and reviews count
                  //                 Row(
                  //                   children: [
                  //                     SvgPicture.asset(
                  //                       AppImages.idicon,
                  //                       width: 20.0,
                  //                       height: 20.0,
                  //                       color: Color.fromARGB(171, 0, 0, 0),
                  //                     ),
                  //                     const SizedBox(width: 8),
                  // Text(
                  //   user.name,
                  //   style: const TextStyle(
                  //     fontFamily: AppFonts.poppins,
                  //     color: Color.fromARGB(171, 0, 0, 0),
                  //     fontSize: 16,
                  //   ),
                  // ),
                  //                   ],
                  //                 ),

                  //                 SizedBox(height: 4),
                  //                 Row(
                  //                   children: [
                  //                     SvgPicture.asset(
                  //                       AppImages.phoneicon,
                  //                       width: 20.0,
                  //                       height: 20.0,
                  //                       color: Color.fromARGB(171, 0, 0, 0),
                  //                     ),
                  //                     const SizedBox(width: 8),
                  //                     Text(
                  //                       user.phone,
                  //                       style: const TextStyle(
                  //                         fontFamily: AppFonts.poppins,
                  //                         color: Color.fromARGB(171, 0, 0, 0),
                  //                         fontSize: 16,
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //                 SizedBox(height: 4),
                  //                 Text(
                  //                   user.city,
                  //                   style: const TextStyle(
                  //                     fontFamily: AppFonts.poppins,
                  //                     color: Color.fromARGB(171, 0, 0, 0),
                  //                     fontSize: 14,
                  //                   ),
                  //                 ),

                  //                 SizedBox(height: 4),

                  //                 Text(
                  //                   user.qualification,
                  //                   style: const TextStyle(
                  //                     fontFamily: AppFonts.poppins,
                  //                     color: Color.fromARGB(171, 0, 0, 0),
                  //                     fontSize: 14,
                  //                   ),
                  //                 ),

                  //                 SizedBox(height: 16),

                  //                 Row(
                  //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                   children: [
                  //                     Center(
                  //                       child: Text(
                  //                         user.createdDate,
                  //                         style: const TextStyle(
                  //                           fontFamily: AppFonts.poppins,
                  //                           color: Color.fromARGB(171, 0, 0, 0),
                  //                           fontSize: 14,
                  //                         ),
                  //                       ),
                  //                     ),

                  //                     SizedBox(width: 8),
                  //                     Container(
                  //                       padding: EdgeInsets.symmetric(
                  //                         horizontal: 8,
                  //                         vertical: 4,
                  //                       ),
                  //                       decoration: BoxDecoration(
                  //                         color: Colors.orange,
                  //                         borderRadius: BorderRadius.circular(12),
                  //                       ),
                  //                       child: Text(
                  //                         user.status,
                  //                         style: TextStyle(
                  //                           color: Colors.white,
                  //                           fontSize: 12,
                  //                           fontFamily: AppFonts.poppins,
                  //                           fontWeight: FontWeight.bold,
                  //                         ),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),

                  //         // Right side - Profile image
                  //         Column(
                  //           children: [
                  //             Container(
                  //               width: 120,
                  //               height: 160,
                  //               decoration: BoxDecoration(
                  //                 borderRadius: BorderRadius.only(
                  //                   topRight: Radius.circular(12),
                  //                 ),
                  //               ),
                  //               child: ClipRRect(
                  //                 borderRadius: BorderRadius.only(
                  //                   topRight: Radius.circular(12),
                  //                 ),
                  //                 child: Image.network(
                  //                   "${user.photo}",
                  //                   fit: BoxFit.cover,
                  //                   errorBuilder: (context, error, stackTrace) {
                  //                     return Container(
                  //                       color: Colors.grey[300],
                  //                       child: Icon(
                  //                         Icons.person,
                  //                         size: 50,
                  //                         color: Colors.grey[600],
                  //                       ),
                  //                     );
                  //                   },
                  //                   loadingBuilder: (
                  //                     context,
                  //                     child,
                  //                     loadingProgress,
                  //                   ) {
                  //                     if (loadingProgress == null) return child;
                  //                     return Container(
                  //                       color: Colors.grey[200],
                  //                       child: Center(
                  //                         child: CircularProgressIndicator(
                  //                           value:
                  //                               loadingProgress.expectedTotalBytes !=
                  //                                       null
                  //                                   ? loadingProgress
                  //                                           .cumulativeBytesLoaded /
                  //                                       loadingProgress
                  //                                           .expectedTotalBytes!
                  //                                   : null,
                  //                         ),
                  //                       ),
                  //                     );
                  //                   },
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               width: 120,

                  //               decoration: BoxDecoration(
                  //                 color: const Color.fromARGB(137, 201, 201, 201),
                  //                 borderRadius: BorderRadius.only(
                  //                   bottomRight: Radius.circular(12),
                  //                 ),
                  //               ),
                  //               child: Padding(
                  //                 padding: const EdgeInsets.symmetric(vertical: 2),
                  //                 child: Center(
                  //                   child: Text(
                  //                     user.empId,
                  //                     style: TextStyle(
                  //                       color: AppColor.blackColor,
                  //                       fontSize: 16,
                  //                       fontWeight: FontWeight.w600,
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // );
                } else {
                  // Show pagination controls (Next + Back) at the bottom
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (paymentlinkprovider
                          .hasPreviousPage) // Show Back only if not on first page
                        ElevatedButton(
                          onPressed: paymentlinkprovider.previousPage,

                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.grey.shade600,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text("← Back"),
                        ),
                      const SizedBox(width: 12),
                      if (paymentlinkprovider
                          .hasNextPage) // Show Next if more pages
                        ElevatedButton(
                          onPressed: paymentlinkprovider.nextPage,
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
        ),
      ),
    );
  }
}
