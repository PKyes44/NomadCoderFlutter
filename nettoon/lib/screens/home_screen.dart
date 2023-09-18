import 'package:flutter/material.dart';
import 'package:nettoon/models/webtoon_model.dart';
import 'package:nettoon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService().getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.green,
        backgroundColor: Colors.white,
        title: const Text(
          "Today's toon",
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ),
      body: FutureBuilder(
        builder: (context, futureResult) {
          if (futureResult.hasData) {
            return ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: futureResult.data!.length,
              itemBuilder: (context, index) {
                var webtoon = futureResult.data![index];

                return Text(webtoon.title);
              },
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: webtoons,
      ),
    );
  }
}
