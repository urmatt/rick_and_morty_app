import 'package:flutter/material.dart';

enum LoadingAlign {
  start,
  end,
}

class LoadMoreList extends ListView {
  final bool finish;
  final bool loading;
  final int extendPixels;
  final Function()? onLoadMore;
  final Widget Function()? loadingBuilder;
  LoadingAlign? loadingAlign;

  LoadMoreList({
    Key? key,
    required this.finish,
    required this.loading,
    this.extendPixels = 300,
    this.onLoadMore,
    this.loadingBuilder,
    this.loadingAlign = LoadingAlign.end,
    Axis scrollDirection = Axis.vertical,
    ScrollController? controller,
    bool? primary,
    ScrollPhysics? physics,
    bool shrinkWrap = false,
    EdgeInsetsGeometry? padding,
    List<Widget> children = const <Widget>[],
  }) : super(
          key: key,
          controller: controller ?? ScrollController(),
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
          children: children,
          scrollDirection: scrollDirection,
        ) {
    // _initLoadingBuilder(children);
    super.controller?.addListener(_scrollListener);
  }

  void _scrollListener() {
    if ((controller?.position.extentAfter ?? 0) < extendPixels &&
        !finish &&
        !loading) {
      onLoadMore?.call();
    }
  }

  void _initLoadingBuilder(List<Widget> children) {
    if (loadingBuilder != null && loading) {
      if (loadingAlign == LoadingAlign.end) {
        children.add(loadingBuilder!.call());
      }

      if (loadingAlign == LoadingAlign.start) {
        children.insert(0, loadingBuilder!.call());
      }
    }
  }
}
