import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:routing/src/route_pages/bottom_sheet_route_page.dart';

extension AutoRouterExtensions on StackRouter {
  Future<T?> pushBottomSheet<T>({
    required Widget child,
    bool isDismissible = true,
    bool enableDrag = true,
    bool isShowCloseButton = false,
    double topPadding = 16,
    bool addKeyboardHeightBottomPadding = false,
    EdgeInsets padding = const EdgeInsets.fromLTRB(24, 0, 24, 0),
    bool addBottomPadding = false,
  }) {
    return pushNativeRoute<T>(
      ModalBottomSheetRoute(
        shape: const RoundedRectangleBorder(),
        useSafeArea: true,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        enableDrag: enableDrag,
        isDismissible: isDismissible,
        builder: (_) => BottomSheetRoutePage(
          topPadding: topPadding,
          enableDrag: enableDrag,
          padding: padding,
          addBottomPadding: addBottomPadding,
          addKeyboardHeightBottomPadding: addKeyboardHeightBottomPadding,
          isShowCloseButton: isShowCloseButton,
          child: child,
        ),
      ),
    );
  }

  Future<T?> pushScrollableBottomSheet<T>({
    required Widget Function(ScrollController) builder,
    bool isDismissible = true,
    double topPadding = 16,
    double initialChildSize = 1,
    double minChildSize = 0.95,
    double maxChildSize = 1,
    bool isShowCloseButton = false,
    bool snap = true,
    DraggableScrollableController? controller,
    bool addKeyboardHeightBottomPadding = false,
    EdgeInsets padding = const EdgeInsets.fromLTRB(24, 0, 24, 0),
    bool addBottomPadding = true,
  }) {
    return pushNativeRoute<T>(
      ModalBottomSheetRoute(
        shape: const RoundedRectangleBorder(),
        useSafeArea: true,
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        isDismissible: isDismissible,
        builder: (context) => DraggableScrollableSheet(
          controller: controller,
          initialChildSize: initialChildSize,
          minChildSize: minChildSize,
          maxChildSize: maxChildSize,
          snap: snap,
          snapSizes: [initialChildSize],
          builder: (context, scrollController) => BottomSheetRoutePage(
            topPadding: topPadding,
            isShowCloseButton: isShowCloseButton,
            padding: padding,
            addBottomPadding: addBottomPadding,
            addKeyboardHeightBottomPadding: addKeyboardHeightBottomPadding,
            child: builder(scrollController),
          ),
        ),
      ),
    );
  }

  /// Pops both the current route and its immediate parent container route (if any).
  void popWithContainer<T extends Object?>([T? result]) {
    final currentRouter = this;
    final parentRouter = currentRouter.parent();

    if (parentRouter?.canPop() ?? false) {
      parentRouter?.pop(result);
    } else if (currentRouter.canPop()) {
      currentRouter.pop(result);
    }
  }
}
