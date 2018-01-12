(* ************************************************************************** *)
(*                                                                            *)
(*                                                        :::      ::::::::   *)
(*   Game.ml                                            :+:      :+:    :+:   *)
(*                                                    +:+ +:+         +:+     *)
(*   By: byoung-w <byoung-w@student.42.fr>          +#+  +:+       +#+        *)
(*                                                +#+#+#+#+#+   +#+           *)
(*   Created: 2017/06/20 13:41:41 by byoung-w          #+#    #+#             *)
(*   Updated: 2017/06/21 18:25:57 by byoung-w         ###   ########.fr       *)
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
	let board = MainBoard.inject_input board move (Player.type_of_player players) in
	render board;
	match board with
	| Board.Occupied (p)	-> win players p
	| _					-> game_loop board (Player.next players) ui

(**)
let start player1 player2 ((_, print, render) as ui) =
	print ("Game start with " ^ player1 ^ " and " ^ player2);
	let board = Board.emptyMain in
	render board;
	game_loop board (Player.new_players player1 player2) ui
