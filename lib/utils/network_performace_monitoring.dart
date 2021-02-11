import 'package:firebase_performance/firebase_performance.dart';
import 'package:http/http.dart';

class _MetricHttpClient extends BaseClient {
  _MetricHttpClient(this._inner);

  final Client _inner;

  @override
  Future<StreamedResponse> send(BaseRequest request) async {
    final HttpMetric metric = FirebasePerformance.instance
        .newHttpMetric(request.url.toString(), HttpMethod.Get);

    await metric.start();

    StreamedResponse response;
    try {
      response = await _inner.send(request);
      metric
        ..responsePayloadSize = response.contentLength
        ..responseContentType = response.headers['Content-Type']
        ..requestPayloadSize = request.contentLength
        ..httpResponseCode = response.statusCode;
    } finally {
      await metric.stop();
    }

    return response;
  }
}

Future<void> testHttpMetric(Request request) async {
  final _MetricHttpClient metricHttpClient = _MetricHttpClient(Client());

  // final Request request = Request(
  //   "SEND",
  //   Uri.parse("https://www.google.com"),
  // );

  metricHttpClient.send(request);
}
