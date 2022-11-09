import 'package:flutter/widgets.dart';

class CardEntity {
  final String id;
  final String name;
  final String logoCardURL;
  final Color colorCard;
  final List<String> eventDetails;
  final String eventDescription;

  CardEntity(this.id, this.name, this.logoCardURL, this.colorCard,
      this.eventDetails, this.eventDescription);
}
