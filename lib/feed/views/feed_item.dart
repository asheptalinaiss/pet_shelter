import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pet_shelter/constants/app_assets.dart';
import 'package:pet_shelter/constants/app_colors.dart';

class FeedItem extends StatelessWidget {

  final String _imageUrl;
  final String _title;
  final String _description;
  final String _address;
  final double _width;

  const FeedItem({
    required String imageUrl,
    required String title,
    required String description,
    required String address,
    required double width
  }) :
        _imageUrl = imageUrl,
        _title = title,
        _description = description,
        _address = address,
        _width = width;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(8)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.08),
                offset: const Offset(0, 1),
                blurRadius: 8,
                spreadRadius: 1
            )
          ]
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        children: [
          _buildImage(_width),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8,),
                _buildTitle(),
                SizedBox(height: 4,),
                _buildDescription(),
                SizedBox(height: 8,),
                _buildAddress()
              ],
            ),
          ),
        ],
      )
    );
  }

  Widget _buildImage(double width) {
    return CachedNetworkImage(
      imageUrl: _imageUrl,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (_, url, error) => SvgPicture.asset(AppAssets.placeholderImage, width: width, height: width,),
    );
   }

  Widget _buildTitle() {
    return Text(
      _title,
      style: const TextStyle(
          fontFamily: AppAssets.mulishFontFamily,
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: AppColors.blackText
      ),
      maxLines: 1,
    );
  }

  Widget _buildDescription() {
    return Text(
      _description,
      style: const TextStyle(
          fontFamily: AppAssets.mulishFontFamily,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: AppColors.blackText
      ),
      maxLines: 2,
    );
  }

  Widget _buildAddress() {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.locationMarker, width: 16, height: 21,),
        Text(
          _address,
          style: const TextStyle(
              fontFamily: AppAssets.mulishFontFamily,
              fontWeight: FontWeight.bold,
              fontSize: 12,
              color: AppColors.hintText
          ),
          maxLines: 2,
        )
      ],
    );
  }
}
