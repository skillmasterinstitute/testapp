// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class Slide extends StatefulWidget {
  const Slide({
    Key? key,
    this.width,
    this.height,
    this.im1,
    this.im2,
    this.im3,
    this.im4,
    this.im5,
    this.im6,
    this.im7,
    this.im8,
    this.im9,
    this.im10,
    this.ic1,
    this.ic2,
    this.ic3,
    this.ic4,
    this.ic5,
    this.ic6,
    this.ic7,
    this.ic8,
    this.ic9,
    this.ic10,
  }) : super(key: key);

  final double? width;
  final double? height;
  final String? im1;
  final String? im2;
  final String? im3;
  final String? im4;
  final String? im5;
  final String? im6;
  final String? im7;
  final String? im8;
  final String? im9;
  final String? im10;
  final Future<dynamic> Function()? ic1;
  final Future<dynamic> Function()? ic2;
  final Future<dynamic> Function()? ic3;
  final Future<dynamic> Function()? ic4;
  final Future<dynamic> Function()? ic5;
  final Future<dynamic> Function()? ic6;
  final Future<dynamic> Function()? ic7;
  final Future<dynamic> Function()? ic8;
  final Future<dynamic> Function()? ic9;
  final Future<dynamic> Function()? ic10;

  @override
  _SlideState createState() => _SlideState();
}

class _SlideState extends State<Slide> {
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final imageWidgets = [
      _buildImage(widget.im1, widget.ic1),
      _buildImage(widget.im2, widget.ic2),
      _buildImage(widget.im3, widget.ic3),
      _buildImage(widget.im4, widget.ic4),
      _buildImage(widget.im5, widget.ic5),
      _buildImage(widget.im6, widget.ic6),
      _buildImage(widget.im7, widget.ic7),
      _buildImage(widget.im8, widget.ic8),
      _buildImage(widget.im9, widget.ic9),
      _buildImage(widget.im10, widget.ic10),
    ];

    // Filter out null widgets to avoid the error
    final validImageWidgets =
        imageWidgets.where((widget) => widget != null).toList();

    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
      child: Container(
        width: widget.width ?? double.infinity,
        height: widget.height ?? 180,
        child: CarouselSlider(
          items: validImageWidgets.cast<Widget>(), // Cast to List<Widget>
          carouselController: _carouselController, // Use the carouselController
          options: CarouselOptions(
            initialPage: 0, viewportFraction: 1.0, enlargeCenterPage: true,
            disableCenter: false, enlargeFactor: 0.0,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 5),
            // Add more options as needed
          ),
        ),
      ),
    );
  }

  Widget? _buildImage(
      String? imageUrl, Future<dynamic> Function()? customAction) {
    if (imageUrl != null && imageUrl.isNotEmpty) {
      return GestureDetector(
        onTap: () {
          // Check if there is a custom action function for this image
          if (customAction != null) {
            customAction();
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 10.0), // Adjust the spacing as needed
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              width: 400,
              height: 200,
              fit: BoxFit.cover,
              // You can customize the cache options here if needed
              cacheKey: imageUrl, // Optional cache key for better control
              placeholder: (context, url) =>
                  CircularProgressIndicator(), // Placeholder while loading
              errorWidget: (context, url, error) =>
                  Icon(Icons.error), // Error widget
            ),
          ),
        ),
      );
    } else {
      return null; // Return null when the URL is not set
    }
  }
}
