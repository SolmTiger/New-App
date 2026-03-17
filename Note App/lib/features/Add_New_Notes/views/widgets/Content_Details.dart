import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class Custom_contentDetails extends StatelessWidget {
  const Custom_contentDetails({super.key, required QuillController controller})
    : _controller = controller;

  final QuillController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,

      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 254, 253, 253),
        borderRadius: BorderRadius.circular(30),
        border: BoxBorder.all(color: Colors.black),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: QuillEditor.basic(
              config: QuillEditorConfig(
                autoFocus: true,
                placeholder: 'Start typing your note...',
                checkBoxReadOnly: false,
                padding: EdgeInsets.all(15),
              ),

              controller: _controller,
            ),
          ),
          Divider(height: 1, thickness: 1),
          SizedBox(height: 10),

          QuillSimpleToolbar(
            controller: _controller,
            config: QuillSimpleToolbarConfig(
              multiRowsDisplay: false,
              showFontSize: false,
              showFontFamily: false,
              showBoldButton: true,
              showItalicButton: true,
              showUnderLineButton: false,
              showStrikeThrough: false,
              showListBullets: true,
              showListNumbers: false,
              showAlignmentButtons: false,
              showSearchButton: false,
              showColorButton: false,
              showBackgroundColorButton: false,
              showClearFormat: false,
              buttonOptions: QuillSimpleToolbarButtonOptions(
                base: QuillToolbarBaseButtonOptions(
                  iconTheme: QuillIconTheme(
                    iconButtonSelectedData: IconButtonData(
                      style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all(
                          Colors.blueAccent,
                        ),
                      ),
                    ),
                    iconButtonUnselectedData: IconButtonData(
                      style: IconButton.styleFrom(
                        foregroundColor: Colors.grey.shade700,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
