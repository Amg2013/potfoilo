import 'dart:math';

import 'package:animated_background/animated_background.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class ZerosAndOnesBackground extends AnimatedBackground {
  List<ZeroOneParticle> particles = [];
  Size size;
  @override
  void paint(Canvas canvas, size) {
    final random = Random();
    final whitePaint = Paint()..color = Colors.white;
    final blackPaint = Paint()..color = Colors.black;

    for (int i = 0; i < size.width; i += 20) {
      for (int j = 0; j < size.height; j += 20) {
        final paint = random.nextBool() ? whitePaint : blackPaint;
        canvas.drawRect(
            Rect.fromLTWH(i.toDouble(), j.toDouble(), 20, 20), paint);
      }
    }
  }

  @override
  void tick(Duration timeElapsed) {
    final random = Random();
    final deltaX = random.nextDouble() * 10 - 5;
    final deltaY = random.nextDouble() * 10 - 5;
    final width = size.width;
    final height = size.height;

    // Create particles if there aren't enough
    if (particles.length < 200) {
      for (int i = 0; i < 10; i++) {
        particles.add(ZeroOneParticle(
          position:
              Offset(random.nextDouble() * width, random.nextDouble() * height),
          direction:
              Offset(random.nextDouble() * 2 - 1, random.nextDouble() * 2 - 1),
          color: Colors.white,
          size: random.nextDouble() * 10 + 5,
        ));
      }
    }

    // Move particles and update direction if they hit a wall
    for (final particle in particles) {
      particle.position = particle.position
          .translate(particle.direction.dx, particle.direction.dy);
      if (particle.position.dx < 0 || particle.position.dx > width) {
        particle.direction =
            Offset(-particle.direction.dx, particle.direction.dy);
      }
      if (particle.position.dy < 0 || particle.position.dy > height) {
        particle.direction =
            Offset(particle.direction.dx, -particle.direction.dy);
      }
    }
  }
}

class ZeroOneParticle {
  Offset position;
  Offset direction;
  Color color;
  double size;

  ZeroOneParticle({
    this.position,
    this.direction,
    this.color,
    this.size,
  });
}
