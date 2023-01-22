

class Complain
{
  final String id;
  final String complainTitle;
  final String status;
  final String discription;
  final String complainProducer;
  final String complainConsumer;
  final String complainType;
  final String complainLocation;
  final String createdAt;
  final String updatedAt;

  Complain({
  required  this.status,required this.id,required this.createdAt,
    required this.complainConsumer,required this.complainLocation,
    required   this.complainProducer ,required this.complainTitle,required this.complainType,required this.discription,required this.updatedAt
});

  factory Complain.fromJson(Map<String ,dynamic> json)=>
      Complain(
          status:json[ "status"],
          id:json[ "_id"],
          createdAt:json[ "createdAt"],
          complainConsumer:json[ "complainConsumer"],
          complainLocation:json[ "complainLocation"],
          complainProducer:json[ "complainProducer"],
          complainTitle:json[ "complainTitle"],
          complainType:json[ "complainType"],
          discription:json[ "discription"],
          updatedAt:json[ "updatedAt"]
      );
}