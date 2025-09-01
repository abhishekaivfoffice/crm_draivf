import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import '../../../../../core/components/appbar/appbar.dart';
import '../../../../../core/components/drawer/drawer.dart';
import '../../../../../widgets/custom_buttons/custom_gradient_button.dart';
import '../../../../../widgets/custom_textfield/custom_dropdown_with_search.dart';
import '../../../../../widgets/custom_textfield/custom_textfield.dart';
import 'add_enquiry_provider.dart';

class AddEnquiry extends StatefulWidget {
  const AddEnquiry({super.key});

  @override
  State<AddEnquiry> createState() => _AddEnquiryState();
}

class _AddEnquiryState extends State<AddEnquiry> {
  @override
  Widget build(BuildContext context) {
    final addenquiryprovider = Provider.of<AddEnquiryProvider>(context);

    return Scaffold(
      drawer: TabletMobileDrawer(),
      appBar: CustomAppBar(title: "Add Enquiry"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field
              CustomTextField(
                controller: addenquiryprovider.nameController,
                keyboardType: TextInputType.emailAddress,
                hintText: "Enter address",
                labelText: "Address",
                isMandatory: false,
              ),
              const SizedBox(height: 15),

              // Phone Field
              CustomTextField(
                keyboardType: TextInputType.phone,
                controller: addenquiryprovider.phoneNumberController,
                hintText: "Enter Phone Number",
                labelText: "Phone",
                isMandatory: false,
              ),
              const SizedBox(height: 15),

              // Source Dropdown
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "source",
                items: addenquiryprovider.source,
                selectedValue: addenquiryprovider.selectedsources,
                onChanged: addenquiryprovider.setSelectedsources,
                hintText: "Select Status",
              ),
              const SizedBox(height: 15),

              CustomTextField(
                controller: addenquiryprovider.emailAddressController,
                hintText: "Enter address",
                labelText: "Address",
                isMandatory: false,
              ),
              const SizedBox(height: 30),
              CustomGradientButton(
                width: MediaQuery.of(context).size.width,
                text: "Save",
                onPressed: () {
                  Get.to(() => const AddEnquiry());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
