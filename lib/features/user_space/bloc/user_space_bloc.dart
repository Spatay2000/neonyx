import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:neonyx/domain/entity/topic_entity.dart';
import 'package:neonyx/features/user_space/bloc/user_space_event.dart';
import 'package:neonyx/features/user_space/bloc/user_space_state.dart';

@injectable
class UserSpaceBloc extends Bloc<UserSpaceEvent, UserSpaceState> {
  // getTopicsUsecase
  final _topics = [
    TopicEntity(id: 0, topic: "Crypto", isChoosed: false),
    TopicEntity(id: 1, topic: "Web3 Technologies", isChoosed: false),
    TopicEntity(id: 2, topic: "Memesssss", isChoosed: false),
    TopicEntity(id: 3, topic: "Space missions", isChoosed: false),
    TopicEntity(id: 4, topic: "Technology news", isChoosed: false),
    TopicEntity(id: 5, topic: "Video games", isChoosed: false),
    TopicEntity(id: 6, topic: "Bitcoin", isChoosed: false),
    TopicEntity(id: 7, topic: "Sport news", isChoosed: false),
    TopicEntity(id: 8, topic: "CS Go Esports", isChoosed: false),
  ];
  List<List<TopicEntity>> allTopics = [];

  UserSpaceBloc() : super(TopicLoading()) {
    on<UserSpaceEvent>(
      (event, emit) {
        if (event is LoadTopics) {
          final count = _topics.length ~/ 3;
          allTopics.add(_topics.getRange(0, count).toList());
          allTopics.add(_topics.getRange(count, count * 2).toList());
          allTopics.add(_topics.getRange(count * 2, count * 3).toList());
          emit(TopicsLoaded(topics: allTopics));
        } else if (event is AddTopic) {
          emit(TopicLoading());
          List<TopicEntity> tt = [];
          for (var topics in allTopics) {
            for (var topic in topics) {
              tt.add(topic);
            }
          }

          for (int i = 0; i < tt.length; i++) {
            if (event.id == tt[i].id) {
              tt[i] = tt[i].copyWith(isChoosed: !tt[i].isChoosed);
            }
          }
          allTopics.clear();
          final count = tt.length ~/ 3;
          allTopics.add(tt.getRange(0, count).toList());
          allTopics.add(tt.getRange(count, count * 2).toList());
          allTopics.add(tt.getRange(count * 2, count * 3).toList());

          for (var t in tt) {
            log("TOPIC: ${t.topic} - ${t.isChoosed}");
          }
          emit(TopicsLoaded(topics: allTopics));
        }
      },
    );

    // on<AddTopic>(
    //   (event, emit) async {
    //     add(const AddTopic(isAdded: true));
    //     emit(const TopicAdded());
    //   },
    // );

    // on<DeleteTopic>(
    //   (event, emit) {
    //     emit(const TopicDeleted());
    //   },
    // );
  }
}
