

import 'base_blog.dart';

class BlogDataSource {
  static BlogDataSource instance =BlogDataSource();

  Future<Map<String, dynamic>> loadBlog() {
    return BaseBlog.get("Blog");
  }

  Future<Map<String, dynamic>> loadDetailBlog(int idDiterima){
    String id = idDiterima.toString();
    return BaseBlog.get("Blog/$id");
  }
}