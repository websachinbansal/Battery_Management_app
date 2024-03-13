class DataStorage {
  int? CellVolt1;
  int? CellVolt2;
  int? CellVolt3;
  int? CellVolt4;
  int? CellVolt5;
  int? CellVolt6;
  int? CellVolt7;
  int? CellVolt8;
  int? CellVolt9;
  int? CellVolt10;
  int? CellVolt11;
  int? CellVolt12;
  int? CellVolt13;
  int? CellVolt14;
  int? CellVolt15;
  int? CellVolt16;

  void storeData(List<int> latestdata) {
    CellVolt1 = latestdata[0];
    CellVolt2 = latestdata[1];
    CellVolt3 = latestdata[2];
    CellVolt4 = latestdata[3];
    CellVolt5 = latestdata[4];
    CellVolt6 = latestdata[5];
    CellVolt7 = latestdata[6];
    CellVolt8 = latestdata[7];
    CellVolt9 = latestdata[8];
    CellVolt10 = latestdata[9];
    CellVolt11 = latestdata[10];
    CellVolt12 = latestdata[11];
    CellVolt13 = latestdata[12];
    CellVolt14 = latestdata[13];
    CellVolt15 = latestdata[14];
    CellVolt16 = latestdata[15];
  }
}
