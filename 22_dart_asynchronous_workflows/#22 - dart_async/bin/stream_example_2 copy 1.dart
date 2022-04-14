void main(List<String> args) {
  asyncGenerator().listen(print);
}

Stream<int> asyncGenerator() async* {
  for (var i = 0; i < 5; i++) {
    yield i;
  }
}
