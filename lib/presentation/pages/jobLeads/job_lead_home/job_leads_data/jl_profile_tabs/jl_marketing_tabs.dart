import 'package:flutter/material.dart';

class JLMarketingTabs extends StatelessWidget {
  const JLMarketingTabs({super.key});

  Widget buildInfoItem(String title, [String? value]) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blueGrey,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (value != null) ...[
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                value,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ]
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return 
      Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column (UTM Information)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      "UTM Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildInfoItem("UTM Medium"),
                  buildInfoItem("UTM Campaign"),
                  buildInfoItem("UTM ID"),
                  buildInfoItem("UTM Term"),
                  buildInfoItem("UTM Content"),
                  buildInfoItem("URL"),
                ],
              ),
            ),
            const SizedBox(width: 16),
            // Right Column (Campaign Information)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey.shade200,
                    padding: const EdgeInsets.all(8),
                    child: const Text(
                      "Campaign Information",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  buildInfoItem("Ad Name", "Tambaram - Test"),
                  buildInfoItem("Adset Name", "Tambaram ad set 2"),
                  buildInfoItem("Campaign Name", "TN Chennai Sep 2025"),
                  buildInfoItem("Form Name", "TN Chennai Tambaram April-2025"),
                  buildInfoItem("Page Name", "Dr.ARAVIND’S IVF"),
                ],
              ),
            ),
          ],
        ),
  
    );
  }
}
