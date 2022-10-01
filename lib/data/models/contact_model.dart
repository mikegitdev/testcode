class Contact{
  String number;
  String link;

  Contact({required this.number,required this.link});

  Contact.fromJson(Map<String, dynamic> json)
      : number = json['number'],
        link = json['link'];

  Map<String, dynamic> toJson() => {
    'number' : number,
    'link' : link,
  };
}