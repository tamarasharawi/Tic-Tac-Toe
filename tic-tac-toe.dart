import 'dart:io';

class TicTacToe {
  late List<String> board;
  late String Player;
  late int moves;

  TicTacToe() {
    board = List.filled(9, ' ');
    Player = '';
    moves = 0;
  }

  void Board() {
    for (int i = 0; i < 9; i += 3) {
      print('${board[i]} | ${board[i + 1]} | ${board[i + 2]}');
      if (i < 6) print('---------');
    }
  }

  void Move(var  input ) {
    if (input < 1 || input > 9 || board[input - 1] != ' ') {
      print('Invalid move! Please try again.');
    }
   else {
    board [input - 1] = Player;
    moves++; }
  }

  bool checkWin() {
 // | 0| 1 | 2 | 
 // | 3| 4 | 5 | 
 // | 6| 7 | 8 | 
    for (int i = 0; i < 3; i++) {
      if (board[i] != ' ' &&
          board[i] == board[i + 3] &&
          board[i] == board[i + 6]) {
        return true; // Check columns
      }
      if (board[i * 3] != ' ' &&
          board[i * 3] == board[i * 3 + 1] &&
          board[i * 3] == board[i * 3 + 2]) {
        return true; // Check rows
      }

    }
     // check cross 
    if (board[0] != ' ' && board[0] == board[4] && board[0] == board[8]) {
      return true; 
    }

    if (board[2] != ' ' && board[2] == board[4] && board[2] == board[6]) {
      return true; 
    }

    return false;
  }


  void switchPlayer() {
    if (Player == 'X') {
  Player = 'O';
} else {
  Player = 'X'; }

}

void charXorO() { 
  String input = stdin.readLineSync() ?? '';
  if(input == 'X'){
    Player = 'X';
    return ;
  }
  else if(input == 'O'){
    Player = 'O';
    return ;
  }
}

}

void main() {
  final ticTacToe = TicTacToe();

  while (true) {
    print(' do you want to play as X or O ? ');
    ticTacToe.charXorO() ; 

    print('\nTic-Tac-Toe');
    ticTacToe.Board();

    print(' enter your move (1-9):');
    var move = stdin.readLineSync() ?? '';
    if (move != null) {
      if (ticTacToe.Move (move) ) {
        if (ticTacToe.checkWin()) {
          print('\nPlayer ${ticTacToe.Player} wins!');
          break;
        } 
        else {
          print('\nThe game is a draw!');
          break;
        }

      }
    } 
    else {
      print('Invalid input! Please enter a number between 0 and 8 ');
    }
  } 

  print("do you want to paly again ? ") ; 
  ticTacToe.switchPlayer();

  
}

