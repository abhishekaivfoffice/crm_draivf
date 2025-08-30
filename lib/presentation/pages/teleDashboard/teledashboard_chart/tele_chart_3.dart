import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';


class TeleChart3 extends StatefulWidget {
  const TeleChart3({super.key});

  @override
  State<TeleChart3> createState() => _TeleChart3State();
}

class _TeleChart3State extends State<TeleChart3> {
  DateTimeRange? selectedDateRange;
  late List<ChartData> chartData;
  late List<ChartData> displayedChartData;

  TooltipBehavior? _tooltipBehavior;
  String? selectedTeleCaller;
  String? selectedSource;

  final List<String> teleCallers = [
    "Vishali",
    "Rakshany",
    "Varitha",
    "Nilani",
    "Kanchana",
  ];

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

  final TextEditingController _teleCallerSearchController =
  TextEditingController();

  final Set<String> _selectedLegends = {};
  final List<ChartSeriesController> _seriesControllers = [];

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);

    chartData = [
      ChartData("Not Specified", "Vishali", 1171, 24, 500, 100, 7, 3),
      ChartData("International", "Rakshany", 1171, 15, 500, 100, 56, 14),
      ChartData("West2 TN", "Varitha", 1044, 114, 67, 90, 12, 19),
      ChartData("AP & Vellore", "Nilani", 1171, 1000, 500, 100, 67, 34),
      ChartData("West1 TN", "Kanchana", 1171, 1000, 500, 100, 19, 20),
      ChartData("South TN", "Vishali", 1044, 114, 11, 4, 9, 4),
      ChartData("Kerala", "Rakshany", 1171, 34, 500, 100, 23, 20),
      ChartData("Central TN", "Varitha", 1416, 236, 57, 2, 12, 56),
      ChartData("Karnataka", "Nilani", 1171, 1000, 23, 100, 12, 17),
      ChartData("Chennai", "Kanchana", 1171, 1000, 12, 100, 16, 78),
    ];

    displayedChartData = List.from(chartData);
  }

  void _filterChartData() {
    setState(() {
      if (selectedTeleCaller != null && selectedTeleCaller!.isNotEmpty) {
        displayedChartData = chartData
            .where((data) => data.teleCaller == selectedTeleCaller)
            .toList();
      } else {
        displayedChartData = List.from(chartData);
      }
    });
    _refreshAnimation();
  }

  void _refreshAnimation() {
    for (var controller in _seriesControllers) {
      controller.animate();
    }
  }

  int calculateZoneTotal(ChartData data) {
    return (data.productA +
        data.productB +
        data.productC +
        data.productD +
        data.whatsapp +
        data.otherSource)
        .toInt();
  }

  int get selectedLegendsTotal {
    // If nothing is selected → count everything
    if (_selectedLegends.isEmpty) {
      return displayedChartData.fold(
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

    // Otherwise, calculate only selected legends
    return displayedChartData.fold(0, (sum, data) {
      double temp = 0;
      if (_selectedLegends.contains("Facebook")) temp += data.productA;
      if (_selectedLegends.contains("Walking Scheduled")) temp += data.productB;
      if (_selectedLegends.contains("Walking completed")) temp += data.productC;
      if (_selectedLegends.contains("Not Interested")) temp += data.productD;
      if (_selectedLegends.contains("Junk")) temp += data.whatsapp;
      if (_selectedLegends.contains("Interested (Hot)"))
        temp += data.otherSource;
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: TabletMobileDrawer(),

      appBar: CustomAppBar(title: "Chart 1"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              "Zone-wise all tele callers sources split up graph - Count: $selectedLegendsTotal",
              style: const TextStyle(
                fontFamily: AppFonts.poppins,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 15),
            Row(
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
                const SizedBox(width: 10),
                Flexible(
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
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 14,
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
                      constraints: const BoxConstraints(maxHeight: 350),
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
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      setState(() {
                        selectedSource = value;
                      });
                      _refreshAnimation();
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            DropdownButtonFormField2<String>(
              value: selectedTeleCaller,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: "Tele Callers",
                labelStyle: const TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 14,
                ),
              ),
              items: teleCallers
                  .map((user) => DropdownMenuItem(
                value: user,
                child: Text(
                  user,
                  style: const TextStyle(
                    fontFamily: AppFonts.poppins,
                    fontSize: 14,
                  ),
                ),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  selectedTeleCaller = value;
                  _filterChartData();
                });
              },
              dropdownSearchData: DropdownSearchData(
                searchController: _teleCallerSearchController,
                searchInnerWidgetHeight: 50,
                searchInnerWidget: Container(
                  height: 70,
                  padding: const EdgeInsets.all(8),
                  child: TextField(
                    controller: _teleCallerSearchController,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: const EdgeInsets.all(14),
                      hintText: 'Search user...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                searchMatchFn: (item, searchValue) {
                  final value = item.value ?? '';
                  return value
                      .toLowerCase()
                      .contains(searchValue.toLowerCase());
                },
              ),
              onMenuStateChange: (isOpen) {
                if (!isOpen) _teleCallerSearchController.clear();
              },
            ),
            const SizedBox(height: 12),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SizedBox(
            height: 550,
            width: MediaQuery.of(context).size.width,
            child: SfCartesianChart(
              // 1. Define your legend
              legend: Legend(
                isVisible: true,
                position: LegendPosition.top,
                toggleSeriesVisibility: true,
              ),

              // 2. Attach the legend tap callback on the chart itself
              onLegendTapped: (LegendTapArgs args) {
                setState(() {
                  final seriesName = args.series.name;
                  if (_selectedLegends.contains(seriesName)) {
                    _selectedLegends.remove(seriesName);
                  } else {
                    _selectedLegends.add(seriesName);
                  }
                });
              },

              tooltipBehavior: _tooltipBehavior,
              primaryXAxis: CategoryAxis(),
              primaryYAxis: NumericAxis(
                title: AxisTitle(text: "Total Walk-ins"),
                interval: 100,
              ),

              series: <StackedBarSeries<ChartData, String>>[
                _buildStackedSeries("Facebook", (data) => data.productA),
                _buildStackedSeries("Walking Scheduled", (data) => data.productB),
                _buildStackedSeries("Walking completed", (data) => data.productC),
                _buildStackedSeries("Not Interested", (data) => data.productD),
                _buildStackedSeries("Junk", (data) => data.whatsapp),
                _buildStackedSeries("Interested (Hot)", (data) => data.otherSource),
              ],
            )

          ),
        ),
          ],
        ),
      ),
    );
  }

  StackedBarSeries<ChartData, String> _buildStackedSeries(
      String name, double Function(ChartData) valueMapper) {
    Color seriesColor;
    switch (name) {
      case "Facebook":
        seriesColor = AppColor.metaColor;
        break;
      case "Walking Scheduled":
        seriesColor = Colors.blue;
        break;
      case "Walking completed":
        seriesColor = Colors.green;
        break;
      case "Not Interested":
        seriesColor = Colors.red;
        break;
      case "Junk":
        seriesColor = Colors.grey;
        break;
      case "Interested (Hot)":
        seriesColor = Colors.orange;
        break;
      default:
        seriesColor = Colors.grey;
    }


    return StackedBarSeries<ChartData, String>(
      dataSource: displayedChartData,
      onRendererCreated: (controller) => _seriesControllers.add(controller),
      xValueMapper: (data, _) => "${data.zone} (${calculateZoneTotal(data)})",
      yValueMapper: (data, _) => valueMapper(data),
      name: name,
      color: seriesColor,
      dataLabelSettings: const DataLabelSettings(isVisible: true),
    );
  }
}

class ChartData {
  final String zone;
  final String teleCaller;
  final double productA;
  final double productB;
  final double productC;
  final double productD;
  final double whatsapp;
  final double otherSource;

  ChartData(this.zone, this.teleCaller, this.productA, this.productB,
      this.productC, this.productD, this.whatsapp, this.otherSource);
}
