$ ->
  App.chess = new Chess()

  cfg =
    draggable: true
    sparePieces: true
    showNotation: false
    position: 'start'
    dropOffBoard: 'trash'
    pieceTheme: 'assets/chesspieces/alpha/{piece}.png'

    onDrop: (source, target, piece, position, orientation) =>
      move = App.chess.move(from: source, to: target)
      App.game.perform('make_move', move)

  App.board = ChessBoard('chessboard', cfg)
