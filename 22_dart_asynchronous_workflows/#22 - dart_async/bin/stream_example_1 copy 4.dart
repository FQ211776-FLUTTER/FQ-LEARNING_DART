import 'dart:async';

Future main(List<String> args) async {
  final streamController = StreamController<int>();

  var value = 0;
  Timer.periodic(const Duration(seconds: 1), (timer) {
    streamController.add(value++);
  });

  streamController.stream.listen(print);
}
