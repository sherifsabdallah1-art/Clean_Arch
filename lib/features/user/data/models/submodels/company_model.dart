import 'package:clean_arch/Core/databases/api/end_points.dart';

class CompanyModel {
  final String name;
  final String catchPhrase;
  final String bs;

  CompanyModel({
    required this.name,
    required this.catchPhrase,
    required this.bs,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json[ApiKey.name],
      catchPhrase: json[ApiKey.catchPhrase],
      bs: json[ApiKey.bs],
    );
  }

  Map<String, dynamic> tojson() {
    return {'name': name, 'catchphrase': catchPhrase, 'bs': bs};
  }
}
