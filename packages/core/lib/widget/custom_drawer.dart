import 'package:core/providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final slideStateProvider = StateProvider<bool>((ref) {
  return false;
});

class CustomDrawer extends ConsumerStatefulWidget {
  const CustomDrawer(
      {Key? key, required this.frontChild, required this.backChild})
      : super(key: key);

  final Widget Function(VoidCallback toggle) frontChild;
  final Widget backChild;

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends ConsumerState<CustomDrawer>
    with SingleTickerProviderStateMixin {
  final double maxSlide = 225.0;
  late AnimationController _animationController;
  bool _canBeDragged = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 250));
    _animationController.forward();
  }

  void _toggle() {
    final model = ref.read(backProvider);
    model.toggleDrawer(_animationController.isDismissed);
    _animationController.isDismissed
        ? _animationController.forward()
        : _animationController.reverse();
  }

  void _onDragStart(DragStartDetails details) {
    double dx = details.globalPosition.dx;
    if (_animationController.isCompleted || _animationController.isDismissed) {
      dx = 0;
    }
    bool isDragOpenFromLeft = _animationController.isDismissed &&
        dx < MediaQuery.of(context).size.width * 0.10;
    bool isDragCloseFromRight =
        _animationController.isCompleted && details.globalPosition.dx > 0.01;
    _canBeDragged = isDragOpenFromLeft || isDragCloseFromRight;
  }

  void _onDragUpdate(DragUpdateDetails details) {
    if (_canBeDragged) {
      double delta = details.primaryDelta! / maxSlide;
      _animationController.value += delta;
    }
  }

  void _onDragEnd(DragEndDetails details) {
    if (_animationController.isDismissed || _animationController.isCompleted) {
      return;
    }
    if (details.velocity.pixelsPerSecond.dx.abs() >= 365.0) {
      double visualVelocity = details.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;

      _animationController.fling(velocity: visualVelocity);
    } else if (_animationController.value < 0.5) {
      _close();
    } else {
      _open();
    }
  }

  void _open() {
    _animationController.fling();
  }

  void _close() {
    _animationController.fling(velocity: -1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onHorizontalDragStart: _onDragStart,
      // onHorizontalDragUpdate: _onDragUpdate,
      // onHorizontalDragEnd: _onDragEnd,
      // onTap: _toggle,
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            double slide = maxSlide * (_animationController.value * 1.40);
            double scale = 1 - (_animationController.value * 0.45);
            return Stack(
              children: [
                widget.backChild,
                Transform(
                    transform: Matrix4.identity()
                      ..translate(slide)
                      ..scale(scale),
                    alignment: Alignment.centerLeft,
                    child: widget.frontChild(_toggle)),
              ],
            );
          }),
    );
  }
}
