class WebSocketModal {
  String webSocketE;
  int e;
  String s;
  int webSocketT;
  String p;
  String q;
  int t;
  bool webSocketM;
  bool m;

  WebSocketModal({
    required this.webSocketE,
    required this.e,
    required this.s,
    required this.webSocketT,
    required this.p,
    required this.q,
    required this.t,
    required this.webSocketM,
    required this.m,
  });

  factory WebSocketModal.fromJson(Map<String, dynamic> json) => WebSocketModal(
        webSocketE: json["e"],
        e: json["E"],
        s: json["s"],
        webSocketT: json["t"],
        p: json["p"],
        q: json["q"],
        t: json["T"],
        webSocketM: json["m"],
        m: json["M"],
      );

  Map<String, dynamic> toJson() => {
        "e": webSocketE,
        "E": e,
        "s": s,
        "t": webSocketT,
        "p": p,
        "q": q,
        "T": t,
        "m": webSocketM,
        "M": m,
      };
}
