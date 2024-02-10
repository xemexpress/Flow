import 'package:flutter/material.dart';
import 'package:textfield_tags/textfield_tags.dart';

class ProductTagsField extends StatefulWidget {
  final VoidCallback onUpdateWidget;
  final TextfieldTagsController tagsController;

  const ProductTagsField({
    super.key,
    required this.onUpdateWidget,
    required this.tagsController,
  });

  @override
  State<ProductTagsField> createState() => _ProductTagsFieldState();
}

class _ProductTagsFieldState extends State<ProductTagsField> {
  final FocusNode tagsFocusNode = FocusNode();
  late double _distanceToField;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _distanceToField = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return TextFieldTags(
      textfieldTagsController: widget.tagsController,
      focusNode: tagsFocusNode,
      inputfieldBuilder: (context, tec, fn, error, onChanged, onSubmitted) {
        return ((context, sc, tags, onTagDelete) {
          return TextField(
            controller: tec,
            focusNode: fn,
            decoration: InputDecoration(
              labelText: 'Tags',
              border: const OutlineInputBorder(),
              hintText:
                  widget.tagsController.hasTags ? '' : "Enter to add tags...",
              prefixIcon: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 20,
                    ),
                    child: Icon(
                      tagsFocusNode.hasFocus
                          ? Icons.style
                          : Icons.style_outlined,
                    ),
                  ),
                  if (tags.isNotEmpty)
                    ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: _distanceToField * 0.6,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8.0, 8.0, 8.0),
                        child: Wrap(
                          spacing: 8,
                          children: tags
                              .map(
                                (tag) => InputChip(
                                  labelPadding: const EdgeInsets.only(left: 12),
                                  padding: EdgeInsets.zero,
                                  label: Text('#$tag'),
                                  labelStyle: TextStyle(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onTertiary,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  deleteIcon: const Icon(
                                    Icons.close_outlined,
                                    size: 20,
                                  ),
                                  backgroundColor:
                                      Theme.of(context).colorScheme.tertiary,
                                  onDeleted: () {
                                    onTagDelete(tag);
                                    fn.requestFocus();
                                    widget.onUpdateWidget();
                                  },
                                  deleteIconColor: Theme.of(context)
                                      .colorScheme
                                      .onTertiary
                                      .withOpacity(0.8),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            onTap: widget.onUpdateWidget,
            onSubmitted: (value) {
              onSubmitted?.call(value);

              FocusScope.of(context).requestFocus(fn);
            },
          );
        });
      },
    );
  }
}
