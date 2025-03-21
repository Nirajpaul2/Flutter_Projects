import 'dart:io';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:http/io_client.dart';
import '../constants/app_constants.dart';

/// Handles SSL certificate pinning
class SSLHelper {
  static Future<SecurityContext> _loadCertificate() async {
    final certificate = await rootBundle.load(AppConstants.certificatePath);
    final securityContext = SecurityContext(withTrustedRoots: false);
    securityContext.setTrustedCertificatesBytes(
      certificate.buffer.asUint8List(),
    );
    return securityContext;
  }

  static Future<http.Client> createSecureClient() async {
    final SecurityContext context = await _loadCertificate();
    final HttpClient httpClient = HttpClient(context: context);

    // Allow only the pinned certificate
    httpClient.badCertificateCallback = (
      X509Certificate cert,
      String host,
      int port,
    ) {
      return cert.pem == AppConstants.certificatePath;
    };

    return IOClient(httpClient);
  }
}
