void main(List<String> args) {
  asyncGenerator().listen(print);
}

Stream<int> asyncGenerator() async* {
  for (var i = 0; i < 5; i++) {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield i;
  }
}
