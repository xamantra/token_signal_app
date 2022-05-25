import 'package:flutter/material.dart';
import 'package:token_signal_app/src/api.service.dart';
import 'package:token_signal_app/src/news.data.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<NewsData>>(
        future: getNewsList(),
        builder: (context, snapshot) {
          if (!snapshot.hasData && (snapshot.data ?? []).isEmpty) {
            return const Center(
              child: SizedBox(
                height: 36,
                width: 36,
                child: CircularProgressIndicator(),
              ),
            );
          }

          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final item = (snapshot.data ?? [])[index];
              return Card(
                child: Column(
                  children: [
                    Text(
                      item.title,
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
