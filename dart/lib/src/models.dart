/// Response models for the Country Flags API.

/// API Response wrapper.
class CountryflagsResponse {
  final String status;
  final dynamic error;
  final CountryflagsData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  CountryflagsResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory CountryflagsResponse.fromJson(Map<String, dynamic> json) => CountryflagsResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? CountryflagsData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Country Flags API.

class CountryflagsData {
  String? country;
  String? countryCode;
  String? shape;
  String? format;
  String? downloadUrl;

  CountryflagsData({
    this.country,
    this.countryCode,
    this.shape,
    this.format,
    this.downloadUrl,
  });

  factory CountryflagsData.fromJson(Map<String, dynamic> json) => CountryflagsData(
      country: json['country'],
      countryCode: json['countryCode'],
      shape: json['shape'],
      format: json['format'],
      downloadUrl: json['downloadUrl'],
    );
}

class CountryflagsRequest {
  String country;
  String? format;
  String? shape;

  CountryflagsRequest({
    required this.country,
    this.format,
    this.shape,
  });

  Map<String, dynamic> toJson() => {
      'country': country,
      if (format != null) 'format': format,
      if (shape != null) 'shape': shape,
    };
}
