class ProjectCategoryModel {
  final String id;
  final String title;
  final String description;
  final String updatedAt;
  final double lat;
  final double lon;
  final double moneyGoal;
  final String images;
  final List tasks;

  ProjectCategoryModel._({this.id, this.title, this.description, this.updatedAt, this.lat, this.lon, this.moneyGoal, this.images, this.tasks});

  factory ProjectCategoryModel.fromJson(Map<String, dynamic> json) {
    return new ProjectCategoryModel._(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      updatedAt: json['updatedAt'],
      moneyGoal: json['moneyGoal'].toDouble(),
      lat: json['lat'],
      lon: json['lon'],
      images: json['images'][0]['file'],
      tasks: json['tasks'],
    );
  }
}