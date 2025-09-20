import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http/http.dart' as http;

class CertificateDetailPage extends StatefulWidget {
  final String fileUrl;

  const CertificateDetailPage({super.key, required this.fileUrl});

  @override
  State<CertificateDetailPage> createState() => _CertificateDetailPageState();
}

class _CertificateDetailPageState extends State<CertificateDetailPage> {
  String? localFilePath;

  @override
  void initState() {
    super.initState();
    if (widget.fileUrl.toLowerCase().endsWith(".pdf")) {
      _downloadFile(widget.fileUrl); // download for PDF
    }
  }

  Future<void> _downloadFile(String url) async {
    final response = await http.get(Uri.parse(url));
    final dir = await getTemporaryDirectory();
    final file = File("${dir.path}/temp.pdf");
    await file.writeAsBytes(response.bodyBytes, flush: true);
    setState(() {
      localFilePath = file.path;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPdf = widget.fileUrl.toLowerCase().endsWith(".pdf");

    return Scaffold(
      appBar: AppBar(title: const Text("Certificate")),
      body: Center(
        child: isPdf
            ? (localFilePath == null
                ? const CircularProgressIndicator()
                : PDFView(filePath: localFilePath))
            : Image.network(
                widget.fileUrl,
                errorBuilder: (context, error, stackTrace) =>
                    const Text("Error loading image"),
              ),
      ),
    );
  }
}
