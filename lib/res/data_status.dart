import 'barrel_file.dart';

class CustomDataStatusWidget extends StatelessWidget {
  final DataStatus status;
  final Widget? loadingStatus;
  final Widget successStatus;
  final Widget errorStatus;

  const CustomDataStatusWidget({
    super.key,
    required this.status,
    this.loadingStatus,
    required this.successStatus,
    required this.errorStatus,
  });

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case DataStatus.Loading:
        return Center(child: loadingStatus ?? const CustomLoadingIndicator());
      case DataStatus.Completed:
        return successStatus;
      case DataStatus.Error:
        return errorStatus;
      default:
        return Container();
    }
  }
}
