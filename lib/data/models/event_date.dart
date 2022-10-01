class EventDate{
  String date;
  String heading;
  String description;

  EventDate({required this.date, required this.heading, required this.description});

  EventDate.fromJson(Map<String, dynamic> json)
      : date = json['date'],
        heading = json['heading'],
        description = json["description"];

  Map<String, dynamic> toJson() => {
    'date' : date,
    'heading' : heading,
    'description' : description,
  };
}