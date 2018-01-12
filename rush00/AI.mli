
(*The map slots for our game. we have a square grid of 9 tic tac toe games*)
val triplets1 : (int * int * int) list
val triplets2 : (int * int * int) list
val sbindex : int list
val empty_moves : 'a list list
val choose_random_subposition : Board.board list * int -> int * int
val choose_random_position : Board.board list -> int * int
val any_no_coord :
	int -> int * int * int -> Cellmaster.t * Cellmaster.t * Cellmaster.t -> int * int
val push_match : 'a list list -> int -> 'a -> 'a list list
val foreach_triplets :
	int * int * int ->
	Board.board list -> int -> (int * int) list list -> (int * int) list list
val foreach_triplets_diag :
	int * int * int ->
	Board.board list -> int -> (int * int) list list -> (int * int) list list
val check_triplets :
	Board.board list -> int -> (int * int) list list -> (int * int) list list
val foreach_subboards : Board.board list -> (int * int) list list
val get_best_move : Board.board list -> int * int
val get_input : Board.board -> int * int
