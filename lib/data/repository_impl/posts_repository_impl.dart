import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/util/constants.dart';
import '../../domain/repository/i_posts_repository.dart';
import '../datasource/local/DAOs/database_posts.dart';
import '../datasource/remote/api_service.dart';
import '../model/post_impl.dart';

class PostsRepository extends DatabasePosts implements IPostsRepository {
  final ApiService _service;
  final DatabasePosts _dbPosts;

  PostsRepository(
    this._service,
    this._dbPosts,
  );

  @override
  Future<List<PostImpl>> fetchPosts(endpoint) async {
    List<PostImpl> postsList = [];

    try {
      var apiResponse = await _service.apiCall(endpoint: endpoint);
      if (apiResponse.statusCode == HttpStatus.ok) {
        List<dynamic> posts = json.decode(apiResponse.body);

        if (posts.isEmpty) {
          return postsList;
        } else {
          posts.forEach((post) {
            postsList.add(
              PostImpl.fromJson(post),
            );
          });
          _dbPosts.addPosts(
            posts: posts,
          );
          return postsList;
        }
      }
      return getPostsFromDatabase();
    } catch (e) {
      return getPostsFromDatabase();
    }
  }

  Future<List<PostImpl>> modelResponse(
    List<QueryDocumentSnapshot> response,
  ) async {
    List<PostImpl> postsList = [];
    List<QueryDocumentSnapshot> posts = response;
    posts.forEach((post) {
      postsList.add(
        PostImpl.fromJson(post),
      );
    });
    return postsList;
  }

  @override
  Future<bool> sendPost(Map<String?, dynamic>? jsonBody) async {
    try {
      var apiResponsePost = await _service.apiPost(
        json: jsonBody,
        endpoint: Services.postsEndpoint,
      );
      if (apiResponsePost.statusCode == HttpStatus.ok ||
          apiResponsePost.statusCode == HttpStatus.created) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
