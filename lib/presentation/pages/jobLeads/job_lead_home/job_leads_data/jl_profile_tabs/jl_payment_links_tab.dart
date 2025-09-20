import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/provider/job_leads_provider/jl_job_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_gradient_button.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_large_textfield.dart';
import 'package:crm_draivfmobileapp/widgets/custom_textfield/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class JLPaymentLinksTab extends StatelessWidget {
  const JLPaymentLinksTab({super.key});

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
        Text(
          "Create Payment Link",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.blackColor,
            fontFamily: AppFonts.poppins,
          ),
        ),
        const SizedBox(height: 10),
        CustomTextField(
          controller: domesticleaddataprofileprovider.totalAmountController,
          hintText: "enter total amount",
          labelText: "Total Amount",
          isMandatory: true,
        ),
        const SizedBox(height: 6),
        CustomLargeTextField(
          controller: domesticleaddataprofileprovider.descriptionController,
          hintText: "enter description",
          labelText: "Description",
          isMandatory: true,
        ),
        const SizedBox(height: 16),
        CustomGradientButton(          width:  screenWidth / 2,

          height: 40,
          text: "Submit",
          onPressed: () {
            // submit action
          },
        ),
        const SizedBox(height: 16),
        Text(
          "Payment Link Sent List ",
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: AppColor.blackColor,
            fontFamily: AppFonts.poppins,
          ),
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
              DataColumn(label: Text("SL No")),
              DataColumn(label: Text("REF No")),
              DataColumn(label: Text("Amount")),
              DataColumn(label: Text("Payment Link")),
              DataColumn(label: Text("Created At")),
            ],
            rows: const [
              DataRow(
                cells: [
                  DataCell(Text("1")),
                  DataCell(Text("1243")),
                  DataCell(Text("7687800")),
                  DataCell(Text("00000")),
                  DataCell(Text("https://www.xyz.//")),
                  DataCell(Text("23-07-2025")),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("2")),
                  DataCell(Text("1243")),
                  DataCell(Text("7687800")),
                  DataCell(Text("00000")),
                  DataCell(Text("https://www.xyz.//")),
                  DataCell(Text("23-07-2025")),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(Text("3")),
                  DataCell(Text("1243")),
                  DataCell(Text("7687800")),
                  DataCell(Text("00000")),
                  DataCell(Text("https://www.xyz.//")),
                  DataCell(Text("23-07-2025")),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
