import 'package:crm_draivfmobileapp/provider/internationallead_provider/Inl_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/custom_file_chooser_field.dart';

import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
//course lead call recording tab
class CourseCallRecordingTabs extends StatelessWidget {
  const CourseCallRecordingTabs({super.key});

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width;

    final domesticleaddataprofileprovider =
        Provider.of<InlDataProvider>(context);
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
