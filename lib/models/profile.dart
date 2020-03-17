class Profile {
  int id;
  String name;
  String phone;
  String email;
  String sum;
  String nextSum;
  String percent;
  String card;

  Profile({this.id, this.name, this.phone, this.email, this.sum, this.nextSum, this.percent, this.card});

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
        id: json['id'],
        name: json['name'],
        phone: json['phone'],
        sum: json['sum'].toString(),
        nextSum: json['nextSum'].toString(),
        percent: json['percent'].toString(),
        card: json['card_number'],
        email: json['email'],
    );
  }
}