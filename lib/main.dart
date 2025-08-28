import 'package:crm_draivfmobileapp/core/routes/routes.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/add_lead_page/add_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/domestic_leads_data/domestic_leads_data_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/domestic_lead_home/domestic_leads_home.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/domestic_lead_home/domestic_leads_homeprovider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/domestic_leads/domestic_leads_home/import_lead/import_leads_provider.dart';
import 'package:crm_draivfmobileapp/presentation/pages/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginProvider()),
        ChangeNotifierProvider(create: (_) => AddLeadsProvider()),
        ChangeNotifierProvider(create: (_) => ImportLeadsProvider()),
        ChangeNotifierProvider(create: (_) => DropdownProvider()),
        ChangeNotifierProvider(create: (_) => DomesticLeadsDataProvider()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'CRM DraivF',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          scaffoldBackgroundColor: Colors.white,
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: const Color(0xFFF2F2F2),
          ),
        ),
        initialRoute: AppRoutes.splashScreen,
        getPages: AppRoutes.routes,
      ),
    );
  }
}
