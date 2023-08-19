import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:together/theme/colors.dart';

class XInput extends StatefulWidget {
  const XInput({
    required this.value,
    Key? key,
    this.onChanged,
    this.readOnly = false,
    this.onTap,
    this.keyboardType,
    this.obscureText = false,
    this.hintText,
    this.textAlign = TextAlign.left,
    this.style,
    this.maxLength,
    this.autofocus = false,
    this.inputFormatters,
    this.prefixIcon,
    this.contentPadding,
    this.errorText,
    this.hintStyle,
    this.enabledBorder,
    this.focusedBorder,
    this.maxLines = 1,
    this.border,
    this.isAction = true,
    this.checkText = false,
    this.heightFactorsuffix = 1.8,
    this.helperText = " ",
    this.isDense = false,
    this.onSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.suffixIconConstraints,
    this.enabled = true,
    this.hintMaxLines,
    this.counterText,
    this.errorBorder,
    this.cursorColor,
    this.onTapOutside,
    this.onEditingComplete,
  }) : super(key: key);

  final String value;
  final TextInputType? keyboardType;
  final bool obscureText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final String? hintText;
  final int? maxLength;
  final bool autofocus;
  final bool readOnly;
  final Widget? prefixIcon;
  final String? errorText;
  final TextAlign textAlign;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  final InputBorder? border;
  final InputBorder? errorBorder;
  final int? maxLines;
  final bool isAction;
  final bool checkText;
  final double? heightFactorsuffix;
  final String? helperText;
  final bool isDense;
  final Function(String value)? onSubmitted;
  final TextCapitalization textCapitalization;
  final BoxConstraints? suffixIconConstraints;
  final bool? enabled;
  final int? hintMaxLines;
  final String? counterText;
  final Color? cursorColor;
  final VoidCallback? onTapOutside;
  final VoidCallback? onEditingComplete;

  @override
  State<XInput> createState() => _XInputState();
}

class _XInputState extends State<XInput> {
  late TextEditingController _controller;
  String get value => widget.value;
  bool obscureText = false;

  @override
  void initState() {
    super.initState();
    obscureText = widget.obscureText;
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(XInput oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (_controller.text != widget.value) {
      _controller.text = widget.value;
    }
  }

  Widget? _buildActions() {
    final List<Widget> actions = [];
    if (widget.obscureText && widget.isAction) {
      actions.add(
        IconButton(
          padding: EdgeInsets.zero,
          icon: Icon(
            obscureText ? Icons.visibility : Icons.visibility_off,
            color: XColors.primary,
          ),
          onPressed: () => setState(() {
            obscureText = !obscureText;
          }),
        ),
      );
    }

    if (actions.isEmpty) {
      return null;
    }
    if (actions.length == 1) {
      return actions[0];
    }
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: actions,
    );
  }

  @override
  Widget build(BuildContext context) {
    const inputBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: XColors.brightNavyBlue, width: 2));
    return TextField(
      onTapOutside: (e) {
        FocusScope.of(context).unfocus();
        widget.onTapOutside?.call();
      },
      onEditingComplete: () {
        FocusScope.of(context).unfocus();
        widget.onEditingComplete?.call();
      },
      onSubmitted: (e) {
        FocusScope.of(context).unfocus();
        widget.onSubmitted?.call(e);
      },
      cursorColor: widget.cursorColor,
      enabled: widget.enabled,
      controller: _controller,
      maxLines: widget.maxLines,
      onChanged: widget.onChanged,
      keyboardType: widget.keyboardType,
      textCapitalization: widget.textCapitalization,
      style: widget.style ??
          const TextStyle(fontSize: 17, color: XColors.brightNavyBlue),
      textAlign: widget.textAlign,
      obscureText: obscureText,
      maxLength: widget.maxLength,
      autofocus: widget.autofocus,
      onTap: widget.onTap,
      readOnly: widget.readOnly,
      scrollPhysics: const ClampingScrollPhysics(),
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        counterStyle: const TextStyle(color: XColors.brightNavyBlue),
        contentPadding:
            widget.contentPadding ?? const EdgeInsets.only(bottom: 23, left: 9),
        prefixIconConstraints:
            const BoxConstraints(minWidth: 30, minHeight: 30),
        suffixIconConstraints: widget.suffixIconConstraints ??
            const BoxConstraints(
                minWidth: 0, minHeight: 27, maxHeight: 27, maxWidth: 27),
        hintText: widget.hintText,
        hintStyle: widget.hintStyle ??
            TextStyle(
                fontSize: 17, color: XColors.brightNavyBlue.withOpacity(.35)),
        enabledBorder: widget.enabledBorder ?? inputBorder,
        focusedBorder: widget.focusedBorder ?? inputBorder,
        errorBorder: widget.errorBorder ?? inputBorder,
        prefixIcon: widget.prefixIcon,
        labelStyle: const TextStyle(color: Color(0xCC50555C)),
        border: widget.border,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        filled: false,
        counterText: widget.counterText,
        errorStyle: const TextStyle(fontSize: 13),
        suffixIcon: FractionallySizedBox(
            heightFactor: widget.heightFactorsuffix,
            alignment: Alignment.bottomRight,
            child: _buildActions()),
        errorText: widget.errorText,
        errorMaxLines: 2,
        hintMaxLines: widget.hintMaxLines,
        helperText: widget.helperText,
        helperMaxLines: 1,
        isDense: widget.isDense,
      ),
    );
  }
}
