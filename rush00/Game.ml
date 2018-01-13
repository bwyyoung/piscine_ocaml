(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Game.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/09/20 17:28:05 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/09/20 18:05:35 by byoung-w         ###   ########.fr       *)
(*                                                                            *)
(* ************************************************************************** *)

(*the winner of our game*)
let win players cellmaster =
	if (Player.type_of_player players) = cellmaster then
		players
	else
		Player.next players

(*Player Input and AI INPUT*)
let input_player board players (get_input, _, _) =
	if (Player.string_of_player players) = "AI" then
		AI.get_input board
	else
		get_input board

(*Core Game Loop*)
let rec game_loop board players ((_, print, render) as ui) =
	print ((Player.string_of_player players) ^ " ("
		^ (String.make 1 (Player.char_of_player players)) ^ ") play");
	let move = input_player board players ui in
	let board = MegaBoard.inject_input board move (Player.type_of_player players) in
	render board;
	match board with
	| Board.Occupied (p)	-> win players p
	| _					-> game_loop board (Player.next players) ui

(*initialise game with player 1 and 2, and start the game loop with the board in mind.*)
let start player1 player2 ((_, print, render) as ui) =
	print ("Game start with " ^ player1 ^ " and " ^ player2);
	let board = Board.megaTicTacToe in
	render board;
	game_loop board (Player.new_players player1 player2) ui
