import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flow/src/common/common.dart';
import 'package:flow/src/core/core.dart';
import 'package:flow/src/features/products/controllers/controllers.dart';
import 'package:flow/src/features/products/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:textfield_tags/textfield_tags.dart';

class CreateProductScreen extends ConsumerStatefulWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const CreateProductScreen(),
      );

  const CreateProductScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CreateProductScreenState();
}

class _CreateProductScreenState extends ConsumerState<CreateProductScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextfieldTagsController _tagsController = TextfieldTagsController();
  final TextEditingController _remarksController = TextEditingController();

  List<File> images = [];

  @override
  void dispose() {
    _nameController.dispose();
    _barcodeController.dispose();
    _quantityController.dispose();
    _tagsController.dispose();
    _remarksController.dispose();

    super.dispose();
  }

  void onUpdateWidget() {
    setState(() {});
  }

  void onTakePhoto() async {
    final photo = await takePhoto();

    if (photo != null) {
      setState(() {
        images = images.isEmpty ? [photo] : images + [photo];
      });
    }
  }

  void onPickImages() async {
    final pickedImages = await pickImages();

    for (var image in pickedImages) {
      if (!images.contains(image)) {
        images.add(image);
      }
    }

    setState(() {});
  }

  void createProduct() {
    ref
        .read(
          productControllerProvider.notifier,
        )
        .createProduct(
          name: _nameController.text,
          barcode: _barcodeController.text,
          quantity: _quantityController.text.isNotEmpty
              ? int.parse(
                  _quantityController.text,
                )
              : 0,
          images: images,
          tags: _tagsController.getTags ?? [],
          remarks: _remarksController.text,
          context: context,
          whenCreated: clearAllFields,
        );
  }

  void clearAllFields() {
    _nameController.clear();
    _barcodeController.clear();
    _quantityController.clear();
    _tagsController.clearTags();
    _remarksController.clear();

    setState(() {
      images = [];
    });
  }

  void onExitCreateProductScreen() {
    clearAllFields();

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isCreatingProduct = ref.watch(productControllerProvider);

    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.close,
                size: 30,
              ),
              onPressed: onExitCreateProductScreen,
            ),
            title: const Text('New Product'),
            actions: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 5,
                    ),
                  ),
                  onPressed:
                      _nameController.text.isNotEmpty ? createProduct : null,
                  child: Text(
                    'Create',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
              ),
            ],
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10,
            ),
            child: Column(
              children: [
                ProductTextField(
                  controller: _nameController,
                  icon: Icons.inventory_2_outlined,
                  selectedIcon: Icons.inventory_2,
                  labelText: 'Product Name*',
                  onUpdateWidget: onUpdateWidget,
                ),
                const SizedBox(height: 15),
                ProductTextField(
                  controller: _barcodeController,
                  icon: Icons.document_scanner_outlined,
                  selectedIcon: Icons.document_scanner,
                  labelText: 'Barcode',
                  onUpdateWidget: onUpdateWidget,
                  iconQuarterTurns: 1,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                  ),
                ),
                const SizedBox(height: 15),
                ProductTextField(
                  controller: _quantityController,
                  icon: Icons.calculate_outlined,
                  selectedIcon: Icons.calculate,
                  labelText: 'Quantity',
                  onUpdateWidget: onUpdateWidget,
                  keyboardType: const TextInputType.numberWithOptions(
                    decimal: false,
                  ),
                ),
                const SizedBox(height: 15),
                ProductTagsField(
                  onUpdateWidget: onUpdateWidget,
                  tagsController: _tagsController,
                ),
                const SizedBox(height: 15),
                ProductTextField(
                  controller: _remarksController,
                  selectedIcon: Icons.description,
                  icon: Icons.description_outlined,
                  labelText: 'Remarks',
                  onUpdateWidget: onUpdateWidget,
                  maxLines: 3,
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 15,
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  // decoration: BoxDecoration(color: Colors.red),
                  child: images.isNotEmpty
                      ? CarouselSlider(
                          items: images
                              .map(
                                (e) => Container(
                                  // margin: const EdgeInsets.symmetric(
                                  //   vertical: 20,
                                  //   horizontal: 10,
                                  // ),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .tertiary
                                          .withOpacity(.5),
                                    ),
                                  ),
                                  child: Image.file(
                                    e,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ),
                              )
                              .toList(),
                          options: CarouselOptions(
                            height: 300,
                            enableInfiniteScroll: false,
                          ),
                        )
                      : const Text('No image yet...'),
                ),
              ],
            ),
          ),
          bottomNavigationBar: SafeArea(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).colorScheme.onBackground,
                    width: 0.3,
                  ),
                ),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: onTakePhoto,
                    icon: const Icon(Icons.camera_alt_outlined),
                  ),
                  IconButton(
                    onPressed: onPickImages,
                    icon: const Icon(Icons.photo_outlined),
                  ),
                ],
              ),
            ),
          ),
        ),
        if (isCreatingProduct)
          const Opacity(
            opacity: 0.4,
            child: ModalBarrier(
              dismissible: false,
              color: Colors.black,
            ),
          ),
        if (isCreatingProduct) const Loader(),
      ],
    );
  }
}
