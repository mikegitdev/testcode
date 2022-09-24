class UserModel {
  final String image;
  final String name;
  bool isSelected;

  UserModel({
   required this.image,
   required this.name,
   required this.isSelected,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        name = json['name'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() => {
    'image' : image,
    'name' : name,
    'isSelected' : isSelected,
  };
}