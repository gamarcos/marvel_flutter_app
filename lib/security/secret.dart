class Secret {
  final String url;
  final String timeStamp;
  final String publicKey;
  final String hash;

  Secret({this.url, this.timeStamp, this.publicKey, this.hash});

  factory Secret.fromJson(Map<String, dynamic> jsonMap) {
    return new Secret(
        url: jsonMap["URL"],
        timeStamp: jsonMap["MARVEL_TS"],
        publicKey: jsonMap["MARVEL_PUBLIC_KEY"],
        hash: jsonMap["MARVEL_HASH"]);
  }
}
