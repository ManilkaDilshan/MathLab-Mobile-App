class Game {
  final int gameId;
  final String category;
  final String name;
  final List instruments;
  final List steps;
  final String image;
  final String description;

  Game(this.gameId, this.category, this.name, this.instruments, this.steps,
      this.image, this.description);

  static List<Game> gameList = [
    Game(0, 'Category 1', 'Game 1', ['instrument 1', 'instrument 2'],
        ['step1', 'step2', 'step3'], 'assets/images/games/game1.png', 'Eu do cupidatat incididunt sunt ea pariatur duis Lorem nisi. Excepteur nulla laborum mollit incididunt exercitation sint cillum mollit officia Lorem dolore irure. Ex minim ea nisi do. Qui cillum cillum ad adipisicing Lorem qui irure fugiat reprehenderit in qui amet occaecat duis. Exercitation dolore deserunt cillum ullamco ad do quis Lorem amet.'),
    Game(1, 'Category 1', 'Game 2', ['instrument 1', 'instrument 2'],
        ['step1', 'step2', 'step3', 'step4'], 'assets/images/games/game2.jpg', 'Occaecat dolor reprehenderit ullamco irure amet et. Veniam voluptate aliquip excepteur minim enim irure ex voluptate dolore excepteur laboris eu aliqua. Anim aute sint commodo minim. Esse occaecat veniam adipisicing sit velit occaecat et velit occaecat. Sit aliquip aute dolore ea velit eiusmod fugiat magna mollit cillum. Aute sit eiusmod id occaecat in esse ut esse sint sunt eu occaecat.'),
    Game(2, 'Category 2', 'Game 3', ['instrument 1', 'instrument 2'],
        ['step1', 'step2', 'step3', 'step4'], 'assets/images/games/game3.jpg', 'Irure cillum aliquip duis eu culpa magna voluptate commodo sunt pariatur proident officia cupidatat. In ex fugiat veniam tempor ullamco et velit magna nostrud sunt. Minim ad ullamco voluptate velit. Ea amet amet sit velit velit. Elit Lorem incididunt velit officia exercitation mollit esse. Ad magna ut duis excepteur. Laborum ad qui et eu.'),
    Game(3, 'Category 3', 'Game 4', ['instrument 1', 'instrument 2'],
        ['step1', 'step2', 'step3', 'step4'], 'assets/images/games/game4.png', 'Exercitation ipsum mollit culpa ex quis in commodo aliqua aliquip adipisicing ad enim tempor ex. Veniam aute eu sunt tempor ut fugiat est consectetur incididunt ad. Anim nulla sit excepteur reprehenderit magna qui qui exercitation ea minim proident. Labore ad do ad laborum labore aliqua aliqua ex voluptate laboris commodo enim esse officia. Nostrud Lorem sint amet culpa ex ullamco labore irure ut reprehenderit minim non veniam cupidatat. Reprehenderit incididunt fugiat ex commodo dolore. Quis excepteur excepteur in fugiat ad aute.'),
    Game(4, 'Category 4', 'Game 5', ['instrument 1', 'instrument 2'],
        ['step1', 'step2', 'step3', 'step4'], 'assets/images/games/game5.jpg', 'Sint est pariatur dolor cillum mollit. Cupidatat elit ullamco eiusmod amet ipsum. Deserunt adipisicing sit sit cillum aliquip eiusmod. Eu do eiusmod est tempor qui Lorem velit laboris est sit dolor proident irure commodo.'),
    Game(5, 'Category 5', 'Game 6', ['instrument 1', 'instrument 2'],
        ['step1', 'step2', 'step3', 'step4'], 'assets/images/games/game6.jpg', 'Nulla anim ea sit elit voluptate adipisicing. Amet sunt tempor incididunt fugiat nostrud nostrud cupidatat consequat. Officia aliqua laborum elit voluptate Lorem veniam incididunt ad mollit enim est. Commodo sit reprehenderit est elit ullamco est. Velit dolore veniam reprehenderit aute sunt dolore.'),
    Game(6, 'Category 1', 'Game 7', ['instrument 1', 'instrument 2'],
        ['step1', 'step2', 'step3', 'step4'], 'assets/images/games/game7.jpg', 'Ipsum consectetur aute consequat voluptate sint exercitation mollit ea laborum nulla minim nostrud nostrud. Aute adipisicing ex reprehenderit dolor eiusmod cillum irure ut fugiat voluptate. Consequat quis laboris duis culpa. Aliquip magna elit veniam consequat aute velit enim est. Deserunt eu quis labore ullamco ullamco aliquip fugiat ad cupidatat qui Lorem magna dolor.'),
    Game(7, 'Category 2', 'Game 8', ['instrument 1', 'instrument 2'],
        ['step1', 'step2', 'step3', 'step4'], 'assets/images/games/game8.jpg', 'Officia occaecat ullamco esse irure quis in do est ea laborum. Ut proident ipsum incididunt duis ipsum incididunt nostrud adipisicing et do commodo reprehenderit nulla fugiat. Esse labore sunt deserunt pariatur. Id cupidatat incididunt excepteur minim est dolor occaecat nostrud do id labore nostrud ex ipsum. Consequat enim nostrud ullamco ullamco dolore ut. Nostrud tempor ex occaecat commodo dolore enim eu officia.'),
    Game(8, 'Category 5', 'Game 9', ['instrument 1', 'instrument 2'],
        ['step1', 'step2', 'step3', 'step4'], 'assets/images/games/game9.jpg', 'Aliquip commodo do exercitation duis aliqua commodo aliqua excepteur proident fugiat sit elit. Id tempor veniam excepteur culpa pariatur exercitation amet ex quis enim mollit aute velit qui. Reprehenderit culpa nulla nisi deserunt nisi voluptate occaecat et ad et veniam. Pariatur laborum ad voluptate laborum pariatur excepteur. Occaecat dolor nulla ea voluptate est veniam aute.'),
    Game(9, 'Category 4', 'Game 10', ['instrument 1', 'instrument 2'],
        ['step1', 'step2', 'step3', 'step4'], 'assets/images/games/game10.jpg', 'Ipsum et pariatur magna in irure. Ad ullamco adipisicing labore incididunt amet in veniam anim veniam voluptate in sunt. Ut ad nisi elit laborum cupidatat consequat nulla dolor eu. Aute consectetur minim duis enim. Laborum sint eu aute incididunt nisi et laborum exercitation veniam dolore.'),
  ];
}
