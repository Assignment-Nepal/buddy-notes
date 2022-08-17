import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';


class PullRefresh extends StatelessWidget {

  final Widget child;
  final Function? onRefresh;
  final Function? onLoading;
  final RefreshController? refreshController;
  final Widget? refreshIndicator;
  bool? enablePullDown;

  PullRefresh({Key? key,
    required this.child,
    required this.refreshController,
    this.onRefresh,
    this.onLoading,
    this.refreshIndicator,
    this.enablePullDown
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    enablePullDown = enablePullDown == null ? true : enablePullDown;
    return SmartRefresher(
      enablePullDown: true,
      enablePullUp: false,
      header: refreshIndicator != null? refreshIndicator: WaterDropMaterialHeader(),
      controller: refreshController!,
      onRefresh: onRefresh as void Function()?,
      onLoading: onLoading as void Function()?,
      child: child,
    );
  }
}

RefreshController getRefreshController() {
  return RefreshController(initialRefresh: false);
}