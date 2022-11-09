import 'package:flutter/material.dart';
import 'package:flutter_application_2/domain/bloc/authentication/login/login_bloc.dart';
import 'package:flutter_application_2/domain/bloc/authentication/login/login_state.dart';
import 'package:flutter_application_2/domain/bloc/user_cards/user_cards_bloc.dart';
import 'package:flutter_application_2/domain/bloc/user_cards/user_cards_state.dart';
import 'package:flutter_application_2/domain/entities/card_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/bloc/user_cards/user_cards_event.dart';
import '../../../infrastructure/repository/user_card_repository.dart';
import '../../detail_branch/detail_branch.dart';

class CardsHolder extends StatefulWidget {
  const CardsHolder({super.key});

  @override
  State<CardsHolder> createState() => _CardsHolder();
}

class _CardsHolder extends State<CardsHolder> {
  late UserCardsBloc _userCardsBloc;
  late String _userId;

  @override
  void initState() {
    var userState = context.read<LoginBloc>().state as LoginSuccessState;
    _userId = userState.user.id;

    _userCardsBloc = context.read<UserCardsBloc>();
    _userCardsBloc.stream.listen((state) => {
          if (state is UserCardsUpdated)
            {_userCardsBloc.add(GetUserCards(_userId))}
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => _userCardsBloc..add(GetUserCards(_userId)),
        child: BlocBuilder<UserCardsBloc, UserCardsState>(
            builder: (BuildContext context, UserCardsState state) {
          if (state is UserCardsLoadSuccess) {
            return Stack(
                children: state.userCards
                    .map((e) => Container(
                        margin: EdgeInsets.only(
                            top: (state.userCards.indexOf(e) * 48)),
                        child: CardView(cardItem: e)))
                    .toList());
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }));
  }
}

class CardView extends StatelessWidget {
  final CardEntity cardItem;
  const CardView({super.key, required this.cardItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetailBranchScreen(cardItem: cardItem)),
              )
            },
        child: Container(
            height: 64,
            padding:
                const EdgeInsets.only(left: 0, right: 16, top: 0, bottom: 8),
            decoration: BoxDecoration(
                color: cardItem.colorCard,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16))),
            child: Row(
              children: [
                Image.network(cardItem.logoCardURL, height: 80, width: 80),
                const Spacer(),
                Row(
                  children: const [
                    Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 8,
                            0), //apply padding to LTRB, L:Left, T:Top, R:Right, B:Bottom
                        child: Text('0',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                                color: Colors.white))),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Color.fromARGB(255, 255, 255, 255),
                      size: 16.0,
                    )
                  ],
                )
              ],
            )));
  }
}
