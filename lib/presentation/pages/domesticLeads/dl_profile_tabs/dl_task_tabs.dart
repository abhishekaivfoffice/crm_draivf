import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class DLTaskTabs extends StatelessWidget {
  const DLTaskTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 18),
        CustomGradientButton(
          icon: Icons.add,
          height: 40,
          width: 190,
          text: "New Task",
          onPressed: () {
           Get.toNamed(AppRoutes.addNewTaskScreen);
          },
        ),
        const SizedBox(height: 10),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal, // allow horizontal scroll
          child: DataTable(
            headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
            border: TableBorder(
              horizontalInside: BorderSide(
                color: Colors.grey.shade300,
                width: 1,
              ),
            ),
            columns: const [
              DataColumn(label: Text("#")),
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Status")),
              DataColumn(label: Text("Start Date")),
              DataColumn(label: Text("Due Date")),
              DataColumn(label: Text("Assigned to")),
              DataColumn(label: Text("Tags")),
              DataColumn(label: Text("Priority")),
            ],
            rows: const [
              DataRow(
                cells: [
                  DataCell(Text("1")),
                  DataCell(Text("Project Alpha")),
                  DataCell(Text("In Progress")),
                  DataCell(Text("01-Sep-2025")),
                  DataCell(Text("10-Sep-2025")),
                  DataCell(Text("John Doe")),
                  DataCell(Text("Frontend")),
                  DataCell(Text("High")),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("2")),
                  DataCell(Text("Project Beta")),
                  DataCell(Text("Not Started")),
                  DataCell(Text("05-Sep-2025")),
                  DataCell(Text("15-Sep-2025")),
                  DataCell(Text("Jane Smith")),
                  DataCell(Text("Backend")),
                  DataCell(Text("Medium")),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("3")),
                  DataCell(Text("Project Gamma")),
                  DataCell(Text("Completed")),
                  DataCell(Text("20-Aug-2025")),
                  DataCell(Text("30-Aug-2025")),
                  DataCell(Text("Alice")),
                  DataCell(Text("API")),
                  DataCell(Text("Low")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
