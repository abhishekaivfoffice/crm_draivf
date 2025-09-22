import 'package:crm_draivfmobileapp/provider/job_leads_new_provider/jln_job_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_dropdown_with_search.dart';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class JLNEmailTabs extends StatelessWidget {
  const JLNEmailTabs({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    final domesticleaddataprofileprovider =
        Provider.of<JlNJobLeadsDataProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10),
        // CustomSearchDropdownWithSearch(
        //   isMandatory: false,
        //   labelText: "Language",
        //   items: domesticleaddataprofileprovider.language,
        //   selectedValue: domesticleaddataprofileprovider.selectedLanguage,
        //   onChanged: domesticleaddataprofileprovider.setSelectedLanguage,
        //   hintText: "Select language",
        // ),
        //  const SizedBox(height: 10),
        CustomSearchDropdownWithSearch(
          isMandatory: false,
          labelText: "Template",
          items: domesticleaddataprofileprovider.template,
          selectedValue: domesticleaddataprofileprovider.selectedTemplate,
          onChanged: domesticleaddataprofileprovider.setSelectedTemplate,
          hintText: "Select template",
        ),
        const SizedBox(height: 16),
        CustomGradientButton(
          width: screenWidth / 2,
          height: 40,
          text: "Send Email",
          onPressed: () {
            // submit action
          },
        ),

      ],
    );
  }
}
