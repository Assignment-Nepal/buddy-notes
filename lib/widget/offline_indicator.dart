import 'package:buddyapp/constant/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_offline/flutter_offline.dart';


class OfflineIndicator extends StatelessWidget {

  final Widget child;
  final String? errorMessage;
  final Color? errorBackground;

  OfflineIndicator({
    required this.child,
    this.errorMessage,
    this.errorBackground,
  });

  @override
  Widget build(BuildContext context) {
    return OfflineBuilder(
      connectivityBuilder: (BuildContext context, ConnectivityResult connectivity, Widget child) {
        final bool connected = connectivity != ConnectivityResult.none;
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
              left: 0.0,
              right: 0.0,
              height: 20.0,
              child: Container(
                color: connected ? null : errorBackground != null? errorBackground: AppColors.textColorLight,
                child: connected
                    ?  null
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      errorMessage != null? errorMessage!: "No internet Connection",
                      style: const TextStyle(color: Colors.white,fontSize: 12),
                    ),
                    const SizedBox(
                      width: 8.0,
                    ),
                    const SizedBox(
                      width: 12.0,
                      height: 12.0,
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: connected? const EdgeInsets.only(top: 0):const EdgeInsets.only(top: 20.0),
              child: child,
            ),
          ],
        );
      },
      child: child,
    );
  }
}