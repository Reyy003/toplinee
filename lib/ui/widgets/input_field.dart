part of 'widgets.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? hint;
  final String? labelText;
  final TextInputType? inputType;
  final Color? textColor;
  final double? textSize;
  final Widget? prefixIcon;
  final Function(String)? onChanged;

  const InputField(
    this.controller, {
    this.focusNode,
    this.inputType = TextInputType.name,
    this.hint = "",
    this.labelText = "",
    this.textColor = Colors.black87,
    this.textSize = 14,
    this.onChanged,
    this.prefixIcon,
    key,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool _isObscureText = true;
  InputBorder inputBorder = OutlineInputBorder(
    borderSide: BorderSide(color: subtitleColorText2),
    borderRadius: BorderRadius.circular(16),
  );

  // Hide text if password input type
  void changeObsecureText() {
    setState(() {
      _isObscureText = !_isObscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: widget.controller,
          focusNode: widget.focusNode,
          keyboardType: widget.inputType,
          maxLines: (widget.inputType == TextInputType.multiline) ? null : 1,
          style: GoogleFonts.urbanist(
              color: widget.textColor,
              fontSize: widget.textSize,
              fontWeight: FontWeight.w600),
          onChanged: (value) {
            if (widget.onChanged != null) {
              widget.onChanged!(value);
            }
          },
          onEditingComplete: () {
            // Close keyboard on complete input/enter
            if (widget.focusNode != null) {
              widget.focusNode!.unfocus();
            }
          },
          obscuringCharacter: '●',
          obscureText: (widget.inputType == TextInputType.visiblePassword)
              ? _isObscureText
              : false,
          decoration: InputDecoration(
            hintText: widget.hint,
            // Show label on user focus and has input
            labelText: (widget.controller.text.isNotEmpty |
                    (widget.focusNode != null
                        ? widget.focusNode!.hasFocus
                        : false))
                ? widget.labelText
                : null,
            labelStyle: GoogleFonts.urbanist(
                color: widget.textColor,
                fontSize: widget.textSize,
                fontWeight: FontWeight.w600),
            filled: true,
            fillColor: Colors.white,
            enabledBorder: inputBorder,
            border: inputBorder,
            focusedBorder: inputBorder,
            disabledBorder: InputBorder.none,
            contentPadding: EdgeInsets.all(24.w),
            prefixIconConstraints: BoxConstraints(
              minHeight: 48.r,
              minWidth: 64.r,
              maxHeight: 48.r,
              maxWidth: 64.r,
            ),
            prefixIcon: widget.prefixIcon,

            // Add suffix eye icon on password input type
            suffixIconConstraints: BoxConstraints(
              minHeight: 48.r,
              minWidth: 64.r,
              maxHeight: 48.r,
              maxWidth: 64.r,
            ),
            suffixIcon: (widget.inputType == TextInputType.visiblePassword)
                ? Padding(
                    padding: EdgeInsets.only(right: 12.w),
                    child: GestureDetector(
                      onTap: changeObsecureText,
                      child: (_isObscureText)
                          ? Iconify(Mdi.remove_red_eye, color: blackColor)
                          : Iconify(Mdi.eye_off, color: blackColor),
                    ),
                  )
                : null,
          ),
        ),
      ],
    );
  }
}
