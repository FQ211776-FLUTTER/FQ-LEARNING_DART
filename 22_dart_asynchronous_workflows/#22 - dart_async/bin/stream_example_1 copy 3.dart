import 'dart:async';

Future main(List<String> args) async {

  Stream.fromFutures([Future(() => 3), Future.value(2)]).listen(print);

}
