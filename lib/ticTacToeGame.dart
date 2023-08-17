enum SquareType { Empty, X, O }

class TicTacToeGame {
  late List<SquareType> _squares;
  late bool _xTurn;
  late bool _gameOver;
  late bool _xWin;

  TicTacToeGame() {
    _squares = List.generate(9, (_) => SquareType.Empty);
    _xTurn = true;
    _gameOver = false;
    _xWin = false;
  }

  bool get isXTurn => _xTurn;

  bool get isGameOver => _gameOver;

  bool get isXWin => _xWin;

  SquareType getSquare(int index) => _squares[index];

  bool play(int index) {
    if (_gameOver || _squares[index] != SquareType.Empty) {
      return false;
    }

    _squares[index] = _xTurn ? SquareType.X : SquareType.O;
    _xTurn = !_xTurn;
    _gameOver = _isGameOver();

    if (_gameOver) {
      _xWin = !_xTurn;
    }

    return true;
  }

  bool _isGameOver() {
    // Check rows
    for (int i = 0; i < 9; i += 3) {
      if (_squares[i] != SquareType.Empty &&
          _squares[i] == _squares[i + 1] &&
          _squares[i] == _squares[i + 2]) {
        print(SquareType.X);
        return true;
      }
    }

    // Check columns
    for (int i = 0; i < 3; i++) {
      if (_squares[i] != SquareType.Empty &&
          _squares[i] == _squares[i + 3] &&
          _squares[i] == _squares[i + 6]) {
        return true;
      }
    }

    // Check diagonals
    if (_squares[0] != SquareType.Empty &&
        _squares[0] == _squares[4] &&
        _squares[0] == _squares[8]) {
      return true;
    }

    if (_squares[2] != SquareType.Empty &&
        _squares[2] == _squares[4] &&
        _squares[2] == _squares[6]) {
      return true;
    }

    // Check tie
    for (int i = 0; i < 9; i++) {
      if (_squares[i] == SquareType.Empty) {
        return false;
      }
    }

    return true;
  }
}
