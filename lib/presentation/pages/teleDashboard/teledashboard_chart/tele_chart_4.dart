import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../../core/components/appbar/appbar.dart';
import '../../../../core/components/drawer/drawer.dart';


class TeleChart4Screen extends StatefulWidget {
  const TeleChart4Screen({super.key});

  @override
  State<TeleChart4Screen> createState() => _TeleChart4ScreenState();
}

class _TeleChart4ScreenState extends State<TeleChart4Screen> {
  DateTimeRange? selectedDateRange;
  late List<ChartData> chartData;
  late List<ChartData> displayedChartData;
  String? selectedZone;

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

  final List<String> zoneList = [
    "CHENNAI",
    "KARNATAKA",
    "CENTRAL TN",
    "KERALA",
    "SOUTH TN",
    "WEST 1 TN",
    "AP & VELLORE",
    "WEST 2 TN",
  ];

  final TextEditingController _teleCallerSearchController = TextEditingController();
  final TextEditingController _zoneSearchController = TextEditingController();

  final Set<String> _selectedLegends = {};
  final List<ChartSeriesController> _seriesControllers = [];

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);

    chartData = [
      ChartData("CHENNAI - SHOLINGANALLUR", "Vishali", 1171.0, 24.0, 500.0, 100.0, 7.0, 3.0),
      ChartData("CHENNAI - MADIPAKKAM", "Rakshany", 1171.0, 15.0, 500.0, 100.0, 56.0, 14.0),
      ChartData("CHENNAI - URAPAKKAM", "Varitha", 1044.0, 114.0, 67.0, 90.0, 12.0, 19.0),
      ChartData("KANCHIPURAM", "Nilani", 1171.0, 1000.0, 500.0, 100.0, 67.0, 34.0),
      ChartData("CHENNAI - THIRUVALLUR", "Kanchana", 1171.0, 1000.0, 500.0, 100.0, 19.0, 20.0),
      ChartData("CHENNAI - TAMBARAM", "Vishali", 1044.0, 114.0, 11.0, 4.0, 9.0, 4.0),
      ChartData("CHENNAI - VADAPALANI", "Rakshany", 1171.0, 34.0, 500.0, 100.0, 23.0, 20.0),
      ChartData("VILLUPURAM", "Varitha", 1416.0, 236.0, 57.0, 2.0, 12.0, 56.0),
      ChartData("CHENGALPATTU", "Nilani", 1171.0, 1000.0, 23.0, 100.0, 12.0, 17.0),
    ];

    displayedChartData = List.from(chartData);
  }

  void _filterChartData() {
    setState(() {
      if (selectedTeleCaller != null && selectedTeleCaller!.isNotEmpty) {
        displayedChartData = chartData.where((data) => data.teleCaller == selectedTeleCaller).toList();
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
    if (_selectedLegends.isEmpty) {
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

    return chartData.fold(0, (sum, data) {
      double temp = 0;
      if (_selectedLegends.contains("Facebook")) temp += data.productA;
      if (_selectedLegends.contains("Walking Scheduled")) temp += data.productB;
      if (_selectedLegends.contains("Walking completed")) temp += data.productC;
      if (_selectedLegends.contains("Not Interested")) temp += data.productD;
      if (_selectedLegends.contains("Junk")) temp += data.whatsapp;
      if (_selectedLegends.contains("Interested (Hot)")) temp += data.otherSource;
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
              "Centre-wise split up of all tele callers – source wise split up - Count: $selectedLegendsTotal",
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
              value: selectedZone,
              isExpanded: true,
              decoration: InputDecoration(
                labelText: "Select Zone",
                labelStyle: const TextStyle(
                  fontFamily: AppFonts.poppins,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                  color: Colors.grey, // ✅ Prevent color change when clicked
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey, width: 1),
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
                    color: Colors.grey, // ✅ Prevent color change when clicked
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
                      hintText: 'Search zone...',
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontFamily: AppFonts.poppins,
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
              onChanged: (value) {
                setState(() {
                  selectedZone = value;
                  _filterChartData(); // ✅ Apply filtering here
                });
                _refreshAnimation(); // ✅ Don't use await here
              },
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 550,
                width: MediaQuery.of(context).size.width,
                child: SfCartesianChart(
                  legend: Legend(
                    isVisible: true,
                    position: LegendPosition.top,
                    toggleSeriesVisibility: true,
                  ),
                  onLegendTapped: (LegendTapArgs args) {
                    setState(() {
                      final name = args.series.name ?? '';
                      if (_selectedLegends.contains(name)) {
                        _selectedLegends.remove(name);
                      } else {
                        _selectedLegends.add(name);
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  StackedBarSeries<ChartData, String> _buildStackedSeries(
      String name,
      double Function(ChartData) valueMapper,
      ) {
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
        seriesColor = Colors.orange;
        break;
      case "Interested (Hot)":
        seriesColor = Colors.purple;
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

  ChartData(
      this.zone,
      this.teleCaller,
      this.productA,
      this.productB,
      this.productC,
      this.productD,
      this.whatsapp,
      this.otherSource,
      );
}
