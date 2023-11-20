import 'base_report.dart';


class ReportDataSource {
  static ReportDataSource instance =ReportDataSource();

  Future<Map<String, dynamic>> loadReport() {
    return BaseReport.get("report");
  }

  Future<Map<String, dynamic>> loadDetailReport(int idDiterima){
    String id = idDiterima.toString();
    return BaseReport.get("report/$id");
  }
}