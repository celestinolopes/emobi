class ReportErrorModel {
  final String? title;
  final String? subTitle;
  final StackTrace? track;
  final error;

  ReportErrorModel({this.error, this.subTitle, this.title, this.track});
}
