import 'dart:async';

Future main(List<String> args) async {
  final streamController = StreamController<int>();

  var value = 0;
  Timer.periodic(const Duration(seconds: 1), (timer) {
    if (value == 5) {
      timer.cancel();
      streamController.close();
    } else {
      streamController.add(value++);
    }
  });

//   var max = 0;
//   await streamController.stream.forEach((value) {
//     max = (value > max) ? value : max;
//   });
//   print('Max is --> $max');

  var max = 0;
  await for (final value in streamController.stream) {
    max = (value > max) ? value : max;
  }
  print('Max is --> $max');
}
