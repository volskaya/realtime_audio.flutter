protocol FlutterArguments: Codable {}
protocol FlutterResponse: Codable {}

extension Encodable {
  func toJsonMap() throws -> [String: Any] {
    try JSONSerialization.jsonObject(with: try encode(), options: .fragmentsAllowed) as! [String: Any]
  }
}
