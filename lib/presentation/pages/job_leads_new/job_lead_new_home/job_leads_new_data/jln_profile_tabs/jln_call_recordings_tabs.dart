import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_job_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/custom_file_chooser_field.dart';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class JLNCallRecordingTabs extends StatelessWidget {
  const JLNCallRecordingTabs({super.key});

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
        CustomFileChooserField(
          labelText: "Call Recordings",
          isMandatory: true,
          selectedFile:
              domesticleaddataprofileprovider.selectedCallRecordingFile,
          allowedExtensions: ["PDF"],
          onFilePicked: (file) {
            if (file != null) {
              domesticleaddataprofileprovider.setCallRecordingFileFile(file);
            }
          },
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
