Future<void> main() async {
  print('Etape 1');
  print(await retour1());
  print('Etape 5');
}

Future<String> retour1() {
  print('Etape 2');
  var retour = Future.delayed(Duration(seconds: 5), () =>
    'Etape 3'
  );
  print('Etape 4');
  return retour;
}