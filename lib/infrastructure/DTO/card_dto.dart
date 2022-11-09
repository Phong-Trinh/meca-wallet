import 'package:flutter/widgets.dart';

class CardDTO {
  final String id;
  final String name;
  final String logoCardURL;
  final Color colorCard;
  final List<String> eventDetails;
  final String eventDescription;

  CardDTO(this.id, this.name, this.logoCardURL, this.colorCard,
      this.eventDetails, this.eventDescription);
}
