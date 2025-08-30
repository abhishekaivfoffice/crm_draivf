import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/apptexts.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';

import 'dashborad_chart_provider/chart1_provider.dart';

class Chart1Screen extends StatefulWidget {
  const Chart1Screen({super.key});

  @override
  State<Chart1Screen> createState() => _Chart1ScreenState();
}

class _Chart1ScreenState extends State<Chart1Screen> {
  Future<void> _pickDateRange(BuildContext context) async {
    final provider = context.read<Chart1Provider>();
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      initialDateRange: provider.selectedDateRange,
    );
    if (picked != null) {
      provider.setDateRange(picked);
      await provider.refreshAnimation();
    }
  }

  ChartAxisLabel _xLabelFormatter(
    BuildContext context,
    AxisLabelRenderDetails args,
  ) {
    final provider = context.read<Chart1Provider>();
    final zone = args.text;
    final idx = provider.zones.indexOf(zone);
    if (idx >= 0) {
      final pct =
          provider.targetLeads[idx] == 0
              ? 0
              : ((provider.actualLeads[idx] / provider.targetLeads[idx]) * 100)
                  .toStringAsFixed(1);
      return ChartAxisLabel(
        '$zone ($pct%)',
        const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
      );
    }
    return ChartAxisLabel(args.text, const TextStyle(fontSize: 10));
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<Chart1Provider>();
      provider.resetSelections();
      Future.delayed(const Duration(milliseconds: 300), () {
        provider.targetCtrl?.animate();
        provider.actualCtrl?.animate();
      });
    });
  }

  Widget build(BuildContext context) {
    return Consumer<Chart1Provider>(
      builder: (context, provider, child) {
        final rows = provider.buildRows(zeroPhase: provider.zeroPhase);

        return Scaffold(
          drawer: TabletMobileDrawer(),
          appBar: CustomAppBar(title: "Chart 1"),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Text(
                    AppText.zoneWiseLeadsTargetVsActualLeadsGeneratedWith,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: AppFonts.poppins,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Achievement - Count: ${provider.achievementCount}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      fontFamily: AppFonts.poppins,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Calendar + Source Dropdown
                  Row(
                    children: [
                      // Calendar Picker
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () => _pickDateRange(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today,
                                  size: 18,
                                  color: AppColor.primaryColor2,
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    provider.selectedDateRange == null
                                        ? "Select Date"
                                        : "${provider.selectedDateRange!.start.toString().substring(0, 10)} → ${provider.selectedDateRange!.end.toString().substring(0, 10)}",
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: AppFonts.poppins,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Dropdown for Source
                      Flexible(
                        flex: 1,
                        child: DropdownSearch<String>(
                          items: provider.sources,
                          selectedItem: provider.selectedSource,
                          onChanged: (value) async {
                            provider.setSelectedSource(value);
                            await provider.refreshAnimation();
                          },
                          popupProps: PopupProps.menu(
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                              style: const TextStyle(
                                fontFamily: AppFonts.poppins, // ✅ Custom font
                                fontSize: 14,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Search Source",
                                hintStyle: const TextStyle(
                                  fontFamily:
                                      AppFonts
                                          .poppins, // ✅ Custom font for hint
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Colors.grey,
                                    width: 1,
                                  ),
                                ),
                              ),
                            ),
                            itemBuilder: (context, item, isSelected) {
                              return ListTile(
                                title: Text(
                                  item,
                                  style: const TextStyle(
                                    fontFamily:
                                        AppFonts
                                            .poppins, // ✅ Custom font for items
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            },
                          ),
                          dropdownDecoratorProps: DropDownDecoratorProps(
                            dropdownSearchDecoration: InputDecoration(
                              labelText: "Select Source",
                              labelStyle: const TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                            ),
                          ),
                          dropdownBuilder: (context, selectedItem) {
                            return Text(
                              selectedItem ?? "Select Source",
                              style: TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 14,
                                fontWeight:
                                    selectedItem == null
                                        ? FontWeight.normal
                                        : FontWeight.w600,
                                color:
                                    selectedItem == null
                                        ? Colors.grey
                                        : Colors.black,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Chart
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: 800,
                      height: 600,
                      child: SfCartesianChart(
                        legend: Legend(
                          isVisible: true,
                          textStyle: const TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onLegendTapped: (args) {
                          if (args.seriesIndex == 0) {
                            provider.toggleTargetVisibility();
                          } else if (args.seriesIndex == 1) {
                            provider.toggleActualVisibility();
                          }
                        },
                        tooltipBehavior: TooltipBehavior(enable: true),
                        primaryXAxis: CategoryAxis(
                          labelRotation: 315,
                          axisLabelFormatter:
                              (args) => _xLabelFormatter(context, args),
                          majorGridLines: const MajorGridLines(width: 0),
                          axisLine: const AxisLine(width: 0.6),
                          labelStyle: const TextStyle(
                            fontFamily:
                                AppFonts.poppins, // ✅ Change X-axis label font
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                        primaryYAxis: NumericAxis(
                          title: AxisTitle(
                            text: 'Number of Leads',
                            textStyle: const TextStyle(
                              fontFamily:
                                  AppFonts
                                      .poppins, // ✅ Change Y-axis title font
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                          majorGridLines: const MajorGridLines(width: 0.5),
                          labelStyle: const TextStyle(
                            fontFamily:
                                AppFonts.poppins, // ✅ Change Y-axis label font
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),

                        series: <CartesianSeries<ZoneRow, String>>[
                          ColumnSeries<ZoneRow, String>(
                            name: 'Target Leads',
                            dataSource: provider.isTargetVisible ? rows : [],
                            xValueMapper: (r, _) => r.zone,
                            yValueMapper: (r, _) => r.target,
                            color: Colors.orange,
                            width: 0.6,
                            spacing: 0.1,
                            animationDuration: 800,

                            borderRadius: BorderRadius.circular(4),
                            onRendererCreated:
                                (ctrl) => provider.targetCtrl = ctrl,
                            dataLabelSettings: const DataLabelSettings(
                              textStyle: TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              isVisible: true,
                            ),
                          ),
                          ColumnSeries<ZoneRow, String>(
                            name: 'Actual Leads',
                            dataSource: provider.isActualVisible ? rows : [],
                            xValueMapper: (r, _) => r.zone,
                            yValueMapper: (r, _) => r.actual,
                            color: Colors.deepOrange,
                            width: 0.6,
                            spacing: 0.1,
                            animationDuration: 800,

                            borderRadius: BorderRadius.circular(4),
                            onRendererCreated:
                                (ctrl) => provider.actualCtrl = ctrl,
                            dataLabelSettings: const DataLabelSettings(
                              textStyle: TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                              isVisible: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
