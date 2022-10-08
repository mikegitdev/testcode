class UsersGroupModel{
  final String image;
  final String name;
  bool isSelected;

  UsersGroupModel({
    required this.image,
    required this.name,
    required this.isSelected,
});

  UsersGroupModel.fromJson(Map<String, dynamic> json)
      : image = json['image'],
        name = json['name'],
        isSelected = json['isSelected'];

  Map<String, dynamic> toJson() => {
    'image' : image,
    'name' : name,
    'isSelected' : isSelected,
  };
}