class EmployeeList {
  late int? id;
  late String name;
  late String designation;
  late String? logoUrl;
  late String companyName;

  EmployeeList(
      {required this.name,
      required this.designation,
      this.logoUrl,
      required this.companyName,
      this.id});

  factory EmployeeList.fromJson(Map<String, dynamic> json) {
    return EmployeeList(
        id: json['id'],
        companyName: json['company'],
        designation: json['designation'],
        logoUrl: json['company_logo'],
        name: json['name']);
  }
}
