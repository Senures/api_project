class GenresResponse {
  List<String>? genres;

  GenresResponse({this.genres});

  GenresResponse.fromJson(Map<String, dynamic> json) {
    genres = json['genres'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genres'] = this.genres;
    return data;
  }
}
