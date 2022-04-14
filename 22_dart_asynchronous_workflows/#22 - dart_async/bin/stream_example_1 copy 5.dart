import 'dart:async';

Future main(List<String> args) async {
  final streamController = StreamController<int>.broadcast(); /*<---*/
  final streamSubscription = streamController.stream.listen(print);
  final otherStreamSubscription = streamController.stream.listen(print);

  var value = 0;
  Timer.periodic(const Duration(seconds: 1), (timer) {
    if (value == 5) {
      timer.cancel();
      streamController.close();
      streamSubscription.cancel();
    } else {
      streamController.add(value++);
    }
  });

  var max = 0;
  await streamController.stream.forEach((value) {
    max = (value > max) ? value : max;
  });

}
