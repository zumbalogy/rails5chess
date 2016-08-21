$ ->
  App.chess = new Chess()

  isPawn = (piece) ->
    piece[1] == 'P'

  isBoardEnd = (pos) ->
    pos[1] == '1' || pos[1] == '8'

  cfg =
    position: 'start'
    draggable: true
    pieceTheme: 'assets/chesspieces/alpha/{piece}.png'
    showNotation: false

    onDrop: (source, target, piece, position, orientation) =>
      promotion = 'n'
      if isPawn(piece) && isBoardEnd(target)
        promotion = 'q' if confirm('confirm to promote to queen. else knight.')
      move = App.chess.move
        from: source
        to: target
        promotion: promotion

      if (move == null)
        # illegal move
        return 'snapback'
      else
        App.game.perform('make_move', move)
        App.board.position(App.chess.fen(), false)

  App.board = ChessBoard('chessboard', cfg)
