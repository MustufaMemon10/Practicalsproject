class OgModules {
  final String name;
  final String shortName;
  final String url;
  final String logo;

  OgModules({
    required this.name,
    required this.shortName,
    required this.url,
    required this.logo,
  });

  factory OgModules.fromJson(Map<String, dynamic> json) {
    return OgModules(
        name: json['organizationName'] ?? '',
        shortName: json['organizationShortName']?? '',
        url: json['organizationURL']?? '',
        logo: json['organizationLOGO']?? ''
    );
  }

  static OgModules empty() =>
      OgModules(name: '', shortName: '', url: '', logo: '');

  static List<OgModules> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => OgModules.fromJson(json)).toList();
  }
}
