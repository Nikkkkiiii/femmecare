
import 'package:femmecare/presentations/widget/base_button.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends BaseButton {
  CustomElevatedButton({
    Key? key,
    this.decoration,
    this.leftIcon,
    this.rightIcon,
    EdgeInsets? margin,
    VoidCallback? onPressed,
    ButtonStyle? buttonStyle,
    Alignment? alignment,
    TextStyle? buttonTextStyle,
    bool? isDisabled,
    double? height,
    double? width,
    Color? backgroundColorBtn,
    required String text,
  }) : super(
            text: text,
            onPressed: onPressed,
            buttonStyle: buttonStyle,
            isDisabled: isDisabled,
            buttonTextStyle: buttonTextStyle,
            height: height,
            width: width,
            alignment: alignment,
            margin: margin,
            color: backgroundColorBtn);

  final BoxDecoration? decoration;

  final Widget? leftIcon;

  final Widget? rightIcon;

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(
            alignment: alignment ?? Alignment.center,
            child: buildElevatedButtonWidget,
          )
        : buildElevatedButtonWidget;
  }

  Widget get buildElevatedButtonWidget => Container(
        padding: EdgeInsets.only(right: 16.0, left: 16.0),
        height: this.height ?? 57,
        width: this.width ?? 340,
        margin: margin,
        decoration: decoration,
        child: ElevatedButton(
          style: this.buttonStyle ??
              ElevatedButton.styleFrom(
                backgroundColor: this.color ?? Color.fromRGBO(41, 20, 100, 1),
                // backgroundColor: this.color ?? Color.fromRGBO(40, 25, 82, 1),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(27.0),
                ),
              ),
          onPressed: isDisabled ?? false ? null : onPressed ?? () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leftIcon ?? SizedBox.shrink(),
              Text(
                text,
                style: buttonTextStyle ??
                    TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Poppins'),
              ),
              rightIcon ?? SizedBox.shrink(),
            ],
          ),
        ),
      );
}
