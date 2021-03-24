class CategoryModel {
  final String id;
  final String name;
  final String image;

  CategoryModel._({this.id, this.name, this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return new CategoryModel._(
    id: json['id'],
    name: json['name'],
    image: json['image']['file'],
    );
  }
}