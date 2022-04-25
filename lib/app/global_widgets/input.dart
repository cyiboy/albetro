import 'package:albetro/app/core/theme/color_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';


enum InputType { email, password, number, text, date }

class Input extends StatefulWidget {
  final bool multi;
  final int? lines;
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final InputType? type;
  final TextCapitalization? capitalization;
  final String? Function(String?)? validator;
  final IconButton? prefixIcon;
  final IconButton? suffixIcon;
  bool obscure;
  bool active;

  Input.multi(
      {this.label,
      this.hint,
      this.controller,
      this.type,
      this.capitalization,
      this.validator,
      this.prefixIcon,
      this.suffixIcon,
        this.active = true,
      this.lines})
      : multi = true,

        obscure = false;

  Input(
      {this.label,
      this.hint,
      this.controller,
      this.type,
        this.active = true,
      this.capitalization,
      this.validator,
      this.prefixIcon,
      this.suffixIcon})
      : multi = false,
        lines = 1,

        obscure = false;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  @override
  void initState() {
    // TODO: implement initState
    widget.obscure =    widget.type== InputType.password? true :false;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscure,
      enabled: widget.active,
      keyboardType: widget.type == InputType.email
          ? TextInputType.emailAddress
          : widget.type == InputType.number
              ? TextInputType.number
              : widget.type == InputType.date ? TextInputType.datetime :TextInputType.text,
      inputFormatters: widget.type == InputType.number
          ? [FilteringTextInputFormatter.digitsOnly]
          : [],
      validator: widget.validator,
      minLines: widget.multi ? widget.lines : 1,
      maxLines: widget.multi ? widget.lines : 1,
      textCapitalization: widget.capitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
          labelText: widget.label,
          labelStyle: TextStyle(
              color: Colors.grey
          ),
          contentPadding: EdgeInsets.all(20.0),
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.grey),
          fillColor:cards,
          filled: true,

          prefixIconColor: textColor.withOpacity(0.3),
          suffixIconColor: textColor.withOpacity(0.3),
          focusColor: textColor.withOpacity(0.3),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Surface , width: 1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Surface, width:1.0),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: widget.type == InputType.password
                ? IconButton(
                    onPressed: ()=> setState(() {
                      widget.obscure = !widget.obscure;
                    }),
                    icon: !widget.obscure ? Icon(Icons.visibility) : Icon(Icons.visibility_off)
                  )
                : widget.suffixIcon,
          prefixIcon: widget.prefixIcon
      ),
      cursorColor: Colors.white,
      style: new TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w400,
        color: textColor
      ),
    );
  }
}
