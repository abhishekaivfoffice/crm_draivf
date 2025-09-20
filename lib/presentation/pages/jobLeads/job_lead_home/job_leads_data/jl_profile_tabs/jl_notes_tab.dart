import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_job_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_datefield_with_time.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class JLNotesTab extends StatelessWidget {
  const JLNotesTab({super.key});

  @override
  Widget build(BuildContext context) {
            double screenWidth = MediaQuery.of(context).size.width;

    final domesticleaddataprofileprovider =
        Provider.of<JlJobLeadsDataProvider>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        
        const SizedBox(height: 10),
        CustomLargeTextField(
          controller: domesticleaddataprofileprovider.notesController,
          hintText: "enter notes",
          labelText: "Notes",
          isMandatory: true,
        ),
        const SizedBox(height: 6),
          CustomDateFieldWithTime(
          controller: domesticleaddataprofileprovider.dateContactedController,
          hintText: "enter date contacted",
          labelText: "Date Contacted",
          isMandatory: true,
        ),
      
        const SizedBox(height: 16),
        CustomGradientButton(
                    width:  screenWidth / 2,

          height: 40,
          text: "Submit",
          onPressed: () {
            // submit action
          },
        ),
        const SizedBox(height: 16),
    
        const SizedBox(height: 10),
        
      ],
    );
  }
}