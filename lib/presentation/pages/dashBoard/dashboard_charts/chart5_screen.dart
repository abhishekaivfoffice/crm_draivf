import 'package:crm_draivfmobileapp/core/components/appbar/appbar.dart';
import 'package:crm_draivfmobileapp/core/components/drawer/drawer.dart';
import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Chart5Screen extends StatefulWidget {
  const Chart5Screen({super.key});

  @override
  State<Chart5Screen> createState() => _Chart5ScreenState();
}

class _Chart5ScreenState extends State<Chart5Screen> {
  DateTimeRange? selectedDateRange;

  late List<_ChartData> chartData;
  TooltipBehavior? _tooltipBehavior;

  // ✅ Store series controllers for animation
  final List<ChartSeriesController> _seriesControllers = [];
  final Set<String> _selectedLegends = {};

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);

    // Dummy chart data
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
    if (_selectedLegends.isEmpty) return totalCount;

    return chartData.fold(0, (sum, data) {
      double temp = 0;
      if (_selectedLegends.contains("Meta")) temp += data.productA;
      if (_selectedLegends.contains("Google")) temp += data.productB;
      if (_selectedLegends.contains("Website")) temp += data.productC;
      if (_selectedLegends.contains("Inbound Call")) temp += data.productD;
      if (_selectedLegends.contains("Whatsapp")) temp += data.whatsapp;
      if (_selectedLegends.contains("Other Source")) temp += data.otherSource;
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

      appBar: CustomAppBar(title: "Chart 5"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
          child: Column(
            children: [
              const Text(
                "Zone-wise All Lead Sources Split-up Graph",
                style: TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: _pickDateRange,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
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
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 14,
                      ),
                      child: Center(
                        child: Text(
                          "Total Count: $selectedLegendsTotal",
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: AppFonts.poppins,
                          ),
                        ),
                      ),
                    ),
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
                      _buildStackedSeries("Meta", (data) => data.productA),
                      _buildStackedSeries("Google", (data) => data.productB),
                      _buildStackedSeries("Website", (data) => data.productC),
                      _buildStackedSeries(
                        "Inbound Call",
                        (data) => data.productD,
                      ),
                      _buildStackedSeries("Whatsapp", (data) => data.whatsapp),
                      _buildStackedSeries(
                        "Other Source",
                        (data) => data.otherSource,
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
      case "Meta":
        seriesColor = AppColor.metaColor; // ✅ Custom color for Meta
        break;
      case "Google":
        seriesColor = Colors.blue;
        break;
      case "Website":
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
