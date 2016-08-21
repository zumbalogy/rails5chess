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
      App.game.perform('make_move', position)

  App.board = ChessBoard('chessboard', cfg)
