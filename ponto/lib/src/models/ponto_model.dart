class Ponto {
  String? data;
  List<String>? pontos;

  Ponto({this.data, this.pontos});

  Ponto.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    pontos = json['pontos'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data'] = this.data;
    data['pontos'] = this.pontos;
    return data;
  }
}
