import 'dart:collection';

void main() {
  HashMap<int, int> hashMap = HashMap();
  SplayTreeMap<int, int> splayTreeMap = SplayTreeMap();

  for (int i = 0; i < 10000; i++) {
    hashMap[i] = i;
    splayTreeMap[i] = i;
  }
  final sDt = DateTime.now();
  final sItems = splayTreeMap.entries;

  print("Sorted tree map first entry: ${sItems.first}");
  print("Sorted tree map last entry: ${sItems.first}");
  print("Treemap duration ${DateTime.now().difference(sDt).inMicroseconds}");

  print("Unsorted hash map first entry: ${hashMap.entries.first}");
  print("Unsorted hash map last entry: ${hashMap.entries.last}");

  final hashDateTime = DateTime.now();
  final hEntriesSorted = hashMap.entries.toList()
    ..sort((a, b) => a.value.compareTo(b.value));

  print("Sorted hash map first entry: ${hEntriesSorted.first}");
  print("Sorted hash map last entry: ${hEntriesSorted.last}");
  print(
      "HashMap duration ${DateTime.now().difference(hashDateTime).inMicroseconds}");
}
