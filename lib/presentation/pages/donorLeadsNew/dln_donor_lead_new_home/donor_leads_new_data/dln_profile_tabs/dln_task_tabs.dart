import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/widgets/custom_buttons/custom_profile_button.dart';
import 'package:flutter/material.dart';

class DLNTaskTabs extends StatelessWidget {
  const DLNTaskTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),

        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Wife Photo",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
        const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Husband Photo",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Aadhar (Wife)",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Aadhar (Husband)",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Marriage Certificate",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Divorce Document",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Birth Certificate",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Pan Card",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
        //  const Divider(height: 1),

         Container(
          width: double.infinity,
          color: const Color.fromARGB(48, 68, 137, 255),
          
          child: Padding(
           padding: const EdgeInsets.symmetric(vertical: 10),
           child: Center(child: Text(" Clinical Details",style: TextStyle(fontSize: 18,fontFamily: AppFonts.poppins, fontWeight: FontWeight.bold,),)),
         )),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "ART Enrollment",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "TV Scan",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Semen Test",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Serology",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "BBT",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "TFT",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Cardiac Fitness",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "ECG",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Informed Consent",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Donor Consent",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Donor Bond",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "OPU Summary",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Prescriptions",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
          const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Embryo Summary",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
          const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Reports",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
         const Divider(height: 1),
        CustomProfileButton(
          icon: Icons.credit_card,
          title: "Insurance Claim",
          onTap: () {
            // Navigate to cards screen
          },
          onDownload: () {
            print("Download tapped");
          },
        ),
        
      ],
    );
  }
}
