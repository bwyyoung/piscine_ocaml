val update_state : Board.board -> Board.board -> Board.board
val inject_input : Board.board -> int * int -> Cellmaster.t -> Board.board
val getLineMoveset : Board.board -> int -> int -> Board.board list
val getColMoveset : Board.board -> int -> int -> Board.board list
val getDiagMoveset : Board.board -> int -> int -> Board.board list
val getcell_xy : int -> int -> int * int
val getSbMoveset : Board.board -> int -> int * int * int -> Board.board list
