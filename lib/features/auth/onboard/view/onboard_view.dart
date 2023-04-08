import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/base/base_state/base_state.dart';
import '../../../../core/base/base_view/base_view.dart';
import '../../../../core/extension/buildcontext_extension.dart';
import '../viewmodel/onborad_viewmodel.dart';
import 'widget/customtext_widget.dart';
import 'widget/pageview_widget.dart';

class OnBoardView extends StatefulWidget {
  const OnBoardView({super.key});

  @override
  State<OnBoardView> createState() => _OnBoardViewState();
}

class _OnBoardViewState extends BaseState<OnBoardView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<OnBoardViewModel>(
      viewModel: OnBoardViewModel(),
      onPageBuilder: (context, viewModel) => _buildScaffold(viewModel, context),
      onModelReady: (model) {},
      onDispose: (viewModel) {
        viewModel.onboardDispose();
      },
    );
  }

  Scaffold _buildScaffold(OnBoardViewModel viewModel, BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          _buildPageView(viewModel),
          _buildIndicator(context, viewModel),
        ],
      ),
    );
  }

  Align _buildIndicator(BuildContext context, OnBoardViewModel viewModel) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: context.verticalPadding(value: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Observer(
                builder: (_) => CustomTextButton(
                      text: "",
                      onPress: () {},
                    )),
            SmoothPageIndicator(
              controller: viewModel.pageController,
              count: 3,
              effect: WormEffect(
                  dotColor: context.themeColorScheme.primary.withOpacity(.3)),
            ),
            Observer(
              builder: (_) => CustomTextButton(
                text: viewModel.isDone ? viewModel.done : viewModel.next,
                onPress: () {
                  viewModel.nextPage();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  PageView _buildPageView(OnBoardViewModel viewModel) {
    return PageView.builder(
      onPageChanged: (value) {
        viewModel.isDone = (value == 2);
      },
      controller: viewModel.pageController,
      itemCount: viewModel.onBoardList.length,
      itemBuilder: (context, index) => PageViewWidget(
          pageImage: viewModel.onBoardList[index].imagePath,
          title: viewModel.onBoardList[index].title,
          description: viewModel.onBoardList[index].description),
    );
  }
}
