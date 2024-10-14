import 'dart:io';

void main(List<String> args) async {
  File file = File('./sample_data.txt');
  if (!await file.exists()) {
    await file.create(recursive: true);
  }
  List<String> sampleList = [];
  for (int i = 0; i < 1500; i++) {
    sampleList.add('This is sample data line no. $i');
    await file.writeAsString('This is sample data line no. $i\n',
        mode: FileMode.append);
  }
  final fileDt = DateTime.now();
  final fileData = await file.readAsLines();
  final fileItem = fileData[750];
  print('File read duration: ${DateTime.now().difference(fileDt)}');

  final listDt = DateTime.now();
  final item = sampleList[750];
  print('Memory read duration: ${DateTime.now().difference(listDt)}');
}
