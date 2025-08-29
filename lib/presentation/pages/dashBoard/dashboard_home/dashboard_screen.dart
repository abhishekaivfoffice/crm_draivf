
import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_charts/chart1_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_charts/chart2_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_charts/chart3_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_charts/chart4_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_charts/chart5_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_charts/chart6_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_charts/chart7_screen.dart';
import 'package:crm_draivfmobileapp/presentation/pages/dashBoard/dashboard_charts/chart8_screen.dart';
import 'package:flutter/material.dart';


class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;

  final List<Widget> chartPages = [
    Chart1Screen(),
    Chart2Screen(),
    Chart3Screen(),
    Chart4Screen(),
    Chart5Screen(),
    Chart6Screen(),
    Chart7Screen(),
    Chart8Screen(),
  ];

  final List<String> chartTitles = [
    "Zone Leads: Target vs Actual",
    "Centre Leads: Target vs Actual",
    "Zone Leads vs Walk-ins",
    "Branch Leads vs Walk-ins",
    "Zone Lead Sources",
    "Centre Lead Sources",
    "Zone Walk-in Sources",
    "Branch Walk-in Sources",
  ];

  final List<IconData> chartIcons = [
    Icons.show_chart,
    Icons.bar_chart,
    Icons.stacked_line_chart,
    Icons.pie_chart,
    Icons.trending_up,
    Icons.attach_money,
    Icons.people,
    Icons.analytics,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Dashboard"),

      body: _buildChartsTab(),
    );
  }

  /// **Charts Tab with Animated Cards**
  Widget _buildChartsTab() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: ListView(
        children: [
          const SizedBox(height: 16),

          // ✅ Custom Animated Grid (No flutter_staggered_animations)
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1,
            ),
            itemCount: chartPages.length,
            itemBuilder: (context, index) {
              // Fade + Scale animation with staggered delay
              final animationController = AnimationController(
                duration: const Duration(milliseconds: 600),
                vsync: Navigator.of(context),
              )..forward();

              final animation = CurvedAnimation(
                parent: animationController,
                curve: Interval(
                  (index * 0.1), // Stagger delay
                  1.0,
                  curve: Curves.easeOutBack,
                ),
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
                          pageBuilder: (_, __, ___) => chartPages[index],
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
                        borderRadius: BorderRadius.circular(18),
                        gradient: LinearGradient(
                          colors: [
                            AppColor.primaryColor1.withOpacity(0.9),
                            AppColor.primaryColor2,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 8,
                            offset: const Offset(2, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            chartIcons[index],
                            color: Colors.white,
                            size: 40,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            chartTitles[index],
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
        ],
      ),
    );
  }
}
