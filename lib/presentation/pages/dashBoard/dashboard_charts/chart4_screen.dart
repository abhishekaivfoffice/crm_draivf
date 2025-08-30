
import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/constatnts/apptexts.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart4Screen extends StatefulWidget {
  const Chart4Screen({super.key});

  @override
  State<Chart4Screen> createState() => _Chart4ScreenState();
}

class _Chart4ScreenState extends State<Chart4Screen> {
  // ----- sample data -----
  final List<String> zones = [
    "Sholinganallur",
    "Madipakkam",
    "Urapakkam",
    "Kanchipuram",
    "Thiruvallur",
    "Tambaram",
    "Vadapalani",
    "Villupuram",
    "Chengalpattu",
    "Chennai",
  ];
  final List<int> targetLeads = [1950, 1201, 1500, 1577, 600, 1400, 1200, 1000,128,156];
  final List<int> actualLeads = [1245, 981, 1635, 1500, 401, 1064, 673, 507,156,190];

  final List<String> sources = [
    "Google Ads",
    "Facebook",
    "Instagram",
    "LinkedIn",
    "YouTube",
    "Twitter",
    "Email Campaign",
    "Referral",
    "Organic Search",
    "Website",
    "Events",
    "Others",
  ];
  final List<String> zoneList = [
    "CHENNAI",
    "KARNATAKA",
    "CENTRAL TN",
    "KERALA",
    "SOUTH TN",
    "WEST 1 TN",
    "AP & VELLORE",
    "WEST 2 TN",
    "INTERNATIONAL",
    "Not Specified",
  ];

  // ----- UI state -----
  String? selectedSource;
  DateTimeRange? selectedDateRange;
  String? selectedZone;
  String? selectedLocation;
  final TextEditingController _zoneSearchController = TextEditingController();
  bool _isTargetVisible = true;
  bool _isActualVisible = true;
  int get totalTarget => targetLeads.fold(0, (sum, val) => sum + val);
  int get totalActual => actualLeads.fold(0, (sum, val) => sum + val);

  // ----- chart controllers to trigger animation -----
  ChartSeriesController? _targetCtrl;
  ChartSeriesController? _actualCtrl;

  // when true we draw zero-height bars, then switch back to real values
  bool _zeroPhase = false;

  // Build the zone rows used by the chart
  List<_ZoneRow> _buildRows({required bool zeroPhase}) {
    return List.generate(zones.length, (i) {
      final t = zeroPhase ? 0.0 : targetLeads[i].toDouble();
      final a = zeroPhase ? 0.0 : actualLeads[i].toDouble();
      final pct =
          targetLeads[i] == 0 ? 0.0 : (actualLeads[i] / targetLeads[i]) * 100.0;
      return _ZoneRow(zone: zones[i], target: t, actual: a, pct: pct);
    });
  }

  // Axis label formatter to show "Zone (xx.x%)"
  ChartAxisLabel _xLabelFormatter(AxisLabelRenderDetails args) {
    final zone = args.text;
    final idx = zones.indexOf(zone);
    if (idx >= 0) {
      final pct =
          targetLeads[idx] == 0
              ? 0
              : ((actualLeads[idx] / targetLeads[idx]) * 100).toStringAsFixed(
                1,
              );
      return ChartAxisLabel(
        '$zone ($pct%)',
        const TextStyle(fontSize: 10, fontWeight: FontWeight.w600),
      );
    }
    return ChartAxisLabel(args.text, const TextStyle(fontSize: 10));
  }

  // Play a refresh animation: down (to zero) then up (to values)
  Future<void> _refreshAnimation() async {
    if (!mounted) return;
    setState(() => _zeroPhase = true);
    await Future.delayed(const Duration(milliseconds: 30));
    _targetCtrl?.animate();
    _actualCtrl?.animate();

    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    setState(() => _zeroPhase = false);
    // give one frame for rebuild, then animate up
    await Future.delayed(const Duration(milliseconds: 16));
    _targetCtrl?.animate();
    _actualCtrl?.animate();
  }

  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      initialDateRange: selectedDateRange,
    );
    if (picked != null) {
      setState(() => selectedDateRange = picked);
      await _refreshAnimation();
    }
  }

  int get achievementCount {
    if (_isTargetVisible && _isActualVisible) {
      return totalTarget + totalActual; // Both visible → Show total sum
    } else if (_isTargetVisible && !_isActualVisible) {
      return totalTarget; // Only target visible
    } else if (!_isTargetVisible && _isActualVisible) {
      return totalActual; // Only actual visible
    } else {
      return 0; // If both hidden
    }
  }

  @override
  Widget build(BuildContext context) {
    final rows = _buildRows(zeroPhase: _zeroPhase);
    final int totalActual = actualLeads.fold(0, (sum, item) => sum + item);

    return Scaffold(
        drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Chart 4"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            children: [
              const Text(
                AppText.branchWiseActualLeadsVsWalkingLeads,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: AppFonts.poppins,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                "Achievement - Count: $achievementCount",
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  fontFamily: AppFonts.poppins,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 16),

              // Calendar + dropdown + Save
              Column(
                children: [
                  Row(
                    children: [
                      // Calendar Picker
                      Flexible(
                        flex: 1,
                        child: GestureDetector(
                          onTap: _pickDateRange,
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
                                    selectedDateRange == null
                                        ? "Select Date"
                                        : "${selectedDateRange!.start.toString().substring(0, 10)} → ${selectedDateRange!.end.toString().substring(0, 10)}",
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
                          items: const ["All", "New", "Old"],
                          // ✅ Added "All", "New", "Old"
                          selectedItem: selectedSource ?? "All",
                          // ✅ Default selection set to "All"
                          popupProps: PopupProps.menu(
                            showSearchBox:
                                false, // ✅ Hide search, since we only have 3 items
                            fit: FlexFit.loose,
                            constraints: const BoxConstraints(maxHeight: 200),
                            itemBuilder: (context, item, isSelected) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 10,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isSelected
                                          ? Colors.blue.withOpacity(0.1)
                                          : Colors.transparent,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontFamily:
                                        AppFonts
                                            .poppins, // ✅ Custom font applied
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
                              labelText: "Filter Leads",
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
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 12,
                              ),
                            ),
                          ),
                          dropdownBuilder: (context, selectedItem) {
                            return Text(
                              selectedItem ?? "All",
                              style: TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            );
                          },
                          onChanged: (value) async {
                            setState(() {
                              selectedSource = value ?? "All";
                            });

                            // ✅ Refresh your chart whenever dropdown changes
                            await _refreshAnimation();
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  DropdownButtonFormField2<String>(
                    value: selectedZone,
                    isExpanded: true,
                    decoration: InputDecoration(
                      labelText: "Select Zone",
                      labelStyle: const TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color:
                            Colors.grey, // ✅ Prevent color change when clicked
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.grey, // ✅ Same color when not focused
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                          // ✅ Prevent color change when clicked
                          width: 1,
                        ),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                    ),

                    // ✅ Enable search functionality
                    dropdownSearchData: DropdownSearchData(
                      searchController: _zoneSearchController,
                      searchInnerWidgetHeight: 10,
                      searchInnerWidget: Padding(
                        padding: const EdgeInsets.all(8),
                        child: TextField(
                          cursorColor: Colors.grey,
                          controller: _zoneSearchController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 14,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                            ),
                            hintText: 'Search zone...',
                            hintStyle: const TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.poppins,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value!.toLowerCase().contains(
                          searchValue.toLowerCase(),
                        );
                      },
                    ),

                    // ✅ Clear search when dropdown closes
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        _zoneSearchController.clear();
                      }
                    },

                    // ✅ Populate dropdown items
                    items:
                        zoneList.map((String zone) {
                          return DropdownMenuItem<String>(
                            value: zone,
                            child: Text(
                              zone,
                              style: const TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          );
                        }).toList(),

                    // ✅ Update selected value
                    onChanged: (value) async {
                      setState(() {
                        selectedZone = value;
                      });
                      await _refreshAnimation();
                    },
                  ),
                ],
              ),

              const SizedBox(height: 14),

              // Chart
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: 640,
                  height: 500,
                  child: SfCartesianChart(
                    legend: Legend(
                      isVisible: true,
                      textStyle: const TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    onLegendTapped: (LegendTapArgs args) {
                      setState(() {
                        if (args.seriesIndex == 0) {
                          _isTargetVisible = !_isTargetVisible;
                        } else if (args.seriesIndex == 1) {
                          _isActualVisible = !_isActualVisible;
                        }
                      });
                    },
                    tooltipBehavior: TooltipBehavior(
                      enable: true,
                      textStyle: const TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    primaryXAxis: CategoryAxis(
                      labelRotation: 315,
                      labelIntersectAction: AxisLabelIntersectAction.rotate45,
                      axisLabelFormatter: _xLabelFormatter,
                      majorGridLines: const MajorGridLines(width: 0),
                      axisLine: const AxisLine(width: 0.6),
                      labelStyle: const TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    primaryYAxis: NumericAxis(
                      title: AxisTitle(
                        text: 'Number of Leads',
                        textStyle: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                      majorGridLines: const MajorGridLines(width: 0.5),
                      axisLine: const AxisLine(width: 0),
                      labelStyle: const TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 10,
                      ),
                    ),

                    series: <CartesianSeries<_ZoneRow, String>>[
                      ColumnSeries<_ZoneRow, String>(
                        name: 'Actual  Leads',
                        dataSource: rows,
                        xValueMapper: (r, _) => r.zone,
                        yValueMapper: (r, _) => r.target,
                        width: 0.6,
                        spacing: 0.1,
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(4),
                        onRendererCreated: (ctrl) => _targetCtrl = ctrl,
                        animationDuration: 800,

                        // ✅ SHOW LEAD COUNT ON TOP OF BARS
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.outer,
                          textStyle: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      ColumnSeries<_ZoneRow, String>(
                        name: 'Walking Leads',
                        dataSource: rows,
                        xValueMapper: (r, _) => r.zone,
                        yValueMapper: (r, _) => r.actual,
                        width: 0.6,
                        spacing: 0.1,
                        color: Colors.deepOrange,
                        borderRadius: BorderRadius.circular(4),
                        onRendererCreated: (ctrl) => _actualCtrl = ctrl,
                        animationDuration: 800,

                        // ✅ SHOW LEAD COUNT ON TOP OF BARS
                        dataLabelSettings: const DataLabelSettings(
                          isVisible: true,
                          labelAlignment: ChartDataLabelAlignment.outer,
                          textStyle: TextStyle(
                            fontFamily: AppFonts.poppins,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
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
  }
}

// simple row model
class _ZoneRow {
  final String zone;
  final double target;
  final double actual;
  final double pct;

  _ZoneRow({
    required this.zone,
    required this.target,
    required this.actual,
    required this.pct,
  });
}
