import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/base/view/base_view.dart';
import '../../../../core/constant/image/image_constants.dart';
import '../../../../core/extension/context_extension.dart';
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
          buildCenterTextWelcome(context, viewModel),
          buildAlignmentIcon(viewModel),
        ],
      )),
    );
  }

  Center buildCenterTextWelcome(
      BuildContext context, SplashViewModel viewModel) {
    return Center(child: Observer(builder: (_) {
      return AnimatedOpacity(
        duration: Duration(milliseconds: 1200),
        opacity: viewModel.isFirstInit ? 0 : 1,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Welcome",
              style: context.textTheme.headline4?.copyWith(
                  color: context.colors.primaryVariant,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            CircularProgressIndicator.adaptive()
          ],
        ),
      );
    }));
  }

  Widget buildAlignmentIcon(SplashViewModel viewModel) {
    return Observer(builder: (_) {
      return AnimatedAlign(
          alignment:
              viewModel.isFirstInit ? Alignment.center : Alignment.bottomCenter,
          duration: Duration(milliseconds: 800),
          child: Image.asset(ImageConstants.instance.corporateIcon));
    });
  }
}
