import 'package:crm_draivfmobileapp/provider/domestic_leads_provider/domestic_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_filechooser_field/upload_box.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AttachmentTabs extends StatelessWidget {
  const AttachmentTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final domesticleaddataprofileprovider =
        Provider.of<DomesticLeadsDataProvider>(context);
    return Column(
      children: [
        const SizedBox(height: 10),
        UploadBox(
          onFilesPicked: (files) {
            // Pass files into provider
            domesticleaddataprofileprovider.setFiles(files);
          },
        ),
        const SizedBox(height: 20),
        Consumer<DomesticLeadsDataProvider>(
          builder: (context, fileProvider, _) {
            if (fileProvider.selectedFiles.isEmpty) {
              return const Text("No files selected");
            }
            return ListView.builder(
              itemCount: fileProvider.selectedFiles.length,
              itemBuilder: (context, index) {
                final file = fileProvider.selectedFiles[index];
                return ListTile(
                  leading: const Icon(Icons.insert_drive_file),
                  title: Text(file.name),
                  subtitle: Text("${file.size} bytes"),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => fileProvider.clearFiles(),
                  ),
                );
              },
            );
          },
        ),
      ],
    );
  }
}
