class EmployeeReadMoreModel {
  late int? id;
  late String name;
  late String rating;
  late String companyName;
  late String interests;
  late String viewMore;
  late String designation;
  late String? logoUrl;
  late String jobDescripton;

  EmployeeReadMoreModel(
      {required this.name,
      required this.designation,
      this.logoUrl,
      required this.companyName,
      this.id,
      required this.interests,
      required this.jobDescripton,
      required this.rating,
      required this.viewMore});

  factory EmployeeReadMoreModel.fromJson(Map<String, dynamic> json) {
    return EmployeeReadMoreModel(
        id: json['id'],
        companyName: json['company'],
        designation: json['designation'],
        logoUrl: json['company_logo'],
        name: json['name'],
        interests: json['interests'],
        jobDescripton: json['job_descripton'],
        rating: json['rating'],
        viewMore: json['view_more']);
  }
}
