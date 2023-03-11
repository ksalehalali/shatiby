class EventModel{
String? name;
 String? description;
 String? videoUrl;
 String? imageUrl;
 String? date;
 String? address;

  EventModel(
      {required this.name, required this.description, required this.videoUrl, required this.date, required this.address,this.imageUrl});


  EventModel.fromJson(Map<dynamic,dynamic> json){
    name = json["name"];
    description = json["description"];
    videoUrl = json["videoUrl"];
    date = json["date"];
    address = json["address"];
    imageUrl = json["imageUrl"];

  }

  Map<String,dynamic> toJson(){
    final Map<String, dynamic> data = Map<String, dynamic>();
    data["name"] = name;
    data["description"] = description;
    data["media"] = videoUrl;
    data["date"] = date;
    data["address"] = address;
    return data;


  }
}