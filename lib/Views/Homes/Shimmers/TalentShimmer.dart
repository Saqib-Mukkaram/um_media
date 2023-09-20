import 'package:flutter/material.dart';

class TalentCardShimmer extends StatefulWidget {
  const TalentCardShimmer({
    super.key,
  });

  @override
  State<TalentCardShimmer> createState() => _TalentCardShimmerState();
}

class _TalentCardShimmerState extends State<TalentCardShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _shimmerController;
  @override
  void initState() {
    super.initState();

    _shimmerController = AnimationController.unbounded(vsync: this)
      ..repeat(min: -0.5, max: 1.5, period: const Duration(milliseconds: 1000));
  }

  @override
  void dispose() {
    _shimmerController.dispose();
    super.dispose();
  }

  final _shimmerGradient = LinearGradient(
    colors: [
      Color(0xFFEBEBF4),
      Color(0xFFF4F4F4),
      Color(0xFFEBEBF4),
    ],
    stops: [
      0.1,
      0.3,
      0.4,
    ],
    begin: Alignment(-1.0, -0.3),
    end: Alignment(1.0, 0.3),
    tileMode: TileMode.clamp,
  );
  LinearGradient get gradient => LinearGradient(
        colors: _shimmerGradient.colors,
        stops: _shimmerGradient.stops,
        begin: _shimmerGradient.begin,
        end: _shimmerGradient.end,
        transform:
            _SlidingGradientTransform(slidePercent: _shimmerController.value),
      );
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.fromLTRB(5, 0, 5, 8),
      child: Card(
        elevation: 8,
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          child: Container(
            color: Colors.white,
            // color: Color.fromARGB(28, 0, 0, 0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Image.asset(AppConstants.img_photography)
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                      Color.fromARGB(255, 163, 162, 162),
                      Color.fromARGB(255, 24, 24, 24)
                    ])),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Container())
                ]),
          ),
        ),
      ),
    );
  }
}

// src,
//                           width: 150,
//                           height: 200,
//                           fit: BoxFit.fill,
class _SlidingGradientTransform extends GradientTransform {
  const _SlidingGradientTransform({
    required this.slidePercent,
  });

  final double slidePercent;

  @override
  Matrix4? transform(Rect bounds, {TextDirection? textDirection}) {
    return Matrix4.translationValues(bounds.width * slidePercent, 0.0, 0.0);
  }
}
