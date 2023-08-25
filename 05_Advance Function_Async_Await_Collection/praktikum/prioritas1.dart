void main(List<String> args) async {
  List<int> data = [2, 3, 5, 6, 7];
  int pengali = 3;

  List<int> perulanganPengali(List<int> data, int pengali) {
    List<int> newDataList = [];
    for (int i = 0; i < data.length; i++) {
      int dataSatuan = data[i] * pengali;
      newDataList.add(dataSatuan);
    }
    return newDataList;
  }

  List<int> result = await Future.delayed(Duration(seconds: 3), () => perulanganPengali(data, pengali));
  /// Menghitung hasil dengan fungsi perulangan pengali dan ditunda selama 3 detik
  print(result);
}
