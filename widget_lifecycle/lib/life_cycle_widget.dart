import 'dart:developer';

import 'package:flutter/material.dart';

class LifeCycleWidget extends StatefulWidget {
  const LifeCycleWidget({Key? key, required this.duration}) : super(key: key);
  final Duration duration;

  @override
  // ignore: no_logic_in_create_state
  State<LifeCycleWidget> createState() {
    log('1. createState: AnimatedIcon ${duration.toString()}');
    return _LifeCycleWidgetState();
  }
}

class _LifeCycleWidgetState extends State<LifeCycleWidget>
    with SingleTickerProviderStateMixin {
Color color = const Color(0XFF28bc6c);
  late AnimationController _controller;
  bool isPlay = true;
  
  @override
  void initState() {
    log('2. initState: AnimatedIcon ${widget.duration.inMilliseconds.toString()}');
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    super.initState();
  }

  @override
  void didChangeDependencies() {
    log('3. didChangeDependencies: AnimatedIcon ${widget.duration.inMilliseconds.toString()}');
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant LifeCycleWidget oldWidget) {
    log('5. didUpdateWidget: AnimatedIcon ${widget.duration.inMilliseconds.toString()}');
    _controller.duration = widget.duration;
    super.didUpdateWidget(oldWidget);
  }

  @override
  void deactivate() {
    log('6. deactivate: AnimatedIcon ${widget.duration.inMilliseconds.toString()}');
    super.deactivate();
  }

  @override
  void dispose() {
    log('7. dispose: AnimatedIcon ${widget.duration.inMilliseconds.toString()}');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    log('4. build: AnimatedIcon ${widget.duration.inMilliseconds.toString()}');
    return FloatingActionButton(
      backgroundColor: Colors.white,
      hoverColor: Colors.white,
      child: AnimatedIcon(
        color: color,
        icon: AnimatedIcons.play_pause,
        progress: _controller,
      ),
      onPressed: () {
        if (isPlay) {
          _controller.forward();
        } else {
          _controller.reverse();
        }
        isPlay = !isPlay;
      },
    );
  }
}