import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Chart7Screen extends StatefulWidget {
  const Chart7Screen({super.key});

  @override
  State<Chart7Screen> createState() => _Chart7ScreenState();
}

class _Chart7ScreenState extends State<Chart7Screen> {
  DateTimeRange? selectedDateRange;

  late List<_ChartData> chartData;
  TooltipBehavior? _tooltipBehavior;
  final Set<String> _selectedLegends = {};


  // ✅ Store series controllers for animation
  final List<ChartSeriesController> _seriesControllers = [];
  final TextEditingController _zoneSearchController = TextEditingController();

  String? selectedZone;
  String? selectedSource;
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

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);
    chartData = [
      _ChartData("Not Specified", 1171, 24, 500, 100, 7, 3),
      _ChartData("International", 1171, 15, 500, 100, 56, 14),
      _ChartData("West2 TN", 1044, 114, 67, 90, 12, 19),
      _ChartData("AP & Vellore", 1171, 1000, 500, 100, 67, 34),
      _ChartData("West1 TN", 1171, 1000, 500, 100, 19, 20),
      _ChartData("South TN", 1044, 114, 11, 4, 9, 4),
      _ChartData("Kerala", 1171, 34, 500, 100, 23, 20),
      _ChartData("Central TN", 1416, 236, 57, 2, 12, 56),
      _ChartData("Karnataka", 1171, 1000, 23, 100, 12, 17),
      _ChartData("Chennai", 1171, 1000, 12, 100, 16, 78),
    ];
  }

  int get totalCount {
    return chartData.fold(
      0,
      (sum, data) =>
          sum +
          data.productA.toInt() +
          data.productB.toInt() +
          data.productC.toInt() +
          data.productD.toInt() +
          data.whatsapp.toInt() +
          data.otherSource.toInt(),
    );
  }

  int calculateZoneTotal(_ChartData data) {
    return (data.productA +
            data.productB +
            data.productC +
            data.productD +
            data.whatsapp +
            data.otherSource)
        .toInt();
  }

  int get selectedLegendsTotal {
    if (_selectedLegends.isEmpty) {
      return chartData.fold(0, (sum, data) =>
      sum + data.productA.toInt() + data.productB.toInt() + data.productC.toInt());
    }

    return chartData.fold(0, (sum, data) {
      double temp = 0;
      if (_selectedLegends.contains("Facebook")) temp += data.productA;
      if (_selectedLegends.contains("Walking Scheduled")) temp += data.productB;
      if (_selectedLegends.contains("Walking completed")) temp += data.productC;
      return sum + temp.toInt();
    });
  }


  Future<void> _pickDateRange() async {
    final picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
      initialDateRange: selectedDateRange,
    );

    if (picked != null) {
      setState(() {
        selectedDateRange = picked;
      });

      _refreshAnimation();
    }
  }

  void _refreshAnimation() {
    for (var controller in _seriesControllers) {
      controller.animate(); // 🔄 Animate each series
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Chart 7"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          child: Column(
            children: [
              Text(
                "Source Walkins (Zone Wise) - Count: $selectedLegendsTotal ",
                style: TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              // 📅 Date Range + Count Row
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: _pickDateRange,
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
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
                                        ? "Select date range"
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
                      Flexible(
                        flex: 1,
                        child: DropdownSearch<String>(
                          items: sources,
                          selectedItem: selectedSource,
                          popupProps: PopupProps.menu(
                            showSearchBox: true,
                            itemBuilder: (context, item, isSelected) {
                              return ListTile(
                                title: Text(
                                  item,
                                  style: const TextStyle(
                                    fontFamily: AppFonts.poppins,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            },
                            searchFieldProps: TextFieldProps(
                              cursorColor: Colors.grey,
                              style: const TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                              decoration: InputDecoration(
                                hintText: "Search Source",
                                hintStyle: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                  fontFamily: AppFonts.poppins,
                                ),
                                isDense:
                                    false, // ✅ Ensures full height for search box
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 14, // ✅ Increased vertical padding
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
                              ),
                            ),
                            fit: FlexFit.loose,
                            constraints: const BoxConstraints(
                              maxHeight: 350,
                            ), // ✅ Increased height
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
                                vertical: 14, // ✅ Increased padding here too
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
                          onChanged: (value) {
                            setState(() {
                              selectedSource = value;
                            });
                            _refreshAnimation(); // ✅ Don't use await here
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // 📊 Syncfusion Chart
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 550,
                  width: MediaQuery.of(context).size.width,
                  child: SfCartesianChart(
                    title: ChartTitle(
                      textStyle: const TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                    legend: Legend(
                      isVisible: true,
                      position: LegendPosition.top,
                      textStyle: const TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onLegendTapped: (LegendTapArgs args) {
                      setState(() {
                        final legendName = args.series.name;
                        if (_selectedLegends.contains(legendName)) {
                          _selectedLegends.remove(legendName);
                        } else {
                          _selectedLegends.add(legendName);
                        }
                      });
                    },
                    tooltipBehavior: _tooltipBehavior,
                    primaryXAxis: CategoryAxis(
                      // majorGridLines: const MajorGridLines(width: 0),
                      labelStyle: const TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 10,
                      ),
                    ),
                    primaryYAxis: NumericAxis(
                      title: AxisTitle(
                        text: "Total Walk-ins",
                        textStyle: const TextStyle(
                          fontFamily: AppFonts.poppins,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                      interval: 100,
                      labelStyle: const TextStyle(
                        fontFamily: AppFonts.poppins,
                        fontSize: 12,
                      ),
                      edgeLabelPlacement: EdgeLabelPlacement.shift,

                      // 👇 Add this property to increase label width
                      maximumLabelWidth:
                          80, // You can increase this if numbers are big
                    ),
                    series: <StackedBarSeries<_ChartData, String>>[
                      _buildStackedSeries("Facebook", (data) => data.productA),
                      _buildStackedSeries(
                        "Walking Scheduled",
                        (data) => data.productB,
                      ),
                      _buildStackedSeries(
                        "Walking completed",
                        (data) => data.productC,
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

  /// ✅ Helper method for stacked bar chart series
  StackedBarSeries<_ChartData, String> _buildStackedSeries(
    String name,
    double Function(_ChartData) valueMapper,
  ) {
    // 🎨 Define custom color for each series
    Color seriesColor;

    switch (name) {
      case "Facebook":
        seriesColor = AppColor.metaColor; // ✅ Custom color for Meta
        break;
      case "Walking Scheduled":
        seriesColor = Colors.blue;
        break;
      case "Walking Completed":
        seriesColor = Colors.green;
        break;
      case "Inbound Call":
        seriesColor = AppColor.inBoundCallColor;
        break;
      case "Whatsapp":
        seriesColor = Colors.teal;
        break;
      case "Other Source":
        seriesColor = Colors.purple;
        break;
      default:
        seriesColor = Colors.grey;
    }

    return StackedBarSeries<_ChartData, String>(
      dataSource: chartData,
      onRendererCreated: (controller) {
        _seriesControllers.add(controller); // ✅ Store controller for animation
      },
      xValueMapper:
          (_ChartData data, _) => "${data.zone} (${calculateZoneTotal(data)})",
      yValueMapper: (_ChartData data, _) => valueMapper(data),
      name: name,
      color: seriesColor, // 🎨 Apply custom color
      width: 0.7,
      spacing: 0.1,
      dataLabelSettings: DataLabelSettings(
        isVisible: true,
        builder: (data, point, series, pointIndex, seriesIndex) {
          return Text(
            "${valueMapper(data).toInt()}",
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              fontFamily: AppFonts.poppins,
            ),
          );
        },
      ),
    );
  }
}

class _ChartData {
  final String zone;
  final double productA;
  final double productB;
  final double productC;
  final double productD;
  final double whatsapp;
  final double otherSource;

  _ChartData(
    this.zone,
    this.productA,
    this.productB,
    this.productC,
    this.productD,
    this.whatsapp,
    this.otherSource,
  );
}
