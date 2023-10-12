import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final String? url;
  final double? height;
  final double? width;
  const UserAvatar({
    Key? key,
    this.url,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(24, 8, 8, 8),
        height: height ?? 45,
        width: width ?? 45,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          // image: DecorationImage(
          //     fit: BoxFit.cover, image: NetworkImage(dogPhoto)),
          // color: AppColors.appColor2.withOpacity(0.2),
          // borderRadius: BorderRadius.circular(100)
        ),
        child: (url ?? '').isNotEmpty
            ? ClipOval(
                child: CachedNetworkImage(
                  imageUrl: url!,
                  fit: BoxFit.cover,
                  errorWidget: (c, _, __) => Image.asset(
                    '',
                    fit: BoxFit.scaleDown,
                  ),
                ),
              )
            : Image.asset(
                '',
                fit: BoxFit.scaleDown,
              ));
  }
}
