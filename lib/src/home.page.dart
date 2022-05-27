import 'package:flutter/material.dart';
import 'package:token_signal_app/src/api.service.dart';
import 'package:token_signal_app/src/firebase.service.dart';
import 'package:token_signal_app/src/news.data.dart';
import 'package:timeago/timeago.dart' as timeago;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    subscribe();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff1E1D24),
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
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final item = (snapshot.data ?? [])[index];
              return _ItemWidget(item: item);
            },
          );
        },
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key? key,
    required this.item,
  }) : super(key: key);

  final NewsData item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff292A33),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  timeago.format(DateTime.fromMillisecondsSinceEpoch(item.timestamp)),
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.7),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
