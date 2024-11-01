import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
//suppose we have 2 api sources with different attribute names in the jsons but with the same structure(Lists)

class YTData {
  String apiResFromYT() {
    return '''
      [
        {
          "title": "click analytics",
          "description": "using clevertap for enagements and google analytics sdk"
        },
        {
          "title": "view analytics",
          "description": "using ...."
        }
      ]
    ''';
  }
}

class TwitterData{
  String apiRespFromTwitter(){
    return '''
      [
        {
          "header": "click analytics twitter",
          "bio": "using clevertap for enagements and google analytics sdk"
        },
        {
          "header": "view analytics twitter",
          "bio": "using ...."
        }
      ]
    ''';
  }
}

class Posts {
  final String title; 
  final String bio;
  const Posts({
    required this.title,
    required this.bio,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'bio': bio,
    };
  }

  factory Posts.fromMap(Map<String, dynamic> map) {
    return Posts(
      title: map['title'] as String,
      bio: map['bio'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Posts.fromJson(String source) => Posts.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Posts(title: $title, bio: $bio)';

}

abstract class IPostAPI{
  List<Posts> postApi();
}

// class Abc{

  
//    Future<Posts> dummypostApi() async {
//     YTData ytData = YTData();

//     final ytresp = ytData.apiResFromYT();

//     final decodedYTResp = jsonDecode(ytresp) as Map<String, dynamic>;
//   return Posts.fromMap(decodedYTResp);
// }
// }

class PostYTApi implements IPostAPI {
  @override
  List<Posts> postApi(){
    YTData ytData = YTData();

    final ytresp = ytData.apiResFromYT();

    final decodedYTResp = jsonDecode(ytresp) as List;      //always know the response structure as it will help us to typecast it 

    return decodedYTResp.map((e) => Posts(title: e['title'], bio: e['description'])).toList();

  }
}

class PostTwitterApi implements IPostAPI{
  @override
  List<Posts> postApi(){
    final data = jsonDecode(TwitterData().apiRespFromTwitter()) as List;

    return data.map((e) => Posts(title: e['header'], bio: e['bio'])).toList();
  }
}

class Output{
  PostYTApi postYTApi = PostYTApi();
  PostTwitterApi postTwitterApi = PostTwitterApi();
  //Abc abc = Abc();
  List<Posts> combinedOutput(){
    return postYTApi.postApi() + postTwitterApi.postApi();
  }
}