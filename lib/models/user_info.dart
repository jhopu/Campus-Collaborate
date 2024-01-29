class UserInfo {
  final String name;
  final String rollNumber;
  final List<String> skills;
  final List<String> courses;
  final String email;
  final String? url;

  UserInfo(
      {required this.name,
      required this.rollNumber,
      required this.skills,
      required this.courses,
      required this.email,
      required this.url});

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
      name: json['name'],
      rollNumber: json['rollNumber'],
      skills: json['skills'].cast<String>(),
      courses: json['courses'].cast<String>(),
      email: json['email'],
      url: json['url']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['rollNumber'] = rollNumber;
    data['skills'] = skills;
    data['courses'] = courses;
    data['email'] = email;
    data['url'] = url;
    return data;
  }
}
