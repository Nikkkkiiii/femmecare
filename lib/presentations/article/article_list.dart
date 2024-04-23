import 'package:femmecare/bloc/channel/article_bloc.dart';
import 'package:femmecare/presentations/article/addArticle.dart';
import 'package:femmecare/presentations/article/channel.dart';
import 'package:femmecare/utils/datetime_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({super.key});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  final ArticleBloc articlelistbloc = ArticleBloc();

  // @override
  // void initState() {
  //   articlelistbloc.add(ArticlePageOpened());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    // setState(() {

    // });
          articlelistbloc.add(ArticlePageOpened());

    // Example data
    return BlocBuilder<ArticleBloc, ArticleState>(
      bloc: articlelistbloc,
      builder: (BuildContext context, ArticleState state) {
        if (state is TokenExpired) {
          print('me here');
          WidgetsBinding.instance.addPostFrameCallback((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Token is expired'),
                duration: Duration(seconds: 1),
              ),
            );
          });
        } else if (state is ArticleListFailure) {
          if (mounted) {
            print(state.error);
            // Show SnackBar using ScaffoldMessenger outside the build method

            // WidgetsBinding.instance.addPostFrameCallback((_) {
            //   ScaffoldMessenger.of(context).showSnackBar(
            //     SnackBar(
            //       content: Text('${state.error}'),
            //       duration: const Duration(seconds: 1),
            //     ),
            //   );
            // }
            // );
          }
        } else if (state is ArticleListSuccess) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: Center(child: Text('Articles')), // Set app bar title
              backgroundColor:
                  Colors.white, // Set app bar background color to pink
              // You can customize the app bar further with actions, etc.
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Stack(
                  children: [
                    Column(
                      children: state.articleList.map((article) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Channel()),
                                );
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors
                                      .pink, // Set pink container background color
                                  borderRadius: BorderRadius.circular(
                                      20), // Add curve to edges
                                ),
                                margin: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 20),
                                padding: EdgeInsets.all(20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // News title text
                                          Text(
                                            article.article_title,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white),
                                          ),
              
                                          // Description text for events
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                1.45,
                                            child: Text(
                                              article.article_content,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.white),
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 3,
                                              softWrap: true,
                                            ),
                                          ),
                                          Align(
                                            alignment: Alignment.bottomRight,
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.only(top: 8),
                                              margin: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Text(
                                                DateTimeUtils.formatRelativeTime(
                                                    article.article_date),
                                                style: const TextStyle(
                                                    fontSize: 13,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    //       IconButton(
                                    //   icon: Icon(Icons.edit, color: Colors.white), // Edit icon
                                    //   onPressed: () {
                                    //     // Navigate to edit article screen
                                    //   },
                                    // ),
                                    // IconButton(
                                    //   icon: Icon(Icons.delete, color: Colors.white), // Delete icon
                                    //   onPressed: () {
                                    //     // Delete the article
                                    //   },
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                          ],
                        );
                      }).toList(),
                    ),
                    Positioned(
                      bottom: 20,
                      right: 20,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => AddArticle()),
                          );
                        },
                        child: Icon(
                          Icons.add,
                          color: Colors.pink,
                        ),
                        backgroundColor: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
