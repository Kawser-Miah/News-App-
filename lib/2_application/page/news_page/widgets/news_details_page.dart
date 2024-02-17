import 'package:flutter/material.dart';

class NewsDetails extends StatelessWidget {
  final String title;
  final String url;
  final String author;
  final String source;
  final String time;
  final String content;
  final String description;
  const NewsDetails(
      {super.key,
      required this.title,
      required this.url,
      required this.author,
      required this.source,
      required this.time,
      required this.content,
      required this.description});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News In Details',
          style: themeData.textTheme.displayMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                color: themeData.colorScheme.onPrimary,
                child: Text(
                  title,
                  style: themeData.textTheme.bodyMedium,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.6,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover)),
              ),
              const SizedBox(
                height: 8,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                width: MediaQuery.of(context).size.width,
                color: themeData.colorScheme.onPrimary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Author: $author',
                      style: themeData.textTheme.displaySmall,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Text('Source: $source',
                              style: themeData.textTheme.displaySmall),
                          const SizedBox(
                            width: 35,
                          ),
                          Text(
                            'Time: $time',
                            style: themeData.textTheme.displaySmall,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text(
                      'Content :',
                      style: themeData.textTheme.displaySmall,
                    ),
                    Text(
                      content,
                      style: themeData.textTheme.bodySmall,
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Text('Description :',
                        style: themeData.textTheme.displaySmall),
                    Text(
                      description,
                      style: themeData.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
