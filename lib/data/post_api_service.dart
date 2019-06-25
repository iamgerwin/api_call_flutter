import 'package:chopper/chopper.dart';

part 'post_api_service.chopper.dart';

@ChopperApi(baseUrl: '/posts')
abstract class PostApiService extends ChopperService {
  @Get()
  Future<Response> getPosts();

//  @Get(headers: {'Content-Type': 'text/plain'})
//  Future<Response> getPosts(@Header('header-name') String headerValue);

  @Get(path: '/{id}')
  Future<Response> getPost(
      @Path('id') int id); // @Query('q') String name <-query parameters

//  @Put()
//  @Patch()
//  @Delete()
  @Post()
  Future<Response> postPost(
    @Body() Map<String, dynamic> body,
  );

  static PostApiService create() {
    final client = ChopperClient(
      baseUrl: 'https://jsonplaceholder.typicode.com',
      services: [
        _$PostApiService(),
      ],
      converter: JsonConverter(),
    );

    return _$PostApiService(client);
  }
}
