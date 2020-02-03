import 'package:flutter/material.dart';
import 'package:flutter_widgets/plugins/firetop/storage/fire_storage_service.dart';
import 'package:flutter_widgets/plugins/url_launcher/url_launcher.dart';

class LaunchFile {
  static void launchPDF(
      BuildContext context, String title, String pdfPath, String pdfUrl) async {
    UrlUtils.open(pdfUrl);
  }

  static Future<dynamic> loadFromFirebase(
      BuildContext context, String url) async {
    return FireStorageService.loadFromStorage(context, url);
  }

  static Future<dynamic> createFileFromPdfUrl(dynamic url) async {
    return url;
  }
}
