class ProjectModel {
  final String id;
  final String title;
  final String description;
  final String status;
  final String updatedAt;
  final String category;
  final double moneyPledged;
  final double lat;
  final double lon;
  final double moneyGoal;
  final String images;

  ProjectModel._({this.id, this.title, this.description, this.status, this.updatedAt, this.category, this.moneyPledged, this.lat, this.lon, this.moneyGoal, this.images});

  factory ProjectModel.fromJson(Map<String, dynamic> json) {
    print(json['images'][0]['file']);
    return new ProjectModel._(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      status: json['status'],
      updatedAt: json['updatedAt'],
      category: json['category']['id'],
      moneyPledged: json['moneyPledged'].toDouble(),
      moneyGoal: json['moneyGoal'].toDouble(),
      lat: json['lat'],
      lon: json['lon'],
      images: json['images'][0]['file'],
    );
  }
}