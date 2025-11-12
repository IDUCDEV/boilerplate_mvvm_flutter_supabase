import 'dart:convert';
import 'package:http/http.dart' as http;

class RestApiService {
  final String baseUrl;
  final Map<String, String> defaultHeaders;
  String? _token;

  RestApiService({
    required this.baseUrl,
    this.defaultHeaders = const {},
  });

  void setToken(String token) {
    _token = token;
  }

  void clearToken() {
    _token = null;
  }

  Map<String, String> _getHeaders({Map<String, String>? additionalHeaders}) {
    final headers = Map<String, String>.from(defaultHeaders);
    if (_token != null) {
      headers['Authorization'] = 'Bearer $_token';
    }
    if (additionalHeaders != null) {
      headers.addAll(additionalHeaders);
    }
    return headers;
  }

  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.get(url, headers: _getHeaders(additionalHeaders: headers));
  }

  Future<http.Response> post(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final requestHeaders = _getHeaders(additionalHeaders: headers);
    requestHeaders['Content-Type'] = 'application/json';
    return await http.post(
      url,
      headers: requestHeaders,
      body: body != null ? jsonEncode(body) : null,
    );
  }

  Future<http.Response> put(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final requestHeaders = _getHeaders(additionalHeaders: headers);
    requestHeaders['Content-Type'] = 'application/json';
    return await http.put(
      url,
      headers: requestHeaders,
      body: body != null ? jsonEncode(body) : null,
    );
  }

  Future<http.Response> delete(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    return await http.delete(url, headers: _getHeaders(additionalHeaders: headers));
  }

  Future<http.Response> patch(String endpoint, {Map<String, String>? headers, dynamic body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final requestHeaders = _getHeaders(additionalHeaders: headers);
    requestHeaders['Content-Type'] = 'application/json';
    return await http.patch(
      url,
      headers: requestHeaders,
      body: body != null ? jsonEncode(body) : null,
    );
  }
}