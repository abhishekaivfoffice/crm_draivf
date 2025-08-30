import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Chart1Provider extends ChangeNotifier {
  // ----- Data -----
  final List<String> zones = [
    "Chennai",
    "Karnataka",
    "Central TN",
    "Kerala",
    "South TN",
    "West1 TN",
    "AP & Vellore",
    "West2 TN",
  ];

  final List<int> targetLeads = [1950, 1201, 1500, 1577, 600, 1400, 1200, 1000];
  final List<int> actualLeads = [1245, 981, 1635, 1500, 401, 1064, 673, 507];

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

  // ----- UI State -----
  String? selectedSource;
  DateTimeRange? selectedDateRange;
  bool isTargetVisible = true;
  bool isActualVisible = true;
  bool zeroPhase = false;

  // ----- Chart Controllers -----
  ChartSeriesController? targetCtrl;
  ChartSeriesController? actualCtrl;

  // ----- Computed Properties -----
  int get totalTarget => targetLeads.fold(0, (sum, val) => sum + val);
  int get totalActual => actualLeads.fold(0, (sum, val) => sum + val);

  int get achievementCount {
    if (isTargetVisible && isActualVisible) {
      return totalTarget + totalActual;
    } else if (isTargetVisible) {
      return totalTarget;
    } else if (isActualVisible) {
      return totalActual;
    } else {
      return 0;
    }
  }

  // ----- Methods -----

  /// Builds chart rows (used in ColumnSeries)
  List<ZoneRow> buildRows({bool zeroPhase = false}) {
    return List.generate(zones.length, (i) {
      final t = zeroPhase ? 0.0 : targetLeads[i].toDouble();
      final a = zeroPhase ? 0.0 : actualLeads[i].toDouble();
      final pct =
          targetLeads[i] == 0 ? 0.0 : (actualLeads[i] / targetLeads[i]) * 100.0;
      return ZoneRow(zone: zones[i], target: t, actual: a, pct: pct);
    });
  }

  /// Toggles the visibility of Target Leads series
  void toggleTargetVisibility() {
    isTargetVisible = !isTargetVisible;
    notifyListeners();
  }

  /// Toggles the visibility of Actual Leads series
  void toggleActualVisibility() {
    isActualVisible = !isActualVisible;
    notifyListeners();
  }

  /// Updates selected source
  void setSelectedSource(String? source) {
    selectedSource = source;
    notifyListeners();
  }

  /// Updates selected date range
  void setDateRange(DateTimeRange? range) {
    selectedDateRange = range;
    notifyListeners();
  }

  /// Resets date and source selections
  void resetSelections() {
    selectedSource = null;
    selectedDateRange = null;
    notifyListeners();
  }

  /// Refreshes chart animation (zero → actual)
  Future<void> refreshAnimation() async {
    zeroPhase = true;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 30));
    targetCtrl?.animate();
    actualCtrl?.animate();

    await Future.delayed(const Duration(milliseconds: 300));
    zeroPhase = false;
    notifyListeners();

    await Future.delayed(const Duration(milliseconds: 16));
    targetCtrl?.animate();
    actualCtrl?.animate();
  }

  /// Placeholder for API integration
  Future<void> fetchChartDataFromApi() async {
    // TODO: Fetch data from API, update targetLeads, actualLeads, sources
    // After fetching:
    // notifyListeners();
  }
}

/// Chart Row Model
class ZoneRow {
  final String zone;
  final double target;
  final double actual;
  final double pct;

  ZoneRow({
    required this.zone,
    required this.target,
    required this.actual,
    required this.pct,
  });
}
