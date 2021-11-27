import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constant/image/image_constants.dart';
import '../viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (model) {
        model.setContext(context);
        model.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel viewModel) =>
          buildScaffoldBody(context, viewModel),
    );
  }

  Scaffold buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            buildAlignmentIcon(viewModel),
          ],
        ),
      ),
    );
  }

  Widget buildAlignmentIcon(SplashViewModel viewModel) {
    return Observer(builder: (_) {
      return AnimatedAlign(
          alignment: Alignment.bottomCenter,
          duration: const Duration(milliseconds: 800),
          child: Image.asset(ImageConstants.instance.corporateIcon));
    });
  }
}
