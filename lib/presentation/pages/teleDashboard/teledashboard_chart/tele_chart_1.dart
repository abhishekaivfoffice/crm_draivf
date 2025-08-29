import 'package:crm_draivfmobileapp/core/constatnts/appcolors.dart';
import 'package:crm_draivfmobileapp/core/fonts/fonts.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class TeleChart1 extends StatefulWidget {
  const TeleChart1({super.key});

  @override
  State<TeleChart1> createState() => _TeleChart1State();
}

class _TeleChart1State extends State<TeleChart1> {
  DateTimeRange? selectedDateRange;
  TooltipBehavior? _tooltipBehavior;

  String? selectedZone;
  String? selectedSource;
  String? selectedTeleCaller;
  final List<ChartSeriesController> _seriesControllers = [];

  final TextEditingController _zoneSearchController = TextEditingController();
  final TextEditingController _teleCallerSearchController =
      TextEditingController();

  List<ChartData> allChartData = []; // Original full data
  List<ChartData> filteredChartData = [];

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

  final List<String> teleCallers = [
    "Vishali",
    "Rakshany",
    "Varitha",
    "Nilani",
    "Kanchana",
  ];

  late List<_ChartData> chartData;
  late List<_ChartData> displayedChartData;
  void _filterChartData() {
    setState(() {
      if (selectedTeleCaller != null && selectedTeleCaller!.isNotEmpty) {
        displayedChartData =
            chartData.where((data) => data.name == selectedTeleCaller).toList();
      } else {
        displayedChartData = List.from(chartData);
      }
    });
    _refreshAnimation();
  }

  @override
  void initState() {
    super.initState();
    _tooltipBehavior = TooltipBehavior(enable: true);

    chartData = [
      _ChartData("Vishali", 29, 23, 77, 5, 42),
      _ChartData("Rakshany", 10, 4, 12, 31, 23),
      _ChartData("Varitha", 1, 1, 3, 5, 0),
      _ChartData("Nilani", 4, 5, 24, 15, 7),
      _ChartData("Kanchana", 14, 4, 14, 21, 25),
    ];

    displayedChartData = List.from(chartData);
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
      controller.animate();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor2,
        centerTitle: true,
        title: const Text(
          "Zone-wise performance logs",
          style: TextStyle(
            fontFamily: AppFonts.poppins,
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        child: Column(
          children: [
            // Filters Row - Date Range, Zone, Type
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
                SizedBox(width: 5),
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
                              selectedItem == null ? Colors.grey : Colors.black,
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
            SizedBox(height: 15),
            Row(
              children: [
                Flexible(
                  child: DropdownSearch<String>(
                    items: const [
                      "All",
                      "Assigned Branch",
                    ], // ✅ Added "All", "New", "Old"
                    selectedItem:
                        selectedSource ??
                        "All", // ✅ Default selection set to "All"
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
                                  AppFonts.poppins, // ✅ Custom font applied
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
                      _refreshAnimation();
                    },
                  ),
                ),
                SizedBox(width: 10),

                Expanded(
                  child: DropdownButtonFormField2<String>(
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
                        vertical: 14,
                      ),
                    ),

                    // 🔹 Dropdown items
                    items:
                        teleCallers.map((user) {
                          return DropdownMenuItem(
                            value: user,
                            child: Text(
                              user,
                              style: const TextStyle(
                                fontFamily: AppFonts.poppins,
                                fontSize: 14,
                              ),
                            ),
                          );
                        }).toList(),

                    // 🔹 On selecting a value
                    onChanged: (value) {
                      setState(() {
                        selectedTeleCaller = value;
                        _filterChartData(); // ✅ Apply filtering here
                      });
                      _refreshAnimation(); // 🔄 Animate chart after selection
                    },

                    // 🔹 Enable Search
                    dropdownSearchData: DropdownSearchData(
                      searchController: _teleCallerSearchController,
                      searchInnerWidgetHeight: 50,
                      searchInnerWidget: Container(
                        height: 70,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 8,
                        ),
                        child: TextField(
                          controller: _teleCallerSearchController,
                          decoration: InputDecoration(
                            isDense: true,
                            contentPadding: const EdgeInsets.all(14),
                            hintText: 'Search user...',

                            hintStyle: TextStyle(
                              fontSize: 14,
                              fontFamily: AppFonts.poppins,
                            ),
                            border: OutlineInputBorder(
                              borderSide: const BorderSide(
                                color: Colors.grey,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ),
                      searchMatchFn: (item, searchValue) {
                        return item.value.toString().toLowerCase().contains(
                          searchValue.toLowerCase(),
                        );
                      },
                    ),

                    // 🔹 Clear search text when dropdown closes
                    onMenuStateChange: (isOpen) {
                      if (!isOpen) {
                        _teleCallerSearchController.clear();
                      }
                    },
                  ),
                ),
              ],
            ),

            // Source + TeleCaller Filters
            const SizedBox(height: 15),

            // Stacked Column Chart
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SizedBox(
                height: 450,
                width: MediaQuery.of(context).size.width * 1.2,
                child: SfCartesianChart(
                  legend: Legend(
                    isVisible: true,
                    position: LegendPosition.top,
                    textStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: AppFonts.poppins,
                    ),
                  ),
                  tooltipBehavior: _tooltipBehavior,
                  primaryXAxis: CategoryAxis(
                    labelStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: AppFonts.poppins,
                    ),
                  ),
                  primaryYAxis: NumericAxis(
                    title: AxisTitle(
                      text: "Number of Leads",
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontFamily: AppFonts.poppins,
                      ),
                    ),
                    labelStyle: const TextStyle(
                      fontSize: 12,
                      fontFamily: AppFonts.poppins,
                    ),
                  ),
                  series: <StackedColumnSeries<_ChartData, String>>[
                    _buildStackedColumn(
                      "Walk-in Scheduled",
                      (data) => data.walkInScheduled,
                      Colors.blue,
                    ),
                    _buildStackedColumn(
                      "Walk-ins Done",
                      (data) => data.walkInsDone,
                      Colors.teal,
                    ),
                    _buildStackedColumn(
                      "Not Interested",
                      (data) => data.notInterested,
                      Colors.purple,
                    ),
                    _buildStackedColumn(
                      "Junk",
                      (data) => data.junk,
                      Colors.orange,
                    ),
                    _buildStackedColumn(
                      "Interested (Hot)",
                      (data) => data.interestedHot,
                      Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  StackedColumnSeries<_ChartData, String> _buildStackedColumn(
    String name,
    num Function(_ChartData) valueMapper,
    Color color,
  ) {
    return StackedColumnSeries<_ChartData, String>(
      dataSource: displayedChartData,
      xValueMapper: (data, _) => data.name,
      yValueMapper: (data, _) => valueMapper(data),
      name: name,
      color: color,
      width: displayedChartData.length == 1 ? 0.3 : 0.6, // ✅ Auto adjust width
      dataLabelSettings: const DataLabelSettings(isVisible: true),
      animationDuration: 1000,
      onRendererCreated: (controller) {
        if (!_seriesControllers.contains(controller)) {
          _seriesControllers.add(controller);
        }
      },
    );
  }
}

class _ChartData {
  final String name;
  final double walkInScheduled;
  final double walkInsDone;
  final double notInterested;
  final double junk;
  final double interestedHot;

  _ChartData(
    this.name,
    this.walkInScheduled,
    this.walkInsDone,
    this.notInterested,
    this.junk,
    this.interestedHot,
  );
}

class ChartData {
  final String user;
  final String zone;
  final double walkInScheduled;
  final double walkInsDone;
  final double notInterested;
  final double junk;
  final double interestedHot;

  ChartData({
    required this.user,
    required this.zone,
    required this.walkInScheduled,
    required this.walkInsDone,
    required this.notInterested,
    required this.junk,
    required this.interestedHot,
  });
}
