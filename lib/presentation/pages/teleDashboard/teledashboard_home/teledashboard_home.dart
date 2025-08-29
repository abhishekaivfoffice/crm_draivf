import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';

import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/teleDashboard/teledashboard_chart/tele_chart_1.dart';
import 'package:crm_draivfmobileapp/presentation/pages/teleDashboard/teledashboard_chart/tele_chart_2.dart';
import 'package:crm_draivfmobileapp/presentation/pages/teleDashboard/teledashboard_chart/tele_chart_3.dart';
import 'package:crm_draivfmobileapp/presentation/pages/teleDashboard/teledashboard_chart/tele_chart_4.dart';
import 'package:flutter/material.dart';



class TeleDashboradScreen extends StatelessWidget {
  const TeleDashboradScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // 🔹 List of chart buttons with title, screen, and icons
    final List<Map<String, dynamic>> chartButtons = [
      {
        "title": "Zone-wise Performance",
        "screen": TeleChart1(),
        "icon": Icons.show_chart,
      },
      {
        "title": "Centre-wise Performance",
        "screen": TeleChart2(),
        "icon": Icons.bar_chart,
      },
      {
        "title": "Zone-wise Source Split",
        "screen": TeleChart3(),
        "icon": Icons.trending_up,
      },
      {
        "title": "Centre-wise Source Split",
        "screen": TeleChart4Screen(),
        "icon": Icons.people_alt,
      },
    ];

    return Scaffold(
       drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Teledashboard"),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: GridView.builder(
          itemCount: chartButtons.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // ✅ 2 buttons per row
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, index) {
            // ✅ Animation Controller per Card
            final animationController = AnimationController(
              duration: const Duration(milliseconds: 600),
              vsync: Navigator.of(context),
            )..forward();

            final animation = CurvedAnimation(
              parent: animationController,
              curve: Interval(index * 0.1, 1.0, curve: Curves.easeOutBack),
            );

            return ScaleTransition(
              scale: animation,
              child: FadeTransition(
                opacity: animation,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: const Duration(milliseconds: 600),
                        pageBuilder:
                            (_, __, ___) => chartButtons[index]["screen"],
                        transitionsBuilder: (_, anim, __, child) {
                          return FadeTransition(
                            opacity: anim,
                            child: ScaleTransition(
                              scale: Tween<double>(
                                begin: 0.9,
                                end: 1.0,
                              ).animate(
                                CurvedAnimation(
                                  parent: anim,
                                  curve: Curves.easeOutBack,
                                ),
                              ),
                              child: child,
                            ),
                          );
                        },
                      ),
                    );
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColor.primaryColor1.withOpacity(0.9),
                          AppColor.primaryColor2,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(3, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          chartButtons[index]["icon"],
                          color: Colors.white,
                          size: 42,
                        ),
                        const SizedBox(height: 12),
                        Text(
                          chartButtons[index]["title"],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontFamily: AppFonts.poppins,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Text(
                            "View Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
