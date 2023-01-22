


class ApiResponse
{
  final bool success;
  final String error;
  final dynamic data;

  ApiResponse({required this.data ,required this.error ,required this.success});



  factory ApiResponse.fromJson(Map<String ,dynamic> json)=>
      ApiResponse(
          data: json["data"],
          error: json["error"],
          success: json["success"]
      );

  Map<String ,dynamic> toJson()
  {
    Map<String, dynamic> data = {};
    data["data"] = this.data;
    data["error"] = error;
    data["success"] = success;
    return data;
  }

}