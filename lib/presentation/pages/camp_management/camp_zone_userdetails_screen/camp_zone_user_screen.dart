import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constatnts/appcolors.dart';
import '../../../../core/fonts/fonts.dart';
import '../../../../widgets/custom_textfield/Custom_date_field.dart';
import '../../../../widgets/custom_textfield/custom_dropdown_with_search.dart';
import 'camp_userdetails_provider.dart';

class CampZoneUserScreen extends StatelessWidget {
  const CampZoneUserScreen({super.key});

  @override
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
          ],
        ),
        SizedBox(height: 20),

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
              const SizedBox(height: 15),
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
                hintText: "Select marriage date",
                labelText: "Marriage at",
                isMandatory: false,
              ),
              SizedBox(height: 6),
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "Location",
                items: campuserdetailsprovider.campeType,
                selectedValue: campuserdetailsprovider.selectedcampeType,
                onChanged: campuserdetailsprovider.setSelectedcampeType,
                hintText: "Select Location",
              ),
            ],
          ),
        ],
      ],
    );
  }
}
