import 'dart:io';
import 'package:femmecare/bloc/channel/article_bloc.dart';
import 'package:femmecare/presentations/article/article_list.dart';
import 'package:femmecare/presentations/widget/custom_elevatedButton.dart';
import 'package:femmecare/presentations/widget/custom_textfield.dart';
import 'package:femmecare/presentations/widget/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddArticle extends StatefulWidget {
  const AddArticle({super.key});

  @override
  State<AddArticle> createState() => _AddArticleState();
}

class _AddArticleState extends State<AddArticle> {
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController articleTitleController = TextEditingController();
  TextEditingController articleContentController = TextEditingController();
  File? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Add Article"))),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(right: 16.0, left: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextFormField(
                hintText: "Article Title",
                controller: articleTitleController,
                hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
                // context: context,
              ),
              const SizedBox(height: 20),
              CustomTextFormField(
                hintText: "Article Content",
                controller: articleContentController,
                hintStyle: const TextStyle(
                    color: Colors.grey,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),

                // context: context,
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.only(left: 13.0),
                child: Text(
                  "Add Image",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey, // Use a color from your color scheme
                    fontWeight:
                        FontWeight.w500, // Make the text bold for emphasis
                    fontSize:
                        20, // Increase the font size for better visibility
                    fontFamily: "poppins",
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ImagePickerWidget(
                onImageSelected: (File? selectedImage) {
                  setState(() {
                    print(selectedImage);
                    this.selectedImage = selectedImage;
                    print(selectedImage);
                  });
                },
                descriptionText: "Add a verifying image",
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomElevatedButton(
                    text: "Add",
                    backgroundColorBtn: Colors.pink,
                    // Theme.of(context).colorScheme.primary,
                    onPressed: () {
                      if (articleTitleController.text.isNotEmpty && articleContentController.text.isNotEmpty) {
                        
                        context.read<ArticleBloc>().add(PostArticle(
                            description: articleContentController.text.trim(),
                            Image: selectedImage,
                            title: articleTitleController.text.trim()));

                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Article posted successfully.'),
                                  duration: Duration(seconds: 1),
                                ),
                              );
                            });  final ArticleBloc articlelistbloc = ArticleBloc();

                                      articlelistbloc.add(ArticlePageOpened());

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ArticleList()),
                              );
                      } else {
                        // Form validation failed, display error message or handle appropriately
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please fill in all fields.'),
                            duration: Duration(seconds: 1),
                          ),
                        );
                      }


                    }),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
