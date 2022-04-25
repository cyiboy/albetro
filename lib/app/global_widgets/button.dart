import 'package:albetro/app/core/theme/color_theme.dart';
import 'package:flutter/material.dart';


class Press extends StatelessWidget {
  final String title;
  final Function()? onPressed;
  final Color background;
  final Color foreground;
  final bool loading;

  Press.light(this.title, {this.onPressed, this.loading = false})
      : background = Colors.white,
        foreground = const Color(0xFF2F3733);

  Press.bold(this.title,
      {this.onPressed,
      this.loading = false,
      this.foreground = Colors.black,
      this.background = const  Color(0xFFFFC78C)});

  Press.dark(this.title, {this.onPressed, this.loading = false})
      : background = const  Color(0xFFFFC78C),
        foreground = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: .15.ofWidth),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: loading
                    ? const SizedBox(
                        child: CircularProgressIndicator(),
                        height: 25,
                        width: 25,
                      )
                    : Text(
                        title,
                        style: TextStyle(
                            color: foreground, fontWeight: FontWeight.w600,),
                      ),
              ),
              onPressed: loading ? null : onPressed,
              style: ElevatedButton.styleFrom(
                  primary: background,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
