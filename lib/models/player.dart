class Player {
  final String name;
  final String squad;
  int missionPoints = 0;
  int victoryPoints = 0;
  double strengthOfSchedule = 0;
  int eventPoints = 0;
  bool hasBye = false;
  bool isDropped = false;

  Player({required this.name, required this.squad});
}