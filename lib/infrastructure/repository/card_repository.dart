import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/entities/card_entity.dart';
import 'package:flutter_application_2/infrastructure/data_sources/meca_db_provider.dart';

import '../DTO/card_dto.dart';

class CardRepository {
  final MecaDBProvider _mecaDBProvider = MecaDBProvider();
  Future<CardEntity> getById(String id) async {
    CardDTO cardDTO = await _mecaDBProvider.readCardById(id);

    return CardEntity(cardDTO.id, cardDTO.name, cardDTO.logoCardURL,
        cardDTO.colorCard, cardDTO.eventDetails, cardDTO.eventDescription);
  }
}
