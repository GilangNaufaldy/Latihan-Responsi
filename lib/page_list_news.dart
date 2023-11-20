import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:latihan_responsi/news_data_source.dart';
import 'news_model.dart';

class PageListNews extends StatelessWidget {
  const PageListNews({super.key, required super.image, required super.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List News"),
      ),
      body: _buildListNewsBody(),
    );
  }
}

Widget _buildListNewsBody() {
  return Container(
    child: FutureBuilder(
      future: NewsDataSource.instance.loadNews(),
      builder: (BuildContext context, AsyncSnapshot<dynamic?> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        }
        if (snapshot.hasData) {
          NewsModel newsModel = NewsModel.fromJson(snapshot.data);
          return _buildSuccessSection(newsModel);
        }
        return _buildLoadingSection();
      },
    ),
  );
}

Widget _buildErrorSection() {
  return Text("Gagal");
}

Widget _buildLoadingSection() {
  return Center(
    child: CircularProgressIndicator(),
  );
}

Widget _buildSuccessSection(NewsModel data) {
  return ListView.builder(
    itemCount: data.data!.length,
    itemBuilder: (BuildContext context, int index) {
      return _buildItemNews(data.data![index]);
    },
  );
}

Widget _buildItemNews(Data NewsModel) {
  return InkWell(
    onTap: () => null,
    //  Navigator.push(context, MaterialPageRoute(builder: (context) => PageDetailUser(idUser: userData.id!,))
    // )
    child: Card(
      child: Row(mainAxisAlignment: MainAxisAlignment.start, children: [
        Container(
          width: 100,
          child: Image.network(NewsModel.imageUrl!),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(NewsModel.title!)],
        ),
      ]),
    ),
  );
}

class CardHalamanDetail extends StatelessWidget {
  const CardHalamanDetail({super.key, required this.image, required this.name});
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Card(
        child: Column(children: [
          SizedBox(height: 200, width: 200, child: Image.network(image)),
          Text(name)
        ]),
      ),
    );
  }
}
