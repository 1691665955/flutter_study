import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _sizeAnimation;
  Animation<Color> _colorAnimation;
  Duration _duration = Duration(milliseconds: 2000);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: _duration)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });
    _sizeAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.fastOutSlowIn);
    _sizeAnimation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_sizeAnimation);
    _colorAnimation =
        ColorTween(begin: Colors.red, end: Colors.cyan).animate(_controller);
    _controller.forward();
    // _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text("动画基础"),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: Column(
              children: [
                Container(
                  width: 100 * (1 + _sizeAnimation.value),
                  height: 100 * (1 + _sizeAnimation.value),
                  color: _colorAnimation.value,
                ),
                SizedBox(
                  height: 20,
                ),
                AnimationHeader(animation: _sizeAnimation),
                SizedBox(
                  height: 20,
                ),
                GrowTransition(
                  animation: _sizeAnimation,
                  child: Column(
                    children: [
                      Image.network(
                        "https://i0.hdslb.com/bfs/article/4f3af6d890ff756fbbf0721b071731258c3ef0c0.jpg",
                        fit: BoxFit.cover,
                        width: 50,
                        height: 50,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "good",
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          TimeLineAnimation()
        ],
      ),
    );
  }
}

class AnimationHeader extends AnimatedWidget {
  AnimationHeader({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation animation = listenable;
    return Container(
      width: 100 * (1 + animation.value),
      height: 100 * (1 + animation.value),
      child: Image.network(
        "https://i0.hdslb.com/bfs/article/4f3af6d890ff756fbbf0721b071731258c3ef0c0.jpg",
        fit: BoxFit.cover,
      ),
    );
  }
}

class GrowTransition extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const GrowTransition({Key key, this.animation, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (BuildContext context, Widget child) {
        return Container(
          width: 100 * (1 + animation.value),
          height: 100 * (1 + animation.value),
          color: Colors.red,
          child: child,
        );
      },
      child: child,
    );
  }
}

class TimeLineAnimation extends StatefulWidget {
  @override
  _TimeLineAnimationState createState() => _TimeLineAnimationState();
}

class _TimeLineAnimationState extends State<TimeLineAnimation>
    with TickerProviderStateMixin {
  AnimationController _posController;
  Animation<double> _posAnimation;
  Duration _duration = Duration(milliseconds: 2000);

  AnimationController _mController;
  Animation<double> _rotationAnimation;
  Animation<double> _scaleDownAnimation;
  Animation<double> _scaleUpAnimation;

  @override
  void initState() {
    super.initState();
    _posController = AnimationController(vsync: this, duration: _duration);
    _posAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _posController, curve: Curves.fastOutSlowIn));
    _posController
      ..addListener(() {
        setState(() {});
      });

    _mController = AnimationController(vsync: this, duration: _duration);
    _rotationAnimation = Tween(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(parent: _mController, curve: Interval(0.0, 0.7)));
    _scaleDownAnimation = Tween(begin: 1.0, end: 0.8).animate(
        CurvedAnimation(parent: _mController, curve: Interval(0.7, 0.85)));
    _scaleUpAnimation = Tween(begin: 0.8, end: 1.0).animate(
        CurvedAnimation(parent: _mController, curve: Interval(0.85, 1.0)));

    //动画启动
    _posController.forward();
  }

  @override
  void dispose() {
    _posController.dispose();
    _mController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height - 200;
    return AnimatedPositioned(
        right: 10,
        top: height * _posAnimation.value,
        duration: _duration,
        onEnd: () {
          Future.delayed(Duration(milliseconds: 500), () {
            _mController.repeat();
          });
        },
        child: Container(
          width: 80,
          height: 80,
          margin: EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.blueGrey,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1.5)),
          child: RotationTransition(
            turns: _rotationAnimation,
            child: ScaleTransition(
              scale: _scaleDownAnimation,
              child: ScaleTransition(
                scale: _scaleUpAnimation,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://i0.hdslb.com/bfs/article/4f3af6d890ff756fbbf0721b071731258c3ef0c0.jpg"),
                ),
              ),
            ),
          ),
        ));
  }
}

//AnimatedContainer
//RotationTransition
