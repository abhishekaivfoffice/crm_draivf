import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:provider/provider.dart';
import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';
import '../../../../widgets/custom_buttons/custom_gradient_button.dart';
import '../camp_zone_userdetails_screen/camp_zone_user_screen.dart';
import '../new_comp_add/new_camp_provider.dart';
import '../new_comp_add/new_camp_screen.dart';

class CampHomeScreen extends StatelessWidget {
  const CampHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final newcampprovider = Provider.of<NewCampProvider>(context);

    return Scaffold(
      drawer: const TabletMobileDrawer(),
      appBar: const CustomAppBar(title: "Camp"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomGradientButton(
                      height: 40,
                      width: 150,
                      text: "New Camp",
                      icon: Icons.add,
                      onPressed: () {
                        Get.to(() => const NewCampScreen());
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15,),
              CampZoneUserScreen(),

            ],
          ),
        ),
      ),
    );
  }
}
