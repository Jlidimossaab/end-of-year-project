class UserFeedback{
  String? description;
  DateTime? date;
  String? tasteReview;
  String? qualityReview;
  String? quantityReview;
  //constructor
  UserFeedback({required this.description,this.date,this.tasteReview,this.qualityReview,this.quantityReview});

  // getting data from server
  factory UserFeedback.fromMap(map) {
    return UserFeedback(
      description: map['description'],
      date : DateTime.parse(map['date'].toDate().toString()),
      tasteReview: map['tasteReview'],
      qualityReview: map['qualityReview'],
      quantityReview: map['quantityReview'],
    );
  }

// sending data to server
  Map<String, dynamic> toMap()
  {
    return {
      "description": description,
      "date":  date,
      "tasteReview":  tasteReview,
      "qualityReview":  qualityReview,
      "quantityReview":  quantityReview,
    };
  }
}

