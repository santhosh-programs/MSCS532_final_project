import 'dart:math';

void main() {
  List<int> sampleData = [];
  for (int i = 0; i < 7500; i++) {
    sampleData.add(i);
  }
  final qDt = DateTime.now();
  quickSort(sampleData, 0, sampleData.length - 1);
  print('Quicksort duration:' +
      DateTime.now().difference(qDt).inMicroseconds.toString());
  final rQDt = DateTime.now();
  randomizedQuickSort(sampleData, 0, sampleData.length - 1);
  print('Randomized Quicksort duration:' +
      DateTime.now().difference(rQDt).inMicroseconds.toString());
}

void quickSort(List<int> data, int startIndex, int endIdx) {
  if (startIndex < endIdx) {
    int q = partition(data, startIndex, endIdx);
    quickSort(data, startIndex, q - 1);
    quickSort(data, q + 1, endIdx);
  }
}

void randomizedQuickSort(List<int> data, int startIndex, int endIdx) {
  if (startIndex < endIdx) {
    int q = randomizedPartition(data, startIndex, endIdx);
    randomizedQuickSort(data, startIndex, q - 1);
    randomizedQuickSort(data, q + 1, endIdx);
  }
}

int randomizedPartition(List<int> data, int startIndex, int endIdx) {
  int i = Random().nextInt(endIdx - startIndex + 1) + startIndex;
  int temp = data[startIndex];
  data[startIndex] = data[i];
  data[i] = temp;
  return partition(data, startIndex, endIdx);
}

// chooses the first element as the pivot
int partition(List<int> data, int startIndex, int endIdx) {
  int x = data[startIndex]; // pivot
  int i = startIndex - 1;
  for (int j = startIndex + 1; j <= endIdx; j++) {
    if (data[j] < x) {
      i = i + 1;
      int temp = data[j];
      data[j] = data[i];
      data[i] = temp;
    }
  }
  int temp = data[i + 1];
  data[i + 1] = data[endIdx];
  data[endIdx] = temp;
  return i + 1;
}
