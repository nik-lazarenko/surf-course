
class Person {
  final String name;

  Person({
    required this.name,
});

  @override
  String toString() {
    return name;
  }
}

class Team {
  final String name;
  final List<Person> members;
  Coach? coach;

  Team({
    required this.name,
    required this.members,
});

  @override
  String toString() {
    return '$name\n'
        'members:${members.map((e) => e.name)}\n'
        'coach:${coach?.name}';
  }
}

class Gamer extends Person {
  Team? team;
  int gamesCount = 0;

  Gamer({
    required super.name,
    required this.team,
    gamesCount,
}) {
    team?.members.add(this);
  }

  @override
  String toString() {
    return 'name\n'
        'team:${team?.name}\n'
        'gamesCount:$gamesCount';
  }
}

class Coach extends Person {
  final Team team;
  int trophiesCount = 0;

  Coach({
    required super.name,
    required this.team,
    trophiesCount,
}) {
    team.coach = this;
  }

  @override
  String toString() {
    return '$name\n'
        'team:${team.name}\n'
        'trophiesCount:$trophiesCount';
  }
}

class Cser extends Gamer {
  int mmr;

  Cser({
    required super.name,
    super.team,
    super.gamesCount,
    required this.mmr,
});

  @override
  String toString() {
    return '$name\n'
        'team:${team?.name}\n'
        'gamesCount:$gamesCount\n'
        'mmr:$mmr';
  }
}

void main() {
  final team = Team(
    name: 'Pervie',
    members: [],
  );

  final coach = Coach(
    name: 'Goga',
    team: team,
  );

  final gamer = Gamer(
    name: 'Vasya',
    team: team,
  );

  final cser = Cser(name: 'Petya',
      team: team,
      mmr: 345,
  );

  print(team);
  print(coach);
  print(gamer);
  print(cser);
}