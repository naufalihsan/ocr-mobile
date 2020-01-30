class KTP {
  final String nik;
  final String name;

  KTP({this.nik, this.name});

  factory KTP.serialize(Map<String, dynamic> data) {
    return KTP(name: data['nama'], nik: data['nik']);
  }
}
