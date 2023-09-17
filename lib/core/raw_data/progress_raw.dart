import 'package:well_shift_app/data/model/progress/emotion_model.dart';

List<EmotionModel> emotions = [
  EmotionModel(
      title: "Anger", status: "increased", total_progress: 45, progress: 10),
  EmotionModel(
      title: "Anxiety", status: "stable", total_progress: 80, progress: 0),
  EmotionModel(
      title: "Hapiness", status: "increased", total_progress: 60, progress: 15),
  EmotionModel(
      title: "Contentment",
      status: "decreased",
      total_progress: 70,
      progress: 15)
];

List suggested_for_you = [
  {
    "image": "assets/images/png/meditation.png",
    "title": "Meditation",
  },
  {
    "image": "assets/images/png/action.png",
    "title": "Action",
  },
  {
    "image": "assets/images/png/music.png",
    "title": "Music",
  },
  {
    "image": "assets/images/png/article.png",
    "title": "Article",
  },
];
