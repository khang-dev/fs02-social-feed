import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'base_view_model.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final T Function(BuildContext) vmBuilder;
  final Widget Function(BuildContext, T, Widget?) builder;
  final Widget? child;

  const BaseView({Key? key, required this.vmBuilder, required this.builder, this.child}) : super(key: key);

  @override
  _BaseViewState<T> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  late T _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = widget.vmBuilder(context);
    _viewModel.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>.value(
      value: _viewModel,
      builder: (context, child) => Consumer<T>(
        builder: widget.builder,
        child: child,
      ),
    );
  }
}
