import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:workshop/utils/textStyles.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final bool isEmail;
  final IconData? prefixIcon;

  CustomTextField({
    this.hintText = 'Write something...',
    required this.controller,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.prefixIcon,
    this.isEmail = false,
    this.isPassword = false,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;
  bool _isValidEmail = false;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validateInput(String? value) {
    if (value != null) {
      setState(() {
        _isValidEmail = RegExp(
                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(value);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      textInputAction: widget.inputAction,
      keyboardType: widget.inputType,
      obscureText: widget.isPassword ? _obscureText : false,
      // inputFormatters: widget.inputType == TextInputType.phone
      //     ? <TextInputFormatter>[
      //         FilteringTextInputFormatter.allow(RegExp('[0-9]'))
      //       ]
      //     : null,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        isDense: true,
        hintText: widget.hintText,
        hintStyle: textStyle(
          14,
          Colors.black,
          FontWeight.w400,
          0.5,
        ),
        prefixIcon: widget.prefixIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Icon(widget.prefixIcon),
              )
            : null,
        suffixIcon: widget.isEmail
            ? _isValidEmail
                ? const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                  )
                : const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Icon(
                      Icons.error,
                      color: Colors.yellow,
                    ),
                  )
            : widget.isPassword
                ? IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility_off : Icons.visibility,
                      color: Colors.grey,
                    ),
                    onPressed: _toggle,
                  )
                : null,
      ),
      onChanged: _validateInput,
    );
  }
}
