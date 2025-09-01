import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';

import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';
import '../../../../widgets/custom_buttons/custom_gradient_button.dart';
import '../../../../widgets/custom_textfield/custom_dropdown_with_search.dart';
import '../../../../widgets/custom_textfield/custom_textfield.dart';
import '../enquiry_home/add_new_enquiry/add_enquiry.dart';
import 'edit_enquiry_provider_screen.dart';

class EditEnquiryScreen extends StatelessWidget {
  const EditEnquiryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final editenquiryprovider = Provider.of<EditEnquiryProvider>(context);
    return Scaffold(
      drawer: TabletMobileDrawer(),
      appBar: CustomAppBar(title: "Edit Enquiry"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Name Field
              CustomTextField(
                controller: editenquiryprovider.nameController,
                hintText: "Enter Your Name",
                labelText: "Name",
                isMandatory: false,
              ),
              const SizedBox(height: 15),

              // Phone Field
              CustomTextField(
                controller: editenquiryprovider.phoneNumberController,
                hintText: "Type Your Number",
                labelText: "Phone Number",
                isMandatory: false,
              ),
              const SizedBox(height: 15),

              // Source Dropdown
              CustomSearchDropdownWithSearch(
                isMandatory: true,
                labelText: "source",
                items: editenquiryprovider.source,
                selectedValue: editenquiryprovider.selectedsources,
                onChanged: editenquiryprovider.setSelectedsources,
                hintText: "Select Status",
              ),
              const SizedBox(height: 15),

              CustomTextField(
                controller: editenquiryprovider.emailAddressController,
                hintText: "Enter Your Email",
                labelText: "Email Address",
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
