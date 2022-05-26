import 'package:core/viewmodel/home/home_viewmodel.dart';
import 'package:core/widget/content_neumorphism.dart';
import 'package:flutter/material.dart';
import 'package:gsp_app1/routes.dart';

class AsymmetricView extends StatelessWidget {
  final List<String> products;
  final HomeViewModel viewModel;

  const AsymmetricView(
      {Key? key, required this.products, required this.viewModel})
      : super(key: key);

  List<Widget> _buildColumns(BuildContext context) {
    if (products.isEmpty) {
      return <Container>[];
    }

    /// This will return a list of columns. It will oscillate between the two
    /// kinds of columns. Even cases of the index (0, 2, 4, etc) will be
    /// TwoProductCardColumn and the odd cases will be OneProductCardColumn.
    ///
    /// Each pair of columns will advance us 3 products forward (2 + 1). That's
    /// some kinda awkward math so we use _evenCasesIndex and _oddCasesIndex as
    /// helpers for creating the index of the product list that will correspond
    /// to the index of the list of columns.
    return List.generate(_listItemCount(products.length), (int index) {
      double width = .59 * MediaQuery.of(context).size.width;
      Widget column;
      if (index % 2 == 0) {
        /// Even cases
        int bottom = _evenCasesIndex(index);
        column = TwoProductCardColumn(
            viewModel: viewModel,
            bottom: products[bottom],
            top: products.length - 1 >= bottom + 1
                ? products[bottom + 1]
                : null);
        width += 32.0;
      } else {
        /// Odd cases
        column = OneProductCardColumn(
          bottom: products[_oddCasesIndex(index)],
          viewModel: viewModel,
        );
      }
      return SizedBox(
        width: width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: column,
        ),
      );
    }).toList();
  }

  int _evenCasesIndex(int input) {
    /// The operator ~/ is a cool one. It's the truncating division operator. It
    /// divides the number and if there's a remainder / decimal, it cuts it off.
    /// This is like dividing and then casting the result to int. Also, it's
    /// functionally equivalent to floor() in this case.
    return input ~/ 2 * 3;
  }

  int _oddCasesIndex(int input) {
    assert(input > 0);
    return (input / 2).ceil() * 3 - 1;
  }

  int _listItemCount(int totalItems) {
    if (totalItems % 3 == 0) {
      return totalItems ~/ 3 * 2;
    } else {
      return (totalItems / 3).ceil() * 2 - 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: const EdgeInsets.fromLTRB(0.0, 34.0, 16.0, 44.0),
      children: _buildColumns(context),
    );
  }
}

class TwoProductCardColumn extends StatelessWidget {
  const TwoProductCardColumn({
    required this.bottom,
    this.top,
    required this.viewModel,
    Key? key,
  }) : super(key: key);

  final String bottom;
  final String? top;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      const spacerHeight = 44.0;

      double heightOfCards = (constraints.biggest.height - spacerHeight) / 2.0;
      double heightOfImages = heightOfCards - 65.0;
      double imageAspectRatio = heightOfImages >= 0.0
          ? constraints.biggest.width / heightOfImages
          : 49.0 / 33.0;

      return ListView(
        physics: const ClampingScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: const EdgeInsetsDirectional.only(start: 28.0),
            child: top != null
                ? NeumorphismCard(
                    viewModel: viewModel,
                    onTap: () => navigator.pushNamed(AppRoutes.viewCoal),
                    title: 'Produksi CO Stockpile',
                  )
                : SizedBox(
                    height: heightOfCards > 0 ? heightOfCards : spacerHeight,
                  ),
          ),
          const SizedBox(height: spacerHeight),
          Padding(
            padding: const EdgeInsetsDirectional.only(end: 28.0),
            child: NeumorphismCard(
              viewModel: viewModel,
              onTap: () => navigator.pushNamed(AppRoutes.viewCoal),
              title: 'Produksi CO Stockpile',
            ),
          ),
        ],
      );
    });
  }
}

class OneProductCardColumn extends StatelessWidget {
  const OneProductCardColumn(
      {required this.viewModel, required this.bottom, Key? key})
      : super(key: key);

  final String bottom;
  final HomeViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final navigator = Navigator.of(context);
    return ListView(
      reverse: true,
      physics: const ClampingScrollPhysics(),
      children: <Widget>[
        const SizedBox(
          height: 40.0,
        ),
        NeumorphismCard(
          viewModel: viewModel,
          onTap: () => navigator.pushNamed(AppRoutes.viewCoal),
          title: 'Produksi CO Stockpile',
        ),
      ],
    );
  }
}
