import 'package:flutter/material.dart';
import 'package:simple_news_app/0_data/models/news_model.dart';

class ListViewScreen extends StatelessWidget {
  final List<Articles> news;
  const ListViewScreen({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return Card(
            color: themeData.colorScheme.onPrimary,
            elevation: 1,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                onTap: () => Navigator.pushNamed(context, '/news_details_page',
                    arguments: {
                      'title': news[index].title,
                      'url': news[index].urlToImage,
                      'author': news[index].author,
                      'source': news[index].source?.name,
                      'time': news[index].publishedAt,
                      'content': news[index].content,
                      'description': news[index].description
                    }),
                title: Text(
                  news[index].title.toString(),
                  style: themeData.textTheme.bodyMedium,
                ),
                subtitle: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Text(
                        'Source: ${news[index].source?.name.toString()}',
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      const Icon(Icons.access_time_outlined),
                      Text(
                        news[index].publishedAt.toString(),
                        style: const TextStyle(fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
