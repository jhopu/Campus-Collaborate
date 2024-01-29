class Project {
  final String projectName;
  final String description;
  final List<String> skills;
  final List<String>? url;
  final String duration;
  final bool isActive;
  final String projectId;
  final List<String> admin;
  final List<String>? starredBy;

  Project(
      {required this.projectName,
      required this.description,
      required this.skills,
      required this.url,
      required this.duration,
      required this.isActive,
      required this.projectId,
      required this.admin,
      required this.starredBy});

  factory Project.fromJson(Map<String, dynamic> json) => Project(
      projectName: json['projectName'],
      description: json['description'],
      skills: json['skills'].cast<String>(),
      url: json['url'],
      duration: json['duration'],
      isActive: json['isActive'],
      projectId: json['projectId'],
      admin: json['admin'].cast<String>(),
      starredBy: json['starredBy']);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['projectName'] = projectName;
    data['description'] = description;
    data['skills'] = skills;
    data['url'] = url;
    data['duration'] = duration;
    data['isActive'] = isActive;
    data['projectId'] = projectId;
    data['admin'] = admin;
    data['starredBy'] = starredBy;
    return data;
  }
}
