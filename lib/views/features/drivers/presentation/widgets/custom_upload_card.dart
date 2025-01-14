import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:text_scroll/text_scroll.dart';

class CustomCardUploadFile extends StatelessWidget {
  final int index;
  final String? name;
  final String? size;
  final String? icon;
  final bool? isSended;
  final bool? isLoading;
  final bool? isFail;
  final Function()? onTap;
  const CustomCardUploadFile({
    super.key,
    this.index = 0,
    this.name,
    this.onTap,
    this.icon,
    this.isSended = false,
    this.isLoading = false,
    this.isFail = false,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 75,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xffDADADA), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Flexible(
              child: Row(
                children: [
                  isFail!
                      ? const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 20,
                        )
                      : const SizedBox(),
                  isSended!
                      ? const Icon(
                          Icons.check_circle,
                          color: Colors.green,
                          size: 20,
                        )
                      : const SizedBox(),
                  isLoading! && isFail == false
                      ? const SizedBox(
                          height: 15,
                          width: 15,
                          child: CircularProgressIndicator(
                            color: Colors.orange,
                            strokeWidth: 3,
                          ),
                        )
                      : const SizedBox(),
                  const Gap(10),
                  SvgPicture.asset(icon ?? ''),
                  const Gap(10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 260,
                        child: TextScroll(
                          name ?? "",
                          style: context.textTheme.labelLarge?.copyWith(),
                          textAlign: TextAlign.right,
                          selectable: false,
                          velocity:
                              const Velocity(pixelsPerSecond: Offset(25, 0)),
                          delayBefore: const Duration(milliseconds: 500),
                          pauseBetween: const Duration(milliseconds: 50),
                        ),
                      ),
                      Text(
                        '$size . ${DateFormat('dd MMM, yyyy').format(
                          DateTime.now(),
                        )}  ',
                        style: context.textTheme.bodySmall
                            ?.copyWith(color: const Color(0xff71839B)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: onTap,
              child: SvgPicture.asset("assets/svg/delete_icon.svg"),
            )
          ],
        ),
      ),
    );
  }
}
